unit uDTFrmCGP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, 
  kbmMemTable, dxBar,
  ExtCtrls, cxStyles, cxGraphics, cxEdit, cxDBLookupComboBox, cxCalendar,
  cxImageComboBox, cxMaskEdit, cxMemo, cxTextEdit, cxVGrid, cxDBVGrid,
  cxControls, cxInplaceContainer, cxClasses;

type
  TFrmCGP = class(TForm)
    BarMgr: TdxBarManager;
    cmGravar: TdxBarButton;
    cmCancelar: TdxBarButton;
    mtSol: TkbmMemTable;
    mtSolCliente: TStringField;
    mtSolProjeto: TStringField;
    mtSolTecnico: TStringField;
    mtSolData: TDateTimeField;
    mtSolItem: TWordField;
    mtSolTipo: TStringField;
    mtSolOrigem: TStringField;
    mtSolNomeResp: TStringField;
    mtSolSync: TBooleanField;
    mtSolNomeTec: TStringField;
    mtSolDescricao: TMemoField;
    dsSol: TDataSource;
    Timer1: TTimer;
    mtSolRetorno: TMemoField;
    mtSolDataRT: TDateTimeField;
    mtSolNomeRT: TStringField;
    VG: TcxDBVerticalGrid;
    VGNomeTec1: TcxDBEditorRow;
    VGData1: TcxDBEditorRow;
    VGTipo1: TcxDBEditorRow;
    VGOrigem1: TcxDBEditorRow;
    VGNomeResp1: TcxDBEditorRow;
    VGDescricao1: TcxDBEditorRow;
    vgRetorno: TcxCategoryRow;
    VGDataRT1: TcxDBEditorRow;
    VGNomeRT1: TcxDBEditorRow;
    VGRetorno1: TcxDBEditorRow;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure VGOrigem1EditPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    procedure SalvaDescr;
  public
    FNovo : Boolean;
    procedure Editar;
    procedure Novo;
    { Public declarations }
  end;

var
  FrmCGP: TFrmCGP;
  Habilitar : Boolean;

implementation

uses uDTDM;

{$R *.DFM}

procedure TFrmCGP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCGP.Editar;
begin
  FNovo := False;
  with DM do begin
    mtSol.Insert;
    mtSolTecnico.Value   := IDTecnico;
    mtSolData.Value      := tSolicitaData.Value;
    mtSolTipo.Value      := tSolicitaTipo.Value;
    mtSolOrigem.Value    := tSolicitaOrigem.Value;
    mtSolDescricao.Value := tSolicitaDescricao.Value;
    mtSolNomeResp.Value  := tSolicitaNomeResp.Value;
    mtSolRetorno.Value   := tSolicitaRetorno.Value;
    mtSolDataRT.Value    := tSolicitaDataRT.Value;
    mtSolNomeRT.Value    := tSolicitaNomeRT.Value;
    mtSol.Post;
    mtSol.Edit;

    cmGravar.Enabled := tSolicitaSync.Value;
    
    ShowModal;
  end;
end;

procedure TFrmCGP.Novo;
begin
  FNovo := True;
  with DM do begin
    mtSol.Insert;
    mtSolTecnico.Value := IDTecnico;
    mtSolData.Value := Date;
    mtSolTipo.Value := 'IG';
    mtSolOrigem.Value := 'T';
    ShowModal;
  end;
end;

procedure TFrmCGP.FormCreate(Sender: TObject);
begin
  mtSol.Open;
end;

procedure TFrmCGP.FormShow(Sender: TObject);
begin
  vgRetorno.Visible := (not mtSolDataRT.IsNull) and (mtSolDataRT.Value > 1);
  VG.FocusedRow := vgTipo1;
  Habilitar := (mtSolOrigem.Value='C');
  Timer1.Enabled := True;
end;

