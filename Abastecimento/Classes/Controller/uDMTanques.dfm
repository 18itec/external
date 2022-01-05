object DMTanque: TDMTanque
  OldCreateOrder = False
  Height = 211
  Width = 125
  object QrSearch: TFDQuery
    Connection = Controle.FConexao
    SQL.Strings = (
      
        'select id, nome, litros_recebidos, combustivel, data_receb, stat' +
        'us'
      'from tanques')
    Left = 16
    Top = 16
  end
  object QrInsert: TFDQuery
    Connection = Controle.FConexao
    SQL.Strings = (
      
        'insert into tanques (id, nome, litros_recebidos, combustivel, da' +
        'ta_receb, status)'
      
        'values (:id, :nome, :litros_recebidos, :combustivel, :data_receb' +
        ', :status)')
    Left = 72
    Top = 16
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'LITROS_RECEBIDOS'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'COMBUSTIVEL'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'DATA_RECEB'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'STATUS'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object QrDelete: TFDQuery
    Connection = Controle.FConexao
    SQL.Strings = (
      'delete from bombas'
      'where (id = :id)')
    Left = 72
    Top = 80
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object QrEdit: TFDQuery
    Connection = Controle.FConexao
    SQL.Strings = (
      'update tanques'
      'set nome = :nome,'
      '    litros_recebidos = :litros_recebidos,'
      '    combustivel = :combustivel,'
      '    data_receb = :data_receb,'
      '    status = :status'
      'where (id = :id)')
    Left = 16
    Top = 80
    ParamData = <
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'LITROS_RECEBIDOS'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'COMBUSTIVEL'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'DATA_RECEB'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'STATUS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object QrFK: TFDQuery
    Connection = Controle.FConexao
    SQL.Strings = (
      'select id, nome'
      'from tanques where status = 1')
    Left = 16
    Top = 144
  end
end
