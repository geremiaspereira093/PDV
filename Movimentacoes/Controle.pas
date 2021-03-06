unit Controle;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Data.DB, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls;

type
  TIdTabelas = class(TForm)
    Label1: TLabel;
    EditId: TDBEdit;
    DataSourceID: TDataSource;
    Label2: TLabel;
    EditTabela: TDBEdit;
    btnNovo: TSpeedButton;
    btnEditar: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DataSourceIDStateChange(Sender: TObject);
    procedure LimpaCampos;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  IdTabelas: TIdTabelas;

implementation

{$R *.dfm}

uses ModuloDados;

procedure TIdTabelas.btnCancelarClick(Sender: TObject);
begin
	DM.DataSetId.Cancel;
end;

procedure TIdTabelas.btnEditarClick(Sender: TObject);
begin
	DM.DataSetId.Edit;
end;

procedure TIdTabelas.btnNovoClick(Sender: TObject);
begin
	DM.DataSetId.Append;
end;

procedure TIdTabelas.btnSalvarClick(Sender: TObject);
begin
	DM.DataSetId.Post;
	LimpaCampos;
end;

procedure TIdTabelas.DataSourceIDStateChange(Sender: TObject);
begin
	btnSalvar.Enabled := ( DM.DataSetId.State in [dsInsert] );
  btnCancelar.Enabled := ( DM.DataSetId.State in [dsInsert] );

  if DM.DataSetId.State In [DSInsert] Then
  begin
		btnNovo.Enabled := False;
    btnEditar.Enabled := False;
  end
  else if DM.DataSetId.State in [DSEDIT] Then
  begin
    btnSalvar.Enabled := True;
    btnCancelar.Enabled := True;
    btnNovo.Enabled := False;
    btnEditar.Enabled := False;
  end
  else
  begin
    btnNovo.Enabled := True;
    btnEditar.Enabled := True;
    btnSalvar.Enabled := False;
    btnCancelar.Enabled := False;
  end;

end;

procedure TIdTabelas.FormCreate(Sender: TObject);
begin
	DM.DataSetId.Active := True;
end;

procedure TIdTabelas.LimpaCampos;
begin
	EditId.Text := '';
  EditTabela.Text := '';
end;

end.
