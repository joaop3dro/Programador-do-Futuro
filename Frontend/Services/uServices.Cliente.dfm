object DmServicesCliente: TDmServicesCliente
  Height = 180
  Width = 640
  object RESTCliente: TRESTClient
    BaseURL = 'http://localhost:9000/lista/cliente'
    Params = <>
    SynchronizedEvents = False
    Left = 24
    Top = 8
  end
  object RESTReqCliente: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTCliente
    Params = <>
    SynchronizedEvents = False
    Left = 112
    Top = 8
  end
end
