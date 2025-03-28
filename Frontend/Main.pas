unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniEdit, uniButton, uniGUIBaseClasses, uniPanel, uniLabel, uniBasicGrid, uniDBGrid, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  System.JSON, uniMemo, Vcl.Imaging.pngimage, uniImage;

type
  TMainForm = class(TUniForm)
    PnlHeader: TUniPanel;
    UniPanel2: TUniPanel;
    BtnSalvar: TUniButton;
    BtnCancel: TUniButton;
    EdtNome: TUniEdit;
    LblCadastro: TUniLabel;
    LblAgenda: TUniLabel;
    EdtEmail: TUniEdit;
    EdtTel: TUniEdit;
    EdtIdade: TUniEdit;
    UniPanel3: TUniPanel;
    EdtEnd: TUniEdit;
    EdtCep: TUniEdit;
    EdtNum: TUniEdit;
    EdtBairro: TUniEdit;
    EdtCidade: TUniEdit;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    UniLabel8: TUniLabel;
    UniLabel9: TUniLabel;
    EdtUF: TUniEdit;
    UniLabel10: TUniLabel;
    MemCliente: TFDMemTable;
    DsCliente: TDataSource;
    BtnBuscarCliente: TUniButton;
    UniDBGrid1: TUniDBGrid;
    UniPanel1: TUniPanel;
    UniLabel12: TUniLabel;
    UniImage1: TUniImage;
    procedure UniFormShow(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnBuscarClienteClick(Sender: TObject);
  private
    procedure BuscarClientesApi;
    { Private declarations }
  public
    { Public declarations }
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication
  ,Bootstrap.Converter.Buttons.Dinos
  ,Bootstrap.Converter.Map.Dinos
  ,Bootstrap.Converter.Images.Dinos
  ,js.SweetAlert.Dinos, uCons.Menus,
  uServices.Cliente,
  Rest.Json
  ,DataSet.Serialize
  ,uDto.Cliente;

function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

procedure TMainForm.BuscarClientesApi;
begin
  var lServices := TDmServicesCliente.Create(self);
  try
    var lModel := lServices.GettAllClientes;
    try
      var lJsonModel := TJson.ObjectToJsonObject(lModel.Items);
      var lJsonValue := TJsonObject.ParseJsonValue(lJsonModel.ToString);
      var lJsonArray := TJSONObject(lJsonValue).GetValue<TJSONArray>('listHelper');

      MemCliente.Close;
      MemCliente.ResourceOptions.StoreItems := [siMeta, siData];
      MemCliente.LoadFromJSON(lJsonArray.ToString);
      MemCliente.Open;
    finally
      lModel.Free;
    end;
  finally
    lServices.Free;
  end;
end;

procedure TMainForm.BtnSalvarClick(Sender: TObject);
begin
  TSweetAlert.jsSweetFireQuestion('Confirmação','Deseja incluir o novo registro',
   'Registro incluso com sucesso!',
   self,
   procedure
   begin
      var lModelCliente := TCliente.create;
      try
        lModelCliente.Celular := EdtTel.Text;
        lModelCliente.Email := EdtEmail.Text;
        lModelCliente.Idade := StrToInt(EdtIdade.Text);
        lModelCliente.Nome := EdtNome.Text;

        lModelCliente.Endereco := TEndereco.Create;
        var lServices := TDmServicesCliente.Create(self);
        try
           lModelCliente.Endereco.Bairro := EdtBairro.Text;
           lModelCliente.Endereco.Cep := EdtCep.Text;
           lModelCliente.Endereco.Cidade := EdtCidade.Text;
           lModelCliente.Endereco.Endereco := EdtEnd.Text;
           lModelCliente.Endereco.Numero := EdtNum.Text;

           lServices.PostCliente(lModelCliente);
        finally
          lModelCliente.Endereco.Free;
          lServices.Free;
        end;

      finally
       lModelCliente.Free;
      end;
      BuscarClientesApi;
   end);
end;

procedure TMainForm.BtnBuscarClienteClick(Sender: TObject);
begin
  BuscarClientesApi;
end;

procedure TMainForm.BtnCancelClick(Sender: TObject);
begin
  TSweetAlert.jsSweetFireError('Cancelado', 'Comando cancelado');
end;

procedure TMainForm.UniFormShow(Sender: TObject);
begin
  TMap.MapComponenet(Self);

  BtnSalvar.ConvertToBootstrap(TpButtom.tpInfo);
  BtnCancel.ConvertToBootstrap(TpButtom.tpDanger);
  BtnBuscarCliente.ConvertToBootstrap(TpButtom.tpInfoOutline);
  UniImage1.ConvertToBootstrap(TTypeImageBorder.Circle);

  LblCadastro.Caption := MENU_CADASTRO + '  Cadastros';
  LblAgenda.Caption := MENU_AGENDA + '  Agendamento';
end;

initialization
  RegisterAppFormClass(TMainForm);

end.
