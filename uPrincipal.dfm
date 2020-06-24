object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Principal'
  ClientHeight = 375
  ClientWidth = 558
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 356
    Width = 558
    Height = 19
    Panels = <>
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 558
    Height = 356
    Align = alClient
    TabOrder = 1
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 556
      Height = 120
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 5
        Top = 8
        Width = 55
        Height = 13
        Caption = 'Logradouro'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 517
        Top = 5
        Width = 33
        Height = 13
        Caption = 'Estado'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 455
        Top = 5
        Width = 37
        Height = 13
        Caption = 'Numero'
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 5
        Top = 48
        Width = 28
        Height = 13
        Caption = 'Bairro'
        FocusControl = DBEdit4
      end
      object Label5: TLabel
        Left = 455
        Top = 48
        Width = 19
        Height = 13
        Caption = 'CEP'
        FocusControl = DBEdit5
      end
      object Label6: TLabel
        Left = 207
        Top = 48
        Width = 33
        Height = 13
        Caption = 'Cidade'
        FocusControl = DBEdit6
      end
      object DBEdit1: TDBEdit
        Left = 5
        Top = 24
        Width = 444
        Height = 21
        DataField = 'Logradouro'
        DataSource = dsDados
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 517
        Top = 24
        Width = 30
        Height = 21
        DataField = 'Estado'
        DataSource = dsDados
        TabOrder = 2
      end
      object DBEdit3: TDBEdit
        Left = 455
        Top = 24
        Width = 56
        Height = 21
        DataField = 'Numero'
        DataSource = dsDados
        TabOrder = 1
      end
      object DBEdit4: TDBEdit
        Left = 5
        Top = 64
        Width = 196
        Height = 21
        DataField = 'Bairro'
        DataSource = dsDados
        TabOrder = 3
      end
      object DBEdit5: TDBEdit
        Left = 455
        Top = 64
        Width = 92
        Height = 21
        DataField = 'CEP'
        DataSource = dsDados
        TabOrder = 5
      end
      object DBEdit6: TDBEdit
        Left = 207
        Top = 64
        Width = 242
        Height = 21
        DataField = 'Cidade'
        DataSource = dsDados
        TabOrder = 4
      end
      object btnSalvar: TButton
        Left = 86
        Top = 91
        Width = 75
        Height = 25
        Caption = 'Salvar'
        TabOrder = 6
        OnClick = btnSalvarClick
      end
      object btnDeletar: TButton
        Left = 167
        Top = 91
        Width = 75
        Height = 25
        Caption = 'Deletar'
        TabOrder = 7
        OnClick = btnDeletarClick
      end
      object btnInserir: TButton
        Left = 5
        Top = 91
        Width = 75
        Height = 25
        Caption = 'Inserir'
        TabOrder = 8
        OnClick = btnInserirClick
      end
      object btnJSON: TButton
        Left = 472
        Top = 91
        Width = 75
        Height = 25
        Caption = 'JSON'
        TabOrder = 9
        OnClick = btnJSONClick
      end
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 121
      Width = 556
      Height = 234
      Align = alClient
      DataSource = dsDados
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
    end
  end
  object cdsDados: TClientDataSet
    PersistDataPacket.Data = {
      A50000009619E0BD010000001800000006000000000003000000A5000A4C6F67
      7261646F75726F01004900000001000557494454480200020014000645737461
      646F0100490000000100055749445448020002000200064E756D65726F040001
      00000000000642616972726F0100490000000100055749445448020002001E00
      0343455004000100000000000643696461646501004900000001000557494454
      48020002001E000000}
    Active = True
    Aggregates = <>
    FileName = 'enderecos.xml'
    Params = <>
    Left = 16
    Top = 232
    object cdsDadosLogradouro: TStringField
      FieldName = 'Logradouro'
    end
    object cdsDadosEstado: TStringField
      FieldName = 'Estado'
      Size = 2
    end
    object cdsDadosNumero: TIntegerField
      FieldName = 'Numero'
    end
    object cdsDadosBairro: TStringField
      FieldName = 'Bairro'
      Size = 30
    end
    object cdsDadosCEP: TIntegerField
      FieldName = 'CEP'
    end
    object cdsDadosCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
  end
  object dsDados: TDataSource
    DataSet = cdsDados
    Left = 16
    Top = 288
  end
end
