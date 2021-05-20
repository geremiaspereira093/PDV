object DM: TDM
  OldCreateOrder = False
  Height = 537
  Width = 480
  object dataSetForn: TADODataSet
    AutoCalcFields = False
    Connection = conexaoBanco
    CursorType = ctStatic
    BeforeInsert = dataSetFornBeforeInsert
    BeforeEdit = dataSetFornBeforeEdit
    AfterPost = dataSetFornAfterPost
    BeforeCancel = dataSetFornBeforeCancel
    AfterCancel = dataSetFornAfterCancel
    BeforeDelete = dataSetFornBeforeDelete
    AfterDelete = dataSetFornAfterDelete
    CommandText = 'SELECT CODIGO,  NOME, CNPJ FROM FORNECEDORES'#13#10#13#10
    Parameters = <>
    Left = 175
    Top = 145
    object dataSetFornCODIGO: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 13
      FieldName = 'CODIGO'
      ReadOnly = True
    end
    object dataSetFornNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 17
      FieldName = 'NOME'
      Size = 80
    end
    object dataSetFornCNPJ: TStringField
      DisplayWidth = 21
      FieldName = 'CNPJ'
      EditMask = '##.###.###/####-##;0;_'
      Size = 14
    end
  end
  object dataSetProdutos: TADODataSet
    Connection = conexaoBanco
    CursorType = ctStatic
    BeforeInsert = dataSetProdutosBeforeInsert
    BeforeEdit = dataSetProdutosBeforeEdit
    AfterPost = dataSetProdutosAfterPost
    BeforeCancel = dataSetProdutosBeforeCancel
    AfterCancel = dataSetProdutosAfterCancel
    BeforeDelete = dataSetProdutosBeforeDelete
    AfterDelete = dataSetProdutosAfterDelete
    CommandText = 
      'SELECT CODIGO, NOME, VALOR, DESCRICAO, DATA_FABRICACAO, DATA_VAL' +
      'IDADE,QUANTIDADE, COD_FORN,'#13#10'CODIGO_BARRAS FROM PRODUTOS'#13#10'WHERE ' +
      'CODIGO = NULL;'
    Parameters = <>
    Left = 170
    Top = 325
    object dataSetProdutosCODIGO: TAutoIncField
      FieldName = 'CODIGO'
      ReadOnly = True
    end
    object dataSetProdutosNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 9
      FieldName = 'NOME'
      Size = 80
    end
    object dataSetProdutosVALOR: TBCDField
      DisplayLabel = 'Valor'
      DisplayWidth = 9
      FieldName = 'VALOR'
      DisplayFormat = ' ###.00,'
      Precision = 19
    end
    object dataSetProdutosDATA_FABRICACAO: TDateField
      DisplayLabel = 'Data de fabrica'#231#227'o'
      DisplayWidth = 15
      FieldName = 'DATA_FABRICACAO'
      DisplayFormat = 'dd/mm/yyy'
      EditMask = '!99/99/00;1;_'
    end
    object dataSetProdutosDATA_VALIDADE: TDateField
      DisplayLabel = 'Data de validade'
      DisplayWidth = 13
      FieldName = 'DATA_VALIDADE'
      DisplayFormat = 'dd/mm/yyy'
      EditMask = '!99/99/00;1;_'
    end
    object dataSetProdutosDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 20
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object dataSetProdutosQUANTIDADE: TBCDField
      FieldName = 'QUANTIDADE'
      DisplayFormat = '###.00,'
      Precision = 19
    end
    object dataSetProdutosCOD_FORN: TIntegerField
      DisplayLabel = 'C'#243'digo do fornecedor'
      DisplayWidth = 17
      FieldName = 'COD_FORN'
    end
    object dataSetProdutosCODIGO_BARRAS: TStringField
      DisplayLabel = 'C'#243'digo de barras'
      FieldName = 'CODIGO_BARRAS'
      Size = 80
    end
  end
  object consultaUsuarios: TADOQuery
    Connection = conexaoBanco
    CursorType = ctStatic
    BeforeDelete = consultaUsuariosBeforeDelete
    AfterDelete = consultaUsuariosAfterDelete
    Parameters = <>
    SQL.Strings = (
      'SELECT USUARIO,SENHA  FROM USUARIOS')
    Left = 63
    Top = 265
    object consultaUsuariosUSUARIO: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'USUARIO'
      Size = 30
    end
    object consultaUsuariosSENHA: TStringField
      DisplayLabel = 'Senha'
      FieldName = 'SENHA'
      Size = 30
    end
  end
  object dataSetFuncionarios: TADODataSet
    Connection = conexaoBanco
    CursorType = ctStatic
    BeforeInsert = dataSetFuncionariosBeforeInsert
    BeforeEdit = dataSetFuncionariosBeforeEdit
    AfterPost = dataSetFuncionariosAfterPost
    BeforeCancel = dataSetFuncionariosBeforeCancel
    AfterCancel = dataSetFuncionariosAfterCancel
    BeforeDelete = dataSetFuncionariosBeforeDelete
    AfterDelete = dataSetFuncionariosAfterDelete
    CommandText = 
      'SELECT CODIGO, NOME,CPF,ENDERECO,TELEFONE,CELULAR,COD_CARGO'#13#10' FR' +
      'OM FUNCIONARIOS'#13#10'WHERE CODIGO = NULL'
    Parameters = <>
    Left = 175
    Top = 265
    object dataSetFuncionariosCODIGO: TAutoIncField
      DisplayWidth = 10
      FieldName = 'CODIGO'
      ReadOnly = True
    end
    object dataSetFuncionariosNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 26
      FieldName = 'NOME'
      Size = 80
    end
    object dataSetFuncionariosCPF: TStringField
      DisplayWidth = 16
      FieldName = 'CPF'
      EditMask = '###.###.###-##;0;_'
      Size = 11
    end
    object dataSetFuncionariosENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      DisplayWidth = 20
      FieldName = 'ENDERECO'
      Size = 80
    end
    object dataSetFuncionariosTELEFONE: TStringField
      DisplayLabel = 'Telefone'
      DisplayWidth = 14
      FieldName = 'TELEFONE'
      EditMask = '(##)####-####;0;_'
      Size = 10
    end
    object dataSetFuncionariosCELULAR: TStringField
      DisplayLabel = 'Celular'
      DisplayWidth = 9
      FieldName = 'CELULAR'
      EditMask = '(##)#####-####;0;_'
      Size = 11
    end
    object dataSetFuncionariosCOD_CARGO: TIntegerField
      DisplayLabel = 'C'#243'digo do cargo'
      DisplayWidth = 13
      FieldName = 'COD_CARGO'
    end
  end
  object consultaFunc: TADOQuery
    Connection = conexaoBanco
    CursorType = ctStatic
    BeforeDelete = consultaFuncBeforeDelete
    AfterDelete = consultaFuncAfterDelete
    Parameters = <>
    SQL.Strings = (
      'SELECT CODIGO, NOME,CPF,ENDERECO,TELEFONE,CELULAR,COD_CARGO'
      ' FROM FUNCIONARIOS')
    Left = 175
    Top = 200
    object consultaFuncCODIGO: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 10
      FieldName = 'CODIGO'
      ReadOnly = True
    end
    object consultaFuncNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 14
      FieldName = 'NOME'
      Size = 50
    end
    object consultaFuncCPF: TStringField
      DisplayWidth = 14
      FieldName = 'CPF'
      EditMask = '###.###.###-##;0;_'
      Size = 11
    end
    object consultaFuncENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      DisplayWidth = 19
      FieldName = 'ENDERECO'
      Size = 50
    end
    object consultaFuncTELEFONE: TStringField
      DisplayLabel = 'Telefone'
      DisplayWidth = 12
      FieldName = 'TELEFONE'
      EditMask = '(##)####-####;0;_'
      Size = 10
    end
    object consultaFuncCELULAR: TStringField
      DisplayLabel = 'Celular'
      DisplayWidth = 14
      FieldName = 'CELULAR'
      EditMask = '(##)#####-####;0;_'
      Size = 11
    end
    object consultaFuncCOD_CARGO: TIntegerField
      DisplayLabel = 'Cargo'
      DisplayWidth = 10
      FieldName = 'COD_CARGO'
    end
  end
  object consultaCargos: TADOQuery
    Connection = conexaoBanco
    CursorType = ctStatic
    BeforeCancel = consultaCargosBeforeCancel
    AfterCancel = consultaCargosAfterCancel
    BeforeDelete = consultaCargosBeforeDelete
    AfterDelete = consultaCargosAfterDelete
    Parameters = <>
    SQL.Strings = (
      'SELECT CODIGO, CARGO FROM CARGOS')
    Left = 55
    Top = 85
    object consultaCargosCARGO: TStringField
      DisplayWidth = 16
      FieldName = 'CARGO'
      Size = 80
    end
    object consultaCargosCODIGO: TAutoIncField
      FieldName = 'CODIGO'
      ReadOnly = True
    end
  end
  object dataSetCargos: TADODataSet
    Connection = conexaoBanco
    CursorType = ctStatic
    AfterPost = dataSetCargosAfterPost
    BeforeCancel = dataSetCargosBeforeCancel
    AfterCancel = dataSetCargosAfterCancel
    CommandText = 'SELECT CODIGO, CARGO FROM CARGOS WHERE CODIGO = NULL'#13#10
    Parameters = <>
    Left = 55
    Top = 145
    object dataSetCargosCODIGO: TAutoIncField
      FieldName = 'CODIGO'
      ReadOnly = True
    end
    object dataSetCargosCARGO: TStringField
      FieldName = 'CARGO'
      Size = 80
    end
  end
  object consultaProdutos: TADOQuery
    Connection = conexaoBanco
    CursorType = ctStatic
    Filtered = True
    AfterCancel = consultaProdutosAfterCancel
    BeforeDelete = consultaProdutosBeforeDelete
    AfterDelete = consultaProdutosAfterDelete
    Parameters = <>
    SQL.Strings = (
      
        'SELECT CODIGO,  NOME, VALOR, DESCRICAO, DATA_FABRICACAO, DATA_VA' +
        'LIDADE,QUANTIDADE, COD_FORN,  '
      'CODIGO_BARRAS, IMAGEM FROM PRODUTOS'
      'WHERE CODIGO = NULL')
    Left = 300
    Top = 270
    object consultaProdutosCODIGO: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 5
      FieldName = 'CODIGO'
      ReadOnly = True
    end
    object consultaProdutosNOME: TStringField
      DisplayLabel = 'Produto'
      DisplayWidth = 11
      FieldName = 'NOME'
      Size = 80
    end
    object consultaProdutosDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o do produto'
      DisplayWidth = 17
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object consultaProdutosVALOR: TBCDField
      DisplayLabel = 'Valor do Produto'
      FieldName = 'VALOR'
      DisplayFormat = '###.00,'
      Precision = 19
    end
    object consultaProdutosDATA_FABRICACAO: TDateField
      DisplayLabel = 'Data de fabrica'#231#227'o'
      DisplayWidth = 16
      FieldName = 'DATA_FABRICACAO'
      DisplayFormat = 'dd/mm/yyy'
      EditMask = '!99/99/00;0;_'
    end
    object consultaProdutosDATA_VALIDADE: TDateField
      DisplayLabel = 'Data de validade'
      DisplayWidth = 14
      FieldName = 'DATA_VALIDADE'
      DisplayFormat = 'dd/mm/yyy'
      EditMask = '!99/99/00;0;_'
    end
    object consultaProdutosQUANTIDADE: TBCDField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
      DisplayFormat = '###.00,'
      Precision = 19
    end
    object consultaProdutosCOD_FORN: TIntegerField
      DisplayLabel = 'Fornecedor'
      DisplayWidth = 9
      FieldName = 'COD_FORN'
    end
    object consultaProdutosCODIGO_BARRAS: TStringField
      DisplayLabel = 'C'#243'digo de Barras'
      DisplayWidth = 80
      FieldName = 'CODIGO_BARRAS'
      Size = 80
    end
    object consultaProdutosIMAGEM: TBlobField
      FieldName = 'IMAGEM'
    end
  end
  object dataSetUsuarios: TADODataSet
    Connection = conexaoBanco
    CursorType = ctStatic
    BeforeInsert = dataSetUsuariosBeforeInsert
    BeforeEdit = dataSetUsuariosBeforeEdit
    AfterPost = dataSetUsuariosAfterPost
    BeforeCancel = dataSetUsuariosBeforeCancel
    AfterCancel = dataSetUsuariosAfterCancel
    BeforeDelete = dataSetUsuariosBeforeDelete
    AfterDelete = dataSetUsuariosAfterDelete
    CommandText = 
      'SELECT USUARIO,SENHA,COD_FUNC FROM USUARIOS '#13#10'WHERE CODIGO = NUL' +
      'L'
    Parameters = <>
    Left = 55
    Top = 320
    object dataSetUsuariosUSUARIO: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'USUARIO'
      Size = 30
    end
    object dataSetUsuariosSENHA: TStringField
      DisplayLabel = 'Senha'
      FieldName = 'SENHA'
      Size = 30
    end
    object dataSetUsuariosCOD_FUNC: TIntegerField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'COD_FUNC'
    end
  end
  object dataSetVendas: TADODataSet
    AutoCalcFields = False
    Connection = conexaoBanco
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterInsert = dataSetVendasAfterInsert
    AfterPost = dataSetVendasAfterPost
    AfterCancel = dataSetVendasAfterCancel
    CommandText = 
      'SELECT CODIGO,COD_FUNCIONARIO,DATA_VENDA,VALOR_TOTAL, HORA,'#13#10'FUN' +
      'CIONARIO,DESCONTO,VALOR_RECEBIDO,TROCO  FROM VENDA WHERE CODIGO ' +
      '= NULL'#13#10#13#10
    Parameters = <>
    Left = 409
    Top = 97
    object dataSetVendasCODIGO: TAutoIncField
      FieldName = 'CODIGO'
    end
    object dataSetVendasDATA_VENDA: TDateField
      DisplayLabel = 'Data da Venda'
      FieldName = 'DATA_VENDA'
      DisplayFormat = 'dd/mm/yy'
      EditMask = '!99/99/00;1;_'
    end
    object dataSetVendasCOD_FUNCIONARIO: TIntegerField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'COD_FUNCIONARIO'
    end
    object dataSetVendasVALOR_TOTAL: TBCDField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = '###.00,'
      Precision = 19
    end
    object dataSetVendasHORA: TDateTimeField
      DisplayLabel = 'Hor'#225'rio da Venda'
      FieldName = 'HORA'
      EditMask = '!90:00;1;_'
    end
    object dataSetVendasDESCONTO: TBCDField
      DisplayLabel = 'Desconto'
      FieldName = 'DESCONTO'
      DisplayFormat = '###.00,'
      Precision = 19
    end
    object dataSetVendasFUNCIONARIO: TStringField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'FUNCIONARIO'
      Size = 100
    end
    object dataSetVendasVALOR_RECEBIDO: TBCDField
      DisplayLabel = 'Valor Recebido'
      FieldName = 'VALOR_RECEBIDO'
      DisplayFormat = '###.00,'
      Precision = 19
    end
    object dataSetVendasTROCO: TBCDField
      DisplayLabel = 'Troco'
      FieldName = 'TROCO'
      DisplayFormat = '###.00,'
      Precision = 19
    end
  end
  object ConsultaFornece: TADOQuery
    Connection = conexaoBanco
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT CODIGO, NOME, CNPJ FROM FORNECEDORES')
    Left = 300
    Top = 215
    object ConsultaForneceCODIGO: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 10
      FieldName = 'CODIGO'
      ReadOnly = True
    end
    object ConsultaForneceNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 38
      FieldName = 'NOME'
      Size = 80
    end
    object ConsultaForneceCNPJ: TStringField
      DisplayWidth = 20
      FieldName = 'CNPJ'
      EditMask = '##.###.###/####-##;0;_'
      Size = 14
    end
  end
  object AdoQueryRelatorio_Vendas: TADOQuery
    Connection = conexaoBanco
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT NOME,VALOR_UNITARIO,DESCRICAO,'
      'QTDE_VENDIDOS,DATA_VENDA,NOME_FUNCIONARIO'
      'FROM VW_RELATORIO_VENDAS')
    Left = 50
    Top = 390
    object AdoQueryRelatorio_VendasNOME: TStringField
      DisplayLabel = 'Produto Vendido'
      DisplayWidth = 12
      FieldName = 'NOME'
      Size = 80
    end
    object AdoQueryRelatorio_VendasVALOR_UNITARIO: TBCDField
      DisplayLabel = 'Valor unit'#225'rio'
      DisplayWidth = 20
      FieldName = 'VALOR_UNITARIO'
      DisplayFormat = 'R$ ###.00,'
      Precision = 19
    end
    object AdoQueryRelatorio_VendasDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o do produto'
      DisplayWidth = 18
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object AdoQueryRelatorio_VendasQTDE_VENDIDOS: TIntegerField
      DisplayLabel = 'Quantidade de produtos vendidos'
      DisplayWidth = 27
      FieldName = 'QTDE_VENDIDOS'
    end
    object AdoQueryRelatorio_VendasDATA_VENDA: TDateField
      DisplayLabel = 'Data da venda'
      DisplayWidth = 11
      FieldName = 'DATA_VENDA'
    end
    object AdoQueryRelatorio_VendasNOME_FUNCIONARIO: TStringField
      DisplayLabel = 'Nome do funcion'#225'rio'
      DisplayWidth = 50
      FieldName = 'NOME_FUNCIONARIO'
      Size = 50
    end
  end
  object DataSourceRelatorioVendas: TDataSource
    AutoEdit = False
    DataSet = AdoQueryRelatorio_Vendas
    Left = 175
    Top = 380
  end
  object RelatorioVendas: TppReport
    AutoStop = False
    DataPipeline = PipelineRelatorioVendas
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 256
    Template.FileName = 
      'C:\Users\Programacao04\Desktop\PDV\Relatorios\RelatorioVendas.rt' +
      'm'
    Units = utMillimeters
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    ThumbnailSettings.PageHighlight.Width = 3
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.AllowExtract = True
    PDFSettings.EncryptSettings.AllowAssemble = True
    PDFSettings.EncryptSettings.AllowQualityPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.EncryptSettings.EncryptionType = etRC4
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    PDFSettings.PDFAFormat = pafNone
    PreviewFormSettings.PageBorder.mmPadding = 0
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    XLSSettings.WorksheetName = 'Report'
    Left = 165
    Top = 458
    Version = '19.03'
    mmColumnWidth = 0
    DataPipelineName = 'PipelineRelatorioVendas'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 20373
      mmPrintPosition = 0
      object ppImage1: TppImage
        DesignLayer = ppDesignLayer1
        UserName = 'Image1'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = True
        Stretch = True
        Border.mmPadding = 0
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D494844520000010D0000
          00BB080300000048283BE60000008D504C5445FFFFFF26394B001D37F4F5F512
          2B40A3A9B000223A273C4ED1D4D7DEDFE120364900243BBCC1C61F34471A3044
          5B66718C9299ADB4BA79848F324657162E42EAEBECF8F9FA9099A2F1F2F3E3E5
          E74B59672E4051C6CBCF6F78834F5E6CB9BEC3717C8799A1A85E6A7641505F82
          8A93C3C8CC445362A9AEB5314556001733CDD1D44E5D6C6E7A85001230B0B7BD
          D3C82D4B00000DB04944415478DAED9DFB77A2BA16C751841A1AAA944AB5B575
          EC99DEB9ABF7ACF9FFFF90B3CE6B5E7D77C66AAD8F6A7DA057022A440209E808
          1DF60FE39A1669F261E7CB4EB293A4B8C49696DA760122656BA251E86CB91ECA
          C33AEEB21E1A4AE16B5AD8228BD1E46CF42D2A34DE3FA4BB5B646118EC9F5EE9
          91A00187A32DB3304C55FF097D8F35D0D006936D7B8661E0F4EF28D000470FFD
          6DA34055511F131A0B93F4D784C6C2FEDBFC1E011ADC496BDBD1866150B90E7D
          8F75D0C856AFB6EF1C20A35C458206A73CCBDBF60E99033FC2DF653DB1E8C56B
          7DBB2F5970585B4701D6D44FD11A5B85318BBD6AEBB84BD287B55B42C36E090D
          BB2534ECB6061A85ED071BC8D45E14FA29877A6FDB20904993A7B0B7084FA330
          1847C33980D208DB6D0B4FE3B0117ECC693D2667C23A47681A40EA47C33538A3
          AD842C4A681A87FAB6C3D0A585768EB03422A31A8685568EB034A2A31A86C9DA
          E750DF0F4983AC1A722FDF73F995FA2CB974FE619F035D979FE6DD5A21905CEF
          812CA47284A441540D753215334DBC6840CF1FB61B2BF596A15C939BF88F615E
          E9DC8B2B1783BE7678DB04EEB50EA91CE168145E09A30A727F342BF73E86C36C
          D74A076B5CB0D09DF5C77FBF763E7055FEC671D977D778B561F1D3EC9F2921E2
          3B0AA51CE1689054032A77C62F7EBF72C252C7CFC6C72E5613198DE1959BCE1F
          A726C6BFD50EE67C726E600C659C3EBB379670CA118A065135A414C2B03F7614
          19F059D49390B02F01346FC94FA72E34B47DCC39A0DA3368949F0802114A3942
          D1A836DC1F1028758C12F3EF9C530B6A1E3DB72C8FF98649A35873D2908E3E19
          1F1F6E9D57037DDF988ED7609DE01C6194230C8DD20B41DA4DD7E704E0740D90
          365C43DB79C6C4C69D064C03637E84AF3C62CD0D5E1A1F179FDD277F819E0AAE
          1C616890556368D4A3B8F7E0A887A51A17972B6F1A571A9CAA378D8FCA8B5339
          80623692FF5DBB2B7818E508410354AE3D55A35AC35AC401528DA30E5E0B020D
          C04134F49BC326BDAD06B709E5084183A41A50440F539331D530871FB293150F
          27D0E0F814BAF4E20AA32A6E4C3982D3287549B186F92C859CC3C3C16903A906
          7C5C8DA708340030A3D9F7352C1229FE81281195E3B73F7F3A0D3FD54877E854
          834C63FE9DACE8A401F434BAC96A9B332DB87204A6B11268CE6DAE1A370E5840
          1922D5386DAED68048831378F437F25D27F88D2947601A44D53846293624D5E0
          5D226A320D4B024A4FBCE3661B8B3982D2287D27F59B5855C38B86D92959895C
          FC952360CC11944640D5F8CBB5F01E34D22DE3A338727601009743F9A1EB568E
          80344A6946D598A0D2BBA986270D4E3A4061EDC73F9DF0ADEA965B84F71A2F04
          528E8034FC5443EF53F550FC69CCE373387546F9E66BC5BDE519B4F62F7F1E0D
          5CD696D5DE357B28986A982F94D51E8A3F0D8EFF0DA581C294F3AB567589CAD1
          DF09A21CC168E0AFBCB9594F72453578947753BE73BF9B270DA08C507C7E8679
          0184A8EDFDE7619DCA1188065935CC562E4C9DAA71DA7A70AB10150D8E5711CA
          2C7476DEFC94431E05508E40340EFB84710D053D7D7C84C65B35FC682CE2F367
          ACF5A1D88BD4FA822947101A44D720A886BEE7A51A7E34163055E75FB5AA8B0F
          202E6E1A443982D0F0518D82C0A41ABE34E6AFCBF797587C2EAC3DE6084063CD
          AAE14FC31A182E889873782B07E0D9670103D020AA0630C73584A69B6AAC8C52
          D0D398F5106F8D0F7C6471AE1C845466F9F48FCDD328E508435ED6B3C2548393
          14549513926A50D080E91DC33908CA81FFC1C56DB909AB72B0D320A906072BC6
          B3C05583E38FD16CC91DF98EE6A0F2F93D39454840536E2BF7E015439E89F37D
          ECCAC14C83A81AB336F132FB4D3E83950DCD3415C526D1356657F41F57C7C61D
          57C8D307AE28E04D42CEB4742E7B4C5A0201B829A37230D320A906876659F383
          DB15CF81A56F67FD9E5796870C1FCF3A5DAF547559689F8DAE576EAD8ED25DAD
          4DA4C8AC1CAC344A43AF541E961978B62BC0D0F58AD917458FF240C6D70A2B0D
          A26A44D25895839146A1CD47279587C6B24CC565A411A52C2F1A63540E361ADE
          AA114563EBCAB2D1C0BB0AD13736E560A251A86FBB72EC26A6199C8389C67B10
          7E71F6CFB60F2F5FE92F66A2517ADE76DD82D8A67CE3CD5B42C36E090DBB2534
          ECC644034C59AE8E889D31A4B6B0D0D0A45ADC82AF99890C8BDA9968EC446233
          053603C3F1A6683C77192E8F88A90C017442C36E090DBB2534ECF6F669F09B52
          51E989E19D220E196ECD7431D3D550FBB2191AAB73251E060EF47BFA8BABCFF4
          17734060D86ECDCAA3DB008D9585445EA590C6F4A386F27EFA91A182475FE8A3
          406B1A780334609ABAA5002537BEA5A6C19F70F4A041F9264DBF8F819462D03A
          261ABC447D67288FC7636A7670AAD35750CE64B24DDA82CC73D2374083B842C6
          ADC84F953A6D0501106BC5266DA9E5D23FF46B92E5831EC30E716C34F02456B2
          49CA6D618F76C73C3977433F536364E266555AD1555B2CBB7DB2D1A0AE20287D
          61780509954FDCC517CA593C58F84ACE9A5D3133A9613334A8DF2A684D5A764A
          57413359E5AC4E27337CE695E3685BA1CAB65F0B238D6293AA8256EE3DE56414
          DC37B2593C52A1EC26EFA3F5B0A7543A3A5F11B8211ADC87068D73F05954D6C2
          6448516643350CC3176C11EA672E0DBFF80B50D4934D35D869683B7D7F1CFC9E
          E59F1F2FFD2B087833477A264A147BFD499AB537F561D7DF95E4FC2BDB8679CC
          A3C4C55DDF32CB29712E5D5802B02B8DC27C27CC8B5BDFE413AB9D1896F30DCF
          E1F125631A1CFB98B9AFF8C3E132E0D160DB0787305D3AB390EB79DF5A2E3617
          AF8895743BDC80A47C62AC5B8019043812BD8A01B53BDB13294ADE389C73E8D5
          8E270EB9706FFB35D86F7B96A3BBCB3CFE10643EE57CF248960375EAAC50F1E0
          6F726616181FBF385A76B5CE91ABC01F8D1CFBFB83C23DF99D0587A7AC9E1170
          76091448297E400263EC44022DD5E149AB268E7E34B11F55C61D026990D97FC5
          826C0DD6494AA31E7E09B05C27D85C9BB65B4FB99403483BA2CB7104E549CB2D
          71130C7707AB2506074F6EC70800A92335577F5C19FF70F33CB9A7A6826C601D
          74E6111CD464AC8DCF58A45F5DE3E02248B7065815654E98086EEF3FAD58EF72
          987FCC58ECF2AEB72EEDDEEC60CF05643AD5807B8A079F87CD66D59BCCF28FC2
          C181DE2696A1D838F9C1CFAB08B8D95BE914D6884FEF63FB76D61537132F80B1
          974BB1DB22FA3D1857EF6CDE048639E5F536609DC2CC4A170A83C5338085FBBC
          A76FF2DAAE196B8AC3A3D7DCF4D5731253E3F746A9D73AC7EBB38B7724F1C9F3
          D6C556A1BE780E472D187C93F77073F4CB08C85AFEEB65683840D66E0F74BA93
          5F4A0A777DCA7D1D51F475961B0401C087D8AFF927D2403B5B590B3AD76C761A
          CF2166CE7F3A8DD426CE5A49682434121A098D84464223A191D00846A3826D5E
          5F2606B1BF000D455F8EAF22184F45D22CE2DBA7A114AF32478D250E989EEE88
          5377EF78F3349467D0B78FBE9FF7DA5D4EDD73F78EB74E4369A1D58AD2A1B5D6
          0666D17091B49371EBA2BE711A1FFE45536972F1C61CB8409E610C9AF75C9B4A
          4C68688DE5F1500C342CCF90E1C46C1833CD4030F24377198D058DD244E4F89D
          668D95C6DC3360D3E119EA7E93907E10071A8A2E0EB854AF624D0951D3505E32
          663369D379462C68C0948E30CCFD9D9606B367C4818626CFA7AFF9779F196828
          C329A367C481C6F9DD623C5D43DB9BD3D15878861568C19CE919E2C8236529FA
          3496B91BD6E6A2543470CF38FF617AC649C36B5E20FA34143D008D0F371CBB67
          C481C672675528A37C460A1A1FBE88AE9E318F3BE24B63798C8595B0E24F4319
          B87BC661CD27CD3106348064E6C0A9D0DC88D69746760C1C9E807BC67937CEE3
          1B59CD486354F35DB332FEBE516D8C67FDD6FCC8E91952DFF48C4A33DF8F712C
          6A664B0B39AB0A14BA21E41A32B404B3FC8A7AAD0B0DA97C17B9D3A7188F6F20
          1A29959E0657BD392279C623DF5DFE2FB634587C63F656699B30CAEDA9C333AC
          D43BBEDC8BEDF846001A96599E21E7ED9E611CBFE19E33F8B669945B9C39B8F3
          E2F00C128C18D160D20DD3489EA1DD1352A9E24383DD37563CE3057A7AC69BA6
          61350BDC339C89C4BF0A8DF293597941B022D0CFA6671C5F91B31EE343835137
          70CFF8F8D9D733E24483CD37CA779646CC3DE30E75E4E09EE722A4374AC3124C
          9B6798BD5A4FCF88090DB4366B710812050D92670C7D96F8C68086B687928741
          FFF89692C6DC33E6B3AF966790E38C18D198EF790FF7CC8375FCC737042BCE68
          9B30C0088D77F87A461C6814EAF35589D63995FEBE815A966D5EBE5AD7FB149E
          11071A95A7F9EFACDC6F0ADD787FA9CB427AD969AFDE88BC4EB12979F469049A
          41787F79E418C1A87672FE9E11071ACA78E11BF434B4D4C4399C53FD4EB3EE26
          FA34962755599BC5FCDA3981270F56B984D25542A328A29591607862AEFCFBB5
          6970C5833FC1606790526A090DC4A3CBE5172BEE7E791A0E4B682434121A098D
          84464223A191D048682434121A098D84464223A191D048682434121A098D8446
          FC6968B6DD23F5250D59F3DB5655558CD30B54F965FD27CCAA631B8DB46D976A
          95712734D6B383D3D03E316ADBCF54F6DDDA348D1E9ACAB4A536A5C1E52E8B60
          BC3C2F05643369BA7DE702D1004A0DF8D63A4206A4698F653749261A9A3E8ADB
          1165A47D08D64043E1E375AAB461FCC937FA8B99682CA53B3E06CAFFD25FFCF6
          4FA192DBF4D76EEE14AA8818D0079BA111BBD3E80D633A2583ED5CE916CB21CD
          9130C04D1876F2668B37AAB574BC94034E3486570A6B2C7A2EC6EB0C764D662A
          2F6B3FA5D089D381B9E78F2CE70C25E74A3B2DA161B7FF0300ED15434ADF2EAB
          0000000049454E44AE426082}
        mmHeight = 16404
        mmLeft = -7673
        mmTop = -6350
        mmWidth = 19844
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel1: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label1'
        Border.mmPadding = 0
        Caption = 'Relat'#243'rio de Vendas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 6350
        mmLeft = 66411
        mmTop = -3440
        mmWidth = 53446
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel3: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label3'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Valor unit'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 31750
        mmTop = 15081
        mmWidth = 20902
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel4: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label4'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Descri'#231#227'o do produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 57679
        mmTop = 15081
        mmWidth = 33073
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel5: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label5'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Quantidade vendida'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 96573
        mmTop = 15081
        mmWidth = 30956
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel6: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label6'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Data da venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 132027
        mmTop = 15081
        mmWidth = 28046
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel2: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label2'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Produto Vendido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 1058
        mmTop = 15081
        mmWidth = 28046
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText6: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText6'
        Border.mmPadding = 0
        DataField = 'NOME_FUNCIONARIO'
        DataPipeline = PipelineRelatorioVendas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PipelineRelatorioVendas'
        mmHeight = 4763
        mmLeft = 234950
        mmTop = 16669
        mmWidth = 159809
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel7: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label7'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Nome do funcion'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 164042
        mmTop = 15081
        mmWidth = 32015
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 10583
      mmPrintPosition = 0
      object ppLine2: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line2'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = -5556
        mmTop = 7408
        mmWidth = 212990
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText1: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText1'
        Border.mmPadding = 0
        DataField = 'NOME'
        DataPipeline = PipelineRelatorioVendas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PipelineRelatorioVendas'
        mmHeight = 4763
        mmLeft = 1058
        mmTop = 1058
        mmWidth = 24606
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText2'
        Border.mmPadding = 0
        DataField = 'VALOR_UNITARIO'
        DataPipeline = PipelineRelatorioVendas
        DisplayFormat = '$ ###.00,'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PipelineRelatorioVendas'
        mmHeight = 4763
        mmLeft = 31750
        mmTop = 1058
        mmWidth = 18785
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText3'
        Border.mmPadding = 0
        DataField = 'DESCRICAO'
        DataPipeline = PipelineRelatorioVendas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PipelineRelatorioVendas'
        mmHeight = 4763
        mmLeft = 57679
        mmTop = 1058
        mmWidth = 32279
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText4: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText4'
        Border.mmPadding = 0
        DataField = 'QTDE_VENDIDOS'
        DataPipeline = PipelineRelatorioVendas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PipelineRelatorioVendas'
        mmHeight = 4763
        mmLeft = 96573
        mmTop = 1058
        mmWidth = 18256
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText5: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText5'
        Border.mmPadding = 0
        DataField = 'DATA_VENDA'
        DataPipeline = PipelineRelatorioVendas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PipelineRelatorioVendas'
        mmHeight = 4763
        mmLeft = 132027
        mmTop = 1058
        mmWidth = 28046
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText7: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText7'
        Border.mmPadding = 0
        DataField = 'NOME_FUNCIONARIO'
        DataPipeline = PipelineRelatorioVendas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PipelineRelatorioVendas'
        mmHeight = 4763
        mmLeft = 164042
        mmTop = 1058
        mmWidth = 23548
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppSystemVariable2: TppSystemVariable
        DesignLayer = ppDesignLayer1
        UserName = 'SystemVariable2'
        Border.mmPadding = 0
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 159809
        mmTop = 529
        mmWidth = 29898
        BandType = 8
        LayerName = Foreground
      end
    end
    object ppDesignLayers1: TppDesignLayers
      object ppDesignLayer1: TppDesignLayer
        UserName = 'Foreground'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object PipelineRelatorioVendas: TppDBPipeline
    DataSource = DataSourceRelatorioVendas
    UserName = 'PipelineRelatorioVendas'
    Left = 50
    Top = 455
    object PipelineRelatorioVendasppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object PipelineRelatorioVendasppField2: TppField
      FieldAlias = 'VALOR_UNITARIO'
      FieldName = 'VALOR_UNITARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object PipelineRelatorioVendasppField3: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object PipelineRelatorioVendasppField4: TppField
      FieldAlias = 'QTDE_VENDIDOS'
      FieldName = 'QTDE_VENDIDOS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object PipelineRelatorioVendasppField5: TppField
      FieldAlias = 'DATA_VENDA'
      FieldName = 'DATA_VENDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object PipelineRelatorioVendasppField6: TppField
      FieldAlias = 'NOME_FUNCIONARIO'
      FieldName = 'NOME_FUNCIONARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
  end
  object DataSetAlterarProdutos: TADODataSet
    Connection = conexaoBanco
    CursorType = ctStatic
    AfterPost = DataSetAlterarProdutosAfterPost
    BeforeCancel = DataSetAlterarProdutosBeforeCancel
    AfterCancel = DataSetAlterarProdutosAfterCancel
    BeforeDelete = DataSetAlterarProdutosBeforeDelete
    AfterDelete = DataSetAlterarProdutosAfterDelete
    CommandText = 
      'SELECT CODIGO, NOME, VALOR, DESCRICAO, DATA_FABRICACAO, DATA_VAL' +
      'IDADE, QUANTIDADE,'#13#10'CODIGO_BARRAS  FROM PRODUTOS '
    Parameters = <>
    Left = 295
    Top = 325
    object DataSetAlterarProdutosCODIGO: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ReadOnly = True
    end
    object DataSetAlterarProdutosNOME: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'NOME'
      Size = 80
    end
    object DataSetAlterarProdutosVALOR: TBCDField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      DisplayFormat = 'R$ ###.00,'
      Precision = 19
    end
    object DataSetAlterarProdutosDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object DataSetAlterarProdutosDATA_FABRICACAO: TDateField
      DisplayLabel = 'Data de fabrica'#231#227'o'
      FieldName = 'DATA_FABRICACAO'
    end
    object DataSetAlterarProdutosDATA_VALIDADE: TDateField
      DisplayLabel = 'Data de validade'
      FieldName = 'DATA_VALIDADE'
    end
    object DataSetAlterarProdutosCODIGO_BARRAS: TStringField
      DisplayLabel = 'C'#243'digo de Barras'
      FieldName = 'CODIGO_BARRAS'
      Size = 80
    end
  end
  object DataSetEditCargos: TADODataSet
    Connection = conexaoBanco
    CursorType = ctStatic
    AfterPost = DataSetEditCargosAfterPost
    BeforeCancel = DataSetEditCargosBeforeCancel
    AfterCancel = DataSetEditCargosAfterCancel
    CommandText = 'SELECT CODIGO,CARGO FROM CARGOS'
    Parameters = <>
    Left = 55
    Top = 205
    object DataSetEditCargosCODIGO: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ReadOnly = True
    end
    object DataSetEditCargosCARGO: TStringField
      DisplayLabel = 'Cargo'
      FieldName = 'CARGO'
      Size = 80
    end
  end
  object DataSetEditUser: TADODataSet
    Connection = conexaoBanco
    CursorType = ctStatic
    AfterPost = DataSetEditUserAfterPost
    AfterCancel = DataSetEditUserAfterCancel
    CommandText = 'SELECT USUARIO,SENHA FROM USUARIOS'
    Parameters = <>
    Left = 305
    Top = 90
    object DataSetEditUserUSUARIO: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'USUARIO'
      Size = 30
    end
    object DataSetEditUserSENHA: TStringField
      DisplayLabel = 'Senha'
      FieldName = 'SENHA'
      Size = 30
    end
  end
  object DataSetEditFuncionario: TADODataSet
    Connection = conexaoBanco
    CursorType = ctStatic
    AfterPost = DataSetEditFuncionarioAfterPost
    BeforeCancel = DataSetEditFuncionarioBeforeCancel
    AfterCancel = DataSetEditFuncionarioAfterCancel
    CommandText = 
      'SELECT NOME,CPF,ENDERECO,TELEFONE,CELULAR,COD_CARGO'#13#10'FROM FUNCIO' +
      'NARIOS'
    Parameters = <>
    Left = 305
    Top = 150
    object DataSetEditFuncionarioNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 15
      FieldName = 'NOME'
      Size = 50
    end
    object DataSetEditFuncionarioCPF: TStringField
      DisplayWidth = 15
      FieldName = 'CPF'
      EditMask = '###.###.###-##;0;_'
      Size = 11
    end
    object DataSetEditFuncionarioENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      DisplayWidth = 16
      FieldName = 'ENDERECO'
      Size = 50
    end
    object DataSetEditFuncionarioTELEFONE: TStringField
      DisplayLabel = 'Telefone'
      DisplayWidth = 14
      FieldName = 'TELEFONE'
      EditMask = '(##)####-####;0;_'
      Size = 10
    end
    object DataSetEditFuncionarioCELULAR: TStringField
      DisplayLabel = 'Celular'
      DisplayWidth = 13
      FieldName = 'CELULAR'
      EditMask = '(##)#####-####;0;_'
      Size = 11
    end
    object DataSetEditFuncionarioCOD_CARGO: TIntegerField
      DisplayLabel = 'Cargo'
      DisplayWidth = 11
      FieldName = 'COD_CARGO'
    end
  end
  object DataSetCadastroFornecedor: TADODataSet
    Connection = conexaoBanco
    CursorType = ctStatic
    AfterPost = DataSetCadastroFornecedorAfterPost
    BeforeCancel = DataSetCadastroFornecedorBeforeCancel
    AfterCancel = DataSetCadastroFornecedorAfterCancel
    CommandText = 'SELECT CODIGO, NOME, CNPJ FROM FORNECEDORES'#13#10'WHERE CODIGO = NULL'
    Parameters = <>
    Left = 180
    Top = 90
    object DataSetCadastroFornecedorCODIGO: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ReadOnly = True
    end
    object DataSetCadastroFornecedorNOME: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'NOME'
      Size = 80
    end
    object DataSetCadastroFornecedorCNPJ: TStringField
      FieldName = 'CNPJ'
      EditMask = '##.###.###/####-##;0;_'
      Size = 14
    end
  end
  object conexaoBanco: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLNCLI11.1;Integrated Security=SSPI;Persist Security I' +
      'nfo=False;User ID="";Initial Catalog=PDV_GERE;Data Source=PROGRA' +
      'MACAO04\SQLEXPRESS01;Use Procedure for Prepare=1;Auto Translate=' +
      'True;Packet Size=4096;Workstation ID=DESKTOP-66VQ1V5;Initial Fil' +
      'e Name="";Use Encryption for Data=False;Tag with column collatio' +
      'n when possible=False;MARS Connection=False;DataTypeCompatibilit' +
      'y=0;Trust Server Certificate=False;Server SPN=PROGRAMACAO04\SQLE' +
      'XPRESS01;Application Intent=READWRITE'
    LoginPrompt = False
    Provider = 'SQLNCLI11.1'
    Left = 221
    Top = 15
  end
  object DataSetDetVenda: TADODataSet
    AutoCalcFields = False
    Connection = conexaoBanco
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterInsert = DataSetDetVendaAfterInsert
    CommandText = 
      'SELECT CODIGO,COD_VENDA,PRODUTO,VALOR,QUANTIDADE,COD_PRODUTO,VAL' +
      'OR_TOTAL'#13#10'FROM DETALHE_VENDA WHERE CODIGO = NULL'
    Parameters = <>
    Left = 413
    Top = 157
    object DataSetDetVendaCODIGO: TAutoIncField
      FieldName = 'CODIGO'
    end
    object DataSetDetVendaCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      LookupDataSet = dataSetVendas
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'CODIGO'
    end
    object DataSetDetVendaPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Size = 80
    end
    object DataSetDetVendaQUANTIDADE: TBCDField
      FieldName = 'QUANTIDADE'
      DisplayFormat = '###.00,'
      Precision = 19
    end
    object DataSetDetVendaVALOR: TBCDField
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 'VALOR'
      DisplayFormat = '###.00,'
      Precision = 19
    end
    object DataSetDetVendaCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
    end
    object DataSetDetVendaVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = '###.00,'
      Precision = 19
    end
  end
  object QueryDetVenda: TADOQuery
    Connection = conexaoBanco
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT PRODUTO,QUANTIDADE,'
      'VALOR,VALOR_TOTAL'
      ' FROM DETALHE_VENDA'
      'WHERE CODIGO = NULL'
      '')
    Left = 413
    Top = 216
    object QueryDetVendaPRODUTO: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'PRODUTO'
      Size = 80
    end
    object QueryDetVendaVALOR: TBCDField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      DisplayFormat = '###.00,'
      Precision = 19
    end
    object QueryDetVendaQUANTIDADE: TBCDField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
      DisplayFormat = '###.00,'
      Precision = 19
    end
    object QueryDetVendaVALOR_TOTAL: TBCDField
      DisplayLabel = 'Total'
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = '###.00,'
      Precision = 19
    end
  end
  object DSQueryDetVendas: TDataSource
    Left = 287
    Top = 403
  end
  object QueryVenda: TADOQuery
    Connection = conexaoBanco
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT CODIGO,COD_FUNCIONARIO,DATA_VENDA,VALOR_TOTAL,HORA,'
      'FUNCIONARIO,DESCONTO,VALOR_RECEBIDO,TROCO  FROM VENDAS')
    Left = 413
    Top = 272
    object QueryVendaCODIGO: TAutoIncField
      FieldName = 'CODIGO'
      ReadOnly = True
    end
    object QueryVendaCOD_FUNCIONARIO: TIntegerField
      FieldName = 'COD_FUNCIONARIO'
    end
    object QueryVendaDATA_VENDA: TDateField
      FieldName = 'DATA_VENDA'
    end
    object QueryVendaVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = '###.00,'
      Precision = 19
    end
    object QueryVendaHORA: TDateTimeField
      FieldName = 'HORA'
    end
    object QueryVendaFUNCIONARIO: TStringField
      FieldName = 'FUNCIONARIO'
      Size = 100
    end
    object QueryVendaDESCONTO: TBCDField
      FieldName = 'DESCONTO'
      Precision = 19
    end
    object QueryVendaVALOR_RECEBIDO: TBCDField
      FieldName = 'VALOR_RECEBIDO'
      DisplayFormat = '###.00,'
      Precision = 19
    end
    object QueryVendaTROCO: TBCDField
      FieldName = 'TROCO'
      DisplayFormat = '###.00,'
      Precision = 19
    end
  end
  object DataSetId: TADODataSet
    Connection = conexaoBanco
    CursorType = ctStatic
    CommandText = 'SELECT ID, TABELA FROM CONTROLA_ID'
    Parameters = <>
    Left = 410
    Top = 340
    object DataSetIdID: TIntegerField
      FieldName = 'ID'
    end
    object DataSetIdTABELA: TStringField
      FieldName = 'TABELA'
      Size = 60
    end
  end
  object QueryId: TADOQuery
    Connection = conexaoBanco
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT ID, TABELA FROM CONTROLA_ID')
    Left = 415
    Top = 405
    object QueryIdID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
    end
    object QueryIdTABELA: TStringField
      DisplayLabel = 'Tabela'
      FieldName = 'TABELA'
      Size = 60
    end
  end
end
