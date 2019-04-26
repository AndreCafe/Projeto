unit ncaFrmEtapa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDCustomPanelFill, LMDButtonPanel, ComCtrls, 
  ovcnf, ovcbase, ovcef, ovcpb, ovcpf, cxLabel, pngimage, ExtCtrls, cxControls,
  cxContainer, cxEdit, cxGroupBox, dxBarExtItems, dxBar, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, DB, cxDBData, cxTimeEdit,
  cxCurrencyEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxCheckBox,
  kbmMemTable, StdCtrls, cxMaskEdit, cxLookAndFeelPainters;

type

  TEtapaRec = record
    erTempo  : TDateTime;
    erValor  : Double;
    erFracao : Double;
  end;
  PEtapaRec = ^TEtapaRec;
  
  TFrmEtapa = class(TForm)
    BarMgr: TdxBarManager;
    cmKardex: TdxBarButton;
    cmGravar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    gbEtapas: TcxGroupBox;
    Panel2: TPanel;
    gridSim: TcxGrid;
    tvSim: TcxGridDBTableView;
    glSim: TcxGridLevel;
    mtSim: TkbmMemTable;
    dsSim: TDataSource;
    OvcController1: TOvcController;
    gbTempoA: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    Label1: TLabel;
    edTempo: TOvcPictureField;
    cxLabel3: TcxLabel;
    edValor: TOvcNumericField;
    Label2: TLabel;
    edTempoA: TOvcPictureField;
    cxLabel1: TcxLabel;
    edValorA: TOvcNumericField;
    Panel3: TPanel;
    gridFrac: TcxGrid;
    tvFrac: TcxGridDBTableView;
    glFrac: TcxGridLevel;
    mtFrac: TkbmMemTable;
    dsFrac: TDataSource;
    mtFracTexto: TStringField;
    tvFracValorFrac: TcxGridDBColumn;
    tvFracTexto: TcxGridDBColumn;
    mtSimTexto: TStringField;
    mtFracValorFrac: TCurrencyField;
    tvSimTexto: TcxGridDBColumn;
    gbErro: TcxGroupBox;
    lbErro: TcxLabel;
    procedure mtFracAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmCancelarClick(Sender: TObject);
    procedure edValorChange(Sender: TObject);
    procedure edTempoChange(Sender: TObject);
    procedure cmGravarClick(Sender: TObject);
  private
    FEtapa : PEtapaRec;
    FEtapaA: PEtapaRec;
    { Private declarations }
    FResultado: Boolean;
    FFracionando : Boolean;
    Fracao : Double;
    function MsgValida: String;
    procedure Validar;
    procedure Fracionar;
    procedure Tarifar;
  public
    function Editar(aEtapa, aEtapaAnt: PEtapaRec): Boolean;
    { Public declarations }
  end;

var
  FrmEtapa: TFrmEtapa;

implementation

uses 
  ncaDM, 
  ncaFrmPri, 
  ufmImagens;

{$R *.dfm}

{ TFrmEtapa }

procedure TFrmEtapa.cmCancelarClick(Sender: TObject);
begin
  FResultado := False;
  Close;
end;

procedure TFrmEtapa.cmGravarClick(Sender: TObject);
begin
  Validar;
  FResultado := True;
  FEtapa^.erTempo := edTempo.AsDateTime;
  FEtapa^.erValor := edValor.AsFloat;
  FEtapa^.erFracao := Fracao;
  Close;
end;

function TFrmEtapa.Editar(aEtapa, aEtapaAnt: PEtapaRec): Boolean;
begin
  FEtapa := aEtapa;
  FEtapaA := aEtapaAnt;
  FResultado := False;
  edTempoA.AsDateTime := FEtapaA^.erTempo;
  edValorA.AsFloat := FEtapaA^.erValor;
  gbTempoA.Visible := (FormatDateTime('hhmmsss', edTempoA.AsDateTime) > '000000');
  edTempo.AsDateTime := FEtapa^.erTempo;
  edValor.AsFloat := FEtapa^.erValor;
  if MsgValida='' then begin
    Fracionar;
    Fracao := FEtapa.erFracao;
    if (Fracao=0) then Fracao := FEtapa^.erValor - FEtapaA^.erValor;
    mtFrac.Locate('ValorFrac', Fracao, []);
  end;
  ShowModal;
  Result := FResultado;
end;

procedure TFrmEtapa.edTempoChange(Sender: TObject);
begin
  if MsgValida='' then
    Fracionar;
end;

procedure TFrmEtapa.edValorChange(Sender: TObject);
begin
  if MsgValida='' then Fracionar;
end;

