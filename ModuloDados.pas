unit ModuloDados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Data.Win.ADODB,Vcl.Dialogs, Vcl.Imaging.pngimage,
  ppCtrls, ppPrnabl, ppClass, ppDB, ppBands, ppCache, ppDesignLayer,
  ppParameter, ppDBPipe, ppComm, ppRelatv, ppProd, ppReport, ppVar,Vcl.Controls;

type
  TDM = class(TDataModule)
    dataSetForn: TADODataSet;
    dataSetFornNOME: TStringField;
    dataSetFornCNPJ: TStringField;
    dataSetProdutos: TADODataSet;
    dataSetProdutosNOME: TStringField;
    dataSetProdutosVALOR: TBCDField;
    dataSetProdutosDESCRICAO: TStringField;
    dataSetProdutosDATA_FABRICACAO: TDateField;
    dataSetProdutosDATA_VALIDADE: TDateField;
    dataSetProdutosCOD_FORN: TIntegerField;
    consultaUsuarios: TADOQuery;
    dataSetFuncionarios: TADODataSet;
    dataSetFuncionariosNOME: TStringField;
    dataSetFuncionariosCPF: TStringField;
    dataSetFuncionariosENDERECO: TStringField;
    dataSetFuncionariosTELEFONE: TStringField;
    dataSetFuncionariosCELULAR: TStringField;
    dataSetFuncionariosCOD_CARGO: TIntegerField;
    consultaUsuariosUSUARIO: TStringField;
    consultaUsuariosSENHA: TStringField;
    consultaFunc: TADOQuery;
    consultaCargos: TADOQuery;
    consultaCargosCARGO: TStringField;
    dataSetCargos: TADODataSet;
    dataSetFuncionariosCODIGO: TAutoIncField;
    dataSetCargosCODIGO: TAutoIncField;
    dataSetCargosCARGO: TStringField;
    consultaFuncCODIGO: TAutoIncField;
    consultaFuncNOME: TStringField;
    consultaFuncCPF: TStringField;
    consultaFuncENDERECO: TStringField;
    consultaFuncTELEFONE: TStringField;
    consultaFuncCELULAR: TStringField;
    consultaFuncCOD_CARGO: TIntegerField;
    consultaProdutos: TADOQuery;
    consultaProdutosNOME: TStringField;
    consultaProdutosDESCRICAO: TStringField;
    consultaProdutosDATA_FABRICACAO: TDateField;
    consultaProdutosDATA_VALIDADE: TDateField;
    consultaProdutosCOD_FORN: TIntegerField;
    dataSetUsuarios: TADODataSet;
    consultaCargosCODIGO: TAutoIncField;
    dataSetVendas: TADODataSet;
    dataSetProdutosCODIGO: TAutoIncField;
    ConsultaFornece: TADOQuery;
    consultaProdutosCODIGO: TAutoIncField;
    AdoQueryRelatorio_Vendas: TADOQuery;
    AdoQueryRelatorio_VendasNOME: TStringField;
    AdoQueryRelatorio_VendasVALOR_UNITARIO: TBCDField;
    AdoQueryRelatorio_VendasDESCRICAO: TStringField;
    AdoQueryRelatorio_VendasQTDE_VENDIDOS: TIntegerField;
    AdoQueryRelatorio_VendasDATA_VENDA: TDateField;
    AdoQueryRelatorio_VendasNOME_FUNCIONARIO: TStringField;
    DataSourceRelatorioVendas: TDataSource;
    RelatorioVendas: TppReport;
    PipelineRelatorioVendas: TppDBPipeline;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppDetailBand1: TppDetailBand;
    ppLine2: TppLine;
    ppFooterBand1: TppFooterBand;
    ppHeaderBand1: TppHeaderBand;
    ppImage1: TppImage;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBText1: TppDBText;
    ppLabel3: TppLabel;
    ppDBText2: TppDBText;
    ppLabel4: TppLabel;
    ppDBText3: TppDBText;
    ppLabel5: TppLabel;
    ppDBText4: TppDBText;
    ppLabel6: TppLabel;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLabel7: TppLabel;
    ppDBText7: TppDBText;
    dataSetUsuariosUSUARIO: TStringField;
    dataSetUsuariosSENHA: TStringField;
    dataSetUsuariosCOD_FUNC: TIntegerField;
    dataSetFornCODIGO: TAutoIncField;
    DataSetAlterarProdutos: TADODataSet;
    DataSetAlterarProdutosCODIGO: TAutoIncField;
    DataSetAlterarProdutosNOME: TStringField;
    DataSetAlterarProdutosVALOR: TBCDField;
    DataSetAlterarProdutosDESCRICAO: TStringField;
    DataSetAlterarProdutosDATA_FABRICACAO: TDateField;
    DataSetAlterarProdutosDATA_VALIDADE: TDateField;
    DataSetEditCargos: TADODataSet;
    DataSetEditCargosCODIGO: TAutoIncField;
    DataSetEditCargosCARGO: TStringField;
    DataSetEditUser: TADODataSet;
    DataSetEditUserUSUARIO: TStringField;
    DataSetEditUserSENHA: TStringField;
    DataSetEditFuncionario: TADODataSet;
    DataSetEditFuncionarioNOME: TStringField;
    DataSetEditFuncionarioCPF: TStringField;
    DataSetEditFuncionarioENDERECO: TStringField;
    DataSetEditFuncionarioTELEFONE: TStringField;
    DataSetEditFuncionarioCELULAR: TStringField;
    DataSetEditFuncionarioCOD_CARGO: TIntegerField;
    ppSystemVariable2: TppSystemVariable;
    ConsultaForneceCODIGO: TAutoIncField;
    ConsultaForneceNOME: TStringField;
    ConsultaForneceCNPJ: TStringField;
    DataSetCadastroFornecedor: TADODataSet;
    dataSetProdutosCODIGO_BARRAS: TStringField;
    DataSetAlterarProdutosCODIGO_BARRAS: TStringField;
    consultaProdutosCODIGO_BARRAS: TStringField;
    DataSetCadastroFornecedorCODIGO: TAutoIncField;
    DataSetCadastroFornecedorNOME: TStringField;
    DataSetCadastroFornecedorCNPJ: TStringField;
    conexaoBanco: TADOConnection;
    dataSetVendasCOD_FUNCIONARIO: TIntegerField;
    dataSetVendasDATA_VENDA: TDateField;
    dataSetVendasVALOR_TOTAL: TBCDField;
    dataSetVendasHORA: TDateTimeField;
    DataSetDetVenda: TADODataSet;
    DataSetDetVendaCOD_VENDA: TIntegerField;
    DataSetDetVendaPRODUTO: TStringField;
    DataSetDetVendaVALOR: TBCDField;
    DataSetDetVendaCOD_PRODUTO: TIntegerField;
    QueryDetVenda: TADOQuery;
    DSQueryDetVendas: TDataSource;
    DataSetDetVendaQUANTIDADE: TBCDField;
    dataSetProdutosQUANTIDADE: TBCDField;
    consultaProdutosQUANTIDADE: TBCDField;
    QueryDetVendaPRODUTO: TStringField;
    QueryDetVendaVALOR: TBCDField;
    QueryDetVendaQUANTIDADE: TBCDField;
    dataSetVendasFUNCIONARIO: TStringField;
    dataSetVendasDESCONTO: TBCDField;
    dataSetVendasVALOR_RECEBIDO: TBCDField;
    dataSetVendasTROCO: TBCDField;
    QueryVenda: TADOQuery;
    DataSetDetVendaVALOR_TOTAL: TBCDField;
    QueryVendaCODIGO: TAutoIncField;
    QueryVendaCOD_FUNCIONARIO: TIntegerField;
    QueryVendaDATA_VENDA: TDateField;
    QueryVendaVALOR_TOTAL: TBCDField;
    QueryVendaHORA: TDateTimeField;
    QueryVendaFUNCIONARIO: TStringField;
    QueryVendaDESCONTO: TBCDField;
    QueryVendaVALOR_RECEBIDO: TBCDField;
    QueryVendaTROCO: TBCDField;
    QueryDetVendaVALOR_TOTAL: TBCDField;
    consultaProdutosVALOR: TBCDField;
    consultaProdutosIMAGEM: TBlobField;
    DataSetId: TADODataSet;
    dataSetVendasCODIGO: TAutoIncField;
    DataSetIdID: TIntegerField;
    DataSetIdTABELA: TStringField;
    DataSetDetVendaESTADO: TStringField;
    DataSetDetVendaCODIGO: TIntegerField;
    QueryDetVendaCODIGO: TIntegerField;
    QueryDetVendaCOD_PRODUTO: TIntegerField;
    QueryId: TADOQuery;
    QueryIdID: TIntegerField;
    QueryIdTABELA: TStringField;
    procedure dataSetProdutosBeforeInsert(DataSet: TDataSet);
    procedure dataSetProdutosAfterPost(DataSet: TDataSet);
    procedure dataSetProdutosAfterDelete(DataSet: TDataSet);
    procedure dataSetProdutosBeforeDelete(DataSet: TDataSet);
    procedure dataSetProdutosBeforeEdit(DataSet: TDataSet);
    procedure dataSetProdutosBeforeCancel(DataSet: TDataSet);
    procedure dataSetProdutosAfterCancel(DataSet: TDataSet);
    procedure dataSetFornAfterCancel(DataSet: TDataSet);
    procedure dataSetFornAfterDelete(DataSet: TDataSet);
    procedure dataSetFornAfterPost(DataSet: TDataSet);
    procedure dataSetFornBeforeCancel(DataSet: TDataSet);
    procedure dataSetFornBeforeDelete(DataSet: TDataSet);
    procedure dataSetFornBeforeInsert(DataSet: TDataSet);
    procedure dataSetFornBeforeEdit(DataSet: TDataSet);
    procedure dataSetUsuariosAfterCancel(DataSet: TDataSet);
    procedure dataSetUsuariosAfterDelete(DataSet: TDataSet);
    procedure dataSetUsuariosAfterPost(DataSet: TDataSet);
    procedure dataSetUsuariosBeforeCancel(DataSet: TDataSet);
    procedure dataSetUsuariosBeforeDelete(DataSet: TDataSet);
    procedure dataSetUsuariosBeforeEdit(DataSet: TDataSet);
    procedure dataSetUsuariosBeforeInsert(DataSet: TDataSet);
    procedure dataSetFuncionariosAfterDelete(DataSet: TDataSet);
    procedure dataSetFuncionariosAfterPost(DataSet: TDataSet);
    procedure dataSetFuncionariosBeforeCancel(DataSet: TDataSet);
    procedure dataSetFuncionariosBeforeDelete(DataSet: TDataSet);
    procedure dataSetFuncionariosBeforeEdit(DataSet: TDataSet);
    procedure dataSetFuncionariosBeforeInsert(DataSet: TDataSet);
    procedure consultaCargosAfterCancel(DataSet: TDataSet);
    procedure consultaCargosAfterDelete(DataSet: TDataSet);
    procedure consultaCargosBeforeCancel(DataSet: TDataSet);
    procedure consultaCargosBeforeDelete(DataSet: TDataSet);
    procedure dataSetCargosAfterCancel(DataSet: TDataSet);
    procedure dataSetCargosAfterPost(DataSet: TDataSet);
    procedure dataSetCargosBeforeCancel(DataSet: TDataSet);
    procedure dataSetVendasAfterCancel(DataSet: TDataSet);
    procedure dataSetVendasAfterPost(DataSet: TDataSet);
    procedure dataSetVendasAfterInsert(DataSet: TDataSet);
    procedure consultaProdutosAfterDelete(DataSet: TDataSet);
    procedure consultaProdutosBeforeDelete(DataSet: TDataSet);
    procedure AdoQueryVendasCalcFields(DataSet: TDataSet);
    procedure consultaProdutosAfterCancel(DataSet: TDataSet);
    procedure DataSetCadastroFornAfterCancel(DataSet: TDataSet);
    procedure DataSetCadastroFornAfterPost(DataSet: TDataSet);
    procedure DataSetCadastroFornBeforeCancel(DataSet: TDataSet);
    procedure DataSetAlterarProdutosAfterCancel(DataSet: TDataSet);
    procedure DataSetAlterarProdutosAfterDelete(DataSet: TDataSet);
    procedure DataSetAlterarProdutosAfterPost(DataSet: TDataSet);
    procedure DataSetAlterarProdutosBeforeDelete(DataSet: TDataSet);
    procedure DataSetAlterarProdutosBeforeCancel(DataSet: TDataSet);
    procedure DataSetEditCargosAfterCancel(DataSet: TDataSet);
    procedure DataSetEditCargosBeforeCancel(DataSet: TDataSet);
    procedure DataSetEditCargosAfterPost(DataSet: TDataSet);
    procedure DataSetEditUserAfterCancel(DataSet: TDataSet);
    procedure DataSetEditUserAfterPost(DataSet: TDataSet);
    procedure consultaUsuariosAfterDelete(DataSet: TDataSet);
    procedure consultaUsuariosBeforeDelete(DataSet: TDataSet);
    procedure DataSetEditFuncionarioAfterCancel(DataSet: TDataSet);
    procedure DataSetEditFuncionarioAfterPost(DataSet: TDataSet);
    procedure DataSetEditFuncionarioBeforeCancel(DataSet: TDataSet);
    procedure dataSetFuncionariosAfterCancel(DataSet: TDataSet);
    procedure consultaFuncAfterDelete(DataSet: TDataSet);
    procedure consultaFuncBeforeDelete(DataSet: TDataSet);
    procedure DataSetCadastroFornecedorAfterCancel(DataSet: TDataSet);
    procedure DataSetCadastroFornecedorAfterPost(DataSet: TDataSet);
    procedure DataSetCadastroFornecedorBeforeCancel(DataSet: TDataSet);
    procedure DataSetDetVendaAfterInsert(DataSet: TDataSet);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Funcionarios, Produtos, Fornecedores, Usuarios, Cargos, Vendas;

