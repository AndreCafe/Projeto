unit uApagarAcesso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport, Data.DB, nxdb,
  nxllComponent, nxsdServerEngine, nxreRemoteServerEngine;

type
  TFrmPri = class(TForm)
    nxRSE: TnxRemoteServerEngine;
    nxSession: TnxSession;
    nxDB: TnxDatabase;
    T: TnxTable;
    nxTCP: TnxWinsockTransport;
    edMaq: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    TID: TUnsignedAutoIncField;
    TMaq: TWordField;
    TEncerrou: TBooleanField;
    TCaixaF: TLongWordField;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPri: TFrmPri;

implementation

{$R *.dfm}

procedure TFrmPri.Button1Click(Sender: TObject);
var Apagou : Boolean;
begin
  if edMaq.Value<0 then raise exception.Create('É necessário informar o número da máquina');

  Apagou := False;
  T.SetRange([False], [False]);
  T.First;

  while not T.Eof do begin
    if TMaq.Value=edMaq.Value then begin
      T.Delete;
      Apagou := True;
      Break;                               
    end;
    T.Next;
  end;
  if Apagou then begin
    ShowMessage('Acesso apagado com sucesso. É necessário ENCERRAR e reabrir o NexServ para fazer efeito.');
    Close;
  end else
    ShowMessage('Não existe um acesso em andamento nessa máquina');
end;

end.























     