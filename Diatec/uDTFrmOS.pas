unit uDTFrmOS;

interface

uses
  Windows, Messages, Variants, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dxBar, 
  StdCtrls, OvcBase, OvcEF, OvcPB, OvcPF, OvcDbPF, 
  Db, kbmMemTable, nxdb, ExtCtrls, 
  dxBarExtItems, Mask, DBCtrls, LMDSimpleLabel, LMDControl, LMDBaseControl,
  LMDBaseGraphicControl, LMDBaseLabel, LMDCustomSimpleLabel,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel, OvcNF,
  cxStyles, cxGraphics, cxEdit,
  cxImageComboBox, cxMaskEdit, cxCurrencyEdit, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxDBData, cxCheckBox, cxCalendar, cxTimeEdit,
  cxTextEdit, cxDBLookupComboBox, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGridLevel,
  cxGrid, cxVGrid, cxDBVGrid, cxInplaceContainer, cxPC, LMDDrawEdge,
  cxContainer, cxDropDownEdit, cxDBEdit, ovcdbnf, ovcsf, ovcdbsf, cxLabel,
  cxDBLabel, wwdbedit, Wwdotdot, Wwdbcomb, wwdblook;

type
  
  TEditRecord = record
    erNum       : Integer;
    erIncluir   : Boolean;
    erHoras     : TDateTime;
    erHorasA    : TDateTime;
    erHorasReal : Double;
    erHorasPrev : Integer;
    erLocaPla   : String[2];
    erProjeto   : String[10];
    erFase      : String[10];
    erTipoHora  : String[15];
    erOcorrencia: String[2];
    erTipoTH    : Char;
    erTHSemTrans: Char;
    erData      : TDateTime;
    erTranslado : TDateTime;
    erProjAbono : TDateTime;
    erProjMotAbono : String[2];
    erProjOSAbon   : Char;
    erProjTipo     : Char;
    erProjAbonaInt : Boolean;
  end;  
  
  TFrmOS = class(TForm)
    dxBarManager1: TdxBarManager;
    cmSalvar: TdxBarButton;
    cmCancelar: TdxBarButton;
    OvcController1: TOvcController;
    mtItens: TkbmMemTable;
    mtItensProjeto: TStringField;
    mtItensFase: TStringField;
    mtItensHoras: TDateTimeField;
    dsItems: TDataSource;
    mtItensIncluir: TBooleanField;
    tItens: TnxTable;
    tItensCliente: TStringField;
    tItensData: TDateTimeField;
    tItensTecnico: TStringField;
    tItensHoras: TDateTimeField;
    tItensSync: TBooleanField;
    mtItensItem: TIntegerField;
    mtItensNomeProjeto: TStringField;
    mtItensNomeFase: TStringField;
    tItensNomeProjeto: TStringField;
    tItensNomeFase: TStringField;
    LMDSimplePanel1: TLMDSimplePanel;
    panCabecalho: TLMDSimplePanel;
    Label1: TLabel;
    Label2: TLabel;
    lbTranslado: TLabel;
    lbAbonoTotal: TLabel;
    Label7: TLabel;
    edInicio: TOvcDbPictureField;
    edTermino: TOvcDbPictureField;
    edTotal: TOvcDbPictureField;
    edTranslado: TOvcDbPictureField;
    edAbonoTotal: TOvcDbPictureField;
    edMotAbono: TwwDBLookupCombo;
    LMDSimplePanel3: TLMDSimplePanel;
    mtItensUniqueKey: TStringField;
    cmVoltaHoras: TdxBarButton;
    cmDiferenca: TdxBarStatic;
    cmRatear: TdxBarButton;
    Timer1: TTimer;
    tF: TnxTable;
    tFHorasReal: TFloatField;
    tFCliente: TStringField;
    tFProjeto: TStringField;
    tFID: TStringField;
    tFFasePai: TStringField;
    tFNome: TStringField;
    tFInicio: TDateTimeField;
    tFTermino: TDateTimeField;
    tFHoras: TWordField;
    tFPercEst: TWordField;
    tFSync: TBooleanField;
    tFIDRetag: TStringField;
    tFSumario: TBooleanField;
    Label8: TLabel;
    edAssinou: TDBEdit;
    mtItensTipoHora: TStringField;
    tItensTipoHora: TStringField;
    tItensOS: TSmallintField;
    mtItensOcorrencia: TStringField;
    mtItensTipoTH: TStringField;
    tItensTipoTH: TStringField;
    tItensOcorrencia: TStringField;
    Label9: TLabel;
    edData: TOvcDbPictureField;
    tItensProjeto: TStringField;
    tItensFase: TStringField;
    tItensRevisao: TStringField;
    mtItensData: TDateTimeField;
    tAuxOS: TnxTable;
    mtItensMaxHoras: TIntegerField;
    tItensHorasReal: TFloatField;
    tItensProjetoLocaPla: TStringField;
    tItensHorasPrev: TIntegerField;
    tItensTranslado: TDateTimeField;
    lbLocal: TLabel;
    edLocal: TwwDBComboBox;
    mtItensNumTela: TIntegerField;
    mtItensOS: TIntegerField;
    tItensProjAbono: TDateTimeField;
    tItensProjOSAbon: TStringField;
    tItensProjMotAbono: TStringField;
    Label10: TLabel;
    tItensProjTipo: TStringField;
    edNumAtend: TOvcNumericField;
    tDesc: TnxTable;
    tDescCliente: TStringField;
    tDescTecnico: TStringField;
    tDescPos: TWordField;
    tDescTexto: TStringField;
    tDescSync: TBooleanField;
    tDescProjeto: TStringField;
    tDescFase: TStringField;
    tDescData: TDateTimeField;
    tDescOS: TSmallintField;
    dstItens: TDataSource;
    Paginas: TcxPageControl;
    tsApontamentos: TcxTabSheet;
    tsReembolso: TcxTabSheet;
    LMDSimplePanel4: TLMDSimplePanel;
    LMDSimplePanel5: TLMDSimplePanel;
    lbTotHoras: TLMDSimpleLabel;
    LMDSimplePanel2: TLMDSimplePanel;
    cbGeraReemb: TDBCheckBox;
    tItensNomeTipoHora: TStringField;
    tItensItem: TIntegerField;
    tItensLogID: TIntegerField;
    tItensDownOk: TBooleanField;
    tDescItem: TIntegerField;
    tDescLogID: TIntegerField;
    tDescDownOk: TBooleanField;
    vgR: TcxDBVerticalGrid;
    vgRTipoReemb: TcxDBEditorRow;
    vgRVeicProp: TcxDBEditorRow;
    vgROutroLocal: TcxDBEditorRow;
    vgRKmDestino: TcxDBEditorRow;
    vgRPedagio1: TcxDBEditorRow;
    vgRPedagio2: TcxDBEditorRow;
    vgRPedagio3: TcxDBEditorRow;
    vgRPedagio4: TcxDBEditorRow;
    vgRMotivo: TcxDBEditorRow;
    gridItens: TcxGrid;
    glItens: TcxGridLevel;
    tvItens: TcxGridDBTableView;
    tvItensProjeto1: TcxGridDBColumn;
    tvItensFase1: TcxGridDBColumn;
    tvItensIncluir1: TcxGridDBColumn;
    tvItensData1: TcxGridDBColumn;
    tvItensHoras1: TcxGridDBColumn;
    tvItensTipoHora1: TcxGridDBColumn;
    tvItensTipoTH1: TcxGridDBColumn;
    tvItensNomeProjeto1: TcxGridDBColumn;
    tvItensFase2: TcxGridDBColumn;
    tvItensNomeFase1: TcxGridDBColumn;
    tvItensOcorrencia1: TcxGridDBColumn;
    tvItensNumTela1: TcxGridDBColumn;
    mtItensIncID: TAutoIncField;
    tItensProjAbonaInt: TStringField;
    LMDDrawEdge1: TLMDDrawEdge;
    lbTempoTotal: TLabel;
    lbObrigaInt: TLabel;
    edObrigaInt: TcxDBImageComboBox;
    lbIInt: TLabel;
    edIInt: TOvcDbPictureField;
    edAbono: TOvcPictureField;
    lbAbono: TLabel;
    edFInt: TOvcDbPictureField;
    lbFInt: TLabel;
    lbValorTrans: TLabel;
    LMDDrawEdge2: TLMDDrawEdge;
    edObs: TOvcDbSimpleField;
    Label4: TLabel;
    edValorTrans: TcxDBCurrencyEdit;
    lbNomeCliente: TcxDBLabel;
    tItensTHSemTrans: TStringField;
    mtItensTHSemTrans: TStringField;
    procedure tItensBeforePost(DataSet: TDataSet);
    procedure cmSalvarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mtItensCalcFields(DataSet: TDataSet);
    procedure cmVoltaHorasClick(Sender: TObject);
    procedure cmRatearClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure edInicioChange(Sender: TObject);
    procedure edDataAfterExit(Sender: TObject);
    procedure edLocalChange(Sender: TObject);
    procedure cbGeraReembClick(Sender: TObject);
    procedure edTransladoChange(Sender: TObject);
    procedure edTransladoEnter(Sender: TObject);
    procedure edTransladoExit(Sender: TObject);
    procedure tvItensCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure tvItensIncluir1PropertiesChange(Sender: TObject);
    procedure tvItensHoras1PropertiesChange(Sender: TObject);
    procedure vgRTipoReembPropertiesChange(Sender: TObject);
    procedure edAbonoChange(Sender: TObject);
    procedure edObrigaIntPropertiesCloseUp(Sender: TObject);
  private
    Incluindo: Boolean;
    TemRA    : Boolean;
    TotHoras : TDateTime;
    Diferenca: TDateTime;
    PercDif  : TDateTime;
    TranslA  : TDateTime;
    HoraAcomp,
    EditandoT : Boolean;
    EditCache: Array[0..199] of TEditRecord;
    NumItens : Integer;
    JaTemTransladoHoje: Boolean;
    { Private declarations }

    function FaixaHorarioOk(TH: Char): Boolean;
    function TotalHorasExced(Indice: Integer): Double;
    function UltimoIncluido: Integer;

    procedure LeItens;
    procedure SalvaItens;
    procedure AjustaVisReembolso(AjustaGerar: Boolean);

    procedure ChecaOSState;

    function SemTrans: Boolean;
    
  public
    procedure CalcTotHoras;
    procedure NovaOS;
    procedure EditaOS;
    procedure AjustaTransladoProj;
    procedure AjustaAbonoProj;
    { Public declarations }
  end;