{$R *.dfm}

 ///////////////CArgos//////////////////////////
procedure TDM.AdoQueryVendasCalcFields(DataSet: TDataSet);
var
	Icms: Currency;
begin
 	Icms := 0.18;
 // AdoQueryVendasCalculaIcms.AsCurrency := AdoQueryVendasVALOR_UNITARIO.AsCurrency *Icms;
end;

procedure TDM.consultaCargosAfterCancel(DataSet: TDataSet);
begin
	ShowMessage('Opera??o cancelada com sucesso');
end;

procedure TDM.consultaCargosAfterDelete(DataSet: TDataSet);
begin
	ShowMessage('Cargo exclu?do com sucesso !');
end;

procedure TDM.consultaCargosBeforeCancel(DataSet: TDataSet);
begin
	if MessageDlg('Deseja cancelar a opera??o ?',mtConfirmation,[mbYes,mbNo],0) = mrNo Then
    abort;
end;

procedure TDM.consultaCargosBeforeDelete(DataSet: TDataSet);
begin
	if MessageDlg('Deseja excluir o usuario ?',mtConfirmation,[mbYes,mbNo],0) = mrNo Then
    abort;
end;

 procedure TDM.consultaFuncAfterDelete(DataSet: TDataSet);
begin
	MessageDlg('Funcion?rio exclu?do com sucesso',mtConfirmation,mbOkCancel,0);
