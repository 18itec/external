object fCadPai: TfCadPai
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'fCadPai'
  ClientHeight = 257
  ClientWidth = 504
  Color = clWindow
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 229
    Width = 504
    Height = 28
    Align = alBottom
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object BtnClose: TSpeedButton
      Left = 416
      Top = 1
      Width = 87
      Height = 26
      Align = alRight
      Caption = '&Fechar'
      OnClick = BtnCloseClick
      ExplicitLeft = 536
    end
    object BntInsert: TSpeedButton
      Left = 68
      Top = 1
      Width = 87
      Height = 26
      Align = alRight
      Caption = '&Novo'
      OnClick = BntInsertClick
      ExplicitLeft = 536
    end
    object BtnSalvar: TSpeedButton
      Left = 242
      Top = 1
      Width = 87
      Height = 26
      Align = alRight
      Caption = '&Salvar'
      Enabled = False
      OnClick = BtnSalvarClick
      ExplicitLeft = 356
      ExplicitTop = 2
    end
    object BtnCancel: TSpeedButton
      Left = 329
      Top = 1
      Width = 87
      Height = 26
      Align = alRight
      Caption = '&Cancelar'
      Enabled = False
      OnClick = BtnCancelClick
      ExplicitLeft = 335
      ExplicitTop = 2
    end
    object BtnAlt: TSpeedButton
      Left = 155
      Top = 1
      Width = 87
      Height = 26
      Align = alRight
      Caption = '&Alterar'
      OnClick = BtnAltClick
      ExplicitLeft = 212
      ExplicitTop = 2
    end
  end
  object PGC: TPageControl
    Left = 0
    Top = 0
    Width = 504
    Height = 229
    ActivePage = TsCad
    Align = alClient
    TabOrder = 1
    object TsCad: TTabSheet
      Caption = 'Cadastro'
    end
    object TsPesq: TTabSheet
      Caption = 'Pesquisar'
      ImageIndex = 1
      object PnlPesq: TPanel
        Left = 0
        Top = 0
        Width = 496
        Height = 57
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 0
        object Label2: TLabel
          Left = 4
          Top = 41
          Width = 187
          Height = 13
          Caption = 'Lista de Registros(Clique 2x para abrir)'
        end
        object EdtPesq: TLabeledEdit
          Left = 4
          Top = 16
          Width = 397
          Height = 19
          EditLabel.Width = 46
          EditLabel.Height = 13
          EditLabel.Caption = 'Pesquisar'
          TabOrder = 0
        end
        object BtnPesq: TButton
          Left = 407
          Top = 13
          Width = 75
          Height = 25
          Caption = 'Pesquisar'
          TabOrder = 1
        end
      end
      object Grid: TDBGrid
        Left = 0
        Top = 57
        Width = 496
        Height = 144
        Align = alClient
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
  end
end
