unit Cargos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls;

type
  TfrmCargos = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Buscar: TLabel;
    txtBuscaCargo: TEdit;
    btnPesquisa: TSpeedButton;
    DBGrid1: TDBGrid;
    btnListar: TSpeedButton;
    btnDeletar: TSpeedButton;
    Nome: TLabel;
    edtCargo: TDBEdit;
    btnNovo: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    Label1: TLabel;
    DBGrid3: TDBGrid;
    btnEditar: TSpeedButton;
    btnCancelarEdit: TSpeedButton;
    btnSalvarEdit: TSpeedButton;
    DBEdit1: TDBEdit;
    sourceCargoCa: TDataSource;
    DataSourceEditCargos: TDataSource;
    sourceCargos: TDataSource;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure LimpaPesquisa;
    procedure PesquisarPorCargo;
    procedure btnPesquisaClick(Sender: TObject);
    procedure AtualizaConsulta;
    procedure btnListarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarEditClick(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure edtCargoExit(Sender: TObject);
    procedure VerificarCampo;
    procedure btnCancelarEditClick(Sender: TObject);
    procedure sourceCargoCaStateChange(Sender: TObject);
    procedure DataSourceEditCargosStateChange(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCargos: TfrmCargos;

implementation

{$R *.dfm}

uses ModuloDados;

procedure TfrmCargos.btnCancelarClick(Sender: TObject);
begin
	DM.dataSetCargos.Cancel;
end;

procedure TfrmCargos.btnCancelarEditClick(Sender: TObject);
begin
  DM.DataSetEditCargos.Cancel;
end;

procedure TfrmCargos.btnDeletarClick(Sender: TObject);
begin
	DM.consultaCargos.Delete;
end;

procedure TfrmCargos.btnEditarClick(Sender: TObject);
begin
	DM.dataSetEditCargos.Edit;
end;

procedure TfrmCargos.btnListarClick(Sender: TObject);
begin
	AtualizaConsulta;
end;

procedure TfrmCargos.btnNovoClick(Sender: TObject);
begin
  edtCargo.SetFocus;
	DM.dataSetCargos.Append;
end;

procedure TfrmCargos.btnPesquisaClick(Sender: TObject);
begin
	PesquisarPorCargo;
end;

procedure TfrmCargos.btnSalvarClick(Sender: TObject);
begin
  VerificarCampo;
  DM.dataSetCargos.Post;
end;

procedure TfrmCargos.btnSalvarEditClick(Sender: TObject);
begin
	DM.DataSetEditCargos.Post;
end;

procedure TfrmCargos.DataSourceEditCargosStateChange(Sender: TObject);
begin
	btnEditar.Enabled := ( DM.DataSetEditCargos.State in [dsBrowse] );
  btnSalvarEdit.Enabled := ( DM.dataSetEditCargos.State in [dsEdit] );
  btnCancelarEdit.Enabled := (DM.dataSetEditCargos.State in [dsEdit] );

  if DM.DataSetEditCargos.State in [dsEdit] Then
  begin
  	btnNovo.Enabled := False;
    btnDeletar.Enabled := False;
  end
  else
  begin
    btnNovo.Enabled := True;
    btnDeletar.Enabled := True;
    btnSalvar.Enabled := False;
    btnCancelar.Enabled := False;
  end;
end;

procedure TfrmCargos.DBEdit1Exit(Sender: TObject);
begin
	VerificarCampo;
end;

procedure TfrmCargos.edtCargoExit(Sender: TObject);
begin
  VerificarCampo;
end;

procedure TfrmCargos.AtualizaConsulta;
begin
	DM.consultaCargos.Close;
  DM.consultaCargos.SQL.Clear;
  DM.consultaCargos.SQL.Add('SELECT CODIGO, CARGO FROM CARGOS');
  DM.consultaCargos.Open;
end;

procedure TfrmCargos.FormCreate(Sender: TObject);
begin
  DM.conexaoBanco.Connected := True;
  Dm.dataSetCargos.Active := True;
  DM.consultaCargos.Active := True;
  DM.DataSetEditCargos.Active := True;
end;

procedure TfrmCargos.LimpaPesquisa;
begin
	txtBuscaCargo.Text := '';
end;

procedure TfrmCargos.PesquisarPorCargo;
begin
	if Trim(txtBuscaCargo.Text) = '' Then
  begin
    ShowMessage('Por favor preencha o campo');
    LimpaPesquisa;
    txtBuscaCargo.SetFocus;
    abort
  end;

  AtualizaConsulta;

	DM.consultaCargos.Close;
  DM.consultaCargos.SQL.Add('WHERE CARGO LIKE :FUNCAO');
  DM.consultaCargos.Parameters.ParamByName('FUNCAO').Value := Trim(txtBuscaCargo.Text) +'%';
  DM.consultaCargos.Open;

  if DM.consultaCargos.IsEmpty Then
  begin
  	ShowMessage('Cargo não encontrado nos registros!');
    LimpaPesquisa;
    txtBuscaCargo.SetFocus;
    abort;
  end;
  LimpaPesquisa;
end;

procedure TfrmCargos.sourceCargoCaStateChange(Sender: TObject);
begin
	btnNovo.Enabled := ( DM.dataSetCargos.State in [dsBrowse] );
  btnSalvar.Enabled := ( DM.dataSetCargos.State in [dsInsert] );
  btnCancelar.Enabled := (DM.dataSetCargos.State in [dsInsert] );

  if DM.dataSetCargos.State in [dsInsert] Then
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

procedure TfrmCargos.VerificarCampo;
begin
	if Trim(edtCargo.Text) = '' Then
  begin
  	MessageDlg('Campo cargo vazio !',mtWarning,mbOkCancel,0);
    abort;
  end;
end;

end.
