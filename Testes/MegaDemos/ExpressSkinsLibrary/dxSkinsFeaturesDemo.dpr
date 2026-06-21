program dxSkinsFeaturesDemo;

uses
  Forms,
  dxSkinEditorDM in 'dxSkinEditorDM.pas' {TdmSkinEditor},
  dxSkinEditorPreview in 'dxSkinEditorPreview.pas' {TdxSkinEditorPreviewForm},
  dxSkinsMainForm in 'dxSkinsMainForm.pas' {TdxSkinsDemoMainForm},
  dxAboutDemo in 'dxAboutDemo.pas' {dxAboutDemoForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressSkins Features Demo';
  Application.CreateForm(TdmSkinEditor, dmSkinEditor);
  Application.CreateForm(TdxSkinsDemoMainForm, dxSkinsDemoMainForm);
  dxSkinsDemoMainForm.Caption := Application.Title;
  Application.Run;
end.
