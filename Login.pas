unit Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.Imaging.pngimage, Data.DB, Vcl.DBCtrls;

type
  TfrmLogin = class(TForm)
    Panel1: TPanel;
    txtSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    DSLogin: TDataSource;
    ComboUsuario: TComboBox;
    procedure Login;
    procedure FormCreate(Sender: TObject);
    procedure limpaCampos;
    procedure CarregaUsuario;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses ModuloDados, Menu;

procedure TfrmLogin.CarregaUsuario;
begin
  DM.consultaUsuarios.Open;
  if not DM.consultaUsuarios.IsEmpty Then
  begin
    while not DM.consultaUsuarios.Eof do
    begin
      ComboUsuario.Items.Add(DM.consultaUsuarios.FieldByName('USUARIO').AsString);
      DM.consultaUsuarios.Next;
    end;
  end;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  DM.conexaoBanco.Connected := True;
  DM.consultaUsuarios.Active := True;
end;

procedure TfrmLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
   perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 Then
    Login;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  CarregaUsuario;
  ComboUsuario.SetFocus;
end;

procedure TfrmLogin.limpaCampos;
begin
  ComboUsuario.SetFocus;
  txtSenha.Text := '';
end;

procedure TfrmLogin.Login;
begin
  DM.consultaUsuarios.Close;
  DM.consultaUsuarios.SQL.Clear;
  DM.consultaUsuarios.SQL.Add('SELECT USUARIO, SENHA FROM USUARIOS');
  DM.consultaUsuarios.SQL.Add('WHERE (USUARIO = :USER) AND (SENHA = :PASS)');
  DM.consultaUsuarios.Parameters.ParamByName('USER').Value := ComboUsuario.Text;
  DM.consultaUsuarios.Parameters.ParamByName('PASS').Value := Trim(txtSenha.Text);
  DM.consultaUsuarios.Open;

  if DM.consultaUsuarios.IsEmpty Then
  begin
//    ShowMessage('Usuario ou senha inválidos !');
//    limpaCampos;
//    abort
  end
  else
    frmLogin.Close;
end;

end.
