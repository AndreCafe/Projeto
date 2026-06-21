unit RibbonNotepadDemoOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxGraphics, cxControls, cxLookAndFeels, ExtCtrls,
  dxRibbonSkins;

type
  TRibbonDemoStyle = (rdsOffice2007, rdsOffice2010, rdsScenic);

  TScreenTipOptions = record
    ShowScreenTips: Boolean;
    ShowDescripitons: Boolean;
  end;

  { TRibbonDemoOptionsForm }

  TRibbonDemoOptionsForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    gbPanel: TBevel;
    cbColorScheme: TComboBox;
    cbColorSchemeAccent: TComboBox;
    cbRibbonStyle: TComboBox;
    cbScreenTipStyle: TComboBox;
    lblColorScheme: TLabel;
    lblRibbonStyle: TLabel;
    lblScreenTipStyle: TLabel;
    lblColorSchemeAccent: TLabel;
    procedure cbRibbonStyleSelect(Sender: TObject);
  private
    procedure PopulateColorSchemeAccents(AItems: TStrings);
    procedure PopulateColorSchemes(AItems: TStrings);
  public
    constructor Create(AOwner: TComponent); override;
    procedure LoadOptions(const AColorSchemeName: string;
      const AScreenTipOptions: TScreenTipOptions; AStyle: TRibbonDemoStyle;
      AColorSchemeAccent: TdxRibbonColorSchemeAccent);
    procedure SaveOptions(out AColorSchemeName: string;
      out AScreenTipOptions: TScreenTipOptions; out AStyle: TRibbonDemoStyle;
      out AColorSchemeAccent: TdxRibbonColorSchemeAccent);
  end;

function ExecuteRibbonDemoOptions(var AColorSchemeName: string;
  var AScreenTipOptions: TScreenTipOptions; var AStyle: TRibbonDemoStyle;
  var AColorSchemeAccent: TdxRibbonColorSchemeAccent): Boolean;
implementation

uses
  cxLookAndFeelPainters;

{$R *.dfm}

function ExecuteRibbonDemoOptions(var AColorSchemeName: string;
  var AScreenTipOptions: TScreenTipOptions; var AStyle: TRibbonDemoStyle;
  var AColorSchemeAccent: TdxRibbonColorSchemeAccent): Boolean;
begin
  with TRibbonDemoOptionsForm.Create(nil) do
  try
    LoadOptions(AColorSchemeName, AScreenTipOptions, AStyle, AColorSchemeAccent);
    Result := ShowModal = mrOk;
    if Result then
      SaveOptions(AColorSchemeName, AScreenTipOptions, AStyle, AColorSchemeAccent);
  finally
    Free;
  end;
end;

{ TRibbonDemoOptionsForm }

constructor TRibbonDemoOptionsForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  PopulateColorSchemes(cbColorScheme.Items);
  PopulateColorSchemeAccents(cbColorSchemeAccent.Items);
end;

procedure TRibbonDemoOptionsForm.cbRibbonStyleSelect(Sender: TObject);
begin
  cbColorSchemeAccent.Enabled := cbRibbonStyle.ItemIndex > 0;
  lblColorSchemeAccent.Enabled := cbRibbonStyle.ItemIndex > 0;
end;

procedure TRibbonDemoOptionsForm.LoadOptions(const AColorSchemeName: string;
  const AScreenTipOptions: TScreenTipOptions; AStyle: TRibbonDemoStyle;
  AColorSchemeAccent: TdxRibbonColorSchemeAccent);
begin
  cbRibbonStyle.ItemIndex := Ord(AStyle);
  cbColorScheme.ItemIndex := cbColorScheme.Items.IndexOf(AColorSchemeName);
  cbColorSchemeAccent.ItemIndex := Ord(AColorSchemeAccent);
  if AScreenTipOptions.ShowScreenTips then
    cbScreenTipStyle.ItemIndex := Ord(not AScreenTipOptions.ShowDescripitons)
  else
    cbScreenTipStyle.ItemIndex := 2;
  cbRibbonStyleSelect(nil);
end;

procedure TRibbonDemoOptionsForm.SaveOptions(out AColorSchemeName: string;
  out AScreenTipOptions: TScreenTipOptions; out AStyle: TRibbonDemoStyle;
  out AColorSchemeAccent: TdxRibbonColorSchemeAccent);
begin
  AColorSchemeName := cbColorScheme.Text;
  AStyle := TRibbonDemoStyle(cbRibbonStyle.ItemIndex);
  AScreenTipOptions.ShowScreenTips := cbScreenTipStyle.ItemIndex <> 2;
  AScreenTipOptions.ShowDescripitons := cbScreenTipStyle.ItemIndex = 0;
  AColorSchemeAccent := TdxRibbonColorSchemeAccent(cbColorSchemeAccent.ItemIndex);
end;

procedure TRibbonDemoOptionsForm.PopulateColorSchemeAccents(AItems: TStrings);
var
  AAccentIndex: TdxRibbonColorSchemeAccent;
begin
  AItems.BeginUpdate;
  try
    AItems.Clear;
    for AAccentIndex := Low(TdxRibbonColorSchemeAccent) to High(TdxRibbonColorSchemeAccent) do
      AItems.Add(dxRibbonColorSchemeAccentNames[AAccentIndex]);
  finally
    AItems.EndUpdate;
  end;
end;

procedure TRibbonDemoOptionsForm.PopulateColorSchemes(AItems: TStrings);

  procedure AddColorScheme(const AName: string);
  begin
    if AItems.IndexOf(AName) < 0 then
      AItems.Add(AName)
  end;

var
  I: Integer;
begin
  AItems.BeginUpdate;
  try
    AItems.Clear;
    AddColorScheme('Black');
    AddColorScheme('Blue');
    AddColorScheme('Silver');

    for I := 0 to cxLookAndFeelPaintersManager.Count - 1 do
    begin
      if cxLookAndFeelPaintersManager[I].LookAndFeelStyle = lfsSkin then
        AddColorScheme(cxLookAndFeelPaintersManager[I].LookAndFeelName);
    end;
  finally
    AItems.EndUpdate;
  end;
end;

end.

