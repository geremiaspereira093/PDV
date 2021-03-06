unit Vendas;

interface

uses
	Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
	System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
	Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons, ACBrBase,
	ACBrDFe, ACBrNFe, DateUtils, Vcl.MPlayer,Vcl.Imaging.jpeg, Vcl.Menus,
  ACBrUtil,ACBrNFeNotasFiscais,pcnConversao,pcnConversaoNFe,ACBrNFSe,
  pcnNFe, pnfsConversao, System.Math;

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
		srcVendas: TDataSource;
		SrcQueryVendas: TDataSource;
		DSConsultaProdutos: TDataSource;
		DSConsultaFuncionarios: TDataSource;
		DSDetalheVenda: TDataSource;
		Label11: TLabel;
		DSQueryDetVendas: TDataSource;
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
    Timer1: TTimer;
    Label17: TLabel;
    MainMenu1: TMainMenu;
    Utilitrios1: TMenuItem;
    ConfigurarBanco1: TMenuItem;
    DataSource1: TDataSource;
    PainelTotal: TPanel;
    Label8: TLabel;
    Label12: TLabel;
    Buscar: TLabel;
    Label1: TLabel;
    ImgProduto: TImage;
    Panel5: TPanel;
    txtBusca: TEdit;
    edtUnitario: TDBEdit;
    EdtQuantidade: TDBEdit;
    EdtProduto: TDBEdit;
    Panel1: TPanel;
    Label9: TLabel;
    LblTroco: TLabel;
    Panel2: TPanel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    MediaPlayer1: TMediaPlayer;
    NFCe: TACBrNFe;
    Label18: TLabel;
    Label3: TLabel;
    Panel4: TPanel;
    Label22: TLabel;
    EdtTotal: TDBEdit;
    EditRecebido: TDBEdit;
    EditTroco: TDBEdit;
    EdtDataVenda: TDBEdit;
    EditDesconto: TDBEdit;
    EdtHora: TDBEdit;
		procedure FormCreate(Sender: TObject);
		procedure AbateEstoque;
		procedure txtBuscaChange(Sender: TObject);
		procedure AlimentarDetalheVenda;
		procedure ListarItens;
		procedure SalvaDetalheVenda;
		procedure ConfirmarVenda;
		procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
		procedure AlimentarVendas;
		procedure CalcularSubTotal;
		procedure LimparProdutos;
    procedure LimpaCampos;
    procedure ExibeFoto(Campo:TField;ImgProd:TImage);
    procedure IniciarVenda;
    procedure ConsultaProdutos;
    procedure srcVendasStateChange(Sender: TObject);
    procedure CarregarFoto;
    procedure DarTroco;
    procedure LimpaGrid;
    procedure IniciaNfce;
    procedure GeraNfce;
    procedure ConfigurarBanco1Click(Sender: TObject);
    procedure ValidaCampos;
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

uses ModuloDados, NovaQtde, Cancelamento, CancelaItem, Controle;

procedure TfrmVendas.CarregarFoto;
var
	CaminhoImagem:String;
begin
  CaminhoImagem :=  ExtractFileDir(GetCurrentDir) +'\PDV\Fontes\FotosPadrao\sem-foto.jpg';
  ImgProduto.Picture.LoadFromFile(CaminhoImagem);
end;

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
  LimpaGrid;
	DM.DataSetDetVenda.Post;
  MediaPlayer1.FileName := ExtractFileDir(GetCurrentDir) +'\PDV\Fontes\Blip\barCode.wav';
  MediaPlayer1.Open;
  MediaPlayer1.Play;
	CalcularSubTotal;
	AbateEstoque;
  ListarItens;
	LimparProdutos;
end;

procedure TfrmVendas.srcVendasStateChange(Sender: TObject);
begin
	txtBusca.Enabled := ( DM.dataSetVendas.State in [dsInsert] );
	if DM.dataSetVendas.State in [dsBrowse] Then
  	//depois alterar para subir uma tela caixa ocupado
  	txtBusca.Enabled := False;
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

procedure TfrmVendas.txtBuscaChange(Sender: TObject);
begin
	if txtBusca.Text <> '' then
		ConsultaProdutos;
end;


procedure TfrmVendas.ValidaCampos;
begin
	if Trim(EditRecebido.Text) =''Then
  begin
  	MessageDlg(' Campo  vazio',mtError,mbOKCancel,0);
    abort
  end;
end;

