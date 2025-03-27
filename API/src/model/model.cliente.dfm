inherited dmCliente: TdmCliente
  object qryCadastraCliente: TFDQuery
    Connection = FDConnection1
    Left = 56
    Top = 120
  end
  object qryCadastraEndereco: TFDQuery
    Connection = FDConnection1
    Left = 184
    Top = 120
  end
  object qryListaCliente: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select'
      ' c.cod,'
      ' c.nome,'
      ' c.celular,'
      ' c.email,'
      ' c.idade,'
      ' '
      ' e.cep,'
      ' e.endereco,'
      ' e.numero,'
      ' e.bairro,'
      ' e.cidade,'
      ' e.uf '
      ' '
      'from cliente c'
      'inner join endereco e on c.cod = e.cod_cliente')
    Left = 320
    Top = 120
  end
end
