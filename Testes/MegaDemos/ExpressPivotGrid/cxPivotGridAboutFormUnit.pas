unit cxPivotGridAboutFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxCustomPivotBaseFormUnit, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMemo, cxRichEdit;

type
  TfrmAbout = class(TcxCustomPivotGridDemoUnitForm)
    reAbout: TcxRichEdit;
  private
    { Private declarations }
  public
    procedure ActivateDataSet; override;
    class function GetID: Integer; override;
  end;

implementation

{$R *.dfm}
{$R cxPivotFeatures.res}

procedure TfrmAbout.ActivateDataSet;
var
  AStream: TStream;
begin
  AStream := TResourceStream.Create(hInstance, 'PIVOTFEATURESLIST', 'PIVOTFEATURES');
  try
    reAbout.Lines.LoadFromStream(AStream);
  finally
    AStream.Free; 
  end;
end;

class function TfrmAbout.GetID: Integer;
begin
  Result := -1;
end;

initialization
  TfrmAbout.Register;

end.
