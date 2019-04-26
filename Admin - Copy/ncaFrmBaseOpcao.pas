unit ncaFrmBaseOpcao;
{
    ResourceString: Dario 09/03/13   Nada pra fazer
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
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
    procedure SetNumItem(const Value: Integer);
  public
    procedure Ler; virtual; abstract;
    procedure Salvar; virtual; abstract;
    function Alterou: Boolean; virtual; abstract;

    procedure Renumera; virtual;

    function NumItens: Integer; virtual; 

    property InicioNumItem: Integer
      read FInicioNumItem write SetNumItem;

    function Editar: Boolean;  
    
    { Public declarations }
  end;

  TFrmBaseOpcaoClass = Class of TFrmBaseOpcao;

var
  FrmBaseOpcao: TFrmBaseOpcao;

implementation

uses ncClassesBase, ncaDM;

{$R *.dfm}

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

procedure TFrmBaseOpcao.Renumera;
begin

end;

procedure TFrmBaseOpcao.SetNumItem(const Value: Integer);
begin
  FInicioNumItem := Value;
end;

end.
