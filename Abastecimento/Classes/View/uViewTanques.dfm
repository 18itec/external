inherited fCadTanques: TfCadTanques
  Caption = 'Cadastro de Tanques'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PGC: TPageControl
    inherited TsCad: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 496
      ExplicitHeight = 201
      object EdtTanque: TLabeledEdit
        Left = 3
        Top = 30
        Width = 190
        Height = 19
        EditLabel.Width = 36
        EditLabel.Height = 13
        EditLabel.Caption = 'Tanque'
        TabOrder = 0
      end
      object CHKStatus: TCheckBox
        Left = 447
        Top = 31
        Width = 53
        Height = 17
        Caption = 'Ativo'
        TabOrder = 1
      end
      object EdtCombs: TLabeledEdit
        Left = 199
        Top = 30
        Width = 174
        Height = 19
        EditLabel.Width = 58
        EditLabel.Height = 13
        EditLabel.Caption = 'Combustivel'
        TabOrder = 2
      end
      object EdtLitros: TLabeledEdit
        Left = 379
        Top = 30
        Width = 62
        Height = 19
        EditLabel.Width = 53
        EditLabel.Height = 13
        EditLabel.Caption = 'Litros Total'
        TabOrder = 3
      end
    end
    inherited TsPesq: TTabSheet
      OnShow = TsPesqShow
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 496
      ExplicitHeight = 201
      inherited PnlPesq: TPanel
        inherited Label2: TLabel
          Visible = False
        end
        inherited BtnPesq: TButton
          OnClick = BtnPesqClick
        end
      end
      inherited Grid: TDBGrid
        DataSource = dsPesquisa
        Visible = False
      end
    end
  end
  object dsPesquisa: TDataSource
    DataSet = DMTanque.QrSearch
    Left = 368
    Top = 16
  end
end
