object frmVendas: TfrmVendas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Vendas'
  ClientHeight = 615
  ClientWidth = 1370
  Color = clMedGray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label11: TLabel
    Left = 297
    Top = 318
    Width = 74
    Height = 19
    Caption = 'Valor Total'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object painelTopo: TPanel
    Left = 0
    Top = 0
    Width = 1370
    Height = 61
    Align = alTop
    Color = clSilver
    ParentBackground = False
    TabOrder = 0
  end
  object PainelTotal: TPanel
    Left = 736
    Top = 61
    Width = 634
    Height = 554
    Align = alRight
    Color = clSilver
    ParentBackground = False
    TabOrder = 1
    ExplicitLeft = 741
    ExplicitTop = 52
    object Label8: TLabel
      Left = 24
      Top = 133
      Width = 59
      Height = 19
      Caption = 'Produtos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 23
      Top = 245
      Width = 81
      Height = 19
      Caption = 'Quantidade '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Buscar: TLabel
      Left = 23
      Top = 77
      Width = 117
      Height = 19
      Caption = 'C'#243'digo de Barras'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 24
      Top = 193
      Width = 91
      Height = 19
      Caption = 'Valor unit'#225'rio'
      FocusControl = edtUnitario
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ImgProduto: TImage
      Left = 129
      Top = 257
      Width = 209
      Height = 188
      Stretch = True
    end
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 632
      Height = 66
      Align = alTop
      Caption = 'Total do Item'
      Color = clTeal
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      ExplicitWidth = 736
    end
    object txtBusca: TEdit
      Left = 23
      Top = 102
      Width = 264
      Height = 21
      TabOrder = 1
      OnChange = txtBuscaChange
    end
    object edtUnitario: TDBEdit
      Left = 23
      Top = 218
      Width = 100
      Height = 21
      DataField = 'VALOR'
      DataSource = DSConsultaProdutos
      TabOrder = 2
    end
    object EdtQuantidade: TDBEdit
      Left = 23
      Top = 270
      Width = 100
      Height = 21
      DataField = 'QUANTIDADE'
      DataSource = DSDetalheVenda
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object EdtProduto: TDBEdit
      Left = 23
      Top = 158
      Width = 264
      Height = 21
      DataField = 'PRODUTO'
      DataSource = DSDetalheVenda
      TabOrder = 4
    end
    object Panel1: TPanel
      Left = 1
      Top = 487
      Width = 632
      Height = 66
      Align = alBottom
      Color = clTeal
      ParentBackground = False
      TabOrder = 5
      ExplicitTop = 574
      ExplicitWidth = 736
      object Label9: TLabel
        Left = 5
        Top = 20
        Width = 101
        Height = 42
        Caption = 'Troco:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -37
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 110
        Top = 20
        Width = 19
        Height = 42
        Caption = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -37
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object Panel2: TPanel
      Left = 361
      Top = 67
      Width = 272
      Height = 420
      Align = alRight
      Caption = 'Panel2'
      TabOrder = 6
      ExplicitLeft = 465
      ExplicitHeight = 507
      object Label4: TLabel
        Left = 23
        Top = 26
        Width = 115
        Height = 26
        Caption = 'Valor Total'
        FocusControl = EdtTotalVenda
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 23
        Top = 121
        Width = 158
        Height = 26
        Caption = 'Valor Recebido'
        FocusControl = EdtValorRecebido
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 20
        Top = 213
        Width = 59
        Height = 26
        Caption = 'Troco'
        FocusControl = EdtTroco
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 19
        Top = 295
        Width = 111
        Height = 26
        Caption = 'Data Atual'
        FocusControl = edtUnitario
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 23
        Top = 393
        Width = 90
        Height = 26
        Caption = 'Hor'#225'rio '
        FocusControl = edtUnitario
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EdtTotalVenda: TDBEdit
        Left = 20
        Top = 58
        Width = 186
        Height = 21
        DataField = 'VALOR_TOTAL'
        DataSource = srcVendas
        TabOrder = 0
      end
      object EdtValorRecebido: TDBEdit
        Left = 23
        Top = 153
        Width = 186
        Height = 21
        DataField = 'VALOR_RECEBIDO'
        DataSource = srcVendas
        TabOrder = 1
      end
      object EdtTroco: TDBEdit
        Left = 23
        Top = 245
        Width = 186
        Height = 21
        DataField = 'TROCO'
        DataSource = srcVendas
        TabOrder = 2
      end
      object EdtData: TDBEdit
        Left = 23
        Top = 335
        Width = 186
        Height = 21
        DataField = 'DATA_VENDA'
        DataSource = srcVendas
        TabOrder = 3
      end
      object EdtHora: TDBEdit
        Left = 23
        Top = 430
        Width = 186
        Height = 21
        DataField = 'HORA'
        DataSource = srcVendas
        TabOrder = 4
      end
    end
  end
  object painelGrid: TPanel
    Left = 0
    Top = 61
    Width = 736
    Height = 554
    Align = alClient
    Alignment = taLeftJustify
    Color = clActiveBorder
    ParentBackground = False
    TabOrder = 2
    ExplicitWidth = 632
    ExplicitHeight = 641
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 734
      Height = 66
      Align = alTop
      Caption = 'Itens adicionados'
      Color = clTeal
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      ExplicitWidth = 630
    end
    object DBItensVendidos: TDBGrid
      Left = 205
      Top = 67
      Width = 530
      Height = 420
      Align = alClient
      DataSource = DSQueryDetVendas
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'PRODUTO'
          Width = 205
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QUANTIDADE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_TOTAL'
          Width = 127
          Visible = True
        end>
    end
    object PanelTotal: TPanel
      Left = 1
      Top = 487
      Width = 734
      Height = 66
      Align = alBottom
      Color = clTeal
      ParentBackground = False
      TabOrder = 2
      ExplicitTop = 574
      ExplicitWidth = 630
      object Label5: TLabel
        Left = 11
        Top = 20
        Width = 102
        Height = 42
        Caption = 'Total: '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -37
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblTotal: TLabel
        Left = 116
        Top = 20
        Width = 19
        Height = 42
        Caption = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -37
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object PanelMenu: TPanel
      Left = 1
      Top = 67
      Width = 204
      Height = 420
      Align = alLeft
      TabOrder = 3
      object Label10: TLabel
        Left = 8
        Top = 145
        Width = 189
        Height = 24
        Caption = 'Finalizar Venda  [F3]'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 6
        Top = 226
        Width = 191
        Height = 24
        Caption = 'Cancelar Venda  [F4]'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 11
        Top = 62
        Width = 162
        Height = 24
        Caption = 'Iniciar Venda [F2]'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label17: TLabel
        Left = 6
        Top = 301
        Width = 158
        Height = 24
        Caption = ' Quantidade  [F5]'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 67
      Width = 210
      Height = 41
      Color = clTeal
      ParentBackground = False
      TabOrder = 4
      object Label15: TLabel
        Left = 82
        Top = 11
        Width = 47
        Height = 22
        Caption = 'Menu'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object srcVendas: TDataSource
    AutoEdit = False
    DataSet = DM.dataSetVendas
    Left = 1440
    Top = 10
  end
  object SrcQueryVendas: TDataSource
    AutoEdit = False
    Left = 1114
    Top = 12
  end
  object DSConsultaProdutos: TDataSource
    DataSet = DM.consultaProdutos
    Left = 1014
    Top = 12
  end
  object DSConsultaFuncionarios: TDataSource
    DataSet = DM.consultaFunc
    Left = 898
    Top = 12
  end
  object DSDetalheVenda: TDataSource
    DataSet = DM.DataSetDetVenda
    Left = 1205
    Top = 11
  end
  object DSQueryDetVendas: TDataSource
    DataSet = DM.QueryDetVenda
    Left = 1304
    Top = 10
  end
  object DSVendas: TDataSource
    DataSet = DM.dataSetVendas
    Left = 1383
    Top = 10
  end
  object Timer1: TTimer
    Left = 1453
    Top = 605
  end
end
