unit Menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage,ACBrUtil, REST.Types,
  Data.Bind.Components, Data.Bind.ObjectScope, REST.Client, Vcl.StdCtrls;

type
  TfrmMenu = class(TForm)
    Menus: TMainMenu;
    Cadastros1: TMenuItem;
    Produtos1: TMenuItem;
    Fornecedores1: TMenuItem;
    Estoque1: TMenuItem;
    Movimentaes1: TMenuItem;
    Relatrios1: TMenuItem;
    Sair1: TMenuItem;
    Usurios1: TMenuItem;
    Funcionrios1: TMenuItem;
    Cargo1: TMenuItem;
    Vendas1: TMenuItem;
    Movimentaes2: TMenuItem;
    Entradadeestoque1: TMenuItem;
    SadadeEstoque1: TMenuItem;
    Vendas2: TMenuItem;
    CertificadosDigitais1: TMenuItem;
    Emitircupomfiscal1: TMenuItem;
    Panel1: TPanel;
    Label1: TLabel;
    LblUser: TLabel;
    Image1: TImage;
    Panel2: TPanel;
    procedure Funcionrios1Click(Sender: TObject);
    procedure Cargo1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Fornecedores1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Vendas1Click(Sender: TObject);
    procedure Usurios1Click(Sender: TObject);
    procedure Entradadeestoque1Click(Sender: TObject);
    procedure SadadeEstoque1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PegaUsuario;
    procedure CertificadosDigitais1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;


implementation

{$R *.dfm}

uses Funcionarios, Fornecedores,
  Vendas, Produtos,Cargos, Usuarios, EntradaEstoque,
  CertificadoDigital, SaidaEstoque, Login, ModuloDados;

procedure TfrmMenu.Cargo1Click(Sender: TObject);
begin
  frmCargos := TfrmCArgos.Create(nil);
  frmCargos.Show;
end;

procedure TfrmMenu.CertificadosDigitais1Click(Sender: TObject);
begin
  frmCertificados := TfrmCertificados.Create(nil);
  frmCertificados.Show;s
end;

procedure TfrmMenu.Entradadeestoque1Click(Sender: TObject);
begin
	frmEntradaEstoque := TfrmEntradaEstoque.Create(nil);
  frmEntradaEstoque.Show;
end;

procedure TfrmMenu.FormCreate(Sender: TObject);
begin
	frmLogin:= TfrmLogin.Create(nil);
  try
    frmLogin.ShowModal;
  finally
     frmLogin.Free;
  end;
 DM.consultaUsuarios.Active := True;
 PegaUsuario;
end;

procedure TfrmMenu.Fornecedores1Click(Sender: TObject);
begin
  frmFornecedor := TfrmFornecedor.Create(nil);
  frmFornecedor.Show;
end;

procedure TfrmMenu.Funcionrios1Click(Sender: TObject);
begin
  frmFuncionarios := TfrmFuncionarios.Create(nil);
  frmFuncionarios.Show;
end;

procedure TfrmMenu.PegaUsuario;
begin
  DM.consultaUsuarios.Open;
  if not DM.consultaUsuarios.IsEmpty Then
    LblUser.Caption := DM.consultaUsuariosUSUARIO.AsString;
end;

procedure TfrmMenu.Produtos1Click(Sender: TObject);
begin
	frmProdutos := TfrmProdutos.Create(nil);
 	frmProdutos.Show;
end;

procedure TfrmMenu.SadadeEstoque1Click(Sender: TObject);
begin
	frmSaiEstoque :=  TfrmSaiEstoque.Create(nil);
  frmSaiEstoque.Show;
end;

procedure TfrmMenu.Sair1Click(Sender: TObject);
begin
	if MessageDlg('Deseja fazer o logoff ?',mtConfirmation,[mbYes,mbNo],0) = 7 then
  	abort
  else
    frmLogin := TfrmLogin.Create(nil);
    try
      frmLogin.ShowModal;
    finally
      frmLogin.Free;
    end;
end;

procedure TfrmMenu.Usurios1Click(Sender: TObject);
begin
 	frmUsers := TfrmUsers.Create(nil);
  frmUsers.Show;

end;

procedure TfrmMenu.Vendas1Click(Sender: TObject);
begin
	frmVendas := TfrmVendas.Create(nil);
 	frmVendas.Show;
end;

end.