procedure TfrmVendas.ConfigurarBanco1Click(Sender: TObject);
begin
	IdTabelas := TIdTabelas.Create(self);
  IdTabelas.Show;
end;

procedure TfrmVendas.ConfirmarVenda;
var
	Codigo: Integer;
	CodigoFuncionario: Integer;
begin
	AlimentarVendas;
  DarTroco;
  ValidaCampos;
	DM.dataSetVendas.Post;
  DM.dataSetVendas.UpdateBatch();
  DM.DataSetDetVenda.UpdateBatch();
	/// lancar movimentacao
	/// CuponFiscal
//  IniciaNfce;
//	GeraNfce;
  LimpaCampos;
	LimpaGrid;
  CarregarFoto;
end;

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

  if not DM.ConsultaProdutos.IsEmpty Then
    begin
    	DM.DataSetDetVenda.Append;
      SalvaDetalheVenda;
      DM.ConsultaProdutos.Close;
    end;

end;

procedure TfrmVendas.DarTroco;
var
	ValorTotal:Currency;
  ValorRecebido: Currency;
  Troco:Currency;
begin
   ValorRecebido := StrToCurr(EditRecebido.Text);
   ValorTotal := StrToCurr(EdtTotal.Text);
   Troco := ValorRecebido - ValorTotal;
   EditTroco.Text := CurrToStr(Troco);
   LblTroco.Caption :=  FormatFloat('###.00,', Troco);
end;

procedure TfrmVendas.FormCreate(Sender: TObject);
begin
	DM.ConsultaProdutos.Active := True;
	DM.dataSetFuncionarios.Active := True;
	DM.dataSetProdutos.Active := True;
	DM.dataSetVendas.Active := True;
	DM.DataSetDetVenda.Active := True;
	DM.QueryDetVenda.Active := True;
  CarregarFoto;
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
  	FrmCancelarVenda := TFrmCancelarVenda.Create(nil);
    FrmCancelarVenda.Show;
	end
  //Trocar a quantidade
  else if Key = VK_F5 Then
  begin
    FrmQuantidade := TFrmQuantidade.Create(nil);
    try
    	FrmQuantidade.ShowModal;
    finally
      FrmQuantidade.Free;
    end;
  end
  else if Key = VK_F11 Then
  begin
  	PanelMenu.Visible := True;
  end
   //Finalizar a venda atual
	else if Key = VK_F3 Then
	begin
		if MessageDlg('Deseja Finalizar a Venda ?', mtInformation, [mbYes, mbNo], 0) = mrYes Then
			ConfirmarVenda;
	end
  else if Key = VK_DELETE Then
  begin
  	FrmCancelaItem := TFrmCancelaItem.Create(nil);
    FrmCancelaItem.Show;
  end;

end;

procedure TfrmVendas.GeraNfce;
Var
  NotaF: NotaFiscal;
  Item : integer;
  Produto: TDetCollectionItem;
  InfoPgto: TpagCollectionItem;