end;

procedure TDM.consultaFuncBeforeDelete(DataSet: TDataSet);
begin
	if MessageDlg('Deseja excluir o funcion?rio ?',mtConfirmation,[mbYes,mbNo],0) = mrNo Then
  	abort
end;

procedure TDM.consultaProdutosAfterCancel(DataSet: TDataSet);
begin
  ShowMessage('Opera??o cancelada com sucesso');
end;

procedure TDM.consultaProdutosAfterDelete(DataSet: TDataSet);
begin
	ShowMessage('Produto exclu?do com sucesso');
end;

procedure TDM.consultaProdutosBeforeDelete(DataSet: TDataSet);
begin
	if MessageDlg('Deseja excluir o produto ?',mtConfirmation,[mbYes,mbNo],0) = mrNO  Then
  	abort;
end;

procedure TDM.consultaUsuariosAfterDelete(DataSet: TDataSet);
begin
	ShowMessage('Usu?rio excluido !');
end;

procedure TDM.consultaUsuariosBeforeDelete(DataSet: TDataSet);
begin
	if MessageDlg('Deseja excluir o usuario ?',mtConfirmation,[mbYes,mbNo],0) = mrNo Then
  	abort;
end;

procedure TDM.DataSetAlterarProdutosAfterCancel(DataSet: TDataSet);
begin
	ShowMessage('Edi??o cancelada !');