var
  FrmOS: TFrmOS;

implementation

uses uDTDM, uDTFrmAponta;

{$R *.DFM}

function TemHora(DT: TDateTime): Boolean;
begin
  Result := (FormatDateTime('hh:mm', DT) > '00:00');
end;

procedure TFrmOS.NovaOS;
begin
  Incluindo := True;
  DM.tOS.Append;
  LeItens;
  ShowModal;
end;

procedure TFrmOS.EditaOS;
begin
  Incluindo := False;
  with DM do 
  edAbono.AsDateTime := tOSAbono.Value - tOSTempoInt.Value;
  DM.tOS.Edit;
  LeItens;
  ShowModal;
end;

procedure TFrmOS.SalvaItens;
var I : Integer;
begin
  tItens.CancelRange;
  tItens.IndexName := 'IProjFase';
  I := 0;
  mtItens.First;
  with DM do
  while not mtItens.Eof do begin
    if tItens.FindKey([tOSCliente.Value, 
                       mtItensProjeto.Value,
                       mtItensFase.Value,
                       tOSTecnico.Value,
                       mtItensItem.Value]) then 
    begin
      tItens.Edit;
      with EditCache[I] do
      if erIncluir then begin
        tItensData.Value := DM.tOSData.Value;
        tItensOS.Value   := DM.tOSID.Value;
        tItensHoras.Value := mtItensHoras.Value;
        if erHoras <> erHorasA then
        if tF.FindKey([tOSCliente.Value, mtItensProjeto.Value, mtItensFase.Value]) then begin
          tF.Edit;
          tFHorasReal.Value := 
            tFHorasReal.Value - 
            DateTimeToHoras(erHorasA) + 
            DateTimeToHoras(erHoras);
          tF.Post;
        end;
      end else 
        tItensOS.Value   := -1;
{        tItensData.Clear;
      end;     }
        
      tDesc.First;
      while not tDesc.Eof do begin
        tDesc.Edit;
        tDescData.Value := tItensData.Value;
        tDescOS.Value := tItensOS.Value;
        tDesc.Post;
        tDesc.Next;
      end;  
      tItensSync.Value   := True;  
      tItens.Post;
    end;                   
    mtItens.Next;
    Inc(I);
  end;
