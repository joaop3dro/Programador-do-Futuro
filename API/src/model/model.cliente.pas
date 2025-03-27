unit model.cliente;

interface

uses
  System.SysUtils, System.Classes, model.conexao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.ConsoleUI.Wait, Data.DB,
  FireDAC.Comp.Client, System.JSON, DataSet.Serialize, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TdmCliente = class(TdmConexao)
    qryCadastraCliente: TFDQuery;
    qryCadastraEndereco: TFDQuery;
    qryListaCliente: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function CadastraCliente(Ajson: TJSONObject): TJSONObject;
    function ListaCliente: TJSONArray;
  end;

var
  dmCliente: TdmCliente;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TdmCliente }

function TdmCliente.CadastraCliente(Ajson: TJSONObject): TJSONObject;
var
  LUltimoID: Integer;
  LJsonRetorno: TJSONObject;
  LJsonEndereco: TJSONObject;
begin
  qryCadastraCliente.SQL.Text := 'INSERT INTO cliente (nome, celular, email, idade) ' +
                                 'VALUES (:nome, :celular, :email, :idade)';

  qryCadastraCliente.ParamByName('nome').AsString := AJson.GetValue<string>('nome');
  qryCadastraCliente.ParamByName('celular').AsString := AJson.GetValue<string>('celular');
  qryCadastraCliente.ParamByName('email').AsString := AJson.GetValue<string>('email');
  qryCadastraCliente.ParamByName('idade').AsInteger := AJson.GetValue<integer>('idade');

  qryCadastraCliente.ExecSQL;

  LUltimoID := FDConnection1.ExecSQLScalar('SELECT last_insert_rowid()');

  LJsonEndereco := AJson.GetValue<TJSONObject>('endereco');

  qryCadastraEndereco.SQL.Text := 'INSERT INTO endereco (cod_cliente, cep, endereco, numero, bairro, cidade, uf) ' +
                                  'VALUES (:cod_cliente, :cep, :endereco, :numero, :bairro, :cidade, :uf)';

  qryCadastraEndereco.ParamByName('cod_cliente').AsInteger := LUltimoID;
  qryCadastraEndereco.ParamByName('cep').AsString := LJsonEndereco.GetValue<string>('cep');
  qryCadastraEndereco.ParamByName('endereco').AsString := LJsonEndereco.GetValue<string>('endereco');
  qryCadastraEndereco.ParamByName('numero').AsString := LJsonEndereco.GetValue<string>('numero');
  qryCadastraEndereco.ParamByName('bairro').AsString := LJsonEndereco.GetValue<string>('bairro');
  qryCadastraEndereco.ParamByName('cidade').AsString := LJsonEndereco.GetValue<string>('cidade');
  qryCadastraEndereco.ParamByName('uf').AsString := LJsonEndereco.GetValue<string>('uf');

  qryCadastraEndereco.ExecSQL;

  LJsonRetorno := TJSONObject.Create;

  LJsonRetorno.AddPair('message', TJSONNumber.Create(LUltimoID));

  Result := LJsonRetorno;
end;

function TdmCliente.ListaCliente: TJSONArray;
begin
  qryListaCliente.Close;
  qryListaCliente.Open;

  Result := qryListaCliente.ToJSONArray;

  qryListaCliente.Close;
end;

end.
