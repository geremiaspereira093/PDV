unit Vendas;

interface

uses
	Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
	System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
	Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons, ACBrBase,
	ACBrDFe, ACBrNFe, DateUtils, Vcl.MPlayer,Vcl.Imaging.jpeg;

type
	TSingentonQuantidade = class
	private
		constructor Create;
	public
		class function GetInstance: TSingentonQuantidade;
		 function Totalizar(Quantidade,ValorUnitario:Currency):Currency;
	end;

	TfrmVendas = class(TForm)
		painelTopo: TPanel;
		PainelTotal: TPanel;
		Panel5: TPanel;
		Label8: TLabel;
		Label12: TLabel;
		Buscar: TLabel;
		txtBusca: TEdit;
		Label1: TLabel;
		edtUnitario: TDBEdit;
		srcVendas: TDataSource;
		SrcQueryVendas: TDataSource;
		DSConsultaProdutos: TDataSource;
		DSConsultaFuncionarios: TDataSource;
		DSDetalheVenda: TDataSource;
		Label11: TLabel;
		DSQueryDetVendas: TDataSource;
		DSVendas: TDataSource;
		EdtQuantidade: TDBEdit;
		EdtProduto: TDBEdit;
    ImgProduto: TImage;
		Panel1: TPanel;
    painelGrid: TPanel;
    Panel3: TPanel;
    DBItensVendidos: TDBGrid;
    PanelTotal: TPanel;
    Label5: TLabel;
    LblTotal: TLabel;
    PanelMenu: TPanel;
    Label10: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Panel4: TPanel;
    Label15: TLabel;
    Panel2: TPanel;
    Label4: TLabel;
    EdtTotalVenda: TDBEdit;
    Label6: TLabel;
    EdtValorRecebido: TDBEdit;
    Label7: TLabel;
    EdtTroco: TDBEdit;
    Label3: TLabel;
    EdtData: TDBEdit;
    Label2: TLabel;
    EdtHora: TDBEdit;
    Timer1: TTimer;
    Label9: TLabel;
    Label16: TLabel;
    Label17: TLabel;
		procedure FormCreate(Sender: TObject);
		procedure ConsultaProdutos;
		procedure AbateEstoque;
		procedure IniciarNFE;
		procedure txtBuscaChange(Sender: TObject);
		procedure AlimentarDetalheVenda;
		procedure ListarItens;
		procedure SalvaDetalheVenda;
		procedure ConfirmarVenda;
		procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
		procedure AlimentarVendas;
		procedure CalcularSubTotal;
		procedure LimparProdutos;
		//function Totalizar(Quantidade, ValorUnitario: Currency): Currency;
    procedure LimpaCampos;
    procedure ExibeFoto(Campo:TField;ImgProd:TImage);
    procedure IniciarVenda;

	private
		{ Private declarations }
		ValorUnitario: Currency;
		Quantidade: Currency;
	public
		{ Public declarations }
	end;

var
	frmVendas: TfrmVendas;
	Qtde: TSingentonQuantidade;

implementation

{$R *.dfm}

uses ModuloDados;

procedure TfrmVendas.AbateEstoque;
var
	Qtde: Currency;
	Produto: String;
	QuantidadeEstoque: Currency;
begin
	QuantidadeEstoque := DM.consultaProdutosQUANTIDADE.AsCurrency;
	Qtde := QuantidadeEstoque - StrToCurr(EdtQuantidade.Text);
	Produto := DM.ConsultaProdutos.FieldByName('NOME').Value;

	DM.ConsultaProdutos.Close;
	DM.ConsultaProdutos.SQL.Clear;
	DM.ConsultaProdutos.SQL.Add('UPDATE PRODUTOS SET QUANTIDADE = :QTDE WHERE NOME = :PRODUTO');
	DM.ConsultaProdutos.Parameters.ParamByName('QTDE').Value := Qtde;
	DM.ConsultaProdutos.Parameters.ParamByName('PRODUTO').Value := Produto;
	DM.ConsultaProdutos.ExecSQL;
end;

procedure TfrmVendas.SalvaDetalheVenda;
begin
	AlimentarDetalheVenda;
	DM.DataSetDetVenda.Post;
	ListarItens;
	CalcularSubTotal;

	AbateEstoque;
	LimparProdutos;
end;

procedure TfrmVendas.CalcularSubTotal;
var
	SubTotal: Currency;
