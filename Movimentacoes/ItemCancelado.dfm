object FrmConfirmaCancelamento: TFrmConfirmaCancelamento
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'PDV'
  ClientHeight = 223
  ClientWidth = 495
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object GridCancel: TDBGrid
    Left = 19
    Top = 18
    Width = 468
    Height = 153
    DataSource = DsQueryDetVenda
    FixedColor = clAppWorkSpace
    GradientEndColor = clWhite
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object BtnSim: TPanel
    Left = 280
    Top = 187
    Width = 91
    Height = 25
    Caption = 'Sim [ENTER]'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = BtnSimClick
  end
  object BtnNao: TPanel
    Left = 399
    Top = 187
    Width = 86
    Height = 25
    Caption = 'N'#227'o [ESC]'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = BtnNaoClick
  end
  object DsQueryDetVenda: TDataSource
    DataSet = DM.QueryDetVenda
    Left = 40
    Top = 175
  end
end
