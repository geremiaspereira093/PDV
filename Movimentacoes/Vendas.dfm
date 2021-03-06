object frmVendas: TfrmVendas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Vendas'
  ClientHeight = 680
  ClientWidth = 1446
  Color = clMedGray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
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
    Width = 1446
    Height = 61
    Align = alTop
    Color = clSilver
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = 1
    ExplicitTop = -5
  end
  object painelGrid: TPanel
    Left = 0
    Top = 61
    Width = 995
    Height = 619
    Align = alClient
    Alignment = taLeftJustify
    Color = clActiveBorder
    ParentBackground = False
    TabOrder = 1
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 993
      Height = 66
      Align = alTop
      Caption = 'Itens adicionados'
      Color = clTeal
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      object Label15: TLabel
        Left = 41
        Top = 26
        Width = 105
        Height = 24
        Caption = 'Menu [F11]'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object DBItensVendidos: TDBGrid
      Left = 205
      Top = 67
      Width = 789
      Height = 485
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
          Width = 187
          Visible = True
        end>
    end
    object PanelTotal: TPanel
      Left = 1
      Top = 552
      Width = 993
      Height = 66
      Align = alBottom
      Color = clTeal
      ParentBackground = False
      TabOrder = 2
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
      Height = 485
      Align = alLeft
      TabOrder = 3
      Visible = False
      object Label10: TLabel
        Left = 8
        Top = 96
        Width = 138
        Height = 19
        Caption = 'Finalizar Venda  [F3]'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 8
        Top = 158
        Width = 141
        Height = 19
        Caption = 'Cancelar Venda  [F4]'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 11
        Top = 26
        Width = 120
        Height = 19
        Caption = 'Iniciar Venda [F2]'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label17: TLabel
        Left = 4
        Top = 215
        Width = 116
        Height = 19
        Caption = ' Quantidade  [F5]'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 11
        Top = 279
        Width = 171
        Height = 19
        Caption = 'Cancelar Item [DELETE]'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object PainelTotal: TPanel
    Left = 995
    Top = 61
    Width = 451
    Height = 619
    Align = alRight
    Color = clSilver
    ParentBackground = False
    TabOrder = 2
    object Label8: TLabel
      Left = 24
      Top = 165
      Width = 74
      Height = 22
      Caption = 'Produtos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 23
      Top = 302
      Width = 100
      Height = 22
      Caption = 'Quantidade '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Buscar: TLabel
      Left = 23
      Top = 95
      Width = 145
      Height = 22
      Caption = 'C'#243'digo de Barras'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 24
      Top = 232
      Width = 113
      Height = 22
      Caption = 'Valor unit'#225'rio'
      FocusControl = edtUnitario
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ImgProduto: TImage
      Left = 25
      Top = 395
      Width = 151
      Height = 111
      Stretch = True
    end
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 449
      Height = 66
      Align = alTop
      Caption = 'Total do Item'
      Color = clTeal
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object txtBusca: TEdit
      Left = 24
      Top = 123
      Width = 186
      Height = 21
      TabOrder = 1
      OnChange = txtBuscaChange
    end
    object edtUnitario: TDBEdit
      Left = 24
      Top = 262
      Width = 186
      Height = 21
      DataField = 'VALOR'
      DataSource = DSConsultaProdutos
      TabOrder = 2
    end
    object EdtQuantidade: TDBEdit
      Left = 23
      Top = 340
      Width = 186
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
      Top = 193
      Width = 186
      Height = 21
      DataField = 'PRODUTO'
      DataSource = DSDetalheVenda
      TabOrder = 4
    end
    object Panel1: TPanel
      Left = 1
      Top = 552
      Width = 449
      Height = 66
      Align = alBottom
      Color = clTeal
      ParentBackground = False
      TabOrder = 5
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
      object LblTroco: TLabel
        Left = 112
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
      Left = 222
      Top = 67
      Width = 228
      Height = 485
      Align = alRight
      TabOrder = 6
      object Panel4: TPanel
        Left = 0
        Top = 1
        Width = 227
        Height = 483
        Align = alRight
        TabOrder = 0
        object Label22: TLabel
          Left = 20
          Top = 374
          Width = 42
          Height = 22
          Caption = 'Hora'
          FocusControl = edtUnitario
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 20
          Top = 235
          Width = 49
          Height = 22
          Caption = 'Troco'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 20
          Top = 26
          Width = 125
          Height = 22
          Caption = 'Valor Recebido'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 20
          Top = 98
          Width = 91
          Height = 22
          Caption = 'Valor Total'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 22
          Top = 310
          Width = 40
          Height = 22
          Caption = 'Data'
          FocusControl = edtUnitario
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 20
          Top = 173
          Width = 76
          Height = 22
          Caption = 'Desconto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object EdtTotal: TDBEdit
          Left = 23
          Top = 126
          Width = 186
          Height = 21
          DataField = 'VALOR_TOTAL'
          DataSource = srcVendas
          TabOrder = 0
        end
        object EditRecebido: TDBEdit
          Left = 23
          Top = 54
          Width = 186
          Height = 21
          DataField = 'VALOR_RECEBIDO'
          DataSource = srcVendas
          TabOrder = 1
        end
        object EditTroco: TDBEdit
          Left = 20
          Top = 267
          Width = 186
          Height = 21
          DataField = 'TROCO'
          DataSource = srcVendas
          TabOrder = 2
        end
        object EdtDataVenda: TDBEdit
          Left = 22
          Top = 338
          Width = 186
          Height = 21
          DataField = 'DATA_VENDA'
          DataSource = srcVendas
          TabOrder = 3
        end
        object EditDesconto: TDBEdit
          Left = 23
          Top = 201
          Width = 186
          Height = 21
          DataField = 'DESCONTO'
          DataSource = srcVendas
          TabOrder = 4
        end
        object EdtHora: TDBEdit
          Left = 22
          Top = 407
          Width = 186
          Height = 21
          DataField = 'HORA'
          DataSource = srcVendas
          TabOrder = 5
        end
      end
    end
    object MediaPlayer1: TMediaPlayer
      Left = 170
      Top = 571
      Width = 253
      Height = 30
      DoubleBuffered = True
      Visible = False
      ParentDoubleBuffered = False
      TabOrder = 7
    end
  end
  object srcVendas: TDataSource
    AutoEdit = False
    DataSet = DM.dataSetVendas
    OnStateChange = srcVendasStateChange
    Left = 1355
    Top = 5
  end
  object SrcQueryVendas: TDataSource
    AutoEdit = False
    Left = 1079
    Top = 7
  end
  object DSConsultaProdutos: TDataSource
    DataSet = DM.consultaProdutos
    Left = 974
    Top = 7
  end
  object DSConsultaFuncionarios: TDataSource
    DataSet = DM.consultaFunc
    Left = 858
    Top = 2
  end
  object DSDetalheVenda: TDataSource
    DataSet = DM.DataSetDetVenda
    Left = 1175
    Top = 6
  end
  object DSQueryDetVendas: TDataSource
    DataSet = DM.DataSetDetVenda
    Left = 1274
    Top = 5
  end
  object Timer1: TTimer
    Left = 1453
    Top = 605
  end
  object MainMenu1: TMainMenu
    Left = 350
    Top = 10
    object Utilitrios1: TMenuItem
      Caption = 'Utilit'#225'rios'
      object ConfigurarBanco1: TMenuItem
        Caption = 'Configurar Banco'
        OnClick = ConfigurarBanco1Click
      end
    end
  end
  object DataSource1: TDataSource
    Left = 705
    Top = 5
  end
  object NFCe: TACBrNFe
    Configuracoes.Geral.SSLLib = libCustom
    Configuracoes.Geral.SSLCryptLib = cryWinCrypt
    Configuracoes.Geral.SSLHttpLib = httpNone
    Configuracoes.Geral.SSLXmlSignLib = xsNone
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.ModeloDF = moNFCe
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 3
    Configuracoes.WebServices.QuebradeLinha = '|'
    Configuracoes.RespTec.IdCSRT = 0
    Left = 910
    Top = 626
  end
end