begin
	nfce.NotasFiscais.Clear;
	NotaF := nfce.NotasFiscais.Add;
  //DADOS DA NOTA FISCAL

  NotaF.NFe.Ide.natOp     := 'VENDA';
  NotaF.NFe.Ide.indPag    := ipVista;
  NotaF.NFe.Ide.modelo    := 65;
  NotaF.NFe.Ide.serie     := 1;
  NotaF.NFe.Ide.nNF       := DM.QueryVenda.FieldBYname('CODIGO').AsInteger;
  NotaF.NFe.Ide.dEmi      := Date;
  NotaF.NFe.Ide.dSaiEnt   := Date;
  NotaF.NFe.Ide.hSaiEnt   := Now;
  NotaF.NFe.Ide.tpNF      := tnSaida;
  NotaF.NFe.Ide.tpEmis    := teNormal;
  NotaF.NFe.Ide.tpAmb     := taHomologacao;  //Lembre-se de trocar esta vari?vel quando for para ambiente de produ??o
  NotaF.NFe.Ide.verProc   := '1.0.0.0'; //Vers?o do seu sistema
  NotaF.NFe.Ide.cUF       := 31;
  NotaF.NFe.Ide.cMunFG    := 0624123;
  NotaF.NFe.Ide.finNFe    := fnNormal;


  //DADOS DO EMITENTE

  NotaF.NFe.Emit.CNPJCPF           := '18311776000198';
  //inscri??o estadual
  NotaF.NFe.Emit.IE                := '';
  NotaF.NFe.Emit.xNome             := 'Q-Cursos Networks';
  NotaF.NFe.Emit.xFant             := 'Q-Cursos';

  NotaF.NFe.Emit.EnderEmit.fone    := '(31)3333-3333';
  NotaF.NFe.Emit.EnderEmit.CEP     := 30512660;
  NotaF.NFe.Emit.EnderEmit.xLgr    := 'Rua A';
  NotaF.NFe.Emit.EnderEmit.nro     := '325';
  NotaF.NFe.Emit.EnderEmit.xCpl    := '';
  NotaF.NFe.Emit.EnderEmit.xBairro := 'Santa Monica';
  NotaF.NFe.Emit.EnderEmit.cMun    := 0624123;
  NotaF.NFe.Emit.EnderEmit.xMun    := 'Belo Horizonte';
  NotaF.NFe.Emit.EnderEmit.UF      := 'MG';
  NotaF.NFe.Emit.enderEmit.cPais   := 1058;
  NotaF.NFe.Emit.enderEmit.xPais   := 'BRASIL';

  NotaF.NFe.Emit.IEST              := '';
 	// NotaF.NFe.Emit.IM               := '2648800'; // Preencher no caso de existir servi?os na nota
 	//NotaF.NFe.Emit.CNAE              := '6201500'; // Verifique na cidade do emissor da NFe se ? permitido
                                // a inclus?o de servi?os na NFe
  NotaF.NFe.Emit.CRT               := crtSimplesNacional;// (1-crtSimplesNacional, 2-crtSimplesExcessoReceita, 3-crtRegimeNormal)



  //DADOS DO DESTINAT?RIO

  NotaF.NFe.Dest.CNPJCPF           := '05481336000137';
  NotaF.NFe.Dest.IE                := '687138770110';
  NotaF.NFe.Dest.ISUF              := '';
  NotaF.NFe.Dest.xNome             := 'D.J. COM. E LOCA??O DE SOFTWARES LTDA - ME';

