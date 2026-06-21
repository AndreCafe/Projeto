unit uCMFrmHistorico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, dxBarExtItems, dxBar;

type
  TFrmHistVer = class(TForm)
    RE: TRichEdit;
    BarMgr: TdxBarManager;
    cmGravar: TdxBarButton;
    cmFechar: TdxBarLargeButton;
    procedure cmFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmHistVer: TFrmHistVer;

implementation

{$R *.dfm}

procedure TFrmHistVer.cmFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmHistVer.FormCreate(Sender: TObject);
begin
  try
    RE.Lines.LoadFromFile(ExtractFilePath(ParamStr(0))+'cmhist.rtf');
  except
  end;
end;

procedure TFrmHistVer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
