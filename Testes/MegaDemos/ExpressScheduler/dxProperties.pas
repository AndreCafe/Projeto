unit dxProperties;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxEdit, cxControls, cxInplaceContainer,
  cxVGrid, cxOI, StdCtrls, ExtCtrls, ShellApi;

type
  TfrmInspector = class(TForm)
    cxRTTIInspector: TcxRTTIInspector;
    pnlBottom: TPanel;
    Label1: TLabel;
    lblURL: TLabel;
    procedure lblURLClick(Sender: TObject);
    procedure cxRTTIInspectorPropertyChanged(Sender: TObject);
  private
    FOnChanged: TNotifyEvent;
  public
    property OnChanged: TNotifyEvent read FOnChanged write FOnChanged;
  end;

var
  frmInspector: TfrmInspector;

implementation

{$R *.dfm}

procedure TfrmInspector.lblURLClick(Sender: TObject);
begin
  ShellExecute(Handle, PChar('OPEN'), PChar(lblURL.Caption), nil, nil, SW_SHOWMAXIMIZED);
end;

procedure TfrmInspector.cxRTTIInspectorPropertyChanged(Sender: TObject);
begin
  if Assigned(FOnChanged) then
    FOnChanged(Self);
  //
end;

end.
