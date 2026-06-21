unit uChecaTabelas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, 
  nxdb,
  nxdbBase,
  nxllConst,
  nxllTypes,
  nxsdDataDictionary,
  ComCtrls, 
  UDTTabelas,
  uDTFmtTabs,
  LMDControl, LMDBaseControl, LMDBaseGraphicControl,
  LMDBaseLabel, LMDCustomSimpleLabel, LMDSimpleLabel, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, LMDGraphicControl,
  LMDFill, pngimage;

type

  TFrmChecaBD = class(TForm)
    LMDSimplePanel1: TLMDSimplePanel;
    Image1: TImage;
    Label4: TLabel;
    lbProgresso: TLabel;
    Timer1: TTimer;
    lbOk: TLabel;
    panProgresso: TPanel;
    Progresso: TProgressBar;
    Timer2: TTimer;
    Panel1: TPanel;
    Image3: TImage;
    LMDSimpleLabel1: TLMDSimpleLabel;
    LMDFill1: TLMDFill;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure Checar;
  public
    { Public declarations }
    FDB : TnxDatabase;
    procedure ChecaBD(DB: TnxDatabase);
  end;

var
  FrmChecaBD: TFrmChecaBD;

implementation

uses uDTDM;

{$R *.DFM}

procedure TFrmChecaBD.Checar;
var
  I : Integer;
begin
  Progresso.Max := NumTabs;
  Progresso.Position := 0;
  for I := 1 to NumTabs do begin
    Progresso.Position := I;
    if ClientTab[I] then
      begin
        lbProgresso.Caption := 'Checando tabela: ' + NomeTab[I];
        ChecaTabela(FDB, NomeTab[I], nil);
        Application.ProcessMessages;
        Sleep(50);
    end;
  end;
  lbProgresso.Caption := '...';
    
  lbOk.Visible := True;
  
  Timer1.Enabled := True;
end;

procedure TFrmChecaBD.FormShow(Sender: TObject);
begin
  Timer2.Enabled := True;
end;

procedure TFrmChecaBD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmChecaBD.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  Close;
end;

procedure TFrmChecaBD.Timer2Timer(Sender: TObject);
begin
  Timer2.Enabled := False;
  Checar;
end;

procedure TFrmChecaBD.FormCreate(Sender: TObject);
begin
  FDB := DM.nxdb;
end;

procedure TFrmChecaBD.ChecaBD(DB: TnxDatabase);
begin
  FDB := DB;
  ShowModal;
end;

end.
