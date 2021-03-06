program ProjPdv;

uses
  Vcl.Forms,
  ModuloDados in 'ModuloDados.pas' {DM: TDataModule},
  Menu in 'Menu.pas' {frmMenu},
  Login in 'Login.pas' {frmLogin},
  Usuarios in 'Cadastros\Usuarios.pas' {frmUsers},
  Funcionarios in 'Cadastros\Funcionarios.pas' {frmFuncionarios},
  Produtos in 'Cadastros\Produtos.pas' {frmProdutos},
  Cargos in 'Cadastros\Cargos.pas' {frmCargos},
  Fornecedores in 'Cadastros\Fornecedores.pas' {frmFornecedor},
  Vendas in 'Movimentacoes\Vendas.pas' {frmVendas},
  CertificadoDigital in 'Movimentacoes\CertificadoDigital.pas' {frmCertificados},
  CuponFiscal in 'Movimentacoes\CuponFiscal.pas' {frmCupomFiscal},
  SaidaEstoque in 'Estoque\SaidaEstoque.pas' {frmSaiEstoque},
  EntradaEstoque in 'Estoque\EntradaEstoque.pas' {frmEntradaEstoque},
  NovaQtde in 'Movimentacoes\NovaQtde.pas' {FrmQuantidade},
  Vcl.Consts in 'Vcl.Consts.pas',
  Cancelamento in 'Movimentacoes\Cancelamento.pas' {FrmCancelarVenda},
  CancelaItem in 'Movimentacoes\CancelaItem.pas' {FrmCancelaItem},
  ItemCancelado in 'Movimentacoes\ItemCancelado.pas' {FrmConfirmaCancelamento},
  Controle in 'Movimentacoes\Controle.pas' {IdTabelas};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.CreateForm(TfrmUsers, frmUsers);
  Application.CreateForm(TfrmFuncionarios, frmFuncionarios);
  Application.CreateForm(TfrmFornecedor, frmFornecedor);
  Application.CreateForm(TfrmCertificados, frmCertificados);
  Application.CreateForm(TfrmVendas, frmVendas);
  Application.Run;
end.