//
//  NotaF.NFe.Dest.EnderDest.Fone    := '1532599600';
//  NotaF.NFe.Dest.EnderDest.CEP     := 18270170;
//  NotaF.NFe.Dest.EnderDest.xLgr    := 'Rua Coronel Aureliano de Camargo';
//  NotaF.NFe.Dest.EnderDest.nro     := '973';
//  NotaF.NFe.Dest.EnderDest.xCpl    := '';
//  NotaF.NFe.Dest.EnderDest.xBairro := 'Centro';
//  NotaF.NFe.Dest.EnderDest.cMun    := 3554003;
//  NotaF.NFe.Dest.EnderDest.xMun    := 'Tatui';
//  NotaF.NFe.Dest.EnderDest.UF      := 'SP';
//  NotaF.NFe.Dest.EnderDest.cPais   := 1058;
//  NotaF.NFe.Dest.EnderDest.xPais   := 'BRASIL';



  //ITENS DA VENDA NA NOTA

  //RELACIONANDO OS ITENS COM A  VENDA
   item := 1;
   DM.QueryDetVenda.Close;
   DM.QueryDetVenda.SQL.Clear;
   DM.QueryDetVenda.SQL.Add('select * from detalhes_vendas WHERE numero_venda = :num order by codigo asc') ;
   DM.QueryDetVenda.Parameters.ParamByName('num').Value :=  DM.QueryVenda.FieldByName('CODIGO').Value;
   DM.QueryDetVenda.Open;
   DM.QueryDetVenda.First;

   while not DM.QueryDetVenda.Eof do
   begin
     Produto := NotaF.NFe.Det.New;
     Produto.Prod.nItem    := item; // N?mero sequencial, para cada item deve ser incrementado
     Produto.Prod.cProd    := '123456';
     Produto.Prod.cEAN     := '7896523206646';
     Produto.Prod.xProd    := DM.QueryDetVenda.FieldByName('PRODUTO').Value;
     Produto.Prod.NCM      := '94051010'; // Tabela NCM dispon?vel em  http://www.receita.fazenda.gov.br/Aliquotas/DownloadArqTIPI.htm
     Produto.Prod.EXTIPI   := '';
     Produto.Prod.CFOP     := '5101';
     Produto.Prod.uCom     := 'UN';
     Produto.Prod.qCom     := DM.QueryDetVenda.FieldByName('QUANTIDADE').Value;
     Produto.Prod.vUnCom   := DM.QueryDetVenda.FieldByName('VALOR').Value;
     Produto.Prod.vProd    := DM.QueryDetVenda.FieldByName('VALOR_TOTAL').Value;


    //INFORMA??ES DE IMPOSTOS SOBRE OS PRODUTOS
     Produto.Prod.cEANTrib  := '7896523206646';
     Produto.Prod.uTrib     := 'UN';
     Produto.Prod.qTrib     := 1;
     Produto.Prod.vUnTrib   := 100;
     Produto.Prod.vOutro    := 0;
     Produto.Prod.vFrete    := 0;
     Produto.Prod.vSeg      := 0;
     Produto.Prod.vDesc     := 0;

     Produto.Prod.CEST := '1111111';

     Produto.infAdProd := 'Informacao Adicional do Produto';


   // lei da transparencia nos impostos
     Produto.Imposto.vTotTrib := 0;
     Produto.Imposto.ICMS.CST   	:= cst00;
     Produto.Imposto.ICMS.orig    := oeNacional;
     Produto.Imposto.ICMS.modBC   := dbiValorOperacao;
     Produto.Imposto.ICMS.vBC     := 100;
     Produto.Imposto.ICMS.pICMS   := 18;
     Produto.Imposto.ICMS.vICMS   := 18;
     Produto.Imposto.ICMS.modBCST := dbisMargemValorAgregado;
     Produto.Imposto.ICMS.pMVAST  := 0;
     Produto.Imposto.ICMS.pRedBCST:= 0;
     Produto.Imposto.ICMS.vBCST   := 0;
     Produto.Imposto.ICMS.pICMSST := 0;
     Produto.Imposto.ICMS.vICMSST := 0;
     Produto.Imposto.ICMS.pRedBC  := 0;

       // partilha do ICMS e fundo de probreza
     Produto.Imposto.ICMSUFDest.vBCUFDest      := 0.00;
     Produto.Imposto.ICMSUFDest.pFCPUFDest     := 0.00;
     Produto.Imposto.ICMSUFDest.pICMSUFDest    := 0.00;
     Produto.Imposto.ICMSUFDest.pICMSInter     := 0.00;
     Produto.Imposto.ICMSUFDest.pICMSInterPart := 0.00;
     Produto.Imposto.ICMSUFDest.vFCPUFDest     := 0.00;
     Produto.Imposto.ICMSUFDest.vICMSUFDest    := 0.00;
     Produto.Imposto.ICMSUFDest.vICMSUFRemet   := 0.00;

     item := item + 1;
   	 DM.QueryDetVenda.Next;
   end;

   //totalizando

   NotaF.NFe.Total.ICMSTot.vBC     := 100;
   NotaF.NFe.Total.ICMSTot.vICMS   := 18;
   NotaF.NFe.Total.ICMSTot.vBCST   := 0;
   NotaF.NFe.Total.ICMSTot.vST     := 0;
   NotaF.NFe.Total.ICMSTot.vProd   := DM.QueryVenda.FieldByName('VALOR').Value;
   NotaF.NFe.Total.ICMSTot.vFrete  := 0;
   NotaF.NFe.Total.ICMSTot.vSeg    := 0;
   NotaF.NFe.Total.ICMSTot.vDesc   := StrToCurr(EditDesconto.Text);
   NotaF.NFe.Total.ICMSTot.vII     := 0;
   NotaF.NFe.Total.ICMSTot.vIPI    := 0;
   NotaF.NFe.Total.ICMSTot.vPIS    := 0;
   NotaF.NFe.Total.ICMSTot.vCOFINS := 0;
   NotaF.NFe.Total.ICMSTot.vOutro  := 0;
   NotaF.NFe.Total.ICMSTot.vNF     := 100;

    // lei da transparencia de impostos
   NotaF.NFe.Total.ICMSTot.vTotTrib := 0;

  // partilha do icms e fundo de probreza
  NotaF.NFe.Total.ICMSTot.vFCPUFDest   := 0.00;
  NotaF.NFe.Total.ICMSTot.vICMSUFDest  := 0.00;
  NotaF.NFe.Total.ICMSTot.vICMSUFRemet := 0.00;


  NotaF.NFe.Transp.modFrete := mfSemFrete;  //SEM FRETE

  // YA. Informa??es de pagamento

  InfoPgto := NotaF.NFe.pag.New;
  InfoPgto.indPag := ipVista;
  InfoPgto.tPag   := fpDinheiro;
  InfoPgto.vPag   := DM.QueryVenda.FieldByName('VALOR').Value;

  nfce.NotasFiscais.Assinar;
  nfce.Enviar(DM.QueryVenda.FieldByName('CODIGO').AsInteger);
  ShowMessage(nfce.WebServices.StatusServico.Msg);

