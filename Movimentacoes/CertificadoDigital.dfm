object frmCertificados: TfrmCertificados
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cerfificados Digitais'
  ClientHeight = 260
  ClientWidth = 528
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object StringGrid1: TStringGrid
    Left = 25
    Top = 25
    Width = 481
    Height = 186
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 431
    Top = 224
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 1
  end
  object BitBtn2: TBitBtn
    Left = 330
    Top = 224
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 2
  end
end
