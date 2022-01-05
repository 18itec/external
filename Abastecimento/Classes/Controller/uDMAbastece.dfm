object DMAbastece: TDMAbastece
  OldCreateOrder = False
  Height = 135
  Width = 121
  object QrFK: TFDQuery
    Connection = Controle.FConexao
    SQL.Strings = (
      'select id, nome'
      'from bombas')
    Left = 16
    Top = 16
  end
  object QrInsert: TFDQuery
    Connection = Controle.FConexao
    SQL.Strings = (
      
        'insert into abastecimentos (id, data, hora, id_bomba, qtd_litros' +
        ')'
      'values (:id, :data, :hora, :id_bomba, :qtd_litros)')
    Left = 72
    Top = 16
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        Name = 'HORA'
        ParamType = ptInput
      end
      item
        Name = 'ID_BOMBA'
        ParamType = ptInput
      end
      item
        Name = 'QTD_LITROS'
        ParamType = ptInput
      end>
  end
  object QRAux: TFDQuery
    Connection = Controle.FConexao
    SQL.Strings = (
      'select  imposto, vlr_lts'
      'from bombas where id =:ID')
    Left = 16
    Top = 80
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
end
