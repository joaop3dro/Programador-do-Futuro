unit view.lista;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  System.JSON, frame.cliente, System.Generics.Collections;

type
  TfrmLista = class(TForm)
    VertScrollBox1: TVertScrollBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FListaFrame:TObjectList<TFrameCliente>;
  public
    { Public declarations }
    procedure CarregaTela(AJson:TJSONArray);
  end;

var
  frmLista: TfrmLista;

implementation

{$R *.fmx}

{ TfrmLista }

procedure TfrmLista.CarregaTela(AJson:TJSONArray);
var
 LFrame:TFrameCliente;
begin

  FListaFrame.Clear;

  for var LItem in AJson do
  begin
    LFrame:= TFrameCliente.Create(self);

    LFrame.Name:= 'Frame_' +LItem.GetValue<string>('cod')+FormatDateTime('hhmmsszzz',now);
    LFrame.Align:= TAlignLayout.Top;

    LFrame.lblNome.Text:= LItem.GetValue<string>('nome');
    LFrame.lblCelular.Text:= LItem.GetValue<string>('celular');
    LFrame.lblEmail.Text:= LItem.GetValue<string>('email');
    LFrame.lblIdade.Text:= LItem.GetValue<string>('idade');

    VertScrollBox1.AddObject(LFrame);

    FListaFrame.Add(LFrame);

  end;

end;

procedure TfrmLista.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(FListaFrame);
  Action:= TCloseAction.caFree;
  frmLista:= nil;
end;

procedure TfrmLista.FormCreate(Sender: TObject);
begin
  FListaFrame:= TObjectList<TFrameCliente>.Create;
end;

end.
