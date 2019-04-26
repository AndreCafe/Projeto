unit ncaFrmHistVer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, dxBarExtItems, dxBar, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMemo, cxRichEdit, cxClasses;

type
  TFrmRTF = class(TForm)
    BarMgr: TdxBarManager;
    cmGravar: TdxBarButton;
    cmFechar: TdxBarLargeButton;
    RE: TcxRichEdit;
    procedure cmFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    procedure Mostrar(aCaption: String; aArquivo: String);
    { Public declarations }
  end;

var
  FrmRTF: TFrmRTF;

implementation

uses ncaFrmPri;

{$R *.dfm}

procedure TFrmRTF.cmFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRTF.Mostrar(aCaption, aArquivo: String);
begin
  Caption := aCaption;
  try
    RE.Lines.LoadFromFile(ExtractFilePath(ParamStr(0))+'ajuda\'+aArquivo);
  except
    Exit;
  end;
  ShowModal;
end;

procedure TFrmRTF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