begin
	SubTotal := 0;
	DM.QueryDetVenda.First;
	while not DM.QueryDetVenda.Eof do
	begin
		SubTotal := SubTotal + DM.QueryDetVendaVALOR_TOTAL.AsCurrency;
		DM.QueryDetVenda.Next;
	end;
	LblTotal.Caption := FormatFloat('###.00,', SubTotal);
end;

//function TfrmVendas.Totalizar(Quantidade, ValorUnitario: Currency): Currency;
//var
//	Total: Currency;
//begin
//	Total := ValorUnitario * Quantidade;
//	Result := Total;
//end;

procedure TfrmVendas.ConsultaProdutos;
begin
	DM.ConsultaProdutos.Close;
	DM.ConsultaProdutos.SQL.Clear;
	DM.ConsultaProdutos.SQL.Add('SELECT CODIGO,NOME,VALOR,DESCRICAO,DATA_FABRICACAO,DATA_VALIDADE,' +
  'COD_FORN,QUANTIDADE,CODIGO_BARRAS, IMAGEM FROM PRODUTOS');
	DM.ConsultaProdutos.SQL.Add('WHERE CODIGO_BARRAS =:CODIGO');
	DM.ConsultaProdutos.Parameters.ParamByName('CODIGO').Value := trim(txtBusca.Text);
	DM.ConsultaProdutos.Open;

  ExibeFoto(DM.consultaProdutos.FieldByName('IMAGEM'),ImgProduto);
	/// verifica se tem o produto a ser vendido
	if not DM.ConsultaProdutos.IsEmpty Then
	begin
		DM.DataSetDetVenda.Append;
		SalvaDetalheVenda;

	end;

end;

procedure TfrmVendas.txtBuscaChange(Sender: TObject);
begin
	if txtBusca.Text <> '' then
		ConsultaProdutos;
end;

procedure TfrmVendas.ConfirmarVenda;
var
	Codigo: Integer;
	CodigoFuncionario: Integer;
begin
	AlimentarVendas;
	DM.dataSetVendas.Post;
  DM.dataSetVendas.UpdateBatch();
  DM.DataSetDetVenda.UpdateBatch();

	/// lancar movimentacao
	/// CuponFiscal
  LimpaCampos;
  ListarItens;
end;

procedure TfrmVendas.FormCreate(Sender: TObject);
begin
	DM.ConsultaProdutos.Active := True;
	DM.dataSetFuncionarios.Active := True;
	DM.dataSetProdutos.Active := True;
	DM.dataSetVendas.Active := True;
	DM.DataSetDetVenda.Active := True;
	DM.QueryDetVenda.Active := True;
	 LimpaCampos;
end;

procedure TfrmVendas.FormKeyDown(Sender: TObject; var Key: Word;
	Shift: TShiftState);
begin
   //iniciar uma nova venda
	if Key = VK_F2 Then
  begin
    IniciarVenda;
  end
  //cancelar a venda atual
	else if Key = VK_F4 Then
	begin
		/// cancelar Venda
	end
  else if Key = VK_F5 Then
  begin
    //informar nova quantidade
  end
   //Finalizar a venda atual
	else if Key = VK_F3 Then
	begin
		if MessageDlg('Deseja Finalizar a Venda ?', mtInformation, [mbYes, mbNo], 0) = mrYes Then
		begin
			ConfirmarVenda;
		end;
	end;

end;

procedure TfrmVendas.IniciarNFE;
var
	Caminho: String;
begin
	Caminho := ExtractFilePath(Application.ExeName) + 'nfe';
	ShowMessage(Caminho);
	/// pegando o caminho da pasta nfce com os exemplos
	// Nfce.Configuracoes.Arquivos.PathSchemas := Caminho;
end;

procedure TfrmVendas.IniciarVenda;
begin
	DM.dataSetVendas.Append;
  //procedure adcionar itens
end;

procedure TfrmVendas.LimpaCampos;
begin
	EdtTotalVenda.Text := '';
  EdtValorRecebido.Text := '';
  EdtData.Text := '';
  EdtHora.Text := '';
end;

procedure TfrmVendas.LimparProdutos;
begin
   txtBusca.Text := '';
   txtBusca.SetFocus;
   edtQuantidade.Text := '1';
end;

