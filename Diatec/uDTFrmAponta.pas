unit uDTFrmAponta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, 
  OvcBase, OvcEF, OvcPB, OvcPF, OvcDbPF, DBCtrls, ComCtrls, OvcSC, Db, nxdb,
  OvcNF, OvcEditU, OvcEdit, ExtCtrls, Clipbrd,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  ovceditf, ovcedpop, ovcedsld, ovcdbsed, ovcdbnf, LMDControl, wwdblook;

type
  TFrmAponta = class(TForm)
    panBotoes: TLMDSimplePanel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    panDados: TLMDSimplePanel;
    OvcController1: TOvcController;
    edHoras: TOvcDbPictureField;
    Label2: TLabel;
    Label1: TLabel;
    edData: TOvcDbPictureField;
    Label3: TLabel;
    tDescr: TnxTable;
    tDescrCliente: TStringField;
    tDescrProjeto: TStringField;
    tDescrFase: TStringField;
    tDescrTecnico: TStringField;
    tDescrPos: TWordField;
    tDescrSync: TBooleanField;
    edDescr: TMemo;
    Label4: TLabel;
    edTipoHora: TwwDBLookupCombo;
    tDescrTexto: TStringField;
    lbFase: TPanel;
    Label5: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    tDescrData: TDateTimeField;
    tDescrOS: TSmallintField;
    tDescrItem: TIntegerField;
    tDescrLogID: TIntegerField;
    tDescrDownOk: TBooleanField;
    gbEst: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label6: TLabel;
    lbObs: TLabel;
    OvcDbNumericField1: TOvcDbNumericField;
    OvcDbNumericField2: TOvcDbNumericField;
    edNovaEst: TOvcNumericField;
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tDescrBeforePost(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    OldDT : TDateTime;
    { Private declarations }
    procedure LeDescr;
    procedure SalvaDescr;
  public
    procedure Novo;
    procedure Edita;
    function Valida: Boolean;
    function PlanejamentoOk(Inicio, Fim, Horas : Boolean): Boolean;
    { Public declarations }
  end;

var
  FrmAponta: TFrmAponta;

implementation

uses uDTDM;

{$R *.DFM}

procedure TFrmAponta.Novo;
begin
  DM.tAponta.Append;
  ShowModal;
end;

procedure TFrmAponta.Edita;
begin
  DM.tAponta.Edit;
  LeDescr;
  ShowModal;
end;

function TFrmAponta.Valida: Boolean;
begin
  Result := False;

  with DM do begin
    if (tProjLocaRec.Value='S') and not 
        tFaseTec.FindKey([tFaseCliente.Value, tFaseProjeto.Value, tFaseID.Value, IDTecnico]) then
    begin
      Beep;
      ShowMessage('Não está previsto a sua participação nessa fase do projeto!');
      Exit;
    end;   
  
    if Trim(edDescr.Lines.Text)='' then begin
      Beep;
      ShowMessage('Descrição não pode ficar em branco!');
      Exit;
    end;

    if Length(Trim(edDescr.Lines.Text))<30 then begin
      Beep;
      ShowMessage('Descrição deve ter no mínimo 30 caracteres!');
      Exit;
    end;

    
    if (tApontaTipoHoraTipo.Value='N') and
       (tProjNoturno.Value<>'S') and ((tProjNoturno.Value='N') or (qCliNoturno.Value<>'S')) then
    begin
      Beep;
      ShowMessage('Não é permitido apontar hora noturna nesse cliente/projeto!');
      Exit;
    end;

    if (tApontaTipoHoraTipo.Value='F') and
       (tProjFimSem.Value<>'S') and ((tProjFimSem.Value='N') or (qCliFimSem.Value<>'S')) then
    begin
      Beep;
      ShowMessage('Não é permitido apontar hora fim de semana nesse cliente/projeto!');
      Exit;
    end;
  
    if DateTimeToHoras(edHoras.AsDateTime) < 0.001 then
    begin
      Beep;
      ShowMessage('Número de horas não pode ser zero!');
      Exit;
    end;
    
    if DateTimeToHoras(edHoras.AsDateTime) > 12 then
    begin
      Beep;
      ShowMessage('Número de horas não pode se maior que 12Hs!'+#13+'Desdobre os apontamentos');
      Exit;
    end;
  end;
  
  with DM, tProjLocaPla do
  if not PlanejamentoOk((Value=lpHoraInicio) or (Value=lpTotal), 
                        (Value=lpHoraFim) or (Value=lpTotal),
                        (Copy(Value, 1, 1)='H')) then Exit;

  with DM do 
  if tParametroEstimarFaseNoApontamento.Value and tParametroExigirEstimativa.Value then
  if (tAponta.State=dsInsert) and (edNovaEst.AsInteger=0) then 
  begin
    Beep;
    ShowMessage('É obrigatório realizar uma estimativa de andamento dessa fase');
    Exit;
  end;
                        
  Result := True;
end;

function TFrmAponta.PlanejamentoOk(Inicio, Fim, Horas : Boolean): Boolean;
var HR: Extended;
begin
  Result := False;
  with DM do 
  if Inicio then 
  if tFaseDatReI.IsNull or (tFaseDatReI.Value=0) then 
  if FormatDateTime('yyyymmdd', edData.AsDateTime) > FormatDateTime('yyyymmdd', tFaseInicio.Value) then
  begin
    Beep;
    ShowMessage('Data maior que data programada para Inicio!');
    Exit;
  end;  

  with DM do 
  if Fim then
  if FormatDateTime('yyyymmdd', edData.AsDateTime) > FormatDateTime('yyyymmdd', tFaseTermino.Value) then
  begin
    Beep;
    ShowMessage('Data maior que data programada para Término!');
    Exit;
  end;  

  with DM do 
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
  end;  

  with DM do
  if (not tParametroTodasHorasNoFeriado.Value) and tFer.FindKey([edData.AsDateTime]) and (tApontaTipoHoraTipo.Value<>'F') then
  begin
     Beep;
     ShowMessage('Feriados tem que ser hora 100% / Fim de semana');
     Exit;
   end;

  Result := True;
end;

procedure TFrmAponta.btnOkClick(Sender: TObject);
begin
  if not Valida then Exit;
  with DM do
  if (tAponta.State in [dsEdit, dsInsert]) then begin
    nxdb.StartTransaction;
    try
      tAponta.Post;
      SalvaDescr;
      tFase.Edit;
      if edNovaEst.AsInteger>0 then 
        tFasePercEst.AsInteger := edNovaEst.AsInteger;
        
      tFaseHorasReal.Value :=
        tFaseHorasReal.Value
        - DateTimeToHoras(OldDT)
        + DateTimeToHoras(tApontaHoras.Value);
      if Trim(tFaseStatus.Value) = '' then begin
        tFaseStatus.Value := 'I';
        tFaseDatReI.Value := edData.AsDateTime;
      end;  
      tFase.Post;  
      nxdb.Commit;  
    except
      tAponta.Cancel;
      tFase.Cancel;
      tDescr.Cancel;
      nxdb.Rollback;
      Raise;
    end;
    SomaHR(True);  
  end;
  Close; 
end;

procedure TFrmAponta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  DM.tAponta.Cancel;
end;

procedure TFrmAponta.FormShow(Sender: TObject);
begin
  OldDT := DM.tApontaHoras.Value;
  gbEst.Enabled := DM.tParametroEstimarFaseNoApontamento.Value;
  if DM.tAponta.State=dsInsert then
    lbObs.Caption := '* NÃO inclui esse apontamento'
  else
    lbObs.Caption := '* Incluir esse apontamento';  
  
  
  with DM do
  if (tApontaOS.Value > 0) or
     (not tApontaSync.Value) or
     (tApontaTecnico.Value <> IDTecnico) then
     Begin
        edHoras.Enabled := False;
        edData.Enabled  := False;
        edTipoHora.Enabled := False;
        wwDBLookupCombo1.Enabled := False;
        edDescr.ReadOnly := True;
     End
  else
     Begin
        edHoras.Enabled := True;
        edData.Enabled  := True;
        edTipoHora.Enabled := True;
        wwDBLookupCombo1.Enabled := True;
        edDescr.ReadOnly := False;
     End;
   lbFase.Caption := DM.tFaseID.Value + ' - ' + DM.tFaseNome.Value;
End;

procedure TFrmAponta.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmAponta.LeDescr;
begin
  tDescr.First;
  edDescr.Lines.Clear;
  while not tDescr.Eof do begin
    edDescr.Lines.Add(tDescrTexto.Value);
    tDescr.Next;
  end;
end;

procedure TFrmAponta.SalvaDescr;
var I : Integer;
begin
  tDescr.First;
  while not (tDescr.Eof and tDescr.Bof) do tDescr.Delete;
  with DM do
  for I := 0 to pred(edDescr.Lines.Count) do begin
    tDescr.Append;
    tDescrCliente.Value := tApontaCliente.Value;
    tDescrProjeto.Value := tApontaProjeto.Value;
    tDescrFase.Value    := tApontaFase.Value;
    tDescrItem.Value    := tApontaItem.Value;
    tDescrTecnico.Value := tApontaTecnico.Value;
    tDescrData.Value    := tApontaData.Value;
    tDescrOS.Value      := tApontaOS.Value;
    tDescrPos.Value     := I;
    tDescrTexto.Value := edDescr.Lines[I];
    tDescr.Post;
  end;  
end;

procedure TFrmAponta.FormCreate(Sender: TObject);
begin
  tDescr.Open;
end;

procedure TFrmAponta.tDescrBeforePost(DataSet: TDataSet);
begin
  tDescrSync.Value := True;
end;

procedure TFrmAponta.SpeedButton1Click(Sender: TObject);
begin
  Clipboard.AsText := TagIO;
  edDescr.PasteFromClipboard;
end;

procedure TFrmAponta.SpeedButton2Click(Sender: TObject);
begin
  Clipboard.AsText := TagFO;
  edDescr.PasteFromClipboard;
end;

end.
