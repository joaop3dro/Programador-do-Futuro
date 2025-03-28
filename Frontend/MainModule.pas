unit MainModule;

interface

uses
  uniGUIMainModule, SysUtils, Classes;

type
  TUniMainModule = class(TUniGUIMainModule)
  private
    { Private declarations }
  public
    function GetUrlBackend: string;
  end;

function UniMainModule: TUniMainModule;

implementation

{$R *.dfm}

uses
  UniGUIVars, ServerModule, uniGUIApplication;

function UniMainModule: TUniMainModule;
begin
  Result := TUniMainModule(UniApplication.UniMainModule)
end;

function TUniMainModule.GetUrlBackend: string;
begin
  Result := 'http://localhost:9000';
end;

initialization
  RegisterMainModuleClass(TUniMainModule);
end.
