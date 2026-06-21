program cxTreeListFeaturesDemo;

uses
  Forms,
  cxTreeListDemoMainUnit in 'cxTreeListDemoMainUnit.pas' {TreeListFeaturesDemoMainForm},
  cxCustomTreeListBaseFormUnit in 'cxCustomTreeListBaseFormUnit.pas' {cxCustomTreeListDemoUnitForm},
  cxUnboundTreeListBaseFormUnit in 'cxUnboundTreeListBaseFormUnit.pas' {cxUnboundTreeListDemoUnitForm},
  cxTreeListPlanetsFormUnit in 'cxTreeListPlanetsFormUnit.pas' {frmPlanets},
  cxTreeListInspectorUnit in 'cxTreeListInspectorUnit.pas' {frmInspector},
  cxTreeListAboutFormUnit in 'cxTreeListAboutFormUnit.pas' {frmAbout},
  cxTreeListExpandableBandsFormUnit in 'cxTreeListExpandableBandsFormUnit.pas' {frmExpandableBands},
  cxTreeListGroupSummaryFormUnit in 'cxTreeListGroupSummaryFormUnit.pas' {frmGroupSummary},
  cxTreeListQuickVisibilityCustomization in 'cxTreeListQuickVisibilityCustomization.pas' {frmQuickVisibilityCustomization},
  cxDBTreeListBaseFormUnit in 'cxDBTreeListBaseFormUnit.pas' {cxDBTreeListDemoUnitForm},
  cxTreeListDataModule in 'cxTreeListDataModule.pas' {dmTreeList: TDataModule},
  cxTreeListDepartmentsFormUnit in 'cxTreeListDepartmentsFormUnit.pas' {frmDepartments},
  cxTreeListBiolifeFormUnit in 'cxTreeListBiolifeFormUnit.pas' {frmBiolife},
  cxTreeListCarsFormUnit in 'cxTreeListCarsFormUnit.pas' {frmCars},
  cxTreeListLevelImagesFormUnit in 'cxTreeListLevelImagesFormUnit.pas' {frmLevelImages},
  cxTreeListNestedBandsFormUnit in 'cxTreeListNestedBandsFormUnit.pas' {frmNestedBands},
  cxTreeListFixedBandsFormUnit in 'cxTreeListFixedBandsFormUnit.pas' {frmFixedBands},
  cxTreeListMultipleSummaryFormUnit in 'cxTreeListMultipleSummaryFormUnit.pas' {frmMultipleSummary},
  cxTreeListSummaryCalculationBaseFormUnit in 'cxTreeListSummaryCalculationBaseFormUnit.pas' {frmSummaryCalculationBase},
  cxTreeListIssueListFormUnit in 'cxTreeListIssueListFormUnit.pas' {frmIssueList},
  cxTreeListImagesFormUnit in 'cxTreeListImagesFormUnit.pas' {frmImages},
  cxTreeListNodeHeightFormUnit in 'cxTreeListNodeHeightFormUnit.pas' {frmNodeHeight},
  cxTreeListNodeVisibilityFormUnit in 'cxTreeListNodeVisibilityFormUnit.pas' {frmNodeVisibility},
  cxTreeListExplorerFormUnit in 'cxTreeListExplorerFormUnit.pas' {frmTreeListExplorer},
  cxTreeListDragAndDropFormUnit in 'cxTreeListDragAndDropFormUnit.pas' {frmDragAndDrop},
  cxVirtualTreeListBaseFormUnit in 'cxVirtualTreeListBaseFormUnit.pas' {cxVirtualTreeListDemoUnitForm},
  cxProviderModeDemoClasses in 'cxProviderModeDemoClasses.pas',
  cxTreeListIniEditorFormUnit in 'cxTreeListIniEditorFormUnit.pas' {frmIniEditor},
  cxTreeListInplaceEditorsFormUnit in 'cxTreeListInplaceEditorsFormUnit.pas' {frmInplaceEditors},
  cxTreeListInplaceEditorsValidationFormUnit in 'cxTreeListInplaceEditorsValidationFormUnit.pas' {frmInplaceEditorsValidation},
  cxColumnsMultiEditorsDemoPopup in 'cxColumnsMultiEditorsDemoPopup.pas' {ColumnsMultiEditorsDemoPopupForm},
  cxTreeListCustomDrawFormUnit in 'cxTreeListCustomDrawFormUnit.pas' {frmCustomDraw},
  cxCustomDrawDemoEditor in 'cxCustomDrawDemoEditor.pas' {CustomDrawDemoEditorForm},
  cxCustomDrawDemoConsts in 'cxCustomDrawDemoConsts.pas',
  cxTreeListCheckGroupsFormUnit in 'cxTreeListCheckGroupsFormUnit.pas' {frmCheckGroups},
  cxTreeListStylesFormUnit in 'cxTreeListStylesFormUnit.pas' {frmTreeListStyles},
  cxTreeListMenusFormUnit in 'cxTreeListMenusFormUnit.pas' {frmMenus},
  cxTreeListPreviewFormUnit in 'cxTreeListPreviewFormUnit.pas' {frmPreview},
  cxTreeListSearchFormUnit in 'cxTreeListSearchFormUnit.pas' {frmSearch},
  cxTreeListFullVirtualFormUnit in 'cxTreeListFullVirtualFormUnit.pas' {frmFullVirtual},
  cxTreeListFeaturesDemoUtils in 'cxTreeListFeaturesDemoUtils.pas',
  cxTreeListFeaturesDemoStrConsts in 'cxTreeListFeaturesDemoStrConsts.pas',
  dxDemoUtils in 'dxDemoUtils.pas',
  dxAboutDemo in 'dxAboutDemo.pas' {dxAboutDemoForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'ExpressQuantumTreeList Features Demo';
  Application.CreateForm(TTreeListFeaturesDemoMainForm, TreeListFeaturesDemoMainForm);
  Application.CreateForm(TdmTreeList, dmTreeList);
  Application.Run;
end.