end;

procedure TDM.DataSetAlterarProdutosAfterDelete(DataSet: TDataSet);
begin
  ShowMessage('Produto exclu?do com sucesso !');
end;

procedure TDM.DataSetAlterarProdutosAfterPost(DataSet: TDataSet);
begin
	ShowMessage('Altera??o gravada com sucesso !');
end;

procedure TDM.DataSetAlterarProdutosBeforeCancel(DataSet: TDataSet);
begin
	if MessageDlg('Deseja cancelar a altera??o do produto',mtConfirmation,[mbYes,mbNo],0)= mrNo Then
    abort
end;

procedure TDM.DataSetAlterarProdutosBeforeDelete(DataSet: TDataSet);
begin
	if MessageDlg('Deseja excluir o produto',mtConfirmation,[mbYes,mbNo],0) = mrNo Then
  	abort;
end;

procedure TDM.DataSetCadastroFornAfterCancel(DataSet: TDataSet);
begin
	ShowMessage('Cadastro cancelado !');
end;

procedure TDM.DataSetCadastroFornAfterPost(DataSet: TDataSet);
begin
  ShowMessage(' Fornecedor Gravado com sucesso !');
end;

procedure TDM.DataSetCadastroFornBeforeCancel(DataSet: TDataSet);
begin
	if MessageDlg('Deseja cancelar o cadastro ?',mtConfirmation,[mbYes,mbNo],0) = mrNo Then;
  	abort;
