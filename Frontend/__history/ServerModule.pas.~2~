unit ServerModule;

interface

uses
  Classes, SysUtils, uniGUIServer, uniGUIMainModule, uniGUIApplication, uIdCustomHTTPServer,
  uniGUITypes, uIdContext;

type
  TUniServerModule = class(TUniGUIServerModule)
    procedure UniGUIServerModuleCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure FirstInit; override;
  public
    { Public declarations }
  end;

function UniServerModule: TUniServerModule;

implementation

{$R *.dfm}

uses
  UniGUIVars;

function UniServerModule: TUniServerModule;
begin
  Result := TUniServerModule(UniGUIServerInstance);
end;

procedure TUniServerModule.FirstInit;
begin
  InitServerModule(Self);
end;

procedure TUniServerModule.UniGUIServerModuleCreate(Sender: TObject);
begin
  UniServerModule.CustomFiles.Add('css\bootstrap.css');
  UniServerModule.CustomFiles.Add('css\dinos.css');
  UniServerModule.CustomFiles.Add('js\bootstrap.js');
  UniServerModule.CustomFiles.Add('js\dinos.js');
  UniServerModule.CustomMeta.Add('<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>');
end;

initialization
  RegisterServerModuleClass(TUniServerModule);
end.
