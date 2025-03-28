unit frame.cliente;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, System.Skia, FMX.Skia, FMX.Objects;

type
  TFrameCliente = class(TFrame)
    Layout1: TLayout;
    SkLabel1: TSkLabel;
    lblNome: TSkLabel;
    Layout2: TLayout;
    Layout3: TLayout;
    SkLabel2: TSkLabel;
    lblCelular: TSkLabel;
    Layout4: TLayout;
    SkLabel3: TSkLabel;
    lblEmail: TSkLabel;
    Layout5: TLayout;
    SkLabel4: TSkLabel;
    lblIdade: TSkLabel;
    Rectangle1: TRectangle;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