end;

procedure TDM.DataSetCadastroFornecedorAfterCancel(DataSet: TDataSet);
begin
	MessageDlg('Cadastro Cancelado !',mtInformation,mbOkCancel,0);
end;

procedure TDM.DataSetCadastroFornecedorAfterPost(DataSet: TDataSet);
begin
	MessageDlg('Fornecedor Cadastrado Com Sucesso !',mtInformation,mbOkCancel,0);
end;

procedure TDM.DataSetCadastroFornecedorBeforeCancel(DataSet: TDataSet);
begin
	if MessageDlg('Deseja Cancelar o Cadastro ?',mtConfirmation,[mbYes,mbNo],0) = mrNo Then
  	abort;
end;
//////////////cadastro de cargos/////////////////
procedure TDM.dataSetCargosAfterCancel(DataSet: TDataSet);
begin
	ShowMessage('Opera??o cancelada com sucesso !');
end;

procedure TDM.dataSetCargosAfterPost(DataSet: TDataSet);
begin
	ShowMessage('Cargo gravado com sucesso !');
  frmCargos.AtualizaConsulta;
end;

procedure TDM.dataSetCargosBeforeCancel(DataSet: TDataSet);
begin
	if MessageDlg('Deseja cancelar a opera??o',mtConfirmation,[mbYes,mbNo],0) = mrNo Then
  	abort
