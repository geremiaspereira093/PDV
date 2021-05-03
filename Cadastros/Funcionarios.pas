unit Funcionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.DBCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfrmFuncionarios = class(TForm)
    rdCpf: TRadioButton;
    rdNome: TRadioButton;
    txtBuscaNome: TEdit;
    DBGrid1: TDBGrid;
    btnNovo: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnEditar: TSpeedButton;
    btnDeletar: TSpeedButton;
    Label1: TLabel;
    edtNome: TDBEdit;
    Label3: TLabel;
    edtCpf: TDBEdit;
    Label4: TLabel;
    edtEnd: TDBEdit;
    Label5: TLabel;
    edtTelefone: TDBEdit;
    Label6: TLabel;
    edtCelular: TDBEdit;
    Label7: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    btnCancelar: TSpeedButton;
    btnListar: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Image1: TImage;
    TabSheet3: TTabSheet;
    Image2: TImage;
    Image3: TImage;
    DBGrid2: TDBGrid;
    btnSalvarEdit: TSpeedButton;
    btnCancelarEdit: TSpeedButton;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit3: TDBEdit;
    Label10: TLabel;
    DBEdit4: TDBEdit;
    Label11: TLabel;
    DBEdit5: TDBEdit;
    Label12: TLabel;
    DBEdit2: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    sourceFuncio: TDataSource;
    DataSourceEditFuncionarios: TDataSource;
    sourceCodFunc: TDataSource;
    maskCpf: TMaskEdit;
    procedure rdCpfClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ValidaCampos;
    procedure btnCancelarClick(Sender: TObject);
    procedure rdNomeClick(Sender: TObject);
    procedure ValidaCPF;
    procedure VerificaTamanhoCPF;
    procedure LimpaCPF;
    procedure FocoCPF;
    procedure edtCpfExit(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
    procedure AtualizaConsulta;
    procedure edtNomeExit(Sender: TObject);
    procedure edtEndExit(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure btnSalvarEditClick(Sender: TObject);
    procedure btnCancelarEditClick(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure OrdenarPorLetra;
    procedure LimpaCampos;
    procedure sourceFuncioStateChange(Sender: TObject);
    procedure DataSourceEditFuncionariosStateChange(Sender: TObject);
    procedure Buscar;
    procedure txtBuscaNomeChange(Sender: TObject);
    procedure BuscaCpf;
    procedure maskCpfExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  frmFuncionarios: TfrmFuncionarios;

implementation

{$R *.dfm}

uses ModuloDados;

procedure TfrmFuncionarios.AtualizaConsulta;
begin
	DM.consultaFunc.Close;
  DM.consultaFunc.SQL.Clear;
  DM.consultaFunc.SQL.Add('SELECT CODIGO, NOME, ENDERECO,CELULAR,CPF,TELEFONE,COD_CARGO FROM FUNCIONARIOS');
  dm.consultaFunc.Open;
end;

procedure TfrmFuncionarios.btnCancelarClick(Sender: TObject);
begin
  DM.dataSetFuncionarios.Cancel;
end;

procedure TfrmFuncionarios.btnCancelarEditClick(Sender: TObject);
begin
  DM.DataSetEditFuncionario.Cancel;
end;

procedure TfrmFuncionarios.btnDeletarClick(Sender: TObject);
begin
  DM.consultaFunc.Delete;
end;

procedure TfrmFuncionarios.btnEditarClick(Sender: TObject);
begin
  DM.DataSetEditFuncionario.Edit;
end;

procedure TfrmFuncionarios.btnListarClick(Sender: TObject);
begin
	AtualizaConsulta;
end;

procedure TfrmFuncionarios.btnSalvarClick(Sender: TObject);
begin
	ValidaCampos;
  VerificaTamanhoCPF;
  DM.dataSetFuncionarios.Post;
end;

procedure TfrmFuncionarios.btnSalvarEditClick(Sender: TObject);
begin
  VerificaTamanhoCPF;
  DM.DataSetEditFuncionario.Post;
end;

procedure TfrmFuncionarios.BuscaCpf;
begin
	AtualizaConsulta;
  DM.consultaFunc.Close;
  DM.consultaFunc.SQL.Add('WHERE CPF = :DOC');
  DM.consultaFunc.Parameters.ParamByName('DOC').Value :=  Trim( maskCpf.Text );
  DM.consultaFunc.Open;

	if DM.consultaFunc.IsEmpty Then
  begin
  	MessageDlg('CPF Não Encontrado na Base de Dados ! ',mtWarning,mbOkCancel,0);
  	maskCpf.Text := '';
  end;
end;

procedure TfrmFuncionarios.Buscar;
begin
	if	txtBuscaNome.Enabled = True Then
  begin
  	AtualizaConsulta;
  	DM.consultaFunc.Close;
		DM.consultaFunc.SQL.Add('WHERE NOME LIKE :NAME');
    DM.consultaFunc.Parameters.ParamByName('NAME').Value := '%' + Trim( txtBuscaNome.Text ) + '%';
    DM.consultaFunc.Open;

    if DM.consultaFunc.IsEmpty Then
    begin
      MessageDlg('Funcionário Não Encontrado na Base de Dados ! ',mtWarning,mbOkCancel,0);
      maskCpf.Text := ''
    end;
  end;
end;

procedure TfrmFuncionarios.DataSourceEditFuncionariosStateChange(
  Sender: TObject);
begin
	btnEditar.Enabled := ( DM.DataSetEditFuncionario.State in [dsBrowse] );
  btnSalvarEdit.Enabled := (DM.DataSetEditFuncionario.State in [dsEdit] );
  btnCancelarEdit.Enabled := (DM.DataSetEditFuncionario.State in [dsEdit] );

  if DM.DataSetEditFuncionario.State in [dsEdit] Then
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

procedure TfrmFuncionarios.DBLookupComboBox1Click(Sender: TObject);
begin
 	OrdenarPorLetra;
end;

procedure TfrmFuncionarios.DBLookupComboBox1Exit(Sender: TObject);
begin
	if DBLookupComboBox1.Text = '' Then
  begin
    MessageDlg('Selecione o Funcionário',mtWarning,mbOkCancel,0);
    abort;
  end;
end;

procedure TfrmFuncionarios.edtCpfExit(Sender: TObject);
begin
	if Trim(edtCpf.Text) = '' Then
  begin
    MessageDlg('Campo CPF Vazio !',mtWarning,mbOKCancel,0);
    edtCpf.SetFocus;
    abort;
  end;
	ValidaCPF;
end;

procedure TfrmFuncionarios.edtEndExit(Sender: TObject);
begin
	if Trim(edtEnd.Text) ='' Then
  begin
    MessageDlg('Campo Endereço Vazio !',mtWarning,mbOkCancel,0);
    edtEnd.SetFocus;
    abort;
  end;
end;

procedure TfrmFuncionarios.edtNomeExit(Sender: TObject);
begin

	if Trim(edtNome.Text) = '' Then
  begin
    MessageDlg('Campo Nome Vazio !',mtWarning,mbOKCancel,0);
    edtNome.SetFocus;
    abort;
  end;

end;

procedure TfrmFuncionarios.FocoCPF;
begin
	edtCpf.SetFocus;
end;

procedure TfrmFuncionarios.FormCreate(Sender: TObject);
begin
	DM.conexaoBanco.Connected := True;
  DM.dataSetFuncionarios.Active := True;
  DM.consultaCargos.Active := True;
  DM.consultaFunc.Active := True;
  DM.DataSetEditFuncionario.Active := True;
end;

procedure TfrmFuncionarios.LimpaCampos;
begin
	edtNome.Text := '';
  edtCpf.Text := '';
  edtEnd.Text := '';
  edtTelefone.Text := '';
  edtCelular.Text := '';
end;

procedure TfrmFuncionarios.LimpaCPF;
begin
	edtCpf.Text := '';
end;

procedure TfrmFuncionarios.maskCpfExit(Sender: TObject);
begin
	BuscaCpf;
end;

procedure TfrmFuncionarios.OrdenarPorLetra;
begin
	DM.consultaCargos.Close;
  DM.consultaCargos.SQL.Clear;
  DM.consultaCargos.SQL.Add('SELECT CODIGO, CARGO FROM CARGOS');
  DM.consultaCargos.SQL.Add('ORDER BY CARGO ASC');
  DM.consultaCargos.Open;
end;

procedure TfrmFuncionarios.rdCpfClick(Sender: TObject);
begin
	if rdCpf.Checked = True   Then
  begin
  	maskCpf.Visible := True;
    maskCpf.Enabled := True;
		txtBuscaNome.Visible := False;
    txtBuscaNome.Enabled := False;
  end;
end;

procedure TfrmFuncionarios.rdNomeClick(Sender: TObject);
begin

	if rdNome.Checked = True Then
  begin
  	txtBuscaNome.Visible:= True;
    txtBuscaNome.Enabled := True;
  	maskCpf.Visible := False;
    maskCpf.Enabled := False;
  end;
end;

procedure TfrmFuncionarios.sourceFuncioStateChange(Sender: TObject);
begin
	btnNovo.Enabled := ( DM.dataSetFuncionarios.State in [dsBrowse] );
  btnSalvar.Enabled := ( DM.dataSetFuncionarios.State in [dsInsert] );
  btnCancelar.Enabled := ( DM.dataSetFuncionarios.State in [dsInsert] );

  if DM.dataSetFuncionarios.State in [dsInsert]  Then
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

procedure TfrmFuncionarios.txtBuscaNomeChange(Sender: TObject);
begin
	Buscar;
end;

procedure TfrmFuncionarios.btnNovoClick(Sender: TObject);
begin
  DM.dataSetFuncionarios.Append;
end;

procedure TfrmFuncionarios.ValidaCampos;
begin
	if Trim(edtNome.Text) ='' then
  begin
    ShowMessage('Por favor insira o nome do funcionário !');
    edtNome.Text := '';
    edtNome.SetFocus;
    abort
  end;

  if Trim(edtCpf.Text) ='' then
  begin
    ShowMessage('Por favor insira o cpf do funcionário !');
    LimpaCPF;
    FocoCPF;
    abort
  end;

  if Trim(edtEnd.Text) ='' then
  begin
    ShowMessage('Por favor insira o endereco do funcionário !');
    edtEnd.Text := '';
    edtEnd.SetFocus;
		abort
  end;

end;

procedure TfrmFuncionarios.VerificaTamanhoCPF;
var
	Aux1,Aux2,Soma1,Soma2:Integer;
  Dig :String;
begin
	Dig:=(trim(edtCpf.Text));
	aux1:=length(Dig);
	if  aux1 = 11 Then
  begin
  	aux1:=(StrToInt(Dig[1])*10)+ (StrToInt(Dig[2])*9) +(StrToInt(Dig[3])*8) + (StrToInt(Dig[4])*7)+(StrToInt(Dig[5])*6) +
  	(StrToInt(Dig[6])*5) + (StrToInt(dig[7])*4)+(StrToInt(dig[8])*3)+(StrToInt(Dig[9])*2);
  	Soma1:= 11 -(Aux1 Mod 11);
		if soma1>9 Then
    	Soma1:=0;
  		Aux2:=(StrToInt(Dig[1])*11)+ (StrToInt(Dig[2])*10) +(StrToInt(Dig[3])*9) + (StrToInt(Dig[4])*8)+(StrToInt(Dig[5])*7) +
			(StrToInt(Dig[6])*6) + (StrToInt(Dig[7])*5)+(StrToInt(Dig[8])*4)+(StrToInt(Dig[9])*3)+ ((Soma1)*2);
    	Soma2:=11-(Aux2 Mod 11);
    if Soma2>9 Then
    	Soma2:=0;
    if (StrToInt(Dig[10]) = Soma1) and (StrToInt(Dig[11]) = Soma2) Then
    	ShowMessage('CPF Válido !')
    else
    begin
    	ShowMessage('CPF Inválido');
      FocoCPF;
      LimpaCPF;
    end;
  end;
end;

procedure TfrmFuncionarios.ValidaCPF;
begin
	AtualizaConsulta;

	DM.consultaFunc.Close;
  DM.consultaFunc.SQL.Add('WHERE CPF = :CAMPO');
  DM.consultaFunc.Parameters.ParamByName('CAMPO').Value := Trim(edtCpf.Text);
  DM.consultaFunc.Open;

  if DM.consultaFunc.RecordCount > 0 Then
  begin
    ShowMessage('CPF já cadastrado!');
    edtCpf.SetFocus;
    edtCpf.Text := '';
    abort;
  end;
end;

end.
