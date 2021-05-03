{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N-,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN SYMBOL_EXPERIMENTAL ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN UNIT_EXPERIMENTAL ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
{$WARN OPTION_TRUNCATED ON}
{$WARN WIDECHAR_REDUCED ON}
{$WARN DUPLICATES_IGNORED ON}
{$WARN UNIT_INIT_SEQ ON}
{$WARN LOCAL_PINVOKE ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN TYPEINFO_IMPLICITLY_ADDED ON}
{$WARN RLINK_WARNING ON}
{$WARN IMPLICIT_STRING_CAST ON}
{$WARN IMPLICIT_STRING_CAST_LOSS ON}
{$WARN EXPLICIT_STRING_CAST OFF}
{$WARN EXPLICIT_STRING_CAST_LOSS OFF}
{$WARN CVT_WCHAR_TO_ACHAR ON}
{$WARN CVT_NARROWING_STRING_LOST ON}
{$WARN CVT_ACHAR_TO_WCHAR ON}
{$WARN CVT_WIDENING_STRING_LOST ON}
{$WARN NON_PORTABLE_TYPECAST ON}
{$WARN XML_WHITESPACE_NOT_ALLOWED ON}
{$WARN XML_UNKNOWN_ENTITY ON}
{$WARN XML_INVALID_NAME_START ON}
{$WARN XML_INVALID_NAME ON}
{$WARN XML_EXPECTED_CHARACTER ON}
{$WARN XML_CREF_NO_RESOLVE ON}
{$WARN XML_NO_PARM ON}
{$WARN XML_NO_MATCHING_PARM ON}
{$WARN IMMUTABLE_STRINGS OFF}
unit Fornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Data.DB, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TfrmFornecedor = class(TForm)
    Label1: TLabel;
    edtCnpj: TDBEdit;
    Label2: TLabel;
    edtNome: TDBEdit;
    btnNovo: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnDeletar: TSpeedButton;
    DBGrid1: TDBGrid;
    btnListar: TSpeedButton;
    Cadastro: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    DBGrid2: TDBGrid;
    btnCancelarEdicao: TSpeedButton;
    TabSheet4: TTabSheet;
    DBGrid3: TDBGrid;
    Image1: TImage;
    Label3: TLabel;
    Image2: TImage;
    TextBuscaForne: TEdit;
    btnSalvarCadastro: TSpeedButton;
    btnCancelarCadastro: TSpeedButton;
    DBEdit1: TDBEdit;
    DbEditCnpj: TDBEdit;
    Label5: TLabel;
    Label4: TLabel;
    BtnEditar: TSpeedButton;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    Label6: TLabel;
    Image3: TImage;
    Image4: TImage;
    sourceForne: TDataSource;
    DataSourceCadFornece: TDataSource;
    DataConsultaForne: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure ValidaCampo;
    procedure edtCnpjExit(Sender: TObject);
    procedure LimpaCampo;
    procedure AtualizaConsulta;
    procedure btnListarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure BuscaFornecedor;
    procedure btnSalvarCadastroClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure edtNomeExit(Sender: TObject);
    procedure TextBuscaForneChange(Sender: TObject);
    procedure sourceForneStateChange(Sender: TObject);
    procedure DataSourceCadForneceStateChange(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarCadastroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFornecedor: TfrmFornecedor;

implementation

{$R *.dfm}

uses ModuloDados;

procedure TfrmFornecedor.AtualizaConsulta;
begin
	DM.ConsultaFornece.Close;
  DM.ConsultaFornece.SQL.Clear;
  DM.ConsultaFornece.SQL.Add('SELECT CODIGO, CNPJ,NOME FROM FORNECEDORES');
  DM.ConsultaFornece.Open;
end;

procedure TfrmFornecedor.btnCancelarCadastroClick(Sender: TObject);
begin
	DM.DataSetCadastroFornecedor.Cancel;
end;

procedure TfrmFornecedor.btnCancelarClick(Sender: TObject);
begin
  DM.dataSetForn.Cancel;
end;

procedure TfrmFornecedor.btnDeletarClick(Sender: TObject);
begin
	DM.dataSetForn.Delete;
end;

procedure TfrmFornecedor.BtnEditarClick(Sender: TObject);
begin
	DM.dataSetForn.Edit;
end;

procedure TfrmFornecedor.btnListarClick(Sender: TObject);
begin
	AtualizaConsulta;
end;

procedure TfrmFornecedor.btnSalvarCadastroClick(Sender: TObject);
begin
  DM.DataSetCadastroFornecedor.Post;
end;

procedure TfrmFornecedor.btnSalvarClick(Sender: TObject);
begin
	DM.dataSetForn.Post;
end;

procedure TfrmFornecedor.BuscaFornecedor;
begin
	AtualizaConsulta;

	DM.ConsultaFornece.Close;
  DM.ConsultaFornece.SQL.Add('WHERE NOME LIKE :FORN');
  DM.ConsultaFornece.Parameters.ParamByName('FORN').Value := '%'+Trim(TextBuscaForne.Text)+'%';
  DM.ConsultaFornece.Open;
end;


procedure TfrmFornecedor.DataSourceCadForneceStateChange(Sender: TObject);
begin
	btnNovo.Enabled := ( DM.DataSetCadastroFornecedor.State in [dsBrowse] );
  btnSalvarCadastro.Enabled := ( DM.DataSetCadastroFornecedor.State in [dsInsert] );
  btnCancelarCadastro.Enabled := ( DM.DataSetCadastroFornecedor.State in [dsInsert] );

  if DM.DataSetCadastroFornecedor.State in [dsInsert] Then
  begin
  	btnEditar.Enabled := False;
    btnDeletar.Enabled := False;
  end
  else
  begin
  	btnEditar.Enabled := True;
    btnDeletar.Enabled := True;
    btnSalvarCadastro.Enabled := False;
    btnCancelarCadastro.Enabled := False;
  end;
end;

procedure TfrmFornecedor.sourceForneStateChange(Sender: TObject);
begin
	BtnEditar.Enabled := ( DM.dataSetForn.State in [dsBrowse] );
  BtnSalvar.Enabled := ( DM.dataSetForn.State in [dsEdit] );
  BtnCancelarEdicao.Enabled := ( DM.dataSetForn.State in [dsEdit] );

  if DM.dataSetForn.State in [dsEdit] Then
  begin
  	btnNovo.Enabled := False;
    btnDeletar.Enabled := False;
  end
  else
  begin
  	btnNovo.Enabled := True;
    btnDeletar.Enabled := True;
    btnSalvar.Enabled := False;
    btnCancelarEdicao.Enabled := False;
  end;
end;

procedure TfrmFornecedor.TextBuscaForneChange(Sender: TObject);
begin
	BuscaFornecedor;
end;

procedure TfrmFornecedor.ValidaCampo;
begin
	AtualizaConsulta;

	DM.ConsultaFornece.Close;
  DM.ConsultaFornece.SQL.Add('WHERE CNPJ = :PJ');
  DM.ConsultaFornece.Parameters.ParamByName('PJ').Value := Trim(edtCnpj.Text);
  DM.ConsultaFornece.Open;

  if DM.ConsultaFornece.RecordCount> 0 Then
  begin
  	ShowMessage('CNPJ já cadastrado !');
  	SetFocus;
    LimpaCampo;
    abort;
  end;

end;

procedure TfrmFornecedor.edtCnpjExit(Sender: TObject);
begin
	if Trim(edtCnpj.Text) ='' then
  begin
    ShowMessage('Por favor insira um CNPJ !');
    edtCnpj.SetFocus;
    abort
  end;
end;

procedure TfrmFornecedor.edtNomeExit(Sender: TObject);
begin
	if Trim(edtNome.Text) = '' then
  begin
    ShowMessage('Por favor insira o nome do fornecedor !');
    edtNome.SetFocus;
    abort
  end;
end;

procedure TfrmFornecedor.FormCreate(Sender: TObject);
begin
  DM.conexaoBanco.Connected := True;
  DM.dataSetForn.Active := True;
  DM.consultaFornece.Active := True;
 DM.DataSetCadastroFornecedor.Active := True;
end;

procedure TfrmFornecedor.LimpaCampo;
begin
	edtCnpj.Text := '';
  edtNome.Text := '';
end;

procedure TfrmFornecedor.btnPesquisarClick(Sender: TObject);
begin
	BuscaFornecedor;
end;

procedure TfrmFornecedor.btnNovoClick(Sender: TObject);
begin
	edtCnpj.SetFocus;
  DM.DataSetCadastroFornecedor.Append;
end;

end.