end;

/// emissao de cupon
procedure TfrmVendas.IniciaNfce;
var
	Caminho:String;
begin
	Caminho := ExtractFileDir(GetCurrentDir)+'\PDV\Fontes\nfe';
	ShowMessage(Caminho);
  NFCe.Configuracoes.Arquivos.PathSchemas := Caminho;
  ShowMessage(Caminho);
end;

procedure TfrmVendas.IniciarVenda;
begin
	DM.dataSetVendas.Append;
end;

procedure TfrmVendas.LimpaCampos;
begin
  EditRecebido.Text := '';
  EdtTotal.Text := '';
  EditTroco.Text := '';
  EditDesconto.Text := '';
  EdtDataVenda.Text := '';
  EdtHora.Text := '';
  LblTroco.Caption := '0';
  CarregarFoto;
  LimpaGrid;
end;

procedure TfrmVendas.LimpaGrid;
begin
	DM.QueryDetVenda.Close;
	DM.QueryDetVenda.SQL.Clear;
	DM.QueryDetVenda.SQL.Add('SELECT CODIGO,COD_VENDA,PRODUTO,QUANTIDADE,'+
  'COD_PRODUTO,VALOR,VALOR_TOTAL FROM DETALHE_VENDA');
  DM.QueryDetVenda.SQL.Add('WHERE COD_VENDA = NULL');
	DM.QueryDetVenda.Open;
	CalcularSubTotal;
end;

procedure TfrmVendas.LimparProdutos;
begin
   txtBusca.Text := '';
   txtBusca.SetFocus;
   EdtProduto.Text := '';
   edtUnitario.Text := '';
   edtQuantidade.Text := '1';
end;

procedure TfrmVendas.ListarItens;
var
	Codigo: Integer;
begin
	DM.QueryDetVenda.Close;
	DM.QueryDetVenda.SQL.Clear;
	DM.QueryDetVenda.SQL.Add('SELECT CODIGO,COD_VENDA,PRODUTO,QUANTIDADE,'+
  'COD_PRODUTO,VALOR,VALOR_TOTAL FROM DETALHE_VENDA');
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
	// fazer a totaliza??o aqui

	 Qtde := TSingentonQuantidade.GetInstance;
	 ValorTotal := Qtde.Totalizar(Quantidade,ValorUnitario);

	// pegando o produto pesquisado
	Produto := DM.ConsultaProdutos.FieldByName('NOME').Value;
	EdtProduto.Text := Produto;

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
  Hora:String;

begin
	Qtde:= TSingentonQuantidade.GetInstance;
	ValorTotal:= Qtde.Totalizar(Quantidade,ValorUnitario);
  EdtTotal.Text := CurrToStr(ValorTotal);
	EdtDataVenda.Text := DateToStr(Now);
  EdtHora.Text := TimeToStr(Now);
	DM.dataSetVendas.FieldByName('COD_FUNCIONARIO').Value := DM.consultaFunc.FieldByName('CODIGO').Value;
	DM.dataSetVendas.FieldByName('FUNCIONARIO').Value := DM.consultaUsuarios.FieldByName('USUARIO').Value;
end;

procedure TfrmVendas.ExibeFoto(Campo: TField; ImgProd: TImage);
var
  vJpeg   : TJPEGImage;
  vStream : TMemoryStream;
begin
  { Verifica se o campo esta v?zio. }
  if not Campo.IsNull then
  begin

    { Cria objeto do tipo TJPEG, e objeto do tipo MemoryStream}
    vJpeg   := TJPEGImage.Create;
    vStream := TMemoryStream.Create;

    { Trata o campo como do tipo BLOB e salva o seu conteudo na mem?ria. }
    TBlobField(Campo).SaveToStream(vStream);

    { Ajusta a posicao inicial de leitura da mem?ria }
    vStream.Position := 0;

    { Carrega da memoria os dados, para uma estrutura do tipo TJPEG
      (A partir da posicao 0)}
    vJpeg.LoadFromStream(vStream);

    { Exibe o jpg no Timage. }
    ImgProd.Picture.Assign(vJpeg);

    { Libera a memoria utilizada pelos componentes de convers?o }
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
