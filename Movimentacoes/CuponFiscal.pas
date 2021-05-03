unit CuponFiscal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids;

type
  TfrmCupomFiscal = class(TForm)
    DBGrid1: TDBGrid;
    btnEmitir: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCupomFiscal: TfrmCupomFiscal;

implementation

{$R *.dfm}

uses ModuloDados;

end.