end;

procedure TFrmOS.LeItens;

Procedure FazLeitura;
begin
  tItens.First;
  while not tItens.Eof do begin
    mtItens.Append;
    mtItensNumTela.Value    := NumItens;
    mtItensProjeto.Value    := tItensProjeto.Value;
    mtItensOS.Value         := tItensOS.Value;
    mtItensFase.Value       := tItensFase.Value;
    mtItensHoras.Value      := tItensHoras.Value;
    mtItensItem.Value       := tItensItem.Value;
    mtItensTipoHora.Value   := tItensTipoHora.Value;
    mtItensIncluir.Value    := (tItensOS.Value >= 0);
    mtItensTipoTH.Value     := tItensTipoTH.Value;
    mtItensOcorrencia.Value := tItensOcorrencia.Value;
    mtItensData.Value       := tItensData.Value;
    mtItensTHSemTrans.Value  := tItensTHSemTrans.Value;

    EditCache[NumItens].erIncluir    := mtItensIncluir.Value;
    EditCache[NumItens].erNum        := NumItens;
    EditCache[NumItens].erHoras      := tItensHoras.Value;
    EditCache[NumItens].erHorasA     := tItensHoras.Value;
    EditCache[NumItens].erTipoHora   := tItensTipoHora.Value;
    EditCache[NumItens].erProjeto    := tItensProjeto.Value;
    EditCache[NumItens].erFase       := tItensFase.Value;
    EditCache[NumItens].erOcorrencia := tItensOcorrencia.Value;
    EditCache[NumItens].erData       := tItensData.Value;
    EditCache[NumItens].erHorasReal  := tItensHorasReal.Value;
    EditCache[NumItens].erHorasPrev  := tItensHorasPrev.Value;
    EditCache[NumItens].erLocaPla    := tItensProjetoLocaPla.Value;
    EditCache[NumItens].erTranslado  := tItensTranslado.Value;

    HoraAcomp := (Pos('ACOMPANHAMENTO', UpperCase(tItensNomeTipoHora.Value))>0);
    
    EditCache[NumItens].erProjAbono  := tItensProjAbono.Value;
    EditCache[NumItens].erProjAbonaInt := (tItensProjAbonaInt.Value='S');
    EditCache[NumItens].erProjMotAbono := tItensProjMotAbono.Value;
    if tItensProjOSAbon.Value>'' then
      EditCache[NumItens].erProjOSAbon   := tItensProjOSAbon.Value[1]
    else  
      EditCache[NumItens].erProjOSAbon   := #0;
        
    if tItensTipoTH.Value>'' then
      EditCache[NumItens].erTipoTH     := tItensTipoTH.Value[1]
    else
      EditCache[NumItens].erTipoTH     := '-';  

    if tItensTHSemTrans.Value>'' then
      EditCache[NumItens].erTHSemTrans := tItensTHSemTrans.Value[1] else
      EditCache[NumItens].erTHSemTrans := 'N';

    if tItensProjTipo.Value>'' then
      EditCache[NumItens].erProjTipo   := tItensProjTipo.Value[1]
    else
      EditCache[NumItens].erProjTipo   := '-';  
      
    mtItensNomeProjeto.Value := tItensNomeProjeto.Value;
    mtItensNomeFase.Value := tItensNomeFase.Value;
    mtItens.Post;
    tItens.Next;
    Inc(NumItens);
  end;
end;

begin
  tvItens.DataController.DataModeController.GridMode := False;
  mtItens.DisableControls;
  NumItens := 0;
  try
    mtItens.EmptyTable;
    tItens.IndexName := 'ICliTecOS';
  
    with DM do 
    if not Incluindo then begin
      tItens.CancelRange;
      tItens.SetRange([tOSCliente.Value, tOSTecnico.Value, tOSID.Value, tOSData.Value],
                      [tOSCliente.Value, tOSTecnico.Value, tOSID.Value, tOSData.Value]);
      FazLeitura;
    end;
  
    tItens.CancelRange;
    
    with DM do    
    if Incluindo or tOSSync.Value then begin
      tItens.SetRange([tOSCliente.Value, tOSTecnico.Value, -1],
                      [tOSCliente.Value, tOSTecnico.Value, -1]);
      FazLeitura;
    end;  
  finally
    mtItens.EnableControls;
  end;    
