unit dxSkinEditorStrs;

interface

uses
  dxSkinsCore, dxSkinsStrs;

const
  sdxRegistryOptionAlternateImageSet = 'AlternateImageSet';
  sdxRegistryOptionHideUnusedElements = 'HideUnusedElements';
  sdxRegistryOptionPreviewAlternateImageSet = 'PreviewAlternateImageSet';
  sdxRegistryOptionPreviewBackgroundColor = 'PreviewBackgroundColor';
  sdxRegistryOptionPreviewTransparencyCheckerboard = 'PreviewTransparencyCheckerboard';
  sdxRegistryOptionUseFadingAnimation = 'UseFadingAnimation';
  sdxRegistryPath = 'Software\Developer Express\SkinEditor VCL\';
  sdxRegistryProjectPrefix = 'Project_';
  sdxRegistryProjects = 'Projects';
  sdxRigistryPackageCompanySuffix = 'PackageCompanySuffix';

resourcestring
  sdxImport = 'Import';
  sdxOpen = 'Open';
  sdxSave = 'Save';

  sdxSkinResInvalidCmdSwitch = 'Incorrect parameter value "%s"!';
  sdxSkinResAboutParameters = 'Available command line parameters:' + #13#10 +
    '/MAKESKINRES= Specifies the path and file name of the skin project, for which to create .SKINRES files.' + #13#10 +
    '/OUTPATH= Specifies the output path for .SKINRES files.'  + #13#10 +
    '/S Enables silent mode. In this mode, no error messages or dialogs are displayed while running the Skin Editor with command line parameters.';
  sdxSkinResOutPathNotFound = 'The path specified by the /OUTPATH parameter cannot be found.';
  sdxSkinResProjectCorrupted = 'The skin project file specified by the /MAKESKINRES parameter is corrupt.';
  sdxSkinResProjectNotFound = 'The skin project file specified by the /MAKESKINRES parameter cannot be found.';

  sdxFilter = 'Express Skins Project (*%s)|*%s|Express Skins Binary (*%s)|*%s';
  sdxInvalidFileFormat = ' %s file format is not valid';
  sdxMainFormCaption = 'Skin Editor (for VCL products)';
  sdxNETProjectFilter = '.NET skin project (*.xml)|*.xml|';
  sdxSaveChanges = 'Save changes to project %s?';
  sdxSkinDelete = 'Are you sure you want to delete the "%s" skin?';
  sdxSkinFileName = 'Skin.xml';
  sdxSkinProjectExt = '.skinproj';
  sdxSkinProjectName = 'dxSkinProject1';
  scxSkinDetails = 'Skin D&etails';

  sdxInvalidPath = 'The %s path is invalid.';

  // main form
  sdxGroups = 'Groups';
  scxColors = 'Colors';
  scxAdditional = 'Additional';
  scxProperties = 'Properties';
  scxPreview = 'Preview';
  scxPanelElementEditor = 'Element editor';

  // new project dialog
  sdxAddSkins = 'Add Skins';
  sdxEmpty = 'Empty';
  sdxLocation = 'Project Location:';
  sdxNewProject = 'New project';
  sdxNewSkin = 'MySkin_%s';
  sdxNone = 'None';
  sdxProjectName = 'Project Name:';
  sdxSkinName = 'Skin Name:';
  sdxTemplates = 'Templates:';

  // project manager dialog 
  scxProjectManager = 'Project Manager';

  // add property dialog
  scxAddColor = 'Add Color';
  scxAddProperty = 'Add Property';
  scxNewPropertyName = 'New%sProperty';
  scxPropertyName = 'Property Name:';
  scxState = 'State:';
  scxType = 'Type:';

  // buttons
  scxAdd = '&Add';
  scxClose = 'C&lose';
  scxDelete = '&Delete';
  scxRename = '&Rename';
  scxDetails = 'D&etails';
  sdxCancel = '&Cancel';
  sdxOk = '&Ok';

  // Add / Remove Element
  sdxAddNewElementCaption = 'Add Element';
  sdxAddNewElementCustomName = 'NewElement';
  sdxAddNewElementName = 'Element Name:';
  sdxAddNewElementToAllSkins = 'Add Element To All Skins';

  // Rename dialog
  sdxRenameDialogCaption = 'Rename Member';
  sdxRenameDialogPrompt = 'New Member Name:';

  sdxSkinDeleteColorConfirm = 'Do you want to delete the selected color?';
  sdxSkinDeletePropertyConfirm = 'Do you want to delete the selected property?';
  sdxSkinIncorrectIconDimensions = 'Incorrect icon dimensions. The icon must be %s';
  sdxSkinNeedStoreToDisk = 'Skin images are stored in memory and haven''t been saved to disk.' + #13#10 +
    'You need to save the images to disk before they can be opened in the graphics editor.' + #13#10 +
    'Do you want to save the images?';
  sdxSkinTryToEditSkinResProject = 'You need to save the currently opened skin binary ' +
    '(.SKINRES) file to disk as a skin project (.SKINPROJ) file, before images can be ' +
    'opened in the graphics editor.' + #13#10#13#10 +
    'Do you want to save the .SKINRES file as a .SKINPROJ file?';

const
  SkinProjectExtension: array[0..1] of string =
    (sdxSkinProjectExt, sdxSkinBinaryProjectExt);

  sdxSkinDetailsIconSizeNames: array[TdxSkinIconSize] of string = ('16x16', '48x48');
  sdxSkinDetailsNotes = 'Notes.txt';

  sdxCurrentSkin = '{6B090076-36D1-4C9F-A9B3-94B030C56479}';

implementation

end.
