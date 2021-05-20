unit CancelaItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TFrmCancelaItem = class(TForm)
    RichEditCancel: TRichEdit;
    BtnSim: TPanel;
    BtnNao: TPanel;
    procedure BtnNaoClick(Sender: TObject);
    procedure BtnSimClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  FrmCancelaItem: TFrmCancelaItem;

implementation

{$R *.dfm}

uses ModuloDados, ItemCancelado;


procedure TFrmCancelaItem.BtnNaoClick(Sender: TObject);
begin
	Close;
end;

procedure TFrmCancelaItem.BtnSimClick(Sender: TObject);
begin
	FrmConfirmaCancelamento := 	TFrmConfirmaCancelamento.Create(nil);
  FrmConfirmaCancelamento.Show;
  Close;
end;

procedure TFrmCancelaItem.FormCreate(Sender: TObject);
begin
	RichEditCancel.Text := 'Deseja Cencelar o Item ?';
end;

procedure TFrmCancelaItem.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_RETURN Then
 	BtnSimClick(Sender)
 else if Key = VK_ESCAPE Then
 	BtnNaoClick(Sender);

end;

end.
