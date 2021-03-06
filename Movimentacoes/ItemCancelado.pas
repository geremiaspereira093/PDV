unit ItemCancelado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids;

type
  TFrmConfirmaCancelamento = class(TForm)
    GridCancel: TDBGrid;
    DsQueryDetVenda: TDataSource;
    BtnSim: TPanel;
    BtnNao: TPanel;
    procedure BtnSimClick(Sender: TObject);
    procedure BtnNaoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }

    procedure AtualizaStatus;
    procedure DevolveEStoque;
  public
    { Public declarations }
  end;

var
  FrmConfirmaCancelamento: TFrmConfirmaCancelamento;

implementation

{$R *.dfm}

uses ModuloDados;

{ TConfirmaCancelamento }

procedure TFrmConfirmaCancelamento.AtualizaStatus;
var
	Codigo:Integer;
  Status:Char;
begin
	DM.QueryDetVenda.Close;
	DM.QueryDetVenda.SQL.Clear;
	DM.QueryDetVenda.SQL.Add('SELECT CODIGO, COD_VENDA,PRODUTO,QUANTIDADE,COD_PRODUTO,VALOR,'+
 	 'VALOR_TOTAL,ESTADO FROM DETALHE_VENDA  ORDER BY COD_VENDA ASC');
	DM.QueryDetVenda.Open;

  GridCancel.Columns[0].Alignment := taCenter;
	GridCancel.Columns[2].Alignment := taCenter;
	GridCancel.Columns[3].Alignment := taCenter;

  if not DM.QueryDetVenda.IsEmpty Then
  begin
    Codigo := DM.QueryDetVenda.FieldByName('CODIGO').AsInteger;
  end;

	Status:= 'S';
// 	DM.QueryDetVenda.Close;
//	DM.QueryDetVenda.SQL.Clear;
//	DM.QueryDetVenda.SQL.Add('UPDATE DETALHE_VENDA SET ESTADO = :STATUS WHERE CODIGO = :ID');
//  DM.QueryDetVenda.Parameters.ParamByName('STATUS').Value := Status;
//  DM.QueryDetVenda.Parameters.ParamByName('ID').Value := Codigo;
//	DM.QueryDetVenda.ExecSQL;
	DevolveEStoque;
	DM.QueryDetVenda.Delete;
end;

procedure TFrmConfirmaCancelamento.BtnNaoClick(Sender: TObject);
begin
	Close;
end;

procedure TFrmConfirmaCancelamento.BtnSimClick(Sender: TObject);
begin
	AtualizaStatus;
end;

procedure TFrmConfirmaCancelamento.DevolveEStoque;
var
	Id:Integer;
  QtdeVenda:Currency;
begin
	Id := DM.QueryDetVenda.FieldByName('COD_PRODUTO').AsInteger;
  QtdeVenda := DM.QueryDetVenda.FieldByName('QUANTIDADE').AsCurrency;
	DM.consultaProdutos.Close;
  DM.consultaProdutos.SQL.Clear;
  DM.consultaProdutos.SQL.Add('UPDATE PRODUTOS SET QUANTIDADE = QUANTIDADE + :QTDEVENDA ');
  DM.consultaProdutos.SQL.Add('WHERE CODIGO = :ID');
  DM.consultaProdutos.Parameters.ParamByName('QTDEVENDA').Value := QtdeVenda;
  DM.consultaProdutos.Parameters.ParamByName('ID').Value := Id;
  DM.consultaProdutos.ExecSQL;
end;

procedure TFrmConfirmaCancelamento.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
	if Key = VK_RETURN Then
  	BtnSimClick(Sender)
  else if Key = VK_ESCAPE Then
  	BtnNaoClick(Sender);

end;

end.
