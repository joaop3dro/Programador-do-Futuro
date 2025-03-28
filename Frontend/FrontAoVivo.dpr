{$define UNIGUI_VCL} // Comment out this line to turn this project into an ISAPI module

{$ifndef UNIGUI_VCL}
library
{$else}
program
{$endif}
  FrontAoVivo;

uses
  uniGUIISAPI,
  Forms,
  ServerModule in 'ServerModule.pas' {UniServerModule: TUniGUIServerModule},
  MainModule in 'MainModule.pas' {UniMainModule: TUniGUIMainModule},
  Main in 'Main.pas' {MainForm: TUniForm},
  Bootstrap.Converter.Buttons.Dinos in '..\..\UniDinosStyle\DinosStyle\ConversorBootstrap\Bootstrap.Converter.Buttons.Dinos.pas',
  Bootstrap.Converter.Checkbox.Dinos in '..\..\UniDinosStyle\DinosStyle\ConversorBootstrap\Bootstrap.Converter.Checkbox.Dinos.pas',
  Bootstrap.Converter.Edits.Dinos in '..\..\UniDinosStyle\DinosStyle\ConversorBootstrap\Bootstrap.Converter.Edits.Dinos.pas',
  Bootstrap.Converter.Grids.Dinos in '..\..\UniDinosStyle\DinosStyle\ConversorBootstrap\Bootstrap.Converter.Grids.Dinos.pas',
  Bootstrap.Converter.Images.Dinos in '..\..\UniDinosStyle\DinosStyle\ConversorBootstrap\Bootstrap.Converter.Images.Dinos.pas',
  Bootstrap.Converter.Labels.Dinos in '..\..\UniDinosStyle\DinosStyle\ConversorBootstrap\Bootstrap.Converter.Labels.Dinos.pas',
  Bootstrap.Converter.Map.Dinos in '..\..\UniDinosStyle\DinosStyle\ConversorBootstrap\Bootstrap.Converter.Map.Dinos.pas',
  Bootstrap.Converter.Memos.Dinos in '..\..\UniDinosStyle\DinosStyle\ConversorBootstrap\Bootstrap.Converter.Memos.Dinos.pas',
  Bootstrap.Converter.Panels.Dinos in '..\..\UniDinosStyle\DinosStyle\ConversorBootstrap\Bootstrap.Converter.Panels.Dinos.pas',
  Bridge.Dinos in '..\..\UniDinosStyle\DinosStyle\ConversorBootstrap\Bridge.Dinos.pas',
  js.SweetAlert.Dinos in '..\..\UniDinosStyle\DinosStyle\ConversorBootstrap\js.SweetAlert.Dinos.pas',
  uConst.Buttons in '..\..\UniDinosStyle\DinosStyle\ConversorBootstrap\uConst.Buttons.pas',
  uConst.Form.Controls in '..\..\UniDinosStyle\DinosStyle\ConversorBootstrap\uConst.Form.Controls.pas',
  uConst.Grids in '..\..\UniDinosStyle\DinosStyle\ConversorBootstrap\uConst.Grids.pas',
  uCons.Menus in 'uCons.Menus.pas',
  uServices.Cliente in 'Services\uServices.Cliente.pas' {DmServicesCliente: TDataModule},
  uDto.Cliente in 'Dto\uDto.Cliente.pas';

{$R *.res}

{$ifndef UNIGUI_VCL}
exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;
{$endif}

begin
{$ifdef UNIGUI_VCL}
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  TUniServerModule.Create(Application);
  Application.Run;
{$endif}
end.
