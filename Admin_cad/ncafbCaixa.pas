unit ncafbCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxGroupBox, cxRadioGroup, StdCtrls, cxButtons, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, cxPC, cxControls,
  cxGridCustomPopupMenu, cxGridPopupMenu, dxBar, dxBarExtItems, ExtCtrls,
  pngimage, cxLabel, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSCore,
  Menus, cxClasses;

type
  TfbCaixa = class(TFrmBase)
    Paginas: TcxPageControl;
    FM: TFormManager;
    tsFechado: TcxTabSheet;
    cxLabel1: TcxLabel;
    cxButton1: TcxButton;
    Image1: TImage;
    Timer1: TTimer;
    procedure FrmBasePaiCreate(Sender: TObject);
    procedure FrmBasePaiDestroy(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FMChange(Sender: TObject);
  private
    FFiltrou: Boolean;
    { Private declarations }
  public
    procedure FiltraDados; override;
    procedure AtualizaDireitos; override;
    class function Descricao: String; override;
    { Public declarations }
  end;

var
  fbCaixa: TfbCaixa;

implementation

uses 
  ncaFrmPri, 
  ncafbTran, 
  ncafbCaixasA, 
  ncaDM, 
  ncaFrmCaixa, 
  ncIDRecursos;

{$R *.dfm}

{ TfbCaixa }

class function TfbCaixa.Descricao: String;
begin
  Result := 'Caixa';
end;

procedure TfbCaixa.FrmBasePaiCreate(Sender: TObject);
begin
  inherited;
  FFiltrou := False;
  BarMgr.Bars[0].Free;
  FM.RegistraForm(TfbCaixasA);
  FM.RegistraForm(TfbTran);
  FM.Mostrar(TfbCaixasA, 0, 0);
end;

procedure TfbCaixa.FrmBasePaiDestroy(Sender: TObject);
begin
  FM.Clear;
  inherited;
end;

procedure TfbCaixa.cxButton1Click(Sender: TObject);
begin
  Dados.AbreCaixa;
end;

procedure TfbCaixa.FiltraDados;
begin
  FFiltrou := True;
  with Dados do 
  if NumAberto < 0 then begin
    tsFechado.TabVisible := True;
    Paginas.ActivePage := tsFechado;
    FM.Esconder(TfbTran);
  end else begin
    tsFechado.TabVisible := False;
    FM.Mostrar(TfbTran, 0, 0);  
    FM.FormAtivo.TabSheet.Caption := 'Caixa Atual';
    FM.FormAtivo.TabSheet.PageIndex := 1;
  end;  
end;

procedure TfbCaixa.FMChange(Sender: TObject);
begin
  if FM.FormAtivo <> nil then
  if FM.FormAtivo is TfbTran then
    TfbTran(FM.FormAtivo).Refresh
  else
    FM.FormAtivo.FiltraDados;
end;

procedure TfbCaixa.AtualizaDireitos;
begin
  inherited;
  if not FFiltrou then FiltraDados;
  
  if not Permitido(daCAIVerAntes) then begin
    if tsFechado.TabVisible then
      Paginas.ActivePage := tsFechado
    else
      FM.MostrarTab(TfbTran);  
    FM.Esconder(TfbCaixasA)   
  end;
end;

end.
