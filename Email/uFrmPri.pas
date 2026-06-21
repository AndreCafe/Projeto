unit uFrmPri;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDBaseEdit, LMDCustomEdit, LMDCustomBrowseEdit, LMDFileOpenEdit;

type
  TFrmPri = class(TForm)
    edServ: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edUsername: TEdit;
    edPass: TEdit;
    Label4: TLabel;
    cbAut: TComboBox;
    Label5: TLabel;
    edDestino: TMemo;
    Label6: TLabel;
    edAnexos: TLMDFileOpenEdit;
    Label7: TLabel;
    meCorpo: TMemo;
    Button1: TButton;
    Label8: TLabel;
    edAssunto: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPri: TFrmPri;

implementation

uses uDMEmail;

{$R *.dfm}

procedure TFrmPri.Button1Click(Sender: TObject);
begin
  dmEmail.Servidor := edServ.Text;
  dmEmail.Username := edUsername.Text;
  dmEmail.Password := edPass.Text;
  dmEmail.MetodoLogin := TMetodoLogin(cbAut.ItemIndex);

  dmEmail.Msg.From.Address := edUsername.Text;
  dmEmail.Msg.From.Name    := 'NexCafé';

  ShowMessage('Resultado = '+dmEmail.EnviaEmail(edDestino.Lines.Text, edAssunto.Text, meCorpo.Lines.Text, edAnexos.Text));
end;

procedure TFrmPri.FormCreate(Sender: TObject);
begin
  cbAut.ItemIndex := 0;
end;

end.