end;

procedure TFrmOS.tItensBeforePost(DataSet: TDataSet);
begin
  tItensSync.Value := True;
end;


procedure TFrmOS.cmSalvarClick(Sender: TObject);
var
  I,Mark : Integer;
  THAnt, TH: String;
  THC : String;
  ProjAnt: String;
  ProjTipo : String;
  Translado: TDateTime;
  V : Variant;
  HR, Tot : Double;
begin
  if not Incluindo and TemRA then
    Raise Exception.Create('Não é possível alterar uma OS que faz parte de um relatório de atendimento ... '+
                           'Você pode excluir o relatório para alterar a OS ou mesmo tirar essa OS do relatório.');
                           
  vgR.DataController.PostEditingData;
  tvItens.DataController.PostEditingData;
  TH    := FormatDateTime('ddmmyyyy', edData.AsDateTime);
  for I := 0 to pred(NumItens) do with EditCache[I] do
  if erIncluir and (TH <> FormatDateTime('ddmmyyyy', erData)) then
  begin
    Beep;
    ShowMessage('Data da OS diferente do(s) apontamento(s) ('+FormatDateTime('ddmmyyyy', erData)+')');
    Exit;
  end;


  if FormatDateTime('hh:mm', edTermino.AsDateTime) <= FormatDateTime('hh:mm', edInicio.AsDateTime) then
  begin
    Beep;
    ShowMessage('Não é permitido ter uma OS que começa em um dia e termina em outro.');
    Exit;
  end;

  edValorTrans.PostEditValue;
  
  if (edValorTrans.Value>0.009) and (edTranslado.AsDateTime<EncodeTime(0,1,0,0)) then
  begin
    Beep;
    ShowMessage('Não pode haver um valor de translado se não há translado');
    Exit;
  end;
  

  with DM do begin
    if (tOSLocal.Value<>'C') and (tOSLocal.Value<>'M') then begin
      Beep;
      ShowMessage('É necessário informar o local');
      Exit;
    end;

    if (tOSObrigaInt.Value='S') and (tOSTempoInt.Value=0) then begin
      Beep;
      ShowMessage('É necessário informar o I.I. e o F.I.');
      Exit;
    end;

    if tOSObrigaInt.Value='S' then begin
      if tOSFInt.Value <= tOSIInt.Value then begin
        Beep;
        ShowMessage('O F.I. não pode ser anterior ao I.I.');
        Exit;
      end;

      if tOSIInt.Value < tOSInicio.Value then begin
        Beep;
        ShowMessage('O I.I. não pode ser anterior ao Inicio');
        Exit;
      end;

      if tOSIInt.Value > tOSTermino.Value then begin
        Beep;
        ShowMessage('O I.I. não pode ser posterior ao Término');
        Exit;
      end;

      if tOSFInt.Value > tOSTermino.Value then begin
        Beep;
        ShowMessage('O F.I. não pode ser posterior ao Término');
        Exit;
      end;

      if DateTimeToHoras(tOSTempoInt.Value) < 1 then begin
        Beep;
        ShowMessage('O intervalo entre I.I. e F.I. não pode ser inferior a 1h');
        Exit;
      end;
    end;

  end;
  
  
  THAnt := '';
  THC := '';
  for I := 0 to pred(NumItens) do
  if EditCache[I].erIncluir then begin
    if (THAnt <> EditCache[I].erTipoHora) and (THAnt<>'') then begin
      Beep;
      ShowMessage('Não é possível misturar tipos de hora diferentes na mesma OS!');
      Exit;
    end;
    THAnt := EditCache[I].erTipoHora;
    THC := EditCache[I].erTipoTH;
  end;

  if THC>'' then
  if not FaixaHorarioOk(THC[1]) then Exit;

  ProjAnt := '';    
  for I := 0 to pred(NumItens) do
  if EditCache[I].erIncluir then begin
    if (ProjAnt <> EditCache[I].erProjeto) and (ProjAnt<>'') then begin
      Beep;
      ShowMessage('Não é possível misturar projetos diferentes na mesma OS!');
      Exit;
    end;
    ProjAnt := EditCache[I].erProjeto;
  end;

  DM.tOSProjeto.Value := ProjAnt;
  with DM do
  if tParametroExigeAutorizadoPor.Value and (Trim(edAssinou.Text)='') then begin
    Beep;
    ShowMessage('Campo "Autorizado" deve ser preenchido!');
    Exit;
  end;

  ProjTipo := '';
  THAnt := 'ZZZ';
  for I := 0 to pred(NumItens) do
  if EditCache[I].erIncluir then begin
    ProjTipo := EditCache[I].erProjTipo;
    if (THAnt <> EditCache[I].erOcorrencia) and (THAnt<>'ZZZ') then begin
      Beep;
      ShowMessage('Não é possível misturar ocorrências diferentes na mesma OS!');
      Exit;
    end;
    THAnt := EditCache[I].erOcorrencia;
  end;

  Mark := 0;
  for I := 0 to pred(NumItens) do
  If (EditCache[I].erIncluir) then Mark := Mark + 1;
  If Mark = 0 then begin
     Beep;
     ShowMessage('Não foram selecionados apontamentos para esta OS');
     Exit;
  end;

  for I := 0 to pred(NumItens) do with EditCache[I] do
  if erIncluir and (Copy(erLocaPla, 1, 1)='H') then begin
    HR := erHorasReal;
    Tot := TotalHorasExced(I);
    if (Tot + HR) > erHorasPrev then begin
      Beep;
      ShowMessage('Limite de horas excedido na fase '+erFase+' em '+
                 FloatToStr(Tot+HR-erHorasPrev)+' horas');
      Exit;
    end;
  end;

  if (ProjTipo='H') then begin
    if edNumAtend.AsInteger=0 then begin
      Beep;
      ShowMessage('É necessário informar o número do atendimento no Help Desk');
      Exit;
    end;
  end else
  if edNumAtend.AsInteger > 0 then begin
    Beep;
    edNumAtend.AsInteger := 0;
    ShowMessage('Esse chamado não foi originado pelo Help Desk. Nº de atendimento do help desk será zerado.');
    Exit;
  end;

  if edNumAtend.AsInteger=0 then
    DM.tOSNumAtend.Value := ''
  else
    DM.tOSNumAtend.Value := edNumAtend.Text;  
  

  V := null;
  
  for I := 0 to pred(NumItens) do 
  with DM, EditCache[I] do 
  if erIncluir and (V=null) then begin
    if tAuxProj.FindKey([qCliID.Value, erProjeto]) then
      V := tAuxProj.FieldByName('Translado').Value
    else
      V := 0;
  end;
  if V=null then V := 0;      
  Translado := V;

  if (Translado=0)  and (not DM.tParametroForcaTransladoProj.Value) then
    Translado := DM.qCliTranslado.Value;   

  if (Translado>0) or DM.tParametroTravarTranslado.Value then  
  if edTranslado.AsDateTime > Translado then begin
    Beep;
    ShowMessage('Limite de translado deste projeto / cliente é de ' +
                FormatDateTime('hh:mm', Translado));
    Exit;
  end;

  if (FormatDateTime('hhmm', edAbono.AsDateTime)>'0000') and (edMotAbono.Text='') then begin
    Beep;
    ShowMessage('É preciso informar o motivo do abono');
    edMotAbono.SetFocus;
    Exit;
  end;

  with DM do
  if (tOSTipoReemb.Value='2') and tOSGeraReemb.Value then begin
    if Trim(tOSOutroLocal.Value)='' then begin
      Beep;
      ShowMessage('O Campo Local deve ser preenchido com o código do cliente!');
      Exit;
      Paginas.ActivePageIndex := 1;
    end;
    if tOSOutroLocal.Value=tOSCliente.Value then begin
      Beep;
      ShowMessage('O Campo Local não pode ser igual ao cliente dessa OS!');
      Exit;
      Paginas.ActivePageIndex := 1;
    end;
    if not tAuxCli.FindKey([tOSOutroLocal.Value]) then begin
      Beep;
      ShowMessage('O Campo Local digitado não corresponde ao código de nenhum cliente!');
      Exit;
      Paginas.ActivePageIndex := 1;
    end;
  end;

  with DM do
  if ConflitoOSID(tOSCliente.Value, tOSData.Value, edInicio.AsDateTime, edTermino.AsDateTime, tOSID.Value) then begin
    Beep;
    ShowMessage('Conflito de horário com outra OS !');
    Exit;
  end;  
  
  with DM do begin
    nxdb.StartTransaction;
    try
      tOSDataComp.Value := Date;
      if tsReembolso.TabVisible then begin
        if tOSTipoReemb.Value < '3' then begin
          tOSKMDestino.Value := 0;
          tOSPedagio1.Value := 0;
          tOSPedagio2.Value := 0;
          tOSPedagio3.Value := 0;
          tOSPedagio4.Value := 0;
          tOSMotivo.Value := '';
          if tOSTipoReemb.Value='1' then
            tOSOutroLocal.Value := '';
        end else
        if tOSTipoReemb.Value='3' then
          tOSOutroLocal.Value := '';
      end else begin
        tOSGeraReemb.Value := False;
        tOSOutroLocal.Value := '';
        tOSKMDestino.Value := 0;
        tOSPedagio1.Value := 0;
        tOSPedagio2.Value := 0;
        tOSPedagio3.Value := 0;
        tOSPedagio4.Value := 0;
        tOSMotivo.Value := '';
      end;
      
      if tProj.FindKey([tOSProjeto.Value]) then
        tOSVersaoProj.Value := tProjVersaoProj.Value;
      
      tOS.Post;
      SalvaItens;
      nxdb.Commit;
      Close;
    except
      tItens.Cancel;
      tOS.Cancel;
      nxdb.Rollback;
      Raise;
    end;
  end;
