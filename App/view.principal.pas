unit view.principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  Alcinoe.FMX.Controls, Alcinoe.FMX.Objects, Alcinoe.FMX.Edit,
  Alcinoe.FMX.StdCtrls, FMX.Layouts, view.lista, System.JSON, controller.cliente,
  uLoading, uFancyDialog;

type
  TfrmPrincipal = class(TForm)
    edtNome: TALEdit;
    edtCelular: TALEdit;
    edtEmail: TALEdit;
    edtIdade: TALEdit;
    Layout1: TLayout;
    btnSalvar: TALButton;
    Layout2: TLayout;
    Layout3: TLayout;
    btnLista: TALButton;
    procedure btnListaClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    LMsg:TFancyDialog;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

procedure TfrmPrincipal.btnListaClick(Sender: TObject);
begin

  TLoading.Show(self,'Aguarde, Carregando Clientes');

  TThread.CreateAnonymousThread(
  procedure
  begin
    try
      sleep(3000);

      TThread.Synchronize(nil,
      procedure
      begin
        if not Assigned(frmLista) then
          Application.CreateForm(TfrmLista, frmLista);
      end);

      var LCliente:= controller.cliente.GetCliente;

      frmLista.CarregaTela(LCliente);

      TThread.Synchronize(nil,
      procedure
      begin
        frmLista.Show;
      end);
    finally
      TLoading.Hide;
    end;
  end).Start;

end;

procedure TfrmPrincipal.btnSalvarClick(Sender: TObject);
var
 LJsonCliente:TJSONObject;
 LJsonEndereco:TJSONObject;

begin
  LMsg.Show(TIconDialog.Question,
  'Confirme para Salvar',
  '',
  'Ok',
  procedure
  begin
    LJsonCliente:= TJSONObject.Create;
    LJsonCliente.AddPair('nome',edtNome.Text);
    LJsonCliente.AddPair('celular',edtCelular.Text);
    LJsonCliente.AddPair('email',edtEmail.Text);
    LJsonCliente.AddPair('idade',edtIdade.Text);

    LJsonEndereco:= TJSONObject.Create;
    LJsonEndereco.AddPair('cep','1234');
    LJsonEndereco.AddPair('endereco','teste');
    LJsonEndereco.AddPair('numero','1223');
    LJsonEndereco.AddPair('bairro','bairro da fe');
    LJsonEndereco.AddPair('cidade','SP');
    LJsonEndereco.AddPair('uf','SP');

    LJsonCliente.AddPair('endereco',LJsonEndereco);

    controller.cliente.PostCliente(LJsonCliente);
  end,
  'Cancelar');
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  LMsg:= TFancyDialog.Create(self);
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  FreeAndNil(LMsg);
end;

end.
