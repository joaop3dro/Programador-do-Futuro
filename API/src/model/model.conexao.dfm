object dmConexao: TdmConexao
  OnCreate = DataModuleCreate
  Height = 438
  Width = 555
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    Left = 64
    Top = 48
  end
end