end;

procedure TFrmOS.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmOS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  DM.tOS.Cancel;
end;

procedure TFrmOS.FormCreate(Sender: TObject);
begin
  TemRA := False;
  EditandoT := False;
  HoraAcomp := False;
  lbLocal.Visible := False;
  edLocal.Visible := DM.tParametroCampoLocalOS.Value;
  
{  edTranslado.Enabled := not DM.tParametroTravarTranslado.Value;}
  
  FillChar(EditCache, SizeOf(EditCache), 0);
  mtItens.Active := True;
  tItens.Active := True;
  tDesc.Open;
  tF.Active := True;
end;

procedure TFrmOS.edAbonoChange(Sender: TObject);
begin
  CalcTotHoras;
  edMotAbono.Enabled := (DateTimeToHoras(edAbono.AsDateTime) > 0.009);
end;

procedure TFrmOS.FormShow(Sender: TObject);
begin
  with DM do begin
    lbObrigaInt.Visible := tParametroAtivarIntervalo.Value;
    edObrigaInt.Visible := lbObrigaInt.Visible;
    lbIInt.Visible := lbObrigaInt.Visible;
    edIInt.Visible := lbObrigaInt.Visible;
    lbFInt.Visible := lbObrigaInt.Visible;
    edFInt.Visible := lbObrigaInt.Visible;
    edValorTrans.Enabled := tParametroAtivarValorTrans.Value;
    lbValorTrans.Enabled := edValorTrans.Enabled;
    
    JaTemTransladoHoje := tParametroTransladoUnicoPorCliente.Value and
                          TemTranslado(tOSCliente.Value, tOSData.AsDateTime, tOSID.Value);
    if tParametroPermitirRateio.Value then
      cmRatear.Visible := ivAlways
    else
      cmRatear.Visible := ivNever;
    edNumAtend.AsInteger := StrToIntDef(tOSNumAtend.Value, 0);
  end;      
    
  with DM do begin
    ChecaOSState;

    if tOSObrigaInt.Value<>'S' then
      tOSObrigaInt.Value := 'N';
       
    tAuxRAOS.Active := True;
    tAuxRAOS.IndexName := 'IOS';
    gridItens.Enabled := Incluindo or tOSSync.Value;
    TemRA := (not Incluindo) and tAuxRAOS.FindKey([tOSTecnico.Value, tOSCliente.Value, tOSData.Value, tOSID.Value]);
  end;
  
  vgR.Enabled := gridItens.Enabled;
  
  AjustaTransladoProj;
  AjustaAbonoProj;
  edAbonoChange(nil);
  CalcTotHoras;
  panCabecalho.Enabled := gridItens.Enabled;
  if not gridItens.Enabled then cmSalvar.Visible := ivNever;
  cmRatear.Enabled := gridItens.Enabled;
  cmVoltaHoras.Enabled := gridItens.Enabled;
  AjustaVisReembolso(Incluindo);
