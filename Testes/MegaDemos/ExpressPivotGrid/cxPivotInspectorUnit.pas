unit cxPivotInspectorUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxOI, cxVGrid, cxLookAndFeels, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxHyperLinkEdit, StdCtrls, ExtCtrls;

type
  TfrmInspector = class(TForm)
    pnlBottom: TPanel;
    Label1: TLabel;
    lblURL: TLabel;
    procedure lblURLClick(Sender: TObject);
  private
    FObjectInspector: TcxRTTIInspector;
    FInspectedObjectChanged: TNotifyEvent;
    function GetInspectedObject: TPersistent;
    procedure SetInspectedObject(const Value: TPersistent);
    procedure DoObjectInspectorChange(Sender: TObject);
    procedure DoObjectInspectorFilterProperty(Sender: TObject; const PropertyName: string;
      var Accept: Boolean);
  protected
  public
    constructor Create(AOwner: TComponent); override;
    property InspectedObject: TPersistent read GetInspectedObject write SetInspectedObject;
    property onInspectedObjectChanged: TNotifyEvent read FInspectedObjectChanged
        write FInspectedObjectChanged;
  end;

implementation

{$R *.dfm}

uses
  ShellAPI;

{ TfrmInspector }

constructor TfrmInspector.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  {$IFDEF VERTGRID}
  pnlBottom.Visible := False;
  {$ENDIF}
  fObjectInspector := TcxRTTIInspector.Create(self);
  fObjectInspector.Parent := self;
  fObjectInspector.Align := alClient;
  fObjectInspector.OptionsView.RowHeaderWidth := 140;
  fObjectInspector.onPropertyChanged := DoObjectInspectorChange;
  fObjectInspector.OnFilterProperty := DoObjectInspectorFilterProperty;
end;

procedure TfrmInspector.DoObjectInspectorChange(Sender: TObject);
begin
  if Assigned(FInspectedObjectChanged) then
    FInspectedObjectChanged(Sender);
end;

procedure TfrmInspector.DoObjectInspectorFilterProperty(Sender: TObject;
  const PropertyName: string; var Accept: Boolean);
begin
  if (Pos('Fake', PropertyName) > 0) or (Pos('CustomDataSource', PropertyName) > 0) then
    Accept := False
  else Accept := True;
end;

function TfrmInspector.GetInspectedObject: TPersistent;
begin
  Result := fObjectInspector.InspectedObject;
end;

procedure TfrmInspector.lblURLClick(Sender: TObject);
begin
  ShellExecute(Handle, PChar('OPEN'), PChar(lblURL.Caption), nil, nil, SW_SHOWMAXIMIZED);
end;

procedure TfrmInspector.SetInspectedObject(const Value: TPersistent);
begin
  FObjectInspector.InspectedObject := Value;
end;

end.
