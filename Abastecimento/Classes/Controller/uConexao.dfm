object Controle: TControle
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 84
  Width = 159
  object FConexao: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'User_Name=sysdba'
      'Password=masterkey')
    LoginPrompt = False
    Left = 32
    Top = 16
  end
  object FBDriverLink: TFDPhysFBDriverLink
    Left = 96
    Top = 16
  end
end