procedure TFrmEtapa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmEtapa.FormCreate(Sender: TObject);
begin
  FFracionando := False;
end;

procedure TFrmEtapa.Fracionar;
var 
  I : Integer;
  F, TF : Cardinal;
  T : TDateTime;
  A, B : Int64;
  S: String;
begin
  if mtFrac.RecordCount>1 then
    Fracao := mtFracValorFrac.Value
  else
    Fracao := 0;  
  dsFrac.Dataset  := nil;
  try
    FFracionando := True;
    mtFrac.EmptyTable;
    T := edTempo.AsDateTime - FEtapaA^.erTempo;

    dsFrac.DataSet := nil;

    try
    
      if (FormatDateTime('hhmmss', T)>'000000') and 
         (edValor.AsFloat>0.001) then  
      begin  
        Str((edValor.AsFloat - FEtapaA^.erValor)*100:15:2, S);
        TF := StrToIntDef(Copy(S, 1, Pos('.', S)-1), 0);
//        TF := Trunc(Int((edValor.AsFloat - FEtapaA^.erValor) * 100));
{        if TF > 999999 then  
          Raise Exception.Create('Valor não pode ser maior que 999999');  }
        I := 0;  
        F := TF;
        while (F>0) do begin
          Inc(I);
          if I=1 then begin
            mtFrac.Append;
            mtFracValorFrac.Value := TF/100;
            mtFracTexto.Value := 'Não dividir em sub-etapas';
            mtFrac.Post;
          end else begin
            F := TF div I;
            if (TF mod I) = 0 then begin
              mtFrac.Append;
              mtFracValorFrac.Value := F/100;
              mtFracTexto.Value := 'Cobrar ' + FloatToStrF(F/100, ffCurrency, 10, 2) + ' a cada ' + TempoSt(FormatDateTime('hh:mm:ss', T / I));
              mtFrac.Post;
            end;
          end;

          if I>200 then begin
            F:=0;
          end;
          
        end;    
      end;
    finally
      dsFrac.Dataset := mtFrac;  
    end;
  finally
    dsFrac.Dataset := mtFrac;
    FFracionando := False;
  end;
  if Fracao=0 then
    mtFrac.First
  else begin
    if not mtFrac.Locate('ValorFrac', Fracao, []) then
      mtFrac.First;
  end;
  Tarifar;
end;

procedure TFrmEtapa.Validar;
var S: String;
begin
  S := MsgValida;
  if S <> '' then Raise Exception.Create(S);
end;

function TFrmEtapa.MsgValida: String;
begin
  if edTempo.AsDateTime <= FEtapaA^.erTempo then 
    Result := 'Tempo deve ser maior que ' + FormatDateTime('hh:mm:ss', FEtapaA^.erTempo)+'.'
  else
  if edValor.AsFloat < FEtapaA^.erValor then
    Result := 'Valor desta etapa tem que ser maior ou igual a anterior (' + FloatToStrF(FEtapaA^.erValor, ffCurrency, 15, 2) +').'
  else    
    Result := '';
  gbErro.Visible := (Result>'');
  lbErro.Caption := Result;
  gbEtapas.Visible := not gbErro.Visible;
end;


procedure TFrmEtapa.mtFracAfterScroll(DataSet: TDataSet);
begin
  if not FFracionando then
    Tarifar;
end;

procedure TFrmEtapa.Tarifar;
var 
  Tempo, TempoF, FracT : TDateTime;
  Valor, ValorF : Double;
  I : Integer;
begin
  dsSim.Dataset := nil;
  mtSim.EmptyTable;
  try
    ValorF := edValor.AsFloat;
    Valor := FEtapaA^.erValor;
    Tempo := FEtapaA^.erTempo;
    TempoF := edTempo.AsDateTime;
    Fracao := mtFracValorFrac.Value;
    if ((ValorF-Valor)=0) then Exit;
    if Fracao < 0.01 then Exit;
    
    FracT := (Fracao / (ValorF - Valor)) * (TempoF - Tempo);

    I := 0;
  
    while (ValorF-Valor) > 0.009 do begin
      Inc(I);
      if I>500 then Exit;
      
      mtSim.Append;
      mtSimTexto.Value := 'De ' + FormatDateTime('hh:mm:ss', Tempo) + ' a ' +
                          FormatDateTime('hh:mm:ss', Tempo+FracT) + ' = ' +  
                          FloatToStrF(Valor+Fracao, ffCurrency, 10, 2);
      mtSim.Post;
      Valor := Valor + Fracao;
      Tempo := Tempo + FracT;
    end;
  finally
    mtSim.First;
    dsSim.Dataset := mtSim;
  end;
end;

end.