end;

procedure TDM.DataSetDetVendaAfterInsert(DataSet: TDataSet);
var
	Tabela:String;
  Codigo:Integer;
begin
	//pegar o ids dos itens
  Tabela := 'DETALHE_VENDA';
  Codigo := 1;
	// Atualiza o Id da Tabela ControlaID
	DM.QueryId.Close;
  DM.QueryId.SQL.Clear;
  DM.QueryId.SQL.Add('UPDATE CONTROLA_ID SET ID = ID + :CODIGO WHERE TABELA = :TABELA');
  DM.QueryId.Parameters.ParamByName('CODIGO').Value := Codigo;
  DM.QueryId.Parameters.ParamByName('TABELA').Value := Tabela;
  DM.QueryId.ExecSQL;

  DM.QueryId.Close;
  DM.QueryId.SQL.Clear;
  DM.QueryId.SQL.Add('SELECT ID,TABELA FROM CONTROLA_ID WHERE TABELA = :TABELA');
  DM.QueryId.Parameters.ParamByName('TABELA').Value := Tabela;
  DM.QueryId.Open;

	DM.DataSetDetVenda.FieldByName('CODIGO').Value := DM.QueryId.FieldByName('ID').AsInteger;

	Tabela := 'VENDA';
	DM.QueryId.Close;
  DM.QueryId.SQL.Clear;
  DM.QueryId.SQL.Add('SELECT ID,TABELA FROM CONTROLA_ID WHERE TABELA = :TABELA');
  DM.QueryId.Parameters.ParamByName('TABELA').Value := Tabela;
  DM.QueryId.Open;

	DataSetDetVenda.FieldByName('COD_VENDA').Value :=  DM.QueryId.FieldByName('ID').AsInteger;
end;

procedure TDM.DataSetEditCargosAfterCancel(DataSet: TDataSet);
begin
 	ShowMessage('Altera??o cancelada !');
end;

procedure TDM.DataSetEditCargosAfterPost(DataSet: TDataSet);
begin
	ShowMessage('Altera??o gravada com sucesso!');
end;

procedure TDM.DataSetEditCargosBeforeCancel(DataSet: TDataSet);
begin
	if MessageDlg('Deseja cancelar ? altera??o ?',mtConfirmation,[mbYes,mbNo],0) = mrNo Then
    abort;
end;

procedure TDM.DataSetEditFuncionarioAfterCancel(DataSet: TDataSet);
begin
	MessageDlg('Altera??o cancelada',mtConfirmation,mbOkCancel,0);
end;

procedure TDM.DataSetEditFuncionarioAfterPost(DataSet: TDataSet);
begin
	MessageDlg('Altera??o gravada com sucesso !',mtConfirmation,mbOkCancel,0);
end;

procedure TDM.DataSetEditFuncionarioBeforeCancel(DataSet: TDataSet);
begin
	if MessageDlg('Deseja cancelar a altera??o ?',mtConfirmation,[mbYes,mbNo],0)= mrNo Then
  	abort;
end;

procedure TDM.DataSetEditUserAfterCancel(DataSet: TDataSet);
begin
	MessageDlg('Altera??o cancelada !',mtConfirmation,mbOKCancel,0);
end;

procedure TDM.DataSetEditUserAfterPost(DataSet: TDataSet);
begin
	MessageDlg('Altera??o Gravada com sucesso !',mtConfirmation,mbOKCancel,0);
end;

//////////////Fornecedores/////////////////////////
procedure TDM.dataSetFornAfterCancel(DataSet: TDataSet);
begin
	ShowMessage('Opera??o cancelada com sucesso !');