procedure TFrmCGP.cmGravarClick(Sender: TObject);
begin
  if mtSol.State in [dsEdit, dsInsert] then mtSol.Post;
  mtSol.Edit;
  if (mtSolOrigem.Value='C') and (Trim(mtSolNomeResp.Value)='') then
  begin
    Beep;
    ShowMessage('É necessário preencher o nome do resposável');
    VG.FocusedRow := vgNomeResp1;
    Exit;
  end;

  if mtSolOrigem.Value<>'C' then
    mtSolNomeResp.Value := '';
  
  with DM do begin
    mtSol.Post;
    nxdb.StartTransaction;
    try
      if FNovo then
        tSolicita.Insert
      else
        tSolicita.Edit;
      tSolicitaTipo.Value      := mtSolTipo.Value;
      tSolicitaOrigem.Value    := mtSolOrigem.Value;
      tSolicitaNomeResp.Value  := mtSolNomeResp.Value;
      tSolicita.Post;    
      SalvaDescr;
      nxdb.Commit;
    except
      tSolicita.Cancel;
      tSolicitaDesc.Cancel;
      nxdb.Rollback;
      Raise;
    end;
    tSolicita.Refresh;
  end;
  
  Close;  
end;

procedure TFrmCGP.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

function BreakPos(S: String; MaxLen: Integer): Integer;
begin
  Result := MaxLen;
  while (Result>0) and not (S[Result] in ['-', ' ', '.', ',', '(', ')']) do Dec(Result);
  if Result=0 then
    Result := MaxLen;
end;

function BreakStr(var S: String; MaxLen: Integer): String;
var BPos: Integer;
begin
  if Length(S) > MaxLen then begin
    BPos := BreakPos(S, MaxLen);
    Result := Copy(S, 1, BPos);
    Delete(S, 1, BPos);
  end else begin
    Result := S;
    S := '';
  end;  
end;  

procedure TFrmCGP.SalvaDescr;
var 
  I, Posicao : Integer;
  SL : TStrings;
  S : String;
begin
  with DM do begin
    tSolicitaDesc.CancelRange;
    tSolicitaDesc.SetRange(['E', tSolicitaCliente.Value, tSolicitaProjeto.Value, tSolicitaTecnico.Value, tSolicitaData.Value, tSolicitaItem.Value],
                           ['E', tSolicitaCliente.Value, tSolicitaProjeto.Value, tSolicitaTecnico.Value, tSolicitaData.Value, tSolicitaItem.Value]);
  end;
                             
  with DM do
  if not FNovo then begin
    tSolicitaDesc.First;
    while not tSolicitaDesc.Eof do tSolicitaDesc.Delete;
  end;

  if mtSolDescricao.Value='' then Exit;

  SL := TStringList.Create;
  with DM do
  try
    SL.Text := mtSolDescricao.Value;
    Posicao := 0;
    for I := 0 to pred(SL.Count) do begin
      S := SL[I];
      repeat 
        tSolicitaDesc.Insert;
        tSolicitaDescCliente.Value := tSolicitaCliente.Value;
        tSolicitaDescProjeto.Value := tSolicitaProjeto.Value;
        tSolicitaDescTecnico.Value := tSolicitaTecnico.Value;
        tSolicitaDescData.Value    := tSolicitaData.Value;
        tSolicitaDescItem.Value    := tSolicitaItem.Value;
        tSolicitaDescPos.Value     := Posicao;
        tSolicitaDescTexto.Value   := BreakStr(S, 70);
        tSolicitaDesc.Post;
        Inc(Posicao)
      until (S=''); 
    end;  
  finally
    tSolicitaDesc.CancelRange;
    SL.Free;
  end;  
end;

procedure TFrmCGP.Timer1Timer(Sender: TObject);
begin
{  Timer1.Enabled := False;
  if Habilitar then 
    mtSolOrigem.Value := 'C'
  else
    mtSolOrigem.Value := 'T';  
  mtSol.Post;
  vgNomeResp1.Visible := Habilitar;
  if Habilitar then
    InspNomeResp.Node.MoveTo(InspDescricao.Node, inaInsert);}
end;

procedure TFrmCGP.VGOrigem1EditPropertiesChange(Sender: TObject);
begin
  vgNomeResp1.Visible := (mtSolOrigem.Value='C');
end;

end.
