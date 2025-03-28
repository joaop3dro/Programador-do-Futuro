unit uServices.Cliente;

interface

uses
  System.SysUtils, System.Classes, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope,
  uDto.Cliente ,MainModule;

type
  TDmServicesCliente = class(TDataModule)
    RESTCliente: TRESTClient;
    RESTReqCliente: TRESTRequest;
  private
    { Private declarations }
  public
    procedure PostCliente(AModel: TCliente);
    function GettAllClientes: TListaCliente;
  end;

var
  DmServicesCliente: TDmServicesCliente;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  Rest.Json;

function TDmServicesCliente.GettAllClientes: TListaCliente;
begin
  RESTCliente.BaseURL := UniMainModule.GetUrlBackend + '/lista/cliente';
  RESTReqCliente.Method := rmGET;
  RESTReqCliente.Execute;

  Result := TJson.JsonToObject<TListaCliente>('{ "Items": '+
    RESTReqCliente.Response.JSONText + '}');
end;

procedure TDmServicesCliente.PostCliente(AModel: TCliente);
begin
  RESTCliente.BaseURL := UniMainModule.GetUrlBackend + '/cadastro/cliente';
  RESTReqCliente.Method := rmPost;
  RESTReqCliente.Params.Clear;

  var lJSon := TJson.ObjectToJsonString(AModel);

   RESTReqCliente.Params.AddItem(
    'clienteApi',
     lJSon,
     pkREQUESTBODY,
     [],
     ctAPPLICATION_JSON);

  RESTReqCliente.Execute;
end;

end.
