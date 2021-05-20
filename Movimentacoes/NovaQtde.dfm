object FrmQuantidade: TFrmQuantidade
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Quantidade'
  ClientHeight = 137
  ClientWidth = 256
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 55
    Top = 75
    Width = 86
    Height = 30
    Caption = 'Atualizar'
    OnClick = SpeedButton1Click
  end
  object EdtNovaQtde: TEdit
    Left = 55
    Top = 25
    Width = 146
    Height = 26
    TabOrder = 0
  end
end
