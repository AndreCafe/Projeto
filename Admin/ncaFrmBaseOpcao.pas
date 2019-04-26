unit ncaFrmBaseOpcao;
{
    ResourceString: Dario 09/03/13   Nada pra fazer
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxRadioGroup, cxCheckBox, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxLabel, LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, Menus, StdCtrls, cxButtons;

type
  TFrmBaseOpcao = class(TForm)
    panPri: TLMDSimplePanel;
    LMDSimplePanel1: TLMDSimplePanel;
    btnOk: TcxButton;
    btCancelar: TcxButton;
    procedure btCancelarClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FInicioNumItem : Integer;
    FAlterou: Boolean;
    FOnRefreshSize: TNotifyEvent;
    procedure SetNumItem(const Value: Integer);
  protected
    function RenumCaption(aCaption: String; aNumItem: Byte): String;
    procedure RenumLB(aLB: TcxLabel; aNumItem: Byte);
    procedure RenumRB(aRB: TcxRadioButton; aNumItem: Byte);
    procedure RenumCB(aCB: TcxCheckBox; aNumItem: Byte);
    procedure callRefreshSize;
  public
    procedure Ler; virtual; abstract;
    procedure Salvar; virtual; abstract;
    function Alterou: Boolean; virtual; abstract;

    procedure Renumera; virtual;

    function NumItens: Integer; virtual; 

    property InicioNumItem: Integer
      read FInicioNumItem write SetNumItem;

    function Editar: Boolean;  

    property OnRefreshSize: TNotifyEvent
      read FOnRefreshSize write FOnRefreshSize;
    
    { Public declarations }
  end;

  TFrmBaseOpcaoClass = Class of TFrmBaseOpcao;
  
  procedure EnableControls(aControls: Array of TCustomControl; aEnabled: Boolean);

var
  FrmBaseOpcao: TFrmBaseOpcao;

implementation

uses ncClassesBase, ncaDM;

{$R *.dfm}

procedure EnableControls(aControls: Array of TCustomControl; aEnabled: Boolean);
var I: Integer;
begin
  for I := 0 to High(aControls) do aControls[I].Enabled := aEnabled;
end;


procedure TFrmBaseOpcao.btCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmBaseOpcao.btnOkClick(Sender: TObject);
begin
  if Alterou then begin
    gConfig.AtualizaCache;
    Salvar;
    Dados.CM.SalvaAlteracoesObj(gConfig, False);
    FAlterou := True;
  end;
  Close;
end;

procedure TFrmBaseOpcao.callRefreshSize;
begin
  panPri.Refresh;
  panPri.Realign;
  if Assigned(FOnRefreshSize) then
    FOnRefreshSize(Self);
end;

function TFrmBaseOpcao.Editar: Boolean;
begin
  FAlterou := False;
  ShowModal;
  Result := FAlterou;
end;

procedure TFrmBaseOpcao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmBaseOpcao.FormCreate(Sender: TObject);
begin
  FOnRefreshSize := nil;
  FInicioNumItem := 1;
  btnOk.Enabled := Dados.CM.UA.Admin;
  Ler;
end;

procedure TFrmBaseOpcao.FormShow(Sender: TObject);
begin
  Width := Width + 1;
end;

function TFrmBaseOpcao.NumItens: Integer;
begin
  Result := 1;
end;

function TFrmBaseOpcao.RenumCaption(aCaption: String; aNumItem: Byte): String;
begin
  Result := IntToStr(FInicioNumItem + aNumItem) + '. ' + aCaption;
end;

procedure TFrmBaseOpcao.RenumCB(aCB: TcxCheckBox; aNumItem: Byte);
begin
  aCB.Caption := RenumCaption(aCB.Caption, aNumItem);
end;

procedure TFrmBaseOpcao.Renumera;
begin

end;

procedure TFrmBaseOpcao.RenumLB(aLB: TcxLabel; aNumItem: Byte);
begin
  aLB.Caption := RenumCaption(aLB.Caption, aNumItem);
end;

procedure TFrmBaseOpcao.RenumRB(aRB: TcxRadioButton; aNumItem: Byte);
begin
  aRB.Caption := RenumCaption(aRB.Caption, aNumItem);
end;

procedure TFrmBaseOpcao.SetNumItem(const Value: Integer);
begin
  FInicioNumItem := Value;
end;

end.
