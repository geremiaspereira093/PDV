unit Produtos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls,
  Vcl.Imaging.pngimage, Vcl.ComCtrls, ppBarCod, ppCtrls, ppPrnabl, ppClass,
  ppBands, ppCache, ppDB, ppDesignLayer, ppParameter, ppProd, ppReport,
  ppComm, ppRelatv, ppDBPipe, Vcl.ExtDlgs,Vcl.Imaging.jpeg;

type
  TfrmProdutos = class(TForm)
    DBGrid1: TDBGrid;
    Image1: TImage;
    LblTotal: TLabel;
    LblTotalProdutos: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid2: TDBGrid;
    Image3: TImage;
    btnEditar: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnListar: TSpeedButton;
    TextBuscaProdutos: TEdit;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    btnDeletar: TSpeedButton;
    DataSourceAlterProduto: TDataSource;
    srcConProd: TDataSource;
    DataSource1: TDataSource;
    BtnPrint: TSpeedButton;
    Label8: TLabel;
    DBCodigoBarras: TDBEdit;
    ImgCodigo: TImage;
    PipeLineEtiquetas: TppDBPipeline;
    ReportEtiquetas: TppReport;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBBarCode1: TppDBBarCode;
    ppDBBarCode2: TppDBBarCode;
    ppDBBarCode3: TppDBBarCode;
    ppDBBarCode4: TppDBBarCode;
    ppDBBarCode5: TppDBBarCode;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    EdtCodBarras: TEdit;
    RdProduto: TRadioButton;
    RdCodigo: TRadioButton;
    ImagemProduto: TImage;
    BtnAdicionar: TPanel;
    btnNovo: TSpeedButton;
    Dialog: TOpenPictureDialog;
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure AtualizaConsulta;
    procedure AtualizaQuery;
    procedure btnCancelarClick(Sender: TObject);
    procedure CalculaTotalEstoque;
    procedure btnListarClick(Sender: TObject);
    procedure PesquisaProdutos;
    procedure TextBuscaProdutosChange(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure DataSourceAlterProdutoStateChange(Sender: TObject);
    procedure GerarCodigo(Codigo:String; Canvas :TCanvas);
    procedure DBCodigoBarrasChange(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure RdProdutoClick(Sender: TObject);
    procedure RdCodigoClick(Sender: TObject);
    procedure EdtCodBarrasChange(Sender: TObject);
    procedure EdtCodBarrasExit(Sender: TObject);
    procedure BtnAdicionarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure GravarFoto;
    procedure CarregarFoto;
    procedure DBGrid2CellClick(Column: TColumn);
    procedure ExibeFoto(Campo:TField;ImgProd:TImage);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdutos: TfrmProdutos;

implementation

{$R *.dfm}

uses ModuloDados, EntradaEstoque;

{ TProdutos }

procedure TfrmProdutos.AtualizaConsulta;
begin
	DM.consultaProdutos.UpdateStatus;
end;

procedure TfrmProdutos.AtualizaQuery;
begin
	DM.consultaProdutos.Close;
  DM.consultaProdutos.SQL.Clear;
  DM.consultaProdutos.SQL.Add('SELECT CODIGO, NOME,VALOR,DESCRICAO,DATA_FABRICACAO,'
  +'DATA_VALIDADE,QUANTIDADE,COD_FORN, CODIGO_BARRAS FROM PRODUTOS');
  DM.consultaProdutos.Open;
end;

procedure TfrmProdutos.btnCancelarClick(Sender: TObject);
begin
  DM.DataSetAlterarProdutos.Cancel;
end;

procedure TfrmProdutos.btnDeletarClick(Sender: TObject);
begin
	AtualizaConsulta;
  btnEditar.Enabled := False;
	DM.consultaProdutos.Delete;
  btnEditar.Enabled := True;
  // Verificar com o marcelo
end;

procedure TfrmProdutos.btnEditarClick(Sender: TObject);
begin
  btnEditar.Enabled := False;
  DM.DataSetAlterarProdutos.Edit;
end;

procedure TfrmProdutos.btnListarClick(Sender: TObject);
begin
	AtualizaQuery;
end;

procedure TfrmProdutos.btnNovoClick(Sender: TObject);
begin
	DM.DataSetAlterarProdutos.Append;
end;

procedure TfrmProdutos.BtnPrintClick(Sender: TObject);
begin
	ReportEtiquetas.Print;
end;

procedure TfrmProdutos.btnSalvarClick(Sender: TObject);
begin
  AtualizaConsulta;
  GravarFoto;
	DM.DataSetAlterarProdutos.Post;
end;

procedure TfrmProdutos.CalculaTotalEstoque;
var
  Quantidade: Integer;
begin;
	DM.consultaProdutos.First;
	while not DM.consultaProdutos.Eof do
   begin
   	Quantidade := Quantidade + DM.consultaProdutos.FieldByName('QUANTIDADE').Value;
    DM.consultaProdutos.Next;
   end;
   LblTotalProdutos.Caption := IntToStr(Quantidade);
end;
procedure TfrmProdutos.CarregarFoto;
var
	CaminhoImagem:String;
begin
  CaminhoImagem :=  ExtractFileDir(GetCurrentDir) + '\PDV\Fontes\FotosPadrao\sem-foto.jpg';
  ImagemProduto.Picture.LoadFromFile(CaminhoImagem);
end;

procedure TfrmProdutos.RdCodigoClick(Sender: TObject);
begin
	if RdCodigo.Checked = True Then
  Begin
    EdtCodBarras.Enabled := True;
    EdtCodBarras.Visible := True;
    TextBuscaProdutos.Enabled := False;
    TextBuscaProdutos.Visible := False;
  End;
end;

procedure TfrmProdutos.DataSourceAlterProdutoStateChange(Sender: TObject);
begin
	btnNovo.Enabled := ( DM.DataSetAlterarProdutos.State in [dsBrowse] );
  btnSalvar.Enabled := ( DM.DataSetAlterarProdutos.State in [dsInsert] );
  btnCancelar.Enabled := ( DM.DataSetAlterarProdutos.State in [dsInsert] );
  BtnAdicionar.Enabled := ( DM.DataSetAlterarProdutos.State in [dsInsert] );
  btnEditar.Enabled := ( DM.DataSetAlterarProdutos.State in [dsBrowse] );

  if DM.DataSetAlterarProdutos.State in [dsInsert] Then
  begin
    btnEditar.Enabled:= False;
  	btnDeletar.Enabled := False;

  end
  else if DM.DataSetAlterarProdutos.State in [dsEdit]  Then
  begin
  	btnNovo.Enabled := False;
    btnDeletar.Enabled := False;
    btnSalvar.Enabled := True;
    btnCancelar.Enabled := True;
    BtnAdicionar.Enabled := True;
  end
  else
  begin
  	btnNovo.Enabled := True;
    btnDeletar.Enabled := True;
    btnSalvar.Enabled := False;
    btnCancelar.Enabled := False;
    BtnAdicionar.Enabled := False;
  end;

end;

procedure TfrmProdutos.DBCodigoBarrasChange(Sender: TObject);
var
	Codigo:String;
begin
	Codigo := DBCodigoBarras.Text;
	GerarCodigo(Codigo,ImgCodigo.Canvas);
end;

procedure TfrmProdutos.DBGrid2CellClick(Column: TColumn);
begin
	ExibeFoto(DM.DataSetAlterarProdutos.FieldByName('IMAGEM'),ImagemProduto);
end;

procedure TfrmProdutos.EdtCodBarrasChange(Sender: TObject);
begin
	PesquisaProdutos;
end;

procedure TfrmProdutos.EdtCodBarrasExit(Sender: TObject);
begin
	PesquisaProdutos;
  if DM.consultaProdutos.IsEmpty Then
  begin
    MessageDlg('Produto Não Encontrado na Base de Dados !',mtWarning,mbOkCancel,0);
    EdtCodBarras.Text := '';
    EdtCodBarras.SetFocus;
    abort
  end;
end;

procedure TfrmProdutos.ExibeFoto(Campo: TField; ImgProd: TImage);
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

procedure TfrmProdutos.FormCreate(Sender: TObject);
begin
	DM.conexaoBanco.Connected := True;
	DM.dataSetProdutos.Active := True;
  DM.consultaProdutos.Active := True;
  DM.dataSetForn.Active := True;
  DM.DataSetAlterarProdutos.Active := True;
  CalculaTotalEstoque;
  CarregarFoto;
end;

procedure TfrmProdutos.GerarCodigo(Codigo: String; Canvas: TCanvas);
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
procedure TfrmProdutos.GravarFoto;
var
	Foto: TPicture;
begin
	if Dialog.FileName <> '' Then
  begin
  	Foto :=TPicture.Create;
    Foto.LoadFromFile(Dialog.FileName);
    DM.DataSetAlterarProdutos.FieldByName('IMAGEM').Assign(Foto);
    Foto.Free;
    Dialog.FileName := ExtractFileDir(GetCurrentDir) + '\PDV\Fontes\FotosPadrao\sem-foto.jpg';
  end
  else
  	DM.DataSetAlterarProdutos.FieldByName('IMAGEM').Value := ExtractFileDir(GetCurrentDir) + '\PDV\Fontes\FotosPadrao\sem-foto.jpg';
end;

procedure TfrmProdutos.BtnAdicionarClick(Sender: TObject);
begin
	Dialog.Execute();
  ImagemProduto.Picture.LoadFromFile(Dialog.FileName);
end;

procedure TfrmProdutos.PesquisaProdutos;
begin
	AtualizaQuery;
	DM.consultaProdutos.Close;
  if RdProduto.Checked = True Then
  begin
  	DM.consultaProdutos.SQL.Add('WHERE NOME LIKE :PROD');
		DM.consultaProdutos.Parameters.ParamByName('PROD').Value := '%'+Trim(TextBuscaProdutos.Text)+'%';
  end;
  if RdCodigo.Checked = True Then
  begin
  	DM.consultaProdutos.SQL.Add('WHERE CODIGO_BARRAS = :COD_BARRAS');
    DM.consultaProdutos.Parameters.ParamByName('COD_BARRAS').Value := Trim(EdtCodBarras.Text);
  end;
	DM.consultaProdutos.Open;
end;

procedure TfrmProdutos.RdProdutoClick(Sender: TObject);
begin
	if RdProduto.Checked = True Then
  begin
    TextBuscaProdutos.Enabled := True;
    TextBuscaProdutos.Visible := True;
    EdtCodBarras.Enabled := False;
    EdtCodBarras.Visible := False;
  end;
end;

procedure TfrmProdutos.TextBuscaProdutosChange(Sender: TObject);
begin
	PesquisaProdutos;
  if DM.consultaProdutos.IsEmpty Then
  begin
    ShowMessage('Produto não encontrado na base dados');
    abort;
  end;
end;

end.