end;

procedure TDM.dataSetFornAfterDelete(DataSet: TDataSet);
begin
	ShowMessage('Fornecedor exclu?do com sucesso !');
  frmFornecedor.LimpaCampo;
end;

procedure TDM.dataSetFornAfterPost(DataSet: TDataSet);
begin
	ShowMessage('Fornecedor gravado com sucesso !');
  frmFornecedor.LimpaCampo;
  frmFornecedor.SetFocus;
  frmFornecedor.AtualizaConsulta;
end;

procedure TDM.dataSetFornBeforeCancel(DataSet: TDataSet);
begin
  if MessageDlg('Deseja cancelar a opera??o',mtConfirmation,[mbYes,mbNo],0) = mrNo Then
		abort;
end;

procedure TDM.dataSetFornBeforeDelete(DataSet: TDataSet);
begin
	if MessageDlg('Deseja excluir o fornecedor ?',mtConfirmation,[mbYes,mbNo],0)= mrNo Then
  begin
  	frmFornecedor.LimpaCampo;
  	abort;
  end
  else
  	frmFornecedor.LimpaCampo;
end;

procedure TDM.dataSetFornBeforeEdit(DataSet: TDataSet);
begin
	if MessageDlg('Deseja altetar o dado do fornecedor',mtConfirmation,[mbYes,mbNO],0) = mrNo Then
  	abort;
end;

procedure TDM.dataSetFornBeforeInsert(DataSet: TDataSet);
begin
  ShowMessage('Cadastro de fornecedores');
end;
///////////////////////Funcionarios///////////////////////////////
procedure TDM.dataSetFuncionariosAfterCancel(DataSet: TDataSet);
begin
   ShowMessage('Opera??o cancelada com sucesso !');
   frmFuncionarios.LimpaCampos;
end;

procedure TDM.dataSetFuncionariosAfterDelete(DataSet: TDataSet);
begin
	ShowMessage('Funcion?rio excluido com sucesso !');
end;

procedure TDM.dataSetFuncionariosAfterPost(DataSet: TDataSet);
begin
	ShowMessage('Funcion?rio gravado com sucesso !');
  frmFuncionarios.AtualizaConsulta;
  frmFuncionarios.LimpaCampos;
end;

procedure TDM.dataSetFuncionariosBeforeCancel(DataSet: TDataSet);
begin
	if MessageDlg('Deseja cancelar a opera??o ?',mtConfirmation,[mbYes,mbNo],0) = mrNo Then
  	abort;
end;

procedure TDM.dataSetFuncionariosBeforeDelete(DataSet: TDataSet);
begin
	if MessageDlg('Deseja excluir o funcion?rio ?',mtConfirmation,[mbYes,mbNo],0) = mrNo Then
  	abort;
end;

procedure TDM.dataSetFuncionariosBeforeEdit(DataSet: TDataSet);
begin
   if MessageDlg('Deseja editar os dados do funcion?rio ?',mtConfirmation,[mbYes,mbNo],0) = mrNo Then
  	abort;
end;

procedure TDM.dataSetFuncionariosBeforeInsert(DataSet: TDataSet);
begin
  ShowMessage('Cadastro de funcion?rios');
end;
//////////////////////////produtos////////////////////////////
procedure TDM.dataSetProdutosAfterCancel(DataSet: TDataSet);
begin
	ShowMessage('Opera??o cancelada com sucesso!');
end;

procedure TDM.dataSetProdutosAfterDelete(DataSet: TDataSet);
begin
	ShowMessage('Produto exclu?do com sucesso !');
end;

procedure TDM.dataSetProdutosAfterPost(DataSet: TDataSet);
begin
	ShowMessage('Produto gravado com sucesso!');
  frmProdutos.AtualizaQuery;
end;

