unit controllers.cliente;

interface

uses Horse, System.json, model.cliente;

procedure Registro;
procedure CadastraCliente(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure ListaCliente(Req: THorseRequest; Res: THorseResponse; Next: TProc);

implementation

uses
  System.SysUtils;

procedure Registro;
begin
  THorse.Post('cadastro/cliente', CadastraCliente);
  THorse.Get('lista/cliente', ListaCliente);
end;

procedure CadastraCliente(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LCliente: TdmCliente;
begin
  LCliente := TdmCliente.Create(nil);
  try

    try
      Res.Send<TJSONObject>(LCliente.CadastraCliente(Req.Body<TJSONObject>));
    finally
      Res.Status(201);
      LCliente.Free;
    end;

  except on E:Exception do
    begin
      Res.Send(e.message).Status(500);
      LCliente.Free;
    end;
  end;
end;

procedure ListaCliente(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LCliente: TdmCliente;
begin
  LCliente := TdmCliente.Create(nil);
  try

    try
      Res.Send<TJSONArray>(LCliente.ListaCliente);
    finally
      Res.Status(200);
      LCliente.Free;
    end;

  except on E:Exception do
    begin
      Res.Send(e.message).Status(500);
      LCliente.Free;
    end;
  end;
end;

end.
