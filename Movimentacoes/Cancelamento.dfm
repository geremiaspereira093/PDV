object FrmCancelarVenda: TFrmCancelarVenda
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Cancelar Venda Atual'
  ClientHeight = 188
  ClientWidth = 402
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object BtnSim: TPanel
    Left = 200
    Top = 154
    Width = 91
    Height = 25
    Caption = 'Sim [ENTER]'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = BtnSimClick
  end
  object BtnNao: TPanel
    Left = 308
    Top = 154
    Width = 86
    Height = 25
    Caption = 'N'#227'o [ESC]'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = BtnNaoClick
  end
  object RichEditCancel: TRichEdit
    Left = 8
    Top = 8
    Width = 386
    Height = 140
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'RichEditCancel')
    ParentFont = False
    TabOrder = 2
    Zoom = 100
  end
end
