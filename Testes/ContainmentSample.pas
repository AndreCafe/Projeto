unit ContainmentSample;

interface

uses Dialogs;

type
  IDialog = interface
    ['{14C78CB0-69E5-11D6-9239-0004AC5359AE}']
    function ResultValue: String;
    function Execute: Boolean;
  end;

  TOpenDialogHolder = class(TInterfacedObject,IDialog)
  private
    FOpenDialog : TOpenDialog;
  public
    constructor Create;
    destructor Destroy; override;
    // IDialog
    function Execute: Boolean;
    function ResultValue: String;
  end;

implementation

uses SysUtils, Forms;

{ TOpenDialogHolder }

constructor TOpenDialogHolder.Create;
begin
  inherited Create;
  FOpenDialog := TOpenDialog.Create(nil);
  FOpenDialog.Filter :=
    'Pascal source files (*.pas)|*.pas|Text files|*.txt|All files (*.*)|*.*';
  FOpenDialog.Title := 'Containment example';
  FOpenDialog.InitialDir := ExtractFileDir(Application.ExeName);
end;

destructor TOpenDialogHolder.Destroy;
begin
  FOpenDialog.Free;
  FOpenDialog := nil;
  inherited;
end;

function TOpenDialogHolder.Execute: Boolean;
begin
  Result := FOpenDialog.Execute;
end;

function TOpenDialogHolder.ResultValue: String;
begin
  Result := FOpenDialog.FileName;
end;

end.