end;

procedure TFrmOS.CalcTotHoras;
var 
  I : Integer;
  St: String;
  AbonaInt: Boolean;
begin
  TotHoras := 0;
  if NumItens=0 then Exit;
  AbonaInt := False;
  
  with gridItens do
  for I := 0 to pred(NumItens) do
  if EditCache[I].erIncluir then begin
    TotHoras := TotHoras + EditCache[I].erHoras;
    AbonaInt := EditCache[I].erProjAbonaInt;
  end;

  with DM do  
  if tOS.State in [dsInsert, dsEdit] then begin
    if AbonaInt then
      tOSAbonaInt.Value := 'S' else
      tOSAbonaInt.Value := 'N';

    if AbonaInt then
      tOSAbono.Value := tOSTempoInt.Value + edAbono.AsDateTime else
      tOSAbono.Value := edAbono.AsDateTime;

    if tParametroAtivarIntervalo.Value then begin
      if (DateTimeToHoras(TotHoras)>=6) then
      begin
        tOSObrigaInt.Value := 'S';
        edObrigaInt.Enabled := False;
        lbObrigaInt.Enabled := False;
        edObrigaIntPropertiesCloseUp(nil);  
      end else begin
        edObrigaInt.Enabled := True;
        lbObrigaInt.Enabled := True;
      end;
    end;
  end;
  
  lbAbonoTotal.Visible := (DM.tOSAbono.Value <> edAbono.AsDateTime);
  edAbonoTotal.Visible := lbAbonoTotal.Visible;
    
  Diferenca := Frac(TotHoras - DM.tOSTotalHoras.Value);

  if (Abs(Diferenca) > 0.000001) and (TotHoras > 0.000001) then
    PercDif := Abs(Diferenca / TotHoras)
  else
    PercDif := 0;  

  if Diferenca < 0 then
    St := '-'
  else
    St := '+';

  cmDiferenca.Caption := 'Diferença (' + St +
                         FormatDateTime('hh:mm', Diferenca) + ')';
                         
  cmRatear.Enabled := (Diferenca<0);

  if Abs(Diferenca) < 0.00001 then begin
    cmDiferenca.Visible := ivNever;
    cmRatear.Visible := ivNever;
  end else begin
    cmDiferenca.Visible := ivAlways;
    with DM do 
    if tParametroPermitirRateio.Value then
      cmRatear.Visible := ivAlways
    else
      cmRatear.Visible := ivNever;
  end;
  
  lbTotHoras.Caption := ' Total de Horas Incluidas = ' + FormatDateTime('hh:mm', TotHoras);
  
  cmSalvar.Enabled := (Abs(Diferenca) < 0.0000001) and
                      (DM.tOSTotalHoras.Value > 0.00001)
end;


procedure TFrmOS.mtItensCalcFields(DataSet: TDataSet);
begin
  mtItensUniqueKey.Value := mtItensProjeto.Value + mtItensFase.Value + mtItensItem.AsString;
end;

procedure TFrmOS.AjustaAbonoProj;
var I : Integer;
begin
  if not gridItens.Enabled then Exit;
  
  with DM do 
  for I := 0 to pred(NumItens) do with EditCache[I] do
  if erIncluir then begin
    if (erProjOSAbon='S') then begin
      edAbono.Enabled := True;
      if TemHora(erProjAbono) and (not TemHora(edAbono.AsDateTime)) then begin
        tOSAbono.Value := erProjAbono;
        tOSMotivoAbon.Value := erProjMotAbono;
      end;  
    end else begin
      edAbono.Enabled := True;
{      tOSAbono.Value := 0;
      tOSMotivoAbon.Value := '';}
    end;  
    Exit;  
  end;
end;

function TFrmOS.SemTrans: Boolean;
var I : Integer;
begin
  Result := True;
  for I := 0 to pred(NumItens) do with EditCache[I] do
    if erIncluir and SameText(erTHSemTrans, 'S') then Exit;
  Result := False;
end;

