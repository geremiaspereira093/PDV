unit NovaQtde;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls;

type
  TFrmQuantidade = class(TForm)
    EdtNovaQtde: TEdit;
    SpeedButton1: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQuantidade: TFrmQuantidade;

implementation

{$R *.dfm}

uses Vendas;

procedure TFrmQuantidade.SpeedButton1Click(Sender: TObject);
begin
	frmVendas.EdtQuantidade.Text := EdtNovaQtde.Text;
  EdtNovaQtde.Text := '';
end;

end.
