unit uDTFrmFase;

interface

uses
  Windows, Messages, Variants, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, 
  DBCtrls, OvcEdSld, OvcDbSEd, OvcEdTim, OvcDbTim, OvcEditF, OvcEdPop,
  OvcEdCal, OvcDbDat, OvcBase, ExtCtrls, DB, OvcEF, OvcPB, OvcPF, OvcDbPF,
  ComCtrls, 
  ImgList,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  OvcSF, OvcDbSF, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxMaskEdit, cxDBLookupComboBox,
  cxImageComboBox, cxCheckBox, cxCalendar, cxTimeEdit, cxTextEdit,
  cxCurrencyEdit, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGridLevel,
  cxGrid, cxPC, wwdbedit, Wwdotdot, Wwdbcomb, LMDControl;

type
  TFrmFase = class(TForm)
    panBotoes: TLMDSimplePanel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    lbFase: TPanel;
    OvcController1: TOvcController;
    panDados: TLMDSimplePanel;
    GroupBox3: TGroupBox;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    edPercRea: TOvcDbSliderEdit;
    edPercEst: TOvcDbSliderEdit;
    edHoraPrv: TOvcDbPictureField;
    edHoraReal: TOvcDbPictureField;
    pnDif: TPanel;
    gpStatus: TGroupBox;
    Label4: TLabel;
    Label1: TLabel;
    edStatus: TwwDBComboBox;
    cbAlterar: TComboBox;
    gpDatas: TGroupBox;
    Label3: TLabel;
    Label2: TLabel;
    edValidador: TDBEdit;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    edIniPrev: TOvcDbDateEdit;
    edIniRea: TOvcDbDateEdit;
    edDataValid: TOvcDbDateEdit;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    edFimPrev: TOvcDbDateEdit;
    edFimRea: TOvcDbDateEdit;
    Paginas: TcxPageControl;
    TabSheet1: TcxTabSheet;
    TabSheet2: TcxTabSheet;
    ImageList1: TImageList;
    tsSugestao: TcxTabSheet;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    edNovoHor: TOvcDbPictureField;
    edNovoIni: TOvcDbPictureField;
    edNovoFim: TOvcDbPictureField;
    edJustific: TOvcDbSimpleField;
    edMotSug: TComboBox;
    Label18: TLabel;
    edFlagSug: TComboBox;
    Label19: TLabel;
    Label20: TLabel;
    edCliSug: TOvcDbSimpleField;
    tsObs: TcxTabSheet;
    edObs: TDBMemo;
    gridTec: TcxGrid;
    glTec: TcxGridLevel;
    tvTec: TcxGridDBTableView;
    tvTecTecnico1: TcxGridDBColumn;
    tvTecNomeTec1: TcxGridDBColumn;
    gridDep: TcxGrid;
    glDep: TcxGridLevel;
    tvDep: TcxGridDBTableView;
    tvDepFasePai1: TcxGridDBColumn;
    tvDepNomeFasePai1: TcxGridDBColumn;
    tvDepTipo1: TcxGridDBColumn;
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbAlterarChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edMotSugChange(Sender: TObject);
  private
    procedure AjustaObs;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFase: TFrmFase;
  StatusA: String;

implementation

uses uDTDM, uDTFrmPri;

{$R *.DFM}

function FlagToIndex(S: String): Integer;
begin
  if S='NP' then
    Result := 1
  else  
  if S='AN' then
    Result := 2
  else 
  if S='LN' then
    Result := 3
  else
    Result := 0;
end;

function IndexToFlag(I: Integer): String;
begin
  case I of
    0 : Result := 'NN';
    1 : Result := 'NP';
    2 : Result := 'AN';
    3 : Result := 'LN';
  else
    Result := '';
  end;
end;

function MotivoToIndex(S: String): Integer;
begin
  if S='N' then
    Result := 0
  else 
  if S='C' then
    Result := 1
  else
  if S='D' then
    Result := 2
  else
  if S='E' then
    Result := 3
  else
    Result := -1;      
end;

function IndexToMotivo(I: Integer): String;
begin
  case I of
    0 : Result := 'N';
    1 : Result := 'C';
    2 : Result := 'D';
    3 : Result := 'E';
  else
    Result := '';  
  end;
end;

