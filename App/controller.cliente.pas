unit controller.cliente;

interface

uses uConnection, System.JSON, System.SysUtils;

function GetCliente:TJSONArray;
function PostCliente(Ajson:TJSONObject):TJSONObject;

implementation


function GetCliente:TJSONArray;
var
  LCon:TConnection;
  LResult:string;
begin

  LCon:= TConnection.Create;
  try
    LCon.Get('http://localhost:9001/lista/cliente',[],LResult);

    Result:= TJSONObject.ParseJSONValue(LResult) as TJSONArray;

  finally
    FreeAndNil(LCon);
  end;

end;

function PostCliente(Ajson:TJSONObject):TJSONObject;
var
  LCon:TConnection;
  LResult:string;

begin

  LCon:= TConnection.Create;
  try
    LCon.Post('http://localhost:9001/cadastro/cliente',[],Ajson,LResult);
    Result:= TJSONObject.ParseJSONValue(LResult) as TJSONObject;

  finally
    FreeAndNil(LCon);
    FreeAndNil(Ajson);
  end;

end;



end.
