object DMRelat: TDMRelat
  OldCreateOrder = False
  Height = 143
  Width = 157
  object QrRelat: TFDQuery
    Connection = Controle.FConexao
    SQL.Strings = (
      '')
    Left = 24
    Top = 14
  end
  object QrFKTanque: TFDQuery
    Connection = Controle.FConexao
    SQL.Strings = (
      'select id, nome'
      'from tanques where status = 1')
    Left = 88
    Top = 11
  end
  object QrFKBombas: TFDQuery
    Connection = Controle.FConexao
    SQL.Strings = (
      'select id, nome'
      'from bombas')
    Left = 24
    Top = 72
  end
  object DSMaster: TDataSource
    DataSet = QrRelat
    Left = 88
    Top = 72
  end
end
