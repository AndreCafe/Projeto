unit ncafbMaqConfig;
{
    ResourceString: Dario 10/03/13
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxBar, dxPSCore, cxGridCustomPopupMenu,
  cxGridPopupMenu, cxClasses, ExtCtrls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxMemo, cxMaskEdit, cxSpinEdit, cxContainer,
  cxLabel, LMDPNGImage, LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, cxLookAndFeels, cxLookAndFeelPainters,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, dxPScxEditorProducers, dxPScxExtEditorProducers,
  uParentedPanel, cxNavigator, dxPScxPivotGridLnk;

type
  TfbMaqConfig = class(TFrmBase)
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    GL: TcxGridLevel;
    TVNumero: TcxGridDBColumn;
    TVNome: TcxGridDBColumn;
    TVComputerName: TcxGridDBColumn;
    TVIDCliente: TcxGridDBColumn;
    TVDisplayWH: TcxGridDBColumn;
    TVRAM: TcxGridDBColumn;
    TVCPU: TcxGridDBColumn;
    TVOS: TcxGridDBColumn;
    TVPrinters: TcxGridDBColumn;
    TVDrives: TcxGridDBColumn;
    TVHDTotal: TcxGridDBColumn;
    TVIP: TcxGridDBColumn;
    TVHDFree: TcxGridDBColumn;
    dxBarSubItem1: TdxBarSubItem;
    cmSessoes: TdxBarButton;
    LMDSimplePanel1: TLMDSimplePanel;
    Image1: TImage;
    lbInfo: TcxLabel;
    TVMacAddress: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxsVer: TcxStyle;
    procedure TVOSGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure TVRAMGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure cmEditarClick(Sender: TObject);
    procedure cmNovoClick(Sender: TObject);
    procedure cmApagarClick(Sender: TObject);
    procedure TVFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cmSessoesClick(Sender: TObject);
    procedure TVDisplayWHGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
  private
    { Private declarations }
  public
    class function Descricao: String; override;
    procedure AtualizaDireitos; override;
    procedure AjustaLayoutLargeButton(B : TdxBarLargeButton); override;

    procedure AtualizaBotoes;
    
    { Public declarations }
  end;

var
  fbMaqConfig: TfbMaqConfig;

implementation

uses ncaDM, ncaFrmPri, ncaFrmMaq, ncClassesBase, ncafbMaq, ncVersoes,
  ufmImagens;

// START resource string wizard section
resourcestring
  SOpções = 'Opções';
  SRemover = '&Remover';
  SRecursoDesativadoÉNecessárioComp = '* Recurso desativado. É necessário comprar uma atualização do NexCafé para ativar esse recurso';
  SAsInformaçõesDeConfiguraçãoDosCo = 'As informações de configuração dos computadores da loja são coletadas automaticamente pelo NexCafé. ';
  SAsMáquinasClientesEnviamOsDadosD = 'As máquinas clientes enviam os dados de sua configuração no momento em que se conectam ao servidor ';
  SNexCaféAtravésDoNexGuard = 'NexCafé através do NexGuard.';
  SNãoéPossívelApagarUmaMáquinaComA = 'Não é possível apagar uma máquina com acesso em andamento';
  SConfirmaAExclusãoDaMáquina = 'Confirma a exclusão da Máquina ';
  SInfoMáquinas = 'Info.Máquinas';

// END resource string wizard section


{$R *.dfm}

{ TFrmBase1 }

const
  kilobyte = 1;
  megabyte = kilobyte * 1024;
  gigabyte = megabyte * 1024;

function KByteStr(K: Cardinal): String;
var sufix: String; code: word;
begin
  if K>=gigabyte then begin
    sufix := 'GB'; // do not localize
    Str(K/gigabyte:0:2, result);
  end else
  if K>=megabyte then
  begin
    sufix := 'MB'; // do not localize
    Str(K/megabyte:0:2, result);
  end 
  else begin
    sufix := 'KB'; // do not localize
    Result := IntToStr(K);
  end;
  while (Length(Result)>0) and (Result[Length(Result)] in ['0', '.']) do Delete(Result, Length(Result), 1);
  if Result>'0' then
    Result := Result + ' ' + sufix else
    Result := '';
end;

procedure TfbMaqConfig.AjustaLayoutLargeButton(B: TdxBarLargeButton);
begin

end;

procedure TfbMaqConfig.AtualizaBotoes;
begin
  try
    with Dados do 
    if mtMaquina.RecordCount>0 then begin
      cmEditar.Enabled := Dados.CM.UA.Admin;
      cmApagar.Enabled := Dados.CM.Ua.Admin;
      cmNovo.Enabled := Dados.CM.UA.Admin;
    end else begin
      cmEditar.Caption := SOpções;
      cmEditar.Enabled := False;
      cmApagar.Caption := SRemover;
      cmApagar.Enabled := False;
    end;
  except
  end;
end;

procedure TfbMaqConfig.AtualizaDireitos;
begin
  inherited;
  if not Versoes.PodeUsar(idre_configmaq) then begin
    lbInfo.Caption := SRecursoDesativadoÉNecessárioComp;
    lbInfo.Style.TextStyle := [fsBold];
    cxsVer.TextColor := clSilver;
  end else begin
    lbInfo.Caption := SAsInformaçõesDeConfiguraçãoDosCo+
                      SAsMáquinasClientesEnviamOsDadosD+
                      SNexCaféAtravésDoNexGuard;
    lbInfo.Style.TextStyle := [];
    cxsVer.TextColor := clBlack;
  end;
  
  AtualizaBotoes;
end;

procedure TfbMaqConfig.cmApagarClick(Sender: TObject);
var M : TncMaquina;
begin
  inherited;
  with Dados do begin
    if mtMaquina.RecordCount=0 then Exit;
    if CM.Sessoes.PorMaq[mtMaquinaNumero.Value]<>nil then begin
      Beep;
      ShowMessage(SNãoéPossívelApagarUmaMáquinaComA);
      Exit;
    end;  
    M := CM.Maquinas.PorNumero[mtMaquinaNumero.Value];
    if M<>nil then
    if MessageDlg(SConfirmaAExclusãoDaMáquina+mtMaquinaNumero.AsString, mtConfirmation,
                [mbYes, mbNo], 0) = mrYes then
      CM.ApagaObj(M);
  end;    
end;

procedure TfbMaqConfig.cmEditarClick(Sender: TObject);
var M : TncMaquina;
begin
  inherited;
  
  with Dados do 
  M := CM.Maquinas.PorNumero[mtMaquinaNumero.Value];
  if M=nil then Exit;
  TFrmMaq.Create(Self).Editar(M);
end;

procedure TfbMaqConfig.cmNovoClick(Sender: TObject);
begin
  inherited;
  Dados.NovaMaq;
end;

procedure TfbMaqConfig.cmSessoesClick(Sender: TObject);
begin
  inherited;
  TfbMaq(FrmPri.FM.FormAtivo).Paginas.ActivePageIndex := 0;
end;

class function TfbMaqConfig.Descricao: String;
begin
  Result := SInfoMáquinas;
end;

procedure TfbMaqConfig.TVDisplayWHGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
begin
  inherited;
  if not Versoes.PodeUsar(idre_configmaq) then AText := '*';
end;

procedure TfbMaqConfig.TVFocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  AtualizaBotoes;
end;

procedure TfbMaqConfig.TVOSGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
var V: Variant;  
begin
  inherited;
  if not Versoes.PodeUsar(idre_configmaq) then begin
    AText := '*';
    Exit;
  end;
  V := ARecord.Values[TVOS.Index];
  if V=null then
    AText := '' else
    AText := V;
    
  if Pos('Windows', AText)=1 then // do not localize
    Delete(AText, 1, 8);
end;


procedure TfbMaqConfig.TVRAMGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
var V: Variant;  
begin
  inherited;
  if not Versoes.PodeUsar(idre_configmaq) then begin
    AText := '*';
    Exit;
  end;
  
  V := ARecord.Values[Sender.Index];
  if V=null then
    AText := '' else 
    AText := KByteStr(V);
end;

end.

