unit ncafbTarifas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSCore, cxGridCustomPopupMenu, cxGridPopupMenu, dxBar, dxBarExtItems,
  ExtCtrls, cxControls, cxPC, cxClasses;

type
  TfbTarifas = class(TFrmBase)
    Paginas: TcxPageControl;
    FM: TFormManager;
    procedure FrmBasePaiCreate(Sender: TObject);
    procedure FrmBasePaiDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    procedure AtualizaDireitos; override;
    procedure FiltraDados; override;
    class function Descricao: String; override;
    { Public declarations }
  end;

var
  fbTarifas: TfbTarifas;

implementation

uses 
  ncafbTarBasica, 
  ncafbPacotes, 
  ncaFrmPri, 
  ncafbTipoPass,
  ncafbTiposAcesso, 
  ncaDM, ncafbTiposImp;

{$R *.dfm}

{ TFrmBase1 }

procedure TfbTarifas.AtualizaDireitos;
begin
  inherited;
  if Dados.tbConfigVariosTiposAcesso.Value then
    FM.MostrarTab(TfbTiposAcesso)
  else
    FM.Esconder(TfbTiposAcesso);  
end;

class function TfbTarifas.Descricao: String;
begin
  Result := 'Tarifas';
end;

procedure TfbTarifas.FiltraDados;
begin
  inherited;
end;

procedure TfbTarifas.FrmBasePaiCreate(Sender: TObject);
begin
  BarMgr.Bars[0].Free;
  FM.RegistraForm(TfbTiposAcesso);
  FM.RegistraForm(TfbTarBasica);
  FM.RegistraForm(TfbPacotes);
  FM.RegistraForm(TfbTiposPass);
  FM.RegistraForm(TfbTiposImp);
  FM.Mostrar(TfbTiposAcesso, 0, 0);
  FM.Mostrar(TfbTarBasica, 0, 0);
  FM.Mostrar(TfbPacotes, 0, 0);
  FM.Mostrar(TfbTiposPass, 0, 0);
  FM.Mostrar(TfbTiposImp, 0, 0);
  Paginas.ActivePageIndex := 0;
end;

procedure TfbTarifas.FrmBasePaiDestroy(Sender: TObject);
begin
  FM.Clear;
  inherited;
end;

end.
 