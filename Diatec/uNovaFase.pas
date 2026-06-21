unit uNovaFase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LMDControl, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel, cxGraphics, cxCustomData, cxStyles, cxTL, cxMaskEdit,
  cxCheckBox, cxCalendar, cxTextEdit, Menus, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxInplaceContainer, cxDBTL, cxControls, cxTLData;

type
  TFrmNovaFase = class(TForm)
    LMDSimplePanel1: TLMDSimplePanel;
    TreeFase: TcxDBTreeList;
    cxDBTreeList1Cliente: TcxDBTreeListColumn;
    cxDBTreeList1Projeto: TcxDBTreeListColumn;
    cxDBTreeList1ID: TcxDBTreeListColumn;
    cxDBTreeList1Sync: TcxDBTreeListColumn;
    cxDBTreeList1HR: TcxDBTreeListColumn;
    cxDBTreeList1Nome: TcxDBTreeListColumn;
    cxDBTreeList1Inicio: TcxDBTreeListColumn;
    cxDBTreeList1DatReI: TcxDBTreeListColumn;
    cxDBTreeList1Termino: TcxDBTreeListColumn;
    cxDBTreeList1DatReF: TcxDBTreeListColumn;
    cxDBTreeList1Horas: TcxDBTreeListColumn;
    cxDBTreeList1PercEst: TcxDBTreeListColumn;
    cxDBTreeList1PercRealizado: TcxDBTreeListColumn;
    cxDBTreeList1IDRetag: TcxDBTreeListColumn;
    TreeFaseSumario: TcxDBTreeListColumn;
    cxDBTreeList1FasePai: TcxDBTreeListColumn;
    cxDBTreeList1DataVld: TcxDBTreeListColumn;
    btnOk: TcxButton;
    btnCancelar: TcxButton;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FRes : String;

    function Valida: Boolean;
    function PlanejamentoOk(Inicio, Fim, Horas : Boolean): Boolean;
    
  public
    { Public declarations }
    function ObtemFase: String;
  end;

var
  FrmNovaFase: TFrmNovaFase;

implementation

uses uDTDM;

{$R *.dfm}

procedure TFrmNovaFase.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmNovaFase.btnOkClick(Sender: TObject);
begin
  FRes := DM.tFaseID.Value;
  Close;
end;

procedure TFrmNovaFase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmNovaFase.FormShow(Sender: TObject);
begin
  TreeFase.FullExpand;
end;

function TFrmNovaFase.ObtemFase: String;
begin
  FRes := '';
  ShowModal;
  Result := FRes;
end;

function TFrmNovaFase.PlanejamentoOk(Inicio, Fim, Horas: Boolean): Boolean;
var HR: Extended;
begin
  Result := False;
  with DM do 
  if Inicio then 
  if tFaseDatReI.IsNull or (tFaseDatReI.Value=0) then 
  if FormatDateTime('yyyymmdd', tOSItensData.AsDateTime) > FormatDateTime('yyyymmdd', tFaseInicio.Value) then
  begin
    Beep;
    ShowMessage('Data do apontamento é maior que data programada para Inicio!');
    Exit;
  end;  

  with DM do 
  if Fim then
  if FormatDateTime('yyyymmdd', tOSItensData.AsDateTime) > FormatDateTime('yyyymmdd', tFaseTermino.Value) then
  begin
    Beep;
    ShowMessage('Data do apontamento é maior que data programada para Término!');
    Exit;
  end;  

{  with DM do 
  if Horas then begin
    HR := tFaseHorasReal.Value - DateTimeToHoras(OldDT)
          + DateTimeToHoras(tApontaHoras.Value);
    if HR > tFaseHoras.Value then      
    begin
      Beep;
      ShowMessage('Estão previstas ' + tFaseHoras.AsString + 
                  ' para esta fase. Com este apontamento o total de horas será ' +      
                  FloatToStr(HR));
      Exit;
    end;  
  end;  }

  with DM do
  if (not tParametroTodasHorasNoFeriado.Value) and tFer.FindKey([tOSItensData.AsDateTime]) and (tOSItensTipoHoraTipo.Value<>'F') then
  begin
    Beep;
    ShowMessage('Apontamento de feriados tem que ser hora 100% / Fim de semana');
    Exit;
  end;

  Result := True;

end;

function TFrmNovaFase.Valida: Boolean;
begin
  Result := False;
  with DM do begin
    if (tOSItensTipoHoraTipo.Value='N') and
       (tProjNoturno.Value<>'S') and ((tProjNoturno.Value='N') or (qCliNoturno.Value<>'S')) then
    begin
      Beep;
      ShowMessage('Não é permitido apontar hora noturna nesse cliente/projeto!');
      Exit;
    end;

    if (tOSItensTipoHoraTipo.Value='F') and
       (tProjFimSem.Value<>'S') and ((tProjFimSem.Value='N') or (qCliFimSem.Value<>'S')) then
    begin
      Beep;
      ShowMessage('Não é permitido apontar hora fim de semana nesse cliente/projeto!');
      Exit;
    end;
  end;
  
  with DM, tProjLocaPla do
  if not PlanejamentoOk((Value=lpHoraInicio) or (Value=lpTotal), 
                        (Value=lpHoraFim) or (Value=lpTotal),
                        (Copy(Value, 1, 1)='H')) then Exit;

  Result := True;
end;

end.
