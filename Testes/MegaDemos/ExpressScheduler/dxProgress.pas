unit dxProgress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxLabel, ComCtrls, StdCtrls,
  cxProgressBar, ExtCtrls;

type
  TfrmProgress = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    pbProgress: TcxProgressBar;
  private
    { Private declarations }
  public
    procedure UpdateProgress(APercent: Integer);
  end;

var
  frmProgress: TfrmProgress;

implementation

{$R *.dfm}

procedure TfrmProgress.UpdateProgress(APercent: Integer);
begin
  if pbProgress.Position = APercent then Exit; 
  pbProgress.Position := APercent;
  if APercent = 100 then
    Label1.Caption := 'Updating database...'
  else
    Label1.Caption := 'Inserting events to database...';
  Refresh;
end;

end.
