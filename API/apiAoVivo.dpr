program apiAoVivo;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Horse,
  Horse.Jhonson,
  model.conexao in 'src\model\model.conexao.pas' {dmConexao: TDataModule},
  model.cliente in 'src\model\model.cliente.pas' {dmCliente: TDataModule},
  controllers.cliente in 'src\controllers\controllers.cliente.pas';

begin
  THorse.Use(Jhonson());

  controllers.cliente.Registro;

  THorse.Listen(9001);
end.
