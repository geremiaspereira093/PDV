unit ControleId;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls;

type
  TFrmIdTabelas = class(TForm)
    DataSource1: TDataSource;
    Label1: TLabel;
    DbEdtId: TDBEdit;
    Label2: TLabel;
    DbEdtTabela: TDBEdit;
    btnNovo: TSpeedButton;
    btnEditar: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure DataSource1StateChange(Sender: TObject);
    procedure DbEdtIdExit(Sender: TObject);
    procedure DbEdtTabelaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LimpaCampos;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmIdTabelas: TFrmIdTabelas;

implementation

{$R *.dfm}

uses ModuloDados;

procedure TFrmIdTabelas.btnCancelarClick(Sender: TObject);
begin
	DM.DataSetId.Cancel;
end;

procedure TFrmIdTabelas.btnEditarClick(Sender: TObject);
begin
	DM.dataSetId.Edit;
end;

procedure TFrmIdTabelas.btnNovoClick(Sender: TObject);
begin
	DM.DataSetId.Append;
end;

procedure TFrmIdTabelas.btnSalvarClick(Sender: TObject);
begin
	DM.DataSetId.Post;
  LimpaCampos;
end;

procedure TFrmIdTabelas.DataSource1StateChange(Sender: TObject);
begin
	btnNovo.Enabled := ( DM.DataSetId.State in [dsBrowse] );
  btnSalvar.Enabled := ( DM.DataSetId.State in [dsInsert] );
  btnCancelar.Enabled := ( DM.DataSetId.State in [dsInsert] );

  if DM.DataSetId.State in [dsInsert] Then
  begin
  	btnNovo.Enabled := False;
    btnEditar.Enabled := False;
  end
  else
  begin
  	btnNovo.Enabled := True;
    btnEditar.Enabled := True;
  end;

end;

procedure TFrmIdTabelas.DbEdtIdExit(Sender: TObject);
begin
	if Trim(DbEdtId.Text) ='' Then
  begin
    MessageDlg('Campo Vazio !',mtWarning,mbOKCancel,0);
    DbEdtId.SetFocus;
  end;

end;

procedure TFrmIdTabelas.DbEdtTabelaExit(Sender: TObject);
begin
		if Trim(DbEdtTAbela.Text) ='' Then
  begin
    MessageDlg('Campo Vazio !',mtWarning,mbOKCancel,0);
    DbEdtId.SetFocus;
  end;
end;

procedure TFrmIdTabelas.FormCreate(Sender: TObject);
begin
	DM.DataSetId.Active := True;
end;

procedure TFrmIdTabelas.LimpaCampos;
begin
	DbEdtId.Text := '';
  DbEdtTabela.Text := '';
end;

end.