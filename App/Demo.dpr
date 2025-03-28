program Demo;

uses
  System.StartUpCopy,
  FMX.Forms,
  view.principal in 'view.principal.pas' {frmPrincipal},
  view.lista in 'view.lista.pas' {frmLista},
  frame.cliente in 'frame.cliente.pas' {FrameCliente: TFrame},
  uConnection in 'uConnection.pas',
  controller.cliente in 'controller.cliente.pas',
  uFancyDialog in 'uFancyDialog.pas',
  uLoading in 'uLoading.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