procedure TDM.dataSetProdutosBeforeCancel(DataSet: TDataSet);
begin
	if MessageDlg('Deseja cancelar a opera??o',mtConfirmation,[mbYes,mbNo],0) = mrNo then
		abort;
end;

procedure TDM.dataSetProdutosBeforeDelete(DataSet: TDataSet);
begin
	if MessageDlg('Deseja excluir o produto ?',mtConfirmation,[mbYes,mbNo],0) = mrNo Then
  	abort;
end;

procedure TDM.dataSetProdutosBeforeEdit(DataSet: TDataSet);
begin
	if MessageDlg('Deseja editar os dados do produto ?',mtConfirmation,[mbyes,mbNo],0)= mrNo  Then
  	abort;
end;

procedure TDM.dataSetProdutosBeforeInsert(DataSet: TDataSet);
begin
	ShowMessage('Cadastro de produtos !');
end;
///////////////////////Usuarios////////////////////////
procedure TDM.dataSetUsuariosAfterCancel(DataSet: TDataSet);
begin
	ShowMessage('Opera??o cancelada com sucesso !');
end;

procedure TDM.dataSetUsuariosAfterDelete(DataSet: TDataSet);
begin
	ShowMessage('Usu?rio exclu?do com sucesso !');
end;

procedure TDM.dataSetUsuariosAfterPost(DataSet: TDataSet);
begin
  ShowMessage('Usu?rio gravado com sucesso ?');
end;

procedure TDM.dataSetUsuariosBeforeCancel(DataSet: TDataSet);
begin
 if MessageDlg('Deseja cancelar a opera??o ?', mtConfirmation,[mbYes,mbNo],0) = mrNo Then
 		abort;
end;

procedure TDM.dataSetUsuariosBeforeDelete(DataSet: TDataSet);
begin
 	if MessageDlg('Deseja Excluir o usu?rio ?', mtConfirmation,[mbYes,mbNo],0) = mrNo Then
 		abort;
end;

procedure TDM.dataSetUsuariosBeforeEdit(DataSet: TDataSet);
begin
	if MessageDlg('Deseja editar os dados do usu?rio ?', mtConfirmation,[mbYes,mbNo],0) = mrNo Then
    abort;
end;

procedure TDM.dataSetUsuariosBeforeInsert(DataSet: TDataSet);
begin
	ShowMessage('Cadastro de usu?rios !');
end;

//////////////////Vendas///////////////////////////////////
procedure TDM.dataSetVendasAfterCancel(DataSet: TDataSet);
begin
  ShowMessage('Venda cancelada com sucesso !');
end;

procedure TDM.dataSetVendasAfterInsert(DataSet: TDataSet);
var
	Tabela:String;
  Codigo:Integer;
begin
	Tabela := 'VENDA';
  Codigo := 1;

	DM.QueryId.Close;
  DM.QueryId.SQL.Clear;
  DM.QueryId.SQL.Add('UPDATE CONTROLA_ID SET ID = ID + :CODIGO WHERE TABELA = :TABELA');
  DM.QueryId.Parameters.ParamByName('CODIGO').Value := Codigo;
  DM.QueryId.Parameters.ParamByName('TABELA').Value := Tabela;
  DM.QueryId.ExecSQL;

	QueryId.Close;
  QueryId.SQL.Clear;
  QueryId.SQL.Add('SELECT ID,TABELA FROM CONTROLA_ID WHERE TABELA = :TABELA');
  QueryId.Parameters.ParamByName('TABELA').Value := Tabela;
  QueryId.Open;

	dataSetVendas.FieldByName('CODIGO').Value :=  DM.QueryId.FieldByName('ID').AsInteger;
end;

procedure TDM.dataSetVendasAfterPost(DataSet: TDataSet);
begin
	ShowMessage('Venda confirmada !');
  //frmVendas.LimpaCampos;
  //fazer teste homologado
	//frmVendas.IniciarNFE;
end;

end.
