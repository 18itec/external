inherited fCadBombas: TfCadBombas
  Caption = 'Cadastro de Bombas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PGC: TPageControl
    inherited TsCad: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 496
      ExplicitHeight = 201
      object Label1: TLabel
        Left = 183
        Top = 14
        Width = 36
        Height = 13
        Caption = 'Tanque'
      end
      object EdtBomba: TLabeledEdit
        Left = 3
        Top = 30
        Width = 174
        Height = 19
        EditLabel.Width = 32
        EditLabel.Height = 13
        EditLabel.Caption = 'Bomba'
        TabOrder = 0
      end
      object CBTanque: TComboBox
        Left = 183
        Top = 29
        Width = 130
        Height = 21
        TabOrder = 1
        OnCloseUp = CBTanqueCloseUp
      end
      object CHKStatus: TCheckBox
        Left = 447
        Top = 31
        Width = 45
        Height = 17
        Caption = 'Ativo'
        TabOrder = 2
      end
      object EdtImposto: TLabeledEdit
        Left = 319
        Top = 30
        Width = 58
        Height = 19
        EditLabel.Width = 53
        EditLabel.Height = 13
        EditLabel.Caption = 'Imposto %'
        TabOrder = 3
      end
      object EdtVlr: TLabeledEdit
        Left = 383
        Top = 30
        Width = 58
        Height = 19
        EditLabel.Width = 38
        EditLabel.Height = 13
        EditLabel.Caption = 'R$/Litro'
        TabOrder = 4
      end
    end
    inherited TsPesq: TTabSheet
      OnShow = TsPesqShow
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 496
      ExplicitHeight = 201
      inherited PnlPesq: TPanel
        inherited BtnPesq: TButton
          OnClick = BtnPesqClick
        end
      end
      inherited Grid: TDBGrid
        DataSource = dsPesquisa
        OnDblClick = GridDblClick
      end
    end
  end
  object dsPesquisa: TDataSource
    DataSet = DMBomba.QrSearch
    Left = 416
    Top = 104
  end
end
