object FrmCancelaItem: TFrmCancelaItem
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'PDV'
  ClientHeight = 203
  ClientWidth = 371
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object RichEditCancel: TRichEdit
    Left = 8
    Top = 8
    Width = 353
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
    TabOrder = 0
    Zoom = 100
  end
  object BtnSim: TPanel
    Left = 168
    Top = 159
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
    Left = 275
    Top = 159
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
end