procedure TFrmOS.AjustaTransladoProj;
var I : Integer;
begin
  with DM do begin
    if tParametroTravarTranslado.Value then
      edTranslado.Enabled := False;
      
    // Não pode haver dois translados para o mesmo cliente / tecnico / dia
    if SemTrans or JaTemTransladoHoje or (edLocal.Value='M') then begin
      edTranslado.Enabled := False;
      edTranslado.AsDateTime := 0;
      tOSTranslado.Value := 0;
      Exit;
    end;  
    
    for I := 0 to pred(NumItens) do with EditCache[I] do
    if erIncluir and TemHora(erTranslado) then begin
      // translado travado sempre força translado do projeto (ou cliente)
      if tParametroTravarTranslado.Value then
        tOSTranslado.Value := erTranslado
      else begin
        // translado não é travado, manter translado informado pelo usuário ou corrigir caso seja maior
        if not edTranslado.Modified or
           ((edTranslado.AsDateTime > erTranslado) and (erTranslado>0))
        then
          tOSTranslado.Value := erTranslado;

        if erTranslado > 0 then
          edTranslado.RangeHi := FormatDateTime('hh:mm', erTranslado);
      end;  
      Exit;
    end;

    // Não existe translado informado pelo projeto pegar do cliente

    if not tParametroForcaTransladoProj.Value then
    if tParametroTravarTranslado.Value then begin
      // translado travado sempre força translado do cliente (ou projeto)
      tOSTranslado.Value := qCliTranslado.Value;
      Exit;
    end else begin
      if not edTranslado.Modified or
         ((edTranslado.AsDateTime > qCliTranslado.Value) and (qCliTranslado.Value>0)) then
        tOSTranslado.Value := qCliTranslado.Value;

      if qCliTranslado.Value > 0 then  
        edTranslado.RangeHi := FormatDateTime('hh:mm', qCliTranslado.Value);
    end;
  end;  
end;

procedure TFrmOS.cmVoltaHorasClick(Sender: TObject);
var I : Integer;
begin
  mtItens.DisableControls;
  try
    mtItens.First;
    I := 0;
    while not mtItens.Eof do begin
      mtItens.Edit;
      mtItensHoras.Value := EditCache[I].erHorasA;
      mtItensIncluir.Value := EditCache[I].erIncluir;
      EditCache[I].erHoras := EditCache[I].erHorasA;
      mtItens.Post;
      mtItens.Next;
      Inc(I); 
    end;
  finally
    mtItens.EnableControls;
  end;
  Timer1.Enabled := True;
end;

function TFrmOS.UltimoIncluido: Integer;
var I: Integer;
begin
  Result := -1;
  for I := 0 to pred(NumItens) do with EditCache[I] do
  if erIncluir then Result := I;
end;

procedure TFrmOS.cmRatearClick(Sender: TObject);
var 
  I, Ult : Integer;
  T, Tot : TDateTime;
  H, M, S, MS : Word;
begin
  mtItens.DisableControls;
  try
    mtItens.First;
    I := 0;
    Tot := 0;
    Ult := UltimoIncluido;
    while not mtItens.Eof do 
    with EditCache[I] do begin
      mtItens.Edit;
      if erIncluir then begin
        T := erHorasA + (erHorasA * PercDif);
        DecodeTime(T, H, M, S, MS);
        erHoras := EncodeTime(H, M, 0, 0);
        Tot := Tot + erHoras;
        if (I=Ult) then 
          erHoras := erHoras + (DM.tOSTotalHoras.Value - Tot);
        mtItensHoras.Value := erHoras;
      end;
      mtItensIncluir.Value := erIncluir;
      mtItens.Post;
      mtItens.Next;
      Inc(I); 
    end;  
  finally
    mtItens.EnableControls;
  end;
  Timer1.Enabled := True;    
end;

procedure TFrmOS.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  CalcTotHoras;
end;

procedure TFrmOS.edInicioChange(Sender: TObject);
begin
  CalcTotHoras;
end;

function TFrmOS.TotalHorasExced(Indice: Integer): Double;
var I : Integer;
begin
  Result := 0;
  for I := 0 to Pred(NumItens) do with EditCache[I] do
  if erIncluir and (erFase=EditCache[Indice].erFase) and (erProjeto=EditCache[Indice].erProjeto) then
    Result := Result + DateTimeToHoras(erHoras-erHorasA);
end;

function TFrmOS.FaixaHorarioOk(TH: Char): Boolean;
var 
  I, F: String;
  EFeriado: Boolean;
begin
  with DM do 
    EFeriado := tFer.FindKey([tOSData.Value]);
    
  I := FormatDateTime('hh:mm', DM.tParametroInicioDiurno.Value);
  F := FormatDateTime('hh:mm', DM.tParametroFimDiurno.Value);
  Result := False;
  with DM do
  case TH of
    'F' : 
    if not ((DayOfWeek(tOSData.Value) in [1, 7]) or EFeriado) then begin
      Beep;
      ShowMessage('Hora de Fim de Semana tem que ser realizada no sábado ou domingo ou feriados!');
      Exit;
    end;
  
    'D' : 
    if tParametroRestringeDiurno.Value then
    if (DayOfWeek(tOSData.Value) in [1, 7]) or EFeriado then begin
      Beep;
      ShowMessage('Hora diurna não pode constar em OS realizada no fim de semana ou feriados!');
      Exit;
    end else
    if (FormatDateTime('hh:mm', edInicio.AsDateTime)  < I) or
       (FormatDateTime('hh:mm', edInicio.AsDateTime)  > F) or
       (FormatDateTime('hh:mm', edTermino.AsDateTime) < I) or
       (FormatDateTime('hh:mm', edTermino.AsDateTime) > F) then
    begin
      Beep;
      ShowMessage('Hora diurna tem que ter inicio e termino dentro de ' + I + ' às ' + F + 'hs');
      Exit;
    end;   

    'N' : 
    if (DayOfWeek(tOSData.Value) in [1, 7]) or EFeriado then begin
      if tParametroRestringeDiurno.Value then begin
        Beep;
        ShowMessage('Hora Noturna não pode constar em OS realizada no fim de semana ou feriados!');
        Exit;
      end;  
    end else
    if ((FormatDateTime('hh:mm', edInicio.AsDateTime)  >= I) and  
        (FormatDateTime('hh:mm', edInicio.AsDateTime)  < F)) 
        or
       ((FormatDateTime('hh:mm', edTermino.AsDateTime) > I) and
        (FormatDateTime('hh:mm', edTermino.AsDateTime) <= F)) 
        or 
       ((FormatDateTime('hh:mm', edInicio.AsDateTime) <= I) and
        (FormatDateTime('hh:mm', edTermino.AsDateTime) >= F)) then
    begin
      Beep;
      ShowMessage('Hora Noturno tem que ter inicio e término fora de ' + I + ' às ' + F + 'hs');
      Exit;
    end;
  end;     
  Result := True;
