unit model.conexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.ConsoleUI.Wait, Data.DB,
  FireDAC.Comp.Client, System.IniFiles;

type
  TdmConexao = class(TDataModule)
    FDConnection1: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure LerIni;
  public
    { Public declarations }
  end;

var
  dmConexao: TdmConexao;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TdmConexao }

procedure TdmConexao.DataModuleCreate(Sender: TObject);
begin
  LerIni;
end;

procedure TdmConexao.LerIni;
var
  Lini: TiniFile;
begin
  Lini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'conf.ini');
  try
    FDConnection1.Params.Values['DriverID'] := Lini.ReadString('CONEXAO', 'DriverID', '');
    FDConnection1.Params.Values['Server'] := Lini.ReadString('CONEXAO', 'Server', '');
    FDConnection1.Params.Values['Database'] := Lini.ReadString('CONEXAO', 'Database', '');

    FDConnection1.Connected := true;
  finally
    Lini.Free;
  end;
end;

end.
