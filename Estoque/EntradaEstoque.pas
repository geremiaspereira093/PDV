unit EntradaEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Data.DB,
  Vcl.ExtDlgs;

type
  TfrmEntradaEstoque = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    btnCancelar: TSpeedButton;
    btnNovo: TSpeedButton;
    btnSalvar: TSpeedButton;
    Image1: TImage;
    lookupFornecedor: TDBLookupComboBox;
    Label2: TLabel;
    edtProduto: TDBEdit;
    Label3: TLabel;
    edtValor: TDBEdit;
    Label4: TLabel;
    edtDataFabricacao: TDBEdit;
    Label5: TLabel;
    edtDataValidade: TDBEdit;
    Label6: TLabel;
    edtDescricao: TDBEdit;
    Label7: TLabel;
    edtQuantidade: TDBEdit;
    Label1: TLabel;
    sourceProdutos: TDataSource;
    ImgCodBarras: TImage;
    Label8: TLabel;
    EdtCodBarras: TDBEdit;
    DsFornecedores: TDataSource;
    ImagemProduto: TImage;
    Panel1: TPanel;
    Dialog: TOpenPictureDialog;
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AtivaNovo;
    procedure LimpaCampos;
    procedure edtProdutoExit(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
    procedure edtDescricaoExit(Sender: TObject);
    procedure edtDataValidadeExit(Sender: TObject);
    procedure edtDataFabricacaoExit(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure sourceProdutosStateChange(Sender: TObject);
    procedure EdtCodBarrasChange(Sender: TObject);
    procedure GerarCodigo(Codigo:String; Canvas :TCanvas);
    procedure EdtCodBarrasExit(Sender: TObject);
    procedure AtualizaConsulta;
    procedure Panel1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEntradaEstoque: TfrmEntradaEstoque;

implementation

{$R *.dfm}

uses Produtos, ModuloDados;

procedure TfrmEntradaEstoque.AtivaNovo;
begin
	btnNovo.Enabled := True;
end;

procedure TfrmEntradaEstoque.AtualizaConsulta;
begin
	DM.consultaProdutos.Close;
  DM.consultaProdutos.SQL.Clear;
  DM.consultaProdutos.SQL.Add('SELECT CODIGO,NOME,VALOR,DESCRICAO,'+
  'DATA_FABRICACAO,DATA_VALIDADE,COD_FORN,QUANTIDADE,CODIGO_BARRAS FROM PRODUTOS');
  DM.consultaProdutos.Open;
end;

procedure TfrmEntradaEstoque.btnCancelarClick(Sender: TObject);
begin
  DM.dataSetProdutos.Cancel;
  LimpaCampos;
end;

procedure TfrmEntradaEstoque.btnNovoClick(Sender: TObject);
begin
	edtProduto.SetFocus;
  DM.dataSetProdutos.Append;
end;

procedure TfrmEntradaEstoque.btnSalvarClick(Sender: TObject);
begin
  frmProdutos.AtualizaConsulta;
	DM.dataSetProdutos.Post;
  LimpaCampos;
end;

procedure TfrmEntradaEstoque.EdtCodBarrasChange(Sender: TObject);
begin
	GerarCodigo(EdtCodBarras.Text,ImgCodBarras.Canvas);
end;

procedure TfrmEntradaEstoque.EdtCodBarrasExit(Sender: TObject);
begin
	if Trim( EdtCodBarras.Text )= ''  Then
  begin
    MessageDlg('Campo Vazio !',mtWarning,mbOkCancel,0);
    EdtCodBarras.SetFocus;
  end;

  AtualizaConsulta;
  DM.consultaProdutos.Close;
  DM.consultaProdutos.SQL.Add('WHERE CODIGO_BARRAS = :CODIGO');
  DM.consultaProdutos.Parameters.ParamByName('CODIGO').Value := Trim(EdtCodBarras.Text);
  DM.consultaProdutos.Open;

  if not DM.consultaProdutos.IsEmpty Then
  begin
   	MessageDlg('Produto Já Cadastrado na Base de Dados',mtWarning,mbOkCancel,0);
    EdtCodBarras.SetFocus;
    abort
  end;

end;

//////////Valida se os campos estão vazios

procedure TfrmEntradaEstoque.edtDataFabricacaoExit(Sender: TObject);
begin
	if Trim(edtProduto.Text) = '' Then
	begin
  	ShowMessage('Por favor informe a data de fabricação do produto !');
    edtDataFabricacao.SetFocus;
    abort;
  end;
end;

procedure TfrmEntradaEstoque.edtDataValidadeExit(Sender: TObject);
begin
	if Trim(edtDataValidade.Text) ='' Then
  begin
    ShowMessage('Por favor informe a data de validade do produto !');
    edtDataValidade.SetFocus;
    abort
  end;
end;

procedure TfrmEntradaEstoque.edtDescricaoExit(Sender: TObject);
begin
	if Trim(edtDescricao.Text) ='' Then
  begin
    ShowMessage('Por favor insira uma descrição do produto !');
    edtDescricao.SetFocus;
    abort
  end;
end;

procedure TfrmEntradaEstoque.edtProdutoExit(Sender: TObject);
begin
	if Trim(edtProduto.Text) ='' Then
  begin
    ShowMessage('Por favor insira um produto !');
    edtProduto.SetFocus;
    abort
  end;
end;

procedure TfrmEntradaEstoque.edtQuantidadeExit(Sender: TObject);
begin
	if Trim(edtProduto.Text) = '' Then
	begin
  	ShowMessage('Campo quantidade vazio !');
    edtQuantidade.SetFocus;
    abort;
  end;
end;

procedure TfrmEntradaEstoque.edtValorExit(Sender: TObject);
begin
	if Trim(edtValor.Text) ='' Then
  begin
    ShowMessage('Por favor insira um valor para o produto !');
    edtQuantidade.SetFocus;
    abort
  end;
end;

procedure TfrmEntradaEstoque.FormCreate(Sender: TObject);
begin
	DM.conexaoBanco.Connected := True;
	DM.dataSetProdutos.Active := True;
  DM.consultaProdutos.Active := True;
  DM.dataSetForn.Active := True;
  DM.ConsultaFornece.Active := True;
  DM.consultaProdutos.Active := True;
end;

procedure TfrmEntradaEstoque.LimpaCampos;
begin
	edtProduto.Text := '';
  edtDataFabricacao.Text := '';
  edtDataValidade.Text := '';
  edtDescricao.Text := '';
  edtValor.Text := '';
  edtQuantidade.Text := '';
end;

procedure TfrmEntradaEstoque.Panel1Click(Sender: TObject);
begin
	Dialog.Execute();
  ImagemProduto.Picture.LoadFromFile(Dialog.FileName);//pegar o caminho da Imagem
end;

procedure TfrmEntradaEstoque.sourceProdutosStateChange(Sender: TObject);
begin
	btnNovo.Enabled := ( DM.dataSetProdutos.State in [dsBrowse] );
  btnSalvar.Enabled := ( DM.dataSetProdutos.State in [dsInsert] );
  btnCancelar.Enabled := ( DM.dataSetProdutos.State in [dsInsert] );

  if DM.dataSetProdutos.State in [dsBrowse] Then
  begin
    btnSalvar.Enabled := False;
    btnCancelar.Enabled := False;
  end;
end;

Procedure TFrmEntradaEstoque.GerarCodigo(Codigo: String; Canvas : TCanvas);
const
  digitos : array['0'..'9'] of string[5]= ('00110', '10001', '01001', '11000',
  '00101', '10100', '01100', '00011', '10010', '01010');
var s : string;
	i, j, x, t : Integer;
begin
  // Gerar o valor para desenhar o código de barras
  // Caracter de início
  s := '0000';
  for i := 1 to length((Codigo)) div 2 do
    for j := 1 to 5 do
      s := s + Copy(Digitos[Codigo[i * 2 - 1]], j, 1) + Copy(Digitos[Codigo[i * 2]], j, 1);
      // Caracter de fim
      s := s + '100';
      // Desenhar em um objeto canvas
      // Configurar os parâmetros iniciais
      x := 0;
      // Pintar o fundo do código de branco
      Canvas.Brush.Color := clWhite;
      Canvas.Pen.Color := clWhite;
      Canvas.Rectangle(0,0, 2000, 79);
      // Definir as cores da caneta
      Canvas.Brush.Color := clBlack;
      Canvas.Pen.Color := clBlack;
      // Escrever o código de barras no canvas
    for i := 1 to length(s) do
    begin
      // Definir a espessura da barra
      t := strToInt(s[i]) * 2 + 1;
      // Imprimir apenas barra sim barra não (preto/branco - intercalado);
      if i mod 2 = 1 then
        Canvas.Rectangle(x, 0, x + t, 79);
      // Passar para a próxima barra
        x := x + t;
    end;
end;
end.


