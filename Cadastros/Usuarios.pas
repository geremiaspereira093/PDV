unit Usuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfrmUsers = class(TForm)
    Label3: TLabel;
    edtUsuario: TDBEdit;
    Label4: TLabel;
    edtSenha: TDBEdit;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    LookupUsuario: TDBLookupComboBox;
    btnListar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnNovo: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Image1: TImage;
    Image2: TImage;
    TabSheet2: TTabSheet;
    EdtPesquisar: TEdit;
    Image3: TImage;
    TabSheet3: TTabSheet;
    DBGrid2: TDBGrid;
    btnCancelarEdit: TSpeedButton;
    btnSalvarEdit: TSpeedButton;
    btnEditar: TSpeedButton;
    TabSheet4: TTabSheet;
    btnDeletar: TSpeedButton;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    Image4: TImage;
    DBGrid3: TDBGrid;
    Label6: TLabel;
    EdtBuscaUser: TEdit;
    Label7: TLabel;
    BtnBuscaUser: TSpeedButton;
    srcUsuarios: TDataSource;
    DataSourceEditUser: TDataSource;
    sourceUsuarios: TDataSource;
    Image5: TImage;
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure ValidaCampos;
    procedure btnCancelarClick(Sender: TObject);
    procedure AtivaConsulta;
    procedure btnListarClick(Sender: TObject);
    procedure BuscarUsuarios;
    procedure EdtPesquisarChange(Sender: TObject);
    procedure btnSalvarEditClick(Sender: TObject);
    procedure btnCancelarEditClick(Sender: TObject);
    procedure EdtBuscaUserChange(Sender: TObject);
    procedure PesquisarUsuarios;
    procedure EncontarUsuarios;
    procedure LimpaCampos;
    procedure srcUsuariosStateChange(Sender: TObject);
    procedure DataSourceEditUserStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUsers: TfrmUsers;

implementation

{$R *.dfm}

uses ModuloDados, Login;

procedure TfrmUsers.AtivaConsulta;
begin
	DM.consultaUsuarios.Close;
  DM.consultaUsuarios.SQL.Clear;
  DM.consultaUsuarios.SQL.Add('SELECT USUARIO,SENHA,COD_FUNC FROM USUARIOS');
  DM.consultaUsuarios.Open;
end;

procedure TfrmUsers.btnCancelarClick(Sender: TObject);
begin
  DM.DataSetUsuarios.Cancel;
  LimpaCampos;
end;

procedure TfrmUsers.btnCancelarEditClick(Sender: TObject);
begin
  DM.DataSetEditUser.Cancel;
end;

procedure TfrmUsers.btnDeletarClick(Sender: TObject);
begin
  DM.consultaUsuarios.Delete;
end;

procedure TfrmUsers.btnEditarClick(Sender: TObject);
begin
  DM.DataSetEditUser.Edit;
end;

procedure TfrmUsers.btnListarClick(Sender: TObject);
begin
	AtivaConsulta;
end;

procedure TfrmUsers.btnSalvarClick(Sender: TObject);
begin
	ValidaCampos;
  DM.dataSetUsuarios.Post;
  LimpaCampos;
end;

procedure TfrmUsers.btnSalvarEditClick(Sender: TObject);
begin
  DM.DataSetEditUser.Post;
end;

procedure TfrmUsers.BuscarUsuarios;
begin
	AtivaConsulta;
	DM.consultaUsuarios.Close;
  DM.consultaUsuarios.SQL.Add('WHERE USUARIO LIKE :USER');
  DM.consultaUsuarios.Parameters.ParamByName('USER').Value := '%'+Trim(EdtPesquisar.Text)+'%';
  DM.consultaUsuarios.Open;
end;

procedure TfrmUsers.DataSourceEditUserStateChange(Sender: TObject);
begin
	btnEditar.Enabled := ( DM.DataSetEditUser.State in [dsBrowse] );
  btnSalvarEdit.Enabled := (DM.DataSetEditUser.State in [dsEdit] );
  btnCancelarEdit.Enabled := (DM.DataSetEditUser.State in [dsEdit] );

  if DM.DataSetEditUser.State in [dsEdit] Then
  begin
  	btnNovo.Enabled := False;
    btnDeletar.Enabled := False;
  end
  else
  begin
  	btnNovo.Enabled := True;
    btnDeletar.Enabled := True;
    btnSalvarEdit.Enabled := False;
    btnCancelarEdit.Enabled := False;
  end;
end;

procedure TfrmUsers.EdtBuscaUserChange(Sender: TObject);
begin
	PesquisarUsuarios;
 	EncontarUsuarios;
end;

procedure TfrmUsers.EdtPesquisarChange(Sender: TObject);
begin
	BuscarUsuarios;
  EncontarUsuarios;
end;

procedure TfrmUsers.EncontarUsuarios;
begin
	if DM.consultaUsuarios.IsEmpty Then
  begin
    MessageDlg('Usuário não encontrado na base de dados !',mtError,mbOKCancel,0);
    abort;
  end;
end;

procedure TfrmUsers.FormCreate(Sender: TObject);
begin
	DM.conexaoBanco.Connected := True;
  DM.dataSetUsuarios.Active := True;
  DM.dataSetFuncionarios.Active := True;
  DM.consultaUsuarios.Active := True;
  DM.DatasetEditUser.Active := True;
end;

procedure TfrmUsers.LimpaCampos;
begin
	edtUsuario.Text := '';
  edtSenha.Text := '';
end;

procedure TfrmUsers.PesquisarUsuarios;
begin
	AtivaConsulta;

	DM.consultaUsuarios.Close;
  DM.consultaUsuarios.SQL.Add('WHERE USUARIO LIKE :USER');
  DM.consultaUsuarios.Parameters.ParamByName('USER').Value := '%'+Trim(EdtBuscaUser.Text)+'%';
  DM.consultaUsuarios.Open;
end;

procedure TfrmUsers.srcUsuariosStateChange(Sender: TObject);
begin
	btnNovo.Enabled := ( DM.dataSetUsuarios.State in [dsBrowse] );
  btnSalvar.Enabled := ( DM.dataSetUsuarios.State in [dsInsert] );
  btnCancelar.Enabled := (DM.dataSetUsuarios.State in [dsInsert]);

  if DM.dataSetUsuarios.State in [dsInsert]  Then
  begin
  	btnEditar.Enabled := False;
    btnDeletar.Enabled := False;
  end
  else
  begin
  	btnEditar.Enabled := True;
    btnDeletar.Enabled := True;
    btnSalvar.Enabled := False;
    btnCancelar.Enabled := False;
  end;
end;

procedure TfrmUsers.btnNovoClick(Sender: TObject);
begin
	DM.dataSetUsuarios.Append;
end;

procedure TfrmUsers.ValidaCampos;
begin

	if Trim(edtUsuario.Text) = '' then
  begin
    ShowMessage('Por favor insira um usuário !');
    abort
  end;

  if Trim(edtSenha.Text) = '' then
  begin
    ShowMessage('Por favor insira uma senha !');
    abort
  end;
end;

end.