end;

procedure TFrmOS.edDataAfterExit(Sender: TObject);
begin
  with DM do
    JaTemTransladoHoje := TemTranslado(tOSCliente.Value, edData.AsDateTime, tOSID.Value);
  AjustaTransladoProj;
  AjustaAbonoProj;
  CalcTotHoras;
end;

procedure TFrmOS.edLocalChange(Sender: TObject);
begin
  if DM.tOS.State in [dsInsert, dsEdit] then
    AjustaTransladoProj;
end;

procedure TFrmOS.edObrigaIntPropertiesCloseUp(Sender: TObject);
begin
  lbIInt.Enabled := (DM.tOSObrigaInt.Value='S');
  edIInt.Enabled := lbIInt.Enabled;
  lbFInt.Enabled := lbIInt.Enabled;
  edFInt.Enabled := lbIInt.Enabled;

  if not lbIInt.Enabled then begin
    ChecaOSState;
    DM.tOSIInt.Clear;
    DM.tOSFInt.Clear;
    CalcTotHoras;
  end;
end;

procedure TFrmOS.AjustaVisReembolso(AjustaGerar: Boolean);
begin
  if FormatDateTime('hh:mm', edTranslado.AsDateTime) < '00:01' then
    cbGeraReemb.Visible := False else
    cbGeraReemb.Visible := True;
    
  tsReembolso.TabVisible := cbGeraReemb.Visible and cbGeraReemb.Checked;

  if not gridItens.Enabled then Exit;
  
  if AjustaGerar and cbGeraReemb.Visible then begin
    DM.tOSGeraReemb.Value := not HoraAcomp;
    cbGeraReemb.Checked := DM.tOSGeraReemb.Value;
  end;

  tsReembolso.TabVisible := cbGeraReemb.Visible and cbGeraReemb.Checked;
  vgROutroLocal.Visible := (DM.tOSTipoReemb.Value='2');
  vgRKMDestino.Visible := (DM.tOSTipoReemb.Value='3');
  vgRPedagio1.Visible := (DM.tOSTipoReemb.Value='3');
  vgRPedagio2.Visible := (DM.tOSTipoReemb.Value='3');
  vgRPedagio3.Visible := (DM.tOSTipoReemb.Value='3');
  vgRPedagio4.Visible := (DM.tOSTipoReemb.Value='3');
  vgRMotivo.Visible := (DM.tOSTipoReemb.Value='3');
end;

procedure TFrmOS.cbGeraReembClick(Sender: TObject);
begin
  AjustaVisReembolso(False);
end;

procedure TFrmOS.ChecaOSState;
begin
  with DM do
  if not (tOS.State in [dsEdit, dsInsert]) then
    tOS.Edit;
end;

procedure TFrmOS.edTransladoChange(Sender: TObject);
begin
  AjustaVisReembolso(EditandoT and (TranslA <> edTranslado.AsDateTime));
end;

procedure TFrmOS.edTransladoEnter(Sender: TObject);
begin
  TranslA := edTranslado.AsDateTime;
  EditandoT := True;
end;

procedure TFrmOS.edTransladoExit(Sender: TObject);
begin
  EditandoT := False;
end;

procedure TFrmOS.tvItensCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var
  V: Variant;
  I: Integer;  
begin
  V := AViewInfo.GridRecord.Values[tvItensNumTela1.Index];
  if V=null then Exit;
  I := V;
  with ACanvas.Canvas do
  if EditCache[I].erIncluir then 
    Font.Style := Font.Style + [fsBold]
  else
    Font.Style := Font.Style - [fsBold];
end;

procedure TFrmOS.tvItensIncluir1PropertiesChange(Sender: TObject);
var 
  V : Variant;
  I : Integer;
begin
  V := tvItens.DataController.Controller.FocusedRecord.Values[tvItensNumTela1.Index];
  if V=null then Exit;
  I := V;
  EditCache[I].erIncluir := mtItensIncluir.Value;
  AjustaTransladoProj;
  AjustaAbonoProj;
  CalcTotHoras;
end;

procedure TFrmOS.tvItensHoras1PropertiesChange(Sender: TObject);
var
  V : Variant;
  I : Integer;
begin
  V := tvItens.DataController.Controller.FocusedRecord.Values[tvItensNumTela1.Index];
  if V=null then Exit;
  I := V;
  tvItens.DataController.PostEditingData;
  EditCache[I].erHoras := mtItensHoras.Value;
  CalcTotHoras;
end;

procedure TFrmOS.vgRTipoReembPropertiesChange(Sender: TObject);
begin
  AjustaVisReembolso(False);
end;

end.
