unit Cancelamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Data.DB, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TFrmCancelarVenda = class(TForm)
    BtnSim: TPanel;
    BtnNao: TPanel;
    RichEditCancel: TRichEdit;
    procedure FormCreate(Sender: TObject);
    procedure BtnNaoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnSimClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCancelarVenda: TFrmCancelarVenda;

implementation

{$R *.dfm}

uses ModuloDados, Vendas;

procedure TFrmCancelarVenda.BtnNaoClick(Sender: TObject);
begin
 Close;
end;

procedure TFrmCancelarVenda.BtnSimClick(Sender: TObject);
begin
	DM.dataSetVendas.Cancel;
  DM.DataSetDetVenda.Close;
  DM.DataSetDetVenda.Open;
  DM.QueryDetVenda.Close;
  Close;
end;

procedure TFrmCancelarVenda.FormCreate(Sender: TObject);
begin
 RichEditCancel.Text := 'Deseja Cancelar a Venda ?';
end;

procedure TFrmCancelarVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if Key = VK_ESCAPE Then
  	BtnNaoClick(Sender)
  else if Key = VK_RETURN Then
  	BtnSimClick(Sender);
end;

end.
