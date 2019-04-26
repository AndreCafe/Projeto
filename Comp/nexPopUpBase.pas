unit nexPopUpBase;

interface

uses
  SysUtils, Classes, Controls, cxControls, cxContainer, cxEdit,
  SpTBXFormPopupMenu, SpTBXItem, SpTBXControls, cxTextEdit, Menus,
  Forms, SpTBXSkins;

type
  TnexPopUpBase = class(TcxTextEdit)
  private
    FOnChange: TMenuChangeEvent;
    FOnPopup: TNotifyEvent;
    FOnClosePopup: TSpTBXRollUpEvent;
    FOnBeforeClosePopup: TSpTBXRollUpEvent;
    FOnBeforePopup: TSpTBXRollDownEvent;
    FOnGetPopupFormClass: TSpTBXGetFormClassEvent;
    procedure SetPopupForm(Value: TCustomForm);
    procedure doPopup(Sender: TObject);
    procedure doGetPopupFormClass(Sender: TObject; var AFormClass: TCustomFormClass);
    procedure doClosePopup(Sender: TObject; Selected: Boolean);
    procedure doBeforeClosePopup(Sender: TObject; Selected: Boolean);
    procedure doBeforePopup(Sender: TObject; var FormWidth, FormHeight: Integer);
    { Private declarations }
  protected
    fFormPopupMenu: TSpTBXFormPopupMenu;
    fPopupForm: TCustomForm;
    procedure DoPopupChange(Sender: TObject; Source: TMenuItem; Rebuild: Boolean); 
    { Protected declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property PopupForm: TCustomForm read FPopupForm write SetPopupForm;
    { Public declarations }
  published
    property OnChange: TMenuChangeEvent read FOnChange write FOnChange;
    property OnPopup: TNotifyEvent read FOnPopup write FOnPopup;
    property OnClosePopup: TSpTBXRollUpEvent read FOnClosePopup write FOnClosePopup;
    property OnBeforeClosePopup: TSpTBXRollUpEvent read FOnBeforeClosePopup write FOnBeforeClosePopup;
    property OnBeforePopup: TSpTBXRollDownEvent read FOnBeforePopup write FOnBeforePopup;
    property OnGetPopupFormClass: TSpTBXGetFormClassEvent read FOnGetPopupFormClass write FOnGetPopupFormClass;
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('NexCafe', [TnexPopUpBase]);
end;

constructor TnexPopUpBase.Create(AOwner: TComponent);
begin
    inherited;
    fFormPopupMenu := TSpTBXFormPopupMenu.Create(nil);
    fFormPopupMenu.SkinType := sknNone;

    fFormPopupMenu.OnChange := DoPopupChange;
    fFormPopupMenu.OnPopup  := doPopup;

    fFormPopupMenu.OnGetPopupFormClass  := doGetPopupFormClass;
    fFormPopupMenu.OnClosePopup         := doClosePopup;
    fFormPopupMenu.OnBeforeClosePopup   := doBeforeClosePopup;
    fFormPopupMenu.OnBeforePopup        := doBeforePopup;

    PopupMenu := fFormPopupMenu;

end;

destructor TnexPopUpBase.Destroy;
begin
    fFormPopupMenu.Free;
    inherited;
end;

procedure TnexPopUpBase.doBeforeClosePopup(Sender: TObject; Selected: Boolean);
begin
    if assigned(fOnBeforeClosePopup) then
        fOnBeforeClosePopup(self, Selected);
end;

procedure TnexPopUpBase.doBeforePopup(Sender: TObject; var FormWidth,
  FormHeight: Integer);
begin
    if assigned(fOnBeforePopup) then
        fOnBeforePopup(self, FormWidth, FormHeight);
end;

procedure TnexPopUpBase.DoPopupChange(Sender: TObject; Source: TMenuItem; Rebuild: Boolean);
begin
    if assigned(fOnChange) then
        fOnChange(self, Source, Rebuild);
end;

procedure TnexPopUpBase.doClosePopup(Sender: TObject; Selected: Boolean);
begin
    if assigned(fOnClosePopup) then
        fOnClosePopup(self, Selected);
end;

procedure TnexPopUpBase.doGetPopupFormClass(Sender: TObject;
  var AFormClass: TCustomFormClass);
begin
    if assigned(fOnGetPopupFormClass) then
        fOnGetPopupFormClass(self, AFormClass);
end;

procedure TnexPopUpBase.doPopup(Sender: TObject);
begin
    if assigned(fOnPopup) then
        fOnPopup(self);
end;

procedure TnexPopUpBase.SetPopupForm(Value: TCustomForm);
begin
  if FPopupForm <> Value then begin
    FPopupForm := Value;
    fFormPopupMenu.PopupForm := Value;
  end;
end;


end.
