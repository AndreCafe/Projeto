unit ncaFrmGetWebTabs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw_EWB, EwbCore, EmbeddedWB, Automation;

type
  TFrmGetWebTabs = class(TForm)
    WB: TEmbeddedWB;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure WBDocumentComplete(ASender: TObject; const pDisp: IDispatch;
      var URL: OleVariant);
    procedure FormShow(Sender: TObject);
    procedure WBNavigateError(ASender: TObject; const pDisp: IDispatch; var URL,
      Frame, StatusCode: OleVariant; var Cancel: WordBool);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  FrmGetWebTabs: TFrmGetWebTabs;

implementation

uses ncClassesBase, ncaDM, ncaFrmPri;

{$R *.dfm}

procedure TFrmGetWebTabs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmGetWebTabs.FormCreate(Sender: TObject);
begin
  Width := 1;
  Height := 1;
  Left := 300
end;

procedure TFrmGetWebTabs.FormShow(Sender: TObject);
begin
  WB.navigate('http://nextabs.nextar.com.br?conta='+gConfig.Conta+'&adm='+BoolStr[Dados.CM.UA.Admin]+'&cok='+BoolStr[gConfig.FreePremium or (gConfig.QtdLic>0)]);

//  WB.navigate('http://servidor.nextar.com.br/obtemmsg?conta='+gConfig.Conta);
end;

procedure TFrmGetWebTabs.WBDocumentComplete(ASender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
var 
  S: String; 
  I, P: Integer;
  SL : TStrings;
begin
  try
    S := WB.DocumentSource;
    P := Pos('!webtabs!="', S);
    if P=0 then Exit;
    Delete(S, 1, P+10);
    S := Copy(S, 1, Pos('"', S)-1);
    if S='' then Exit;
    
    SL := TStringList.Create;
    try
      P := Pos(';', S);
      while P > 0 do begin
        SL.Add(Copy(S, 1, P-1));
        Delete(S, 1, P);
        P := Pos(';', S);
      end;
      if Trim(S)>'' then SL.Add(Trim(S));
      for I := 0 to SL.Count-1 do 
        FrmPri.AddWebTab(SL[i]);
    finally
      SL.Free;
    end;
  finally
    Close;
  end;
end;

procedure TFrmGetWebTabs.WBNavigateError(ASender: TObject; const pDisp: IDispatch;
  var URL, Frame, StatusCode: OleVariant; var Cancel: WordBool);
begin
  Close;
end;

end.
