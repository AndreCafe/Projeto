unit ncafbTipoPass;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxMaskEdit, cxCurrencyEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, nxdb, dxPSCore,
  cxGridCustomPopupMenu, cxGridPopupMenu, dxBar, dxBarExtItems, ExtCtrls,
  cxCalendar, cxTextEdit, cxCheckBox, cxTimeEdit, cxDBLookupComboBox, ncPassaportes,
  cxSpinEdit;

type
  TfbTiposPass = class(TFrmBase)
    dsTab: TDataSource;
    Tab: TnxTable;
    TabID: TAutoIncField;
    TabNome: TStringField;
    TabValor: TCurrencyField;
    TabTipoAcesso: TIntegerField;
    TabTipoExp: TWordField;
    TabExpirarEm: TDateTimeField;
    TabMaxSegundos: TIntegerField;
    TabObs: TMemoField;
    TabDia1: TIntegerField;
    TabDia2: TIntegerField;
    TabDia3: TIntegerField;
    TabDia4: TIntegerField;
    TabDia5: TIntegerField;
    TabDia6: TIntegerField;
    TabDia7: TIntegerField;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    TVNome1: TcxGridDBColumn;
    TVValor1: TcxGridDBColumn;
    GL: TcxGridLevel;
    cmImpCodPrePago: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    TabFidelidade: TBooleanField;
    TabFidPontos: TIntegerField;
    TVFidelidade: TcxGridDBColumn;
    TVFidPontos: TcxGridDBColumn;
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure cmNovoClick(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
    procedure cmApagarClick(Sender: TObject);
    procedure cmImpCodPrePagoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure FiltraDados; override;
    procedure AtualizaDireitos; override;
    class function Descricao: String; override;
    
  end;

var
  fbTiposPass: TfbTiposPass;

implementation

uses 
  ncaDM, 
  ncaFrmPri, 
  ncClassesBase, 
  ncaFrmPass, 
  ncaFrmImpPrePago, 
  ncIDRecursos,
  ncafbPass;

{$R *.dfm}

{ TfbTiposPass }

class function TfbTiposPass.Descricao: String;
begin
  Result := 'Passaportes';
end;

procedure TfbTiposPass.dxBarLargeButton1Click(Sender: TObject);
begin
  with TfbPassaportes.Create(Self) do begin
    FiltraDados;
    ShowModal;
  end;  
end;

procedure TfbTiposPass.FiltraDados;
begin
  inherited;
  if not Tab.Active then
    Tab.Open
  else
    Tab.Refresh;  
end;

procedure TfbTiposPass.cmEditarClick(Sender: TObject);
var P : TncPassaporte;
begin
  P := TncPassaporte.Create;
  try
    if Tab.RecordCount > 0 then begin
      P.LoadFromDataset(Tab);
      if TFrmPassaporte.Create(Self).Editar(False, P) then begin
        Tab.Edit;
        P.SaveToDataset(Tab);
        Tab.Post;
      end;  
    end;
  finally
    P.Free;
  end;
end;

procedure TfbTiposPass.cmNovoClick(Sender: TObject);
var P : TncPassaporte;
begin
  P := TncPassaporte.Create;
  try
    if TFrmPassaporte.Create(Self).Editar(True, P) then begin
      Tab.Insert;
      P.SaveToDataset(Tab);
      Tab.Post;
    end;
  finally
    P.Free;
  end;
end;

procedure TfbTiposPass.cmApagarClick(Sender: TObject);
begin
  inherited;
  if SimNaoH('Deseja realmente apagar esse passaporte?', Handle) then
    Tab.Delete;
end;

procedure TfbTiposPass.AtualizaDireitos;
begin
  inherited;
  cmImpCodPrePago.Enabled := Permitido(daPPGImpPPInvalido) or Permitido(daPPGImpPPValido);
  cmApagar.Enabled := Permitido(daCFGPrecos);
end;

procedure TfbTiposPass.cmImpCodPrePagoClick(Sender: TObject);
begin
  TFrmImpPrePago.Create(Self).ShowModal;
end;

end.
