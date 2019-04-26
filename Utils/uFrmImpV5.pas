unit uFrmImpV5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  
  StdCtrls, CheckLst, ExtCtrls, DB, nxdb, nxllComponent,
  nxsdServerEngine, nxsrServerEngine, nxseAutoComponent, LMDCustomComponent,
  LMDBaseController, LMDCustomContainer, LMDGenericList, ComCtrls;

type
  TFrmImpFromV5 = class(TForm)
    clb: TCheckListBox;
    Timer1: TTimer;
    nxSE: TnxSession;
    nxDB: TnxDatabase;
    Tab: TnxTable;
    ServEng: TnxServerEngine;
    nx1xAllEngines1: Tnx1xAllEngines;
    glArqs: TLMDGenericList;
    nxDBO: TnxDatabase;
    TabO: TnxTable;
    PB: TProgressBar;
    Label1: TLabel;
    lbArq: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Andamento(T, I: Integer);
    { Public declarations }
    function CopiaDados: String;
    
  end;

  TCriaDM = function: Integer;

var
  FrmImpFromV5: TFrmImpFromV5;

implementation

uses ncTableDefs, uDMBaseImpNX2;

{$R *.dfm}

procedure TFrmImpFromV5.Andamento(T, I: Integer);
begin
  PB.Max := T;
  PB.Position := I;
  if (I mod 5) = 0 then Application.ProcessMessages;
end;

function TFrmImpFromV5.CopiaDados: String;
var 
  I : Integer;
  SR : TSearchRec;
  sFrom, sTo, S : String;
  slArqs: TStrings;
begin
  sTo := ExtractFilePath(ParamStr(0)) + 'Copia\'+ FormatDateTime('yyyymmdd_hhmm', Now) + '_ImpV5';
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

procedure TFrmImpFromV5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmImpFromV5.FormCreate(Sender: TObject);
begin
  GetTableNames(clb.Items);
  nxDB.AliasPath := ExtractFilePath(ParamStr(0))+'dados';
//  glArqs.Items[0].SaveToFile(ExtractFilePath(ParamStr(0))+'impv5.dll');
end;

procedure TransfDados(TF, TD: TDataset);
var 
  I : Integer;
  F : TField;
begin
  with TD do
  for I := 0 to pred(Fields.Count) do with Fields[I] do 
  if (FieldKind=fkData) then begin
    F := TF.FindField(FieldName);
    if (F <> nil) and (F.FieldKind=fkData) then 
      Value := F.Value;
  end;
end;


procedure TFrmImpFromV5.Timer1Timer(Sender: TObject);
var 
  S: String;
  sTab: String;
  I, T, P: Integer;

procedure ImpTab;
begin
  Caption := sTab;
  T := TabO.RecordCount;
  P := 1;
  TabO.First;
  while not TabO.Eof do begin
    Tab.Insert;
    TransfDados(TabO, Tab);
    Tab.Post;
    
    Andamento(T, P);
    Inc(P);

    TabO.Next;
  end;
end;

begin
  Timer1.Enabled := False;
  nxDB.Active := True;
  Tab.Active  := False;
  Tab.TableName := 'config';
  Tab.Active := True;
  if Tab.FieldByName('RecPorta').Size = 10 then begin
    Close;
    Exit;
  end; 
  Tab.Active := False;
  nxDB.Active := False;
  ServEng.Active := False; 
  S := CopiaDados;
  try
    ServEng.Active := True;
    nxDB.Active := True;
    nxDBO.AliasPath := S;
    nxDBO.Active := True;

    for I := 0 to glArqs.Count-1 do 
      glArqs[i].SaveToFile(ExtractFilePath(ParamStr(0))+'dados\'+glArqs[I].FileName);
    
    for I := 0 to clb.Items.Count-1 do begin 
      if FileExists(S+'\'+clb.Items[I]+'.nx1') then begin
        PB.Position := 0;
        Tab.Active := False;
        Tab.TableName := clb.Items[I];
        sTab := Tab.TableName;
        if SameText(Tab.TableName, 'plusT') or
           SameText(Tab.TableName, 'plusP') then
          Tab.Password := sEncPass else
          Tab.Password := '';
          
        Tab.Active := True;
  
        TabO.Active := False;
        TabO.TableName := Tab.TableName;
        TabO.Password := Tab.Password;
        TabO.Active := True;
  
        try
          lbArq.Caption := 'Convertendo arquivo: ' + '"' + clb.Items[I] + '"';
          ImpTab;
        finally
          Tab.Active := False;
        end;
      end;  
      clb.Checked[I] := True;
      Application.ProcessMessages;
    end;
  finally
    Close;
    nxDB.Active := False;
    ServEng.Active := False;
  end;
end;

end.