procedure TfrmVendas.ListarItens;
begin
	DM.QueryDetVenda.Close;
	DM.QueryDetVenda.SQL.Clear;
	DM.QueryDetVenda.SQL.Add
		('SELECT COD_VENDA,PRODUTO,QUANTIDADE,VALOR,VALOR_TOTAL FROM DETALHE_VENDA  ORDER BY COD_VENDA ASC');
	DM.QueryDetVenda.Open;

	DBItensVendidos.Columns[0].Alignment := taCenter;
	DBItensVendidos.Columns[2].Alignment := taCenter;
	DBItensVendidos.Columns[3].Alignment := taCenter;
end;

procedure TfrmVendas.AlimentarDetalheVenda;
var
	Produto: String;
	ValorTotal: Currency;
	Qtde: TSingentonQuantidade;
begin
	Quantidade := 1.00;
	ValorUnitario := StrToCurr(edtUnitario.Text);
	EdtQuantidade.Text := CurrToStr(Quantidade);
	ValorUnitario := StrToCurr(edtUnitario.Text);
	// fazer a totalização aqui

	 Qtde := TSingentonQuantidade.GetInstance;
	 ValorTotal := Qtde.Totalizar(Quantidade,ValorUnitario);

 //	ValorTotal := Totalizar(Quantidade, ValorUnitario);

	// pegando o produto pesquisado
	Produto := DM.ConsultaProdutos.FieldByName('NOME').Value;
	EdtProduto.Text := Produto;
 //	DM.DataSetDetVenda.FieldByName('COD_VENDA').Value := DM.dataSetVendas.FieldByName('CODIGO').Value;
  DM.DataSetDetVenda.FieldByName('COD_VENDA').Value := 0;
	DM.DataSetDetVenda.FieldByName('COD_PRODUTO').Value :=
  DM.ConsultaProdutos.FieldByName('CODIGO').Value;
	DM.DataSetDetVenda.FieldByName('PRODUTO').Value := Produto;
	DM.DataSetDetVenda.FieldByName('VALOR').Value := ValorUnitario;
	DM.DataSetDetVenda.FieldByName('VALOR_TOTAL').Value := ValorTotal;
end;

procedure TfrmVendas.AlimentarVendas;
var
	ValorTotal: Currency;
	Qtde: TSingentonQuantidade;
begin

	 Qtde:= TSingentonQuantidade.GetInstance;
	 ValorTotal:= Qtde.Totalizar(Quantidade,ValorUnitario);

	//ValorTotal := Totalizar(Quantidade, ValorUnitario);

	EdtTotalVenda.Text := CurrToStr(ValorTotal);
	EdtData.Text := DateToStr(Now);
	EdtHora.Text := TimeToStr(Now);
	DM.dataSetVendas.FieldByName('COD_FUNCIONARIO').Value :=
  DM.consultaFunc.FieldByName('CODIGO').Value;
	DM.dataSetVendas.FieldByName('FUNCIONARIO').Value :=
  DM.consultaUsuarios.FieldByName('USUARIO').Value;
end;

procedure TfrmVendas.ExibeFoto(Campo: TField; ImgProd: TImage);
var
  vJpeg   : TJPEGImage;
  vStream : TMemoryStream;
begin
  { Verifica se o campo esta vázio. }
  if not Campo.IsNull then
  begin

    { Cria objeto do tipo TJPEG, e objeto do tipo MemoryStream}
    vJpeg   := TJPEGImage.Create;
    vStream := TMemoryStream.Create;

    { Trata o campo como do tipo BLOB e salva o seu conteudo na memória. }
    TBlobField(Campo).SaveToStream(vStream);

    { Ajusta a posicao inicial de leitura da memória }
    vStream.Position := 0;

    { Carrega da memoria os dados, para uma estrutura do tipo TJPEG
      (A partir da posicao 0)}
    vJpeg.LoadFromStream(vStream);

    { Exibe o jpg no Timage. }
    ImgProd.Picture.Assign(vJpeg);

    { Libera a memoria utilizada pelos componentes de conversão }
    vJpeg.Free;
    vStream.Free;
  end;
end;

{ TSingentonQuantidade }

constructor TSingentonQuantidade.Create;
begin
	Inherited;
end;

class function TSingentonQuantidade.GetInstance: TSingentonQuantidade;
begin
	if Qtde = nil Then
		Qtde := TSingentonQuantidade.Create;
end;

 function TSingentonQuantidade.Totalizar(Quantidade,
 ValorUnitario: Currency): Currency;
 var
 Total:Currency;
 begin
 Total := ValorUnitario * Quantidade;
 Result := Total;
 end;

initialization

	Qtde := nil;

finalization

if Qtde <> nil then
	Qtde.Free;

end.
