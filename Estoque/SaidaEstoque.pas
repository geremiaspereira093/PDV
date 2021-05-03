unit SaidaEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls;

type
  TfrmSaiEstoque = class(TForm)
    DBGrid1: TDBGrid;
    btnCancelar: TSpeedButton;
    btnRetirar: TSpeedButton;
    BuscarProduto: TEdit;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    EdtQuantidade: TEdit;
    Label2: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DSConsultaProdutos: TDataSource;
    procedure BuscaProduto;
    procedure AtualizaConsulta;
    procedure AbateEstoque;
    procedure btnRetirarClick(Sender: TObject);
    procedure RetornaEstoque;
    procedure btnCancelarClick(Sender: TObject);
    procedure LimpaCampos;
    procedure BuscarProdutoExit(Sender: TObject);
    procedure EdtQuantidadeExit(Sender: TObject);
    procedure VerificaCampos;
    procedure VoltaPesquisa;
    procedure FormCreate(Sender: TObject);
    procedure BuscarProdutoChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DSConsultaProdutosStateChange(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSaiEstoque: TfrmSaiEstoque;

implementation

{$R *.dfm}

uses ModuloDados;

{ TfrmSaiEstoque }

procedure TfrmSaiEstoque.AbateEstoque;
begin
	DM.consultaProdutos.Close;
  DM.consultaProdutos.SQL.Clear;
  DM.consultaProdutos.SQL.Add('EXEC ABATE_ESTOQUE :@PRODUTO,:@QTDE');
  DM.consultaProdutos.Parameters.ParamByName('@PRODUTO').Value := Trim(BuscarProduto.Text);
  DM.consultaProdutos.Parameters.ParamByName('@QTDE').Value := Trim(EdtQuantidade.Text);
  DM.consultaProdutos.ExecSQL;
end;

procedure TfrmSaiEstoque.btnCancelarClick(Sender: TObject);
begin
	if MessageDlg('Deseja cancelar a retirada do estoque ?',mtConfirmation,[mbYes,mbNo],0) = mrNo Then
  begin
  	LimpaCampos;
    VoltaPesquisa;
  	abort;
  end
  else
  begin
  	RetornaEstoque;
    LimpaCampos;
    VoltaPesquisa;
  end;
end;

procedure TfrmSaiEstoque.btnRetirarClick(Sender: TObject);
begin
	VerificaCampos;
  btnCancelar.Enabled := True;
  btnRetirar.Enabled := False;
  VoltaPesquisa;
end;

procedure TfrmSaiEstoque.BuscaProduto;
begin
  AtualizaConsulta;

	DM.consultaProdutos.Close;
  DM.consultaProdutos.SQL.Add('WHERE NOME LIKE :PRODUTO');
  DM.consultaProdutos.Parameters.ParamByName('PRODUTO').Value := '%'+Trim(BuscarProduto.Text)+'%';
  DM.consultaProdutos.Open;

  if DM.consultaProdutos.IsEmpty Then
  begin
    ShowMessage('Produto não encontrado na base de dados !');
    LimpaCampos;
    VoltaPesquisa;
    abort;
  end;

end;

procedure TfrmSaiEstoque.BuscarProdutoChange(Sender: TObject);
begin
  BuscaProduto;
end;

procedure TfrmSaiEstoque.BuscarProdutoExit(Sender: TObject);
begin
 	if BuscarProduto.Text = '' Then
  begin
  	ShowMessage('Informe o produto que deseja pesquisar !');
    VoltaPesquisa;
    abort;
  end;
end;

procedure TfrmSaiEstoque.DSConsultaProdutosStateChange(Sender: TObject);
begin
	btnRetirar.Enabled := ( DM.consultaProdutos.State in [dsBrowse] );

  if DM.consultaProdutos.State in [dsBrowse] Then
  	btnCancelar.Enabled := False;
end;

procedure TfrmSaiEstoque.EdtQuantidadeExit(Sender: TObject);
begin
	if EdtQuantidade.Text = '' Then
  begin
  	ShowMessage('Informe a quantidade do produto a ser retirado!');
    abort;
  end;
end;

procedure TfrmSaiEstoque.FormCreate(Sender: TObject);
begin
	DM.conexaoBanco.Connected := True;
  DM.consultaProdutos.Active := True;
end;

procedure TfrmSaiEstoque.LimpaCampos;
begin
	EdtQuantidade.Text := '';
  BuscarProduto.Text := '';
end;

procedure TfrmSaiEstoque.AtualizaConsulta;
begin
	DM.consultaProdutos.Close;
  DM.consultaProdutos.SQL.Clear;
  DM.consultaProdutos.SQL.Add('SELECT CODIGO,NOME,VALOR,DESCRICAO,DATA_FABRICACAO,DATA_VALIDADE,COD_FORN,QUANTIDADE FROM PRODUTOS');
  DM.consultaProdutos.Open;
end;

procedure TfrmSaiEstoque.RetornaEstoque;
var
	Produto: String;
  Quantidade :Integer;
begin
	Produto := Trim(BuscarProduto.Text);
  Quantidade := StrToInt(EdtQuantidade.Text);

	DM.consultaProdutos.Close;
  DM.consultaProdutos.SQL.Clear;
  DM.consultaProdutos.SQL.Add('EXEC RETORNA_ESTOQUE :@PROD,:@QUANT');
  DM.consultaProdutos.Parameters.ParamByName('@PROD').Value :=  Produto;
  DM.consultaProdutos.Parameters.ParamByName('@QUANT').Value := Quantidade;
  DM.consultaProdutos.ExecSQL;
end;

procedure TfrmSaiEstoque.SpeedButton1Click(Sender: TObject);
begin
	AtualizaConsulta;
end;

procedure TfrmSaiEstoque.VerificaCampos;
begin
	if (EdtQuantidade.Text = '') AND (EdtQuantidade.Text = '') Then
  begin
    ShowMessage('Informe o poduto e a quantidade que deseja retirar do estoque !');
    abort;
  end
  else
  	AbateEstoque;
end;

procedure TfrmSaiEstoque.VoltaPesquisa;
begin
	BuscarProduto.SetFocus;
end;

end.
