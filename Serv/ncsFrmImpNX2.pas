unit ncsFrmImpNX2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxCheckListBox, cxLabel, cxControls, cxContainer, cxEdit,
  cxProgressBar, StdCtrls, CheckLst, ExtCtrls, DB, nxdb, nxllComponent;

type
  TFrmImpNX2 = class(TForm)
    PB: TcxProgressBar;
    cxLabel1: TcxLabel;
    clb: TCheckListBox;
    lbArq: TcxLabel;
    Timer1: TTimer;
    nxSE: TnxSession;
    nxDB: TnxDatabase;
    Tab: TnxTable;
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    procedure Andamento(T, I: Integer);
    { Public declarations }
    function CopiaDados: String;
    
  end;

  TCriaDM = function: Integer;

var
  FrmImpNX2: TFrmImpNX2;

implementation

uses ncServBD, ncEstruturaTabs, ncDMServ, uDMBaseImpNX2;

{$R *.dfm}

procedure TFrmImpNX2.Andamento(T, I: Integer);
begin
  PB.Properties.Max := T;
  PB.Position := I;
  if (I mod 5) = 0 then Application.ProcessMessages;
end;

function TFrmImpNX2.CopiaDados: String;
var 
  I : Integer;
  SR : TSearchRec;
  sFrom, sTo, S : String;
  slArqs: TStrings;
begin
  sTo := ExtractFilePath(ParamStr(0)) + 'Copia\'+ FormatDateTime('yyyymmdd_hhmm', Now) + '_ImpNX2';
  if not DirectoryExists(sFrom) then
    MkDir(sTo);
    
  Result := sTo;  
    
  sFrom := ExtractFilePath(ParamStr(0)) + 'Dados';
  
  slArqs := TStringList.Create;
  try
    if FindFirst(sFrom+'\*.nx1', faAnyFile, SR) = 0 then
    try
      repeat
//        if (Pos('_Failed', SR.Name)=0) and (Pos('_Recovered', SR.Name)=0) then
          slArqs.Add(sFrom+'\'+ExtractFileName(SR.Name));
      until FindNext(SR)<>0;
    finally
      FindClose(SR);
    end;
  
    for I := 0 to slArqs.Count-1 do begin
      lbArq.Caption := 'Copiando arquivo ' + ExtractFileName(slArqs[I]) + ' ...';
      Application.ProcessMessages;
      Application.ProcessMessages;
      Application.ProcessMessages;
      Application.ProcessMessages;
      S := sTo+'\'+ExtractFileName(slArqs[I]);
      if not CopyFile(PChar(slArqs[I]), PChar(S), False) then
        Raise Exception.Create('Erro n.'+IntToStr(GetLastError)+' copiando arquivo ' + slArqs[I] + ' para ' + S);
      Sleep(100);      
    end;

    for I := 0 to slArqs.Count-1 do begin
      lbArq.Caption := 'Apagando arquivo ' + ExtractFileName(slArqs[I]) + ' ...';
      Application.ProcessMessages;
      Application.ProcessMessages;
      Application.ProcessMessages;
      Application.ProcessMessages;
      if not DeleteFile(slArqs[I]) then
        Raise Exception.Create('Erro n.'+IntToStr(GetLastError)+' Apagando arquivo ' + slArqs[I]);
      Sleep(100);      
    end;
    
  finally
    slArqs.Free;
  end;
end;

procedure TFrmImpNX2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmImpNX2.Timer1Timer(Sender: TObject);
var 
  S: String;
  I: Integer;
  DM: TdmBaseImpNX2;

procedure CriaDMImp;
var 
  CriaDM: TCriaDM;
  H: THandle;
begin
  H := LoadLibrary(PChar(ExtractFilePath(ParamStr(0))+'\ImpNX.dll'));
  if H = 0 then Raise Exception.Create('Falha inicializando ImpNX.dll');
  @CriaDM := GetProcAddress(H, PChar('CriaDM'));
  dm := TdmBaseImpNX2(CriaDM);
  dm.Inicializa(S);
end;

begin
  Timer1.Enabled := False;
  S := CopiaDados;
  dmServidorBD := TdmServidorBD.Create(Self);
  try
    CriaDMImp;
    nxSE.ServerEngine := dmServidorBD.ServerEngine;
    nxDB.Active := True;
    RestructureNexCafeDatabase(nxDB);
    for I := 0 to clb.Items.Count-1 do begin
      PB.Position := 0;
      Tab.Active := False;
      Tab.TableName := clb.Items[I];
      Tab.Active := True;
      try
        lbArq.Caption := 'Convertendo arquivo: ' + '"' + clb.Items[I] + '"';
        if FileExists(S+'\'+clb.Items[I]+'.nx1') then 
          dm.Importa(clb.Items[I], Tab, Andamento);
      finally
        Tab.Active := False;
      end;
      clb.Checked[I] := True;
      Application.ProcessMessages;
    end;
    Close;
  finally
    dmServidorBD.Free;
  end;
end;

end.