procedure TFrmFase.btnOkClick(Sender: TObject);
var IDSug: Integer;
begin
  if not (DM.tFase.State in [dsInsert, dsEdit]) then begin
    if Sender = btnOk then Close;
    Exit;
  end;  
  
  with DM do
  if tsSugestao.Enabled then 
  if edMotSug.ItemIndex > 0 then begin
    if (tFaseNovoHor.Value>0) and (tFaseNovoHor.Value < tFaseHorasReal.Value) then begin
      Beep;
      ShowMessage('Já foram apontadas mais horas do que o novo número de horas sugerido');
      Exit;
    end;  

    if (tFaseNovoFim.Value>1) and (tFaseNovoFim.Value<Date) then begin  
      Beep;
      ShowMessage('Nova data de término é anterior a data de hoje!');
      Exit;
    end;

    if (edMotSug.ItemIndex=1) and (Trim(edJustific.AsString)='') then begin
      Beep;
      ShowMessage('É necessário informar o nome de quem fez a sugestão');
      edCliSug.SetFocus;
      Exit;
    end;
    
    tFaseDataSug.Value := Date;
    tFaseSyncSug.Value := True;
    tFaseTecSug.Value := IDTecnico;
    tFaseMotSug.AsString := IndexToMotivo(edMotSug.ItemIndex);
    if edFlagSug.ItemIndex<1 then
      edFlagSug.ItemIndex := 1;
      
    tFaseFlagSug.Value   := IndexToFlag(edFlagSug.ItemIndex);
  end else begin
    tFaseTecSug.Clear;
    tFaseNovoHor.Clear;
    tFaseNovoIni.Clear;
    tFaseNovoFim.Clear;
    tFaseJustific.Clear;
    tFaseMotSug.Clear;
    tFaseFlagSug.Clear;
    tFaseCliSug.Clear;
    tFaseDataSug.Clear;
  end;

  with DM do
  case cbAlterar.ItemIndex of
    1 : begin
          if (tFaseStatus.Value='C') or (tFaseStatus.Value='V') then begin
            tFaseStatus.Value := 'I';
            tFasePercEst.Value := Trunc(tFasePercRealizado.Value);
          end;  
          tFaseStatus.Value := 'I';
          tFaseDatReF.AsVariant := null;
          tFaseDataVld.AsVariant := null;
        end;  
          
    2 : begin
          tFaseStatus.Value := 'C';
          tFaseDatReF.Value := Date;
          tFaseDataVld.AsVariant := null;
          tFasePercEst.Value := 100;
        end;    
          
    3 : begin
          tFaseStatus.Value := 'V';
          if (tFaseDatReF.AsVariant = null) or (tFaseDatReF.Value < tFaseDatReI.Value) then
            tFaseDatReF.Value := Date;
          tFasePercEst.Value := 100;  
          tFaseDataVld.Value := Date;  
        end;
  end;  

  DM.nxDB.StartTransaction;
  with DM do
  try
    tFase.Post;
    if tFaseSumario.Value and ((tFaseStatus.Value='V') or (tFaseStatus.Value='C')) and
       (tFaseStatus.Value<>StatusA) then
      NovoStatusPai(tFaseID.Value, tFaseStatus.Value); 
      
    DM.nxdb.Commit;
  except
    DM.nxdb.Rollback;
    Raise;
  end;  
  if Sender = btnOk then Close;
end;

procedure TFrmFase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.tFase.Cancel;
  Action := caFree;
end;

procedure TFrmFase.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmFase.FormShow(Sender: TObject);
begin
  with DM do begin
    StatusA := tFaseStatus.Value;
    tFase.Edit;
    edMotSug.ItemIndex := MotivoToIndex(tFaseMotSug.Value);
    edFlagSug.ItemIndex := FlagToIndex(tFaseFlagSug.Value);
    
    tsSugestao.Enabled := ((tFaseSyncSug.Value=True) or 
                           (tFaseFlagSug.Value='NN') or
                           (tFaseFlagSug.Value='')) and
                           (tFaseStatus.Value<>'V');

    edMotSugChange(nil);  

    AjustaObs; 

    panDados.Enabled := (tFaseSync.Value=True) or (tFaseStatus.Value<>'V');
    
    edPercEst.Enabled := (edStatus.ItemIndex<2);
    
    cbAlterarChange(nil);
  end;  
end;

procedure TFrmFase.cbAlterarChange(Sender: TObject);
begin
  with DM do
  edValidador.Enabled := ((edStatus.ItemIndex>1) or
                          (cbAlterar.ItemIndex>1)) and
                         (tFaseSync.Value or (tFaseStatus.Value<>'V'));
  AjustaObs;
  if edObs.Enabled then
    Paginas.ActivePage := tsObs;                         
end;

procedure TFrmFase.FormCreate(Sender: TObject);
var P: Integer;
begin
  Paginas.ActivePageIndex := 0;
  cbAlterar.ItemIndex := 0;
  lbFase.Caption := DM.tFaseID.Value + ' - ' + DM.tFaseNome.Value;
  pnDif.Caption :=  FloatToStr(DM.tFaseHoras.Value - DM.tFaseHorasReal.Value);
  P := Pos(',', pnDif.Caption);
  if P=0 then P := Pos('.', pnDif.Caption);
  if P>0 then
    pnDif.Caption := Copy(pnDif.Caption, 1, P+2);
  if (DM.tFaseHoras.Value - DM.tFaseHorasReal.Value) > 0 then 
    pnDif.Color := clBlue 
  else 
    pnDif.Color := clRed;
  DM.tAmarraFase.Filter := '(FasePai>'+QuotedStr('')+') and (FaseFilho=' + QuotedStr(DM.tFaseID.Value)+')';
  DM.tAmarraFase.Filtered := True;
end;

procedure TFrmFase.FormDestroy(Sender: TObject);
begin
  DM.tAmarraFase.Filtered := False;
  DM.tAmarraFase.Filter   := '';
end;

procedure TFrmFase.edMotSugChange(Sender: TObject);
begin
  edNovoIni.Enabled := (DM.tFaseHorasReal.Value<=0.001) and (edMotSug.ItemIndex>0);
  edNovoFim.Enabled  := (edMotSug.ItemIndex>0);
  edNovoHor.Enabled  := edNovoFim.Enabled;
  edJustific.Enabled := edNovoFim.Enabled;
  edCliSug.Enabled   := (edMotSug.ItemIndex=1);
end;

procedure TFrmFase.AjustaObs;
begin
  with DM do begin
    tsObs.TabVisible := tFaseSumario.Value and ((tFaseStatus.Value='V') or (cbAlterar.ItemIndex=3));
    edObs.Enabled := tsObs.TabVisible and (((tFaseStatus.Value='V') and tFaseSync.Value) or (cbAlterar.ItemIndex=3));
  end;    
end;

end.
