unit ufmFormSizedFonts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxBar, dxPSCore, cxGridCustomPopupMenu,
  cxGridPopupMenu, cxClasses, ExtCtrls, uParentedPanel, LMDSimplePanel;

type
  TSizeInfo = class
     name : string;
     size : integer;
  end;

  {TOnChangeInfo = class
     name : string;
     mthd : TMethod;
  end;}

  TOnResizeComponentEvent = procedure(Sender: TObject; aComponent:TComponent; var newWidth, newHeight:integer) of object;

  TSizeInfoList = class(TList)
   protected
    function Get(Index: Integer): TSizeInfo;
    procedure Put(Index: Integer; Item: TSizeInfo);
   public
    procedure Clear; override;
    function byName(aName:string):TSizeInfo;
    function exists(aName:string):boolean;
    function Add(aName:string; aSize:integer): Integer;
  end;

  {TOnChangeInfoList = class(TList)
   protected
    function Get(Index: Integer): TOnChangeInfo;
    procedure Put(Index: Integer; Item: TOnChangeInfo);
   public
    procedure Clear; override;
    function byName(aName:string):TOnChangeInfo;
    function exists(aName:string):boolean;
    function Add(aName:string; aMthd:TMethod): Integer;
  end;}

  TFrmSizedFonts = class(TFrmBase)
   private
    fOnParentModified : TOnParentModifiedEvent;
    fOnResizeSimplePanel  : TOnResizeComponentEvent;
    fOnResizeComponent    : TOnResizeComponentEvent;
    fLastParent : TWinControl;
    fIsFullScreen  : boolean;
    fZoomFactor  : double;
    fNormailFormFontSize : integer;
    fSizeInfoList : TSizeInfoList;
    //fOnChangeInfoList : TOnChangeInfoList;
    //fCustomEditPropertiesInfoList : TOnChangeInfoList;
    fSimplePanelList :TStringList;
    procedure panPriOnParentModified(Sender:TObject; aParent:TWinControl);
    procedure resizeControl(aComponent: TComponent);
    procedure InternalSetParent(AParent: TWinControl);
    procedure calcZoomFactor(aComponent:TControl; var f1, f2: TFont; var aZoomFactorX, aZoomFactorY: double);
    //procedure ControlChange(Sender:TObject);
   protected
    procedure resizeControls; dynamic;
    procedure doParentModified(AParent: TWinControl); virtual;
    procedure SetParent(AParent: TWinControl); override;
    procedure SetZoomFactor(value:double);
    procedure doResizeSimplePanel(aComponent:TComponent; var newWidth, newHeight:integer); virtual;
    procedure doResizeComponent(aComponent:TComponent; var newWidth, newHeight:integer); virtual;
   public
    property isFullScreen  : boolean read fIsFullScreen write fIsFullScreen;
    property onResizeSimplePanel  : TOnResizeComponentEvent read fOnResizeSimplePanel write fOnResizeSimplePanel;
    property onResizeComponent  : TOnResizeComponentEvent read fOnResizeComponent write fOnResizeComponent;
    property ZoomFactor  : double read fZoomFactor write SetZoomFactor;
    procedure ParentChanged; override;
    procedure setNormalScreen;
    procedure setFullScreen;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property OnParentModified : TOnParentModifiedEvent read FOnParentModified write FOnParentModified;
  end;

var
    FrmSizedFonts: TFrmSizedFonts;
    
implementation

{$R *.dfm}

{ TfbFormSizedFonts }

uses
   TypInfo, dxDockControl, ncaFrmPri, StdCtrls, uLogs, 
   math, cxContainer, cxDBLookupComboBox{, cxEdit{, cxLookupEdit};

constructor TFrmSizedFonts.Create(AOwner: TComponent);
begin
  inherited;
  panPri.OnParentModified := panPriOnParentModified;
  fSizeInfoList := TSizeInfoList.create;
  //fOnChangeInfoList := TOnChangeInfoList.create;
  //fCustomEditPropertiesInfoList := TOnChangeInfoList.create;
  fSimplePanelList := TStringList.create;
end;

destructor TFrmSizedFonts.Destroy;
begin
  fSizeInfoList.free;
  //fOnChangeInfoList.free;
  //fCustomEditPropertiesInfoList.free;
  fSimplePanelList.free;
  inherited;
end;

procedure TFrmSizedFonts.ParentChanged;
begin
  inherited;

end;

procedure TFrmSizedFonts.doParentModified(AParent: TWinControl);
begin
    if assigned(FOnParentModified) then
      fOnParentModified(Self, AParent);
    ParentChanged;
end;

procedure TFrmSizedFonts.doResizeComponent(aComponent: TComponent; var newWidth,
  newHeight: integer);
begin
   if assigned(fOnResizeComponent) then
       fOnResizeComponent(Self, aComponent, newWidth, newHeight);
end;

procedure TFrmSizedFonts.doResizeSimplePanel(aComponent:TComponent; var newWidth, newHeight: integer);
begin
   if assigned(fOnResizeSimplePanel) then
       fOnResizeSimplePanel(Self, aComponent, newWidth, newHeight);
end;

procedure TFrmSizedFonts.InternalSetParent(AParent: TWinControl);
begin
    resizeControls;
end;

procedure TFrmSizedFonts.panPriOnParentModified(Sender: TObject; aParent:TWinControl);
begin
  if fNormailFormFontSize=0 then begin
      fNormailFormFontSize := self.Font.Size;

  end;
  if parent<>aParent then
      doParentModified(aParent);
end;

procedure TFrmSizedFonts.calcZoomFactor(aComponent:TControl; var f1, f2: TFont; var aZoomFactorX, aZoomFactorY: double);
var
    PropInfo: PPropInfo;
    bmp : TBitmap;
    x1,x2,y1,y2 : integer;
    txt : string;
begin
    aZoomFactorX := fZoomFactor;
    aZoomFactorY := fZoomFactor;
    txt := '';
    PropInfo := GetPropInfo(aComponent, 'caption');
    if Assigned(PropInfo) then
        txt := GetStrProp(aComponent, 'caption')
    else begin
        PropInfo := GetPropInfo(aComponent, 'text');
        if Assigned(PropInfo) then
            txt := GetStrProp(aComponent, 'text')
    end;
    if txt<>'' then begin
        bmp := TBitmap.create;
        try
            bmp.PixelFormat := pf24bit;
            bmp.Width  := trunc(TControl(aComponent).Width  * fZoomFactor * 1.3);
            bmp.Height := trunc(TControl(aComponent).Height * fZoomFactor * 1.3);

            with bmp.canvas do begin
              Font.Assign(f1);
              x1 := TextWidth(txt);
              y1 := TextHeight(txt);
              Font.Assign(f2);
              x2 := TextWidth(txt);
              y2 := TextHeight(txt);
            end;
            aZoomFactorX := x2 / x1;
            aZoomFactorY := y2 / y1;
        finally
            bmp.free;
        end;
    end;
end;

procedure TFrmSizedFonts.resizeControl(aComponent: TComponent);
var
    f1, f2 : TFont;
    b : boolean;
    PropInfo: PPropInfo;
    //mthd : TMethod;
    //PEvent: ^TNotifyEvent;
    cProp : TcxLookupComboBoxProperties; //TcxCustomEditProperties;
    cStyle : TcxContainerStyle;
    clss : TClass;
    x, y, newWidth, newHeight : integer;
    aZoomFactorX, aZoomFactorY : double;
begin

    if (fSizeInfoList.exists(aComponent.name)) {or
       (fOnChangeInfoList.exists(aComponent.name)) or
        (fCustomEditPropertiesInfoList.exists(aComponent.name))} then exit;
    //if (fSizeInfoList.exists(aComponent.name)) and
    //   (fSizeInfoList.byName(aComponent.name).size = trunc(valorqueseja)) then exit;

    glog.log(self,[lcTrace],'resizeControl: '+aComponent.ClassName+' '+aComponent.Name);

    {PropInfo := GetPropInfo(aComponent, 'font', [tkClass]);
    if Assigned(PropInfo) then begin
        glog.log(self,[lcTrace],'resizeControl font: '+aComponent.ClassName+' '+aComponent.Name);

        mthd.Code := nil;
        mthd.Data := nil;
        PropInfo := GetPropInfo(aComponent, 'OnChange');
        if Assigned(PropInfo) and (PropInfo^.PropType^^.Kind = tkMethod) then begin
            mthd := GetMethodProp(aComponent, PropInfo);
            fOnChangeInfoList.Add(aComponent.name, mthd);
            glog.log(self,[lcTrace],'resizeControl OnChange: '+aComponent.ClassName+' '+aComponent.Name);

            PEvent := @mthd.Code;
            PEvent^ := ControlChange;
            mthd.Data := Self;
            SetMethodProp(aComponent, 'OnChange', mthd);
        end else
            glog.log(self,[lcTrace],'resizeControl OnChange not found: '+aComponent.ClassName+' '+aComponent.Name);
    end;

    PropInfo := GetPropInfo(aComponent, 'Properties');
    if Assigned(PropInfo) then begin
        clss := GetObjectPropClass(aComponent, 'Properties');
        if Assigned(clss) then begin
            cep := TcxCustomEditProperties(GetObjectProp(aComponent, 'Properties', clss));
            if Assigned(cep) then begin
                glog.log(self,[lcTrace],'resizeControl Properties: '+aComponent.ClassName+' '+aComponent.Name);

                if Assigned(cep.OnChange) then begin
                    PEvent := @mthd.Code;
                    PEvent^ := cep.OnChange
                end else
                    glog.log(self,[lcTrace],'resizeControl Properties.OnChange unassigned: '+aComponent.ClassName+' '+aComponent.Name);

                mthd.Data := Self;
                fCustomEditPropertiesInfoList.Add(aComponent.name, mthd);
                cep.OnChange := ControlChange;
                SetObjectProp(aComponent, 'Properties', cep);
            end else
               glog.log(self,[lcTrace],'resizeControl Properties unassigned: '+aComponent.ClassName+' '+aComponent.Name)
        end else
            glog.log(self,[lcTrace],'resizeControl Properties cass unassigned: '+aComponent.ClassName+' '+aComponent.Name)
    end else
        glog.log(self,[lcTrace],'resizeControl Properties not found: '+aComponent.ClassName+' '+aComponent.Name);
    }

    PropInfo := GetPropInfo(aComponent, 'ParentFont');
    if Assigned(PropInfo) then begin
        b := GetOrdProp(aComponent, 'ParentFont')=1;
        if b then begin;
            glog.log(self,[lcTrace],'resizeControl: '+aComponent.ClassName+' '+aComponent.Name+' has Parent Font');
            exit;
        end;
    end else
        glog.log(self,[lcTrace],'resizeControl: no parent font prop: '+aComponent.ClassName+' '+aComponent.Name);

    PropInfo := GetPropInfo(aComponent, 'font', [tkClass]);
    if Assigned(PropInfo) then begin
        f2 := TFont(GetObjectProp(aComponent, 'font', TFont));
        if Assigned(f2) then begin;

            glog.log(self,[lcTrace],'resizeControl: '+aComponent.ClassName+' '+aComponent.Name+' has '+ inttostr(f2.Height)+'->'+inttostr(trunc(f2.Height * fZoomFactor))+' font Height');

            f1 := TFont.Create;
            try
              f1.assign(f2);
              f2.Height :=  trunc(f2.Height * fZoomFactor);
              SetObjectProp(aComponent, 'font', f2);
              fSizeInfoList.add(aComponent.Name, f2.Height);

              if aComponent is TControl then begin

                  calcZoomFactor(TControl(aComponent), f1, f2, aZoomFactorX, aZoomFactorY);

                  newWidth  := trunc( TControl(aComponent).Width  * fZoomFactor);
                  newHeight := trunc( TControl(aComponent).Height * fZoomFactor);
                  doResizeComponent(aComponent, newWidth, newHeight);
                  TControl(aComponent).Width  := newWidth;
                  TControl(aComponent).Height := newHeight;
              end;
            finally
              f1.free;
            end;
        end;
    end else begin
        glog.log(self,[lcTrace],'resizeControl: no font prop: '+aComponent.ClassName+' '+aComponent.Name);

        PropInfo := GetPropInfo(aComponent, 'Style');
        if Assigned(PropInfo) then begin
            clss := GetObjectPropClass(aComponent, 'Style');
            if Assigned(clss) then begin
                cStyle := TcxContainerStyle(GetObjectProp(aComponent, 'Style', clss));
                if Assigned(cStyle) then begin
                    glog.log(self,[lcTrace],'resizeControl Style: '+aComponent.ClassName+' '+aComponent.Name);

                    if Assigned(cStyle.Font) then begin
                    end else
                        glog.log(self,[lcTrace],'resizeControl Style.Font unassigned: '+aComponent.ClassName+' '+aComponent.Name);

                    f2 := cStyle.Font;
                    f1 := TFont.Create;
                    try
                      f1.assign(f2);
                      f2.Height :=  trunc(f2.Height * fZoomFactor);
                      fSizeInfoList.add(aComponent.Name, f2.Height);

                      if aComponent is TControl then begin

                          calcZoomFactor(TControl(aComponent), f1, f2, aZoomFactorX, aZoomFactorY);

                          newWidth  := trunc( TControl(aComponent).Width  * fZoomFactor);
                          newHeight := trunc( TControl(aComponent).Height * fZoomFactor);
                          doResizeComponent(aComponent, newWidth, newHeight);
                          TControl(aComponent).Width  := newWidth;
                          TControl(aComponent).Height := newHeight;

                      end;
                    finally
                      f1.free;
                    end;

                    cStyle.Font.assign(f2);
                    SetObjectProp(aComponent, 'Style', cStyle);
                end else
                   glog.log(self,[lcTrace],'resizeControl Style unassigned: '+aComponent.ClassName+' '+aComponent.Name);

                {
                PropInfo := GetPropInfo(aComponent, 'Properties');
                if Assigned(PropInfo) then begin
                    glog.log(self,[lcTrace],'resizeControl Properties: '+aComponent.ClassName+' '+aComponent.Name);
                    clss := GetObjectPropClass(aComponent, 'Properties');
                    if Assigned(clss) then begin
                        if clss = TcxLookupComboBoxProperties then begin
                            cProp := TcxLookupComboBoxProperties(GetObjectProp(aComponent, 'Properties', clss));
                            x := trunc(cProp.DropDownWidth  * aZoomFactorX);
                            cProp.DropDownWidth := min(x, self.width - TControl(aComponent).left - 10);
                            y := trunc(cProp.DropDownHeight * aZoomFactorY);
                            cProp.DropDownHeight := min(y, self.height - TControl(aComponent).Top - 10);

                            //SetObjectProp(aComponent, 'Properties', cProp);
                        end;
                    end else
                        glog.log(self,[lcTrace],'resizeControl Properties class unassigned: '+aComponent.ClassName+' '+aComponent.Name)
                end else
                    glog.log(self,[lcTrace],'resizeControl Properties not found: '+aComponent.ClassName+' '+aComponent.Name);
                }
            end else
                glog.log(self,[lcTrace],'resizeControl Style class unassigned: '+aComponent.ClassName+' '+aComponent.Name)
        end else
            glog.log(self,[lcTrace],'resizeControl Style not found: '+aComponent.ClassName+' '+aComponent.Name);

    end;

end;

{procedure TFrmSizedFonts.ControlChange(Sender:TObject);
begin
    glog.log(self,[lcTrace],'ControlChange: '+Sender.ClassName+' '+TComponent(Sender).Name);
end;}

procedure TFrmSizedFonts.resizeControls;
var
    i, newWidth, newHeight : integer;
    sp : TLMDSimplePanel;
begin

   for i:=0 to ComponentCount-1 do begin
       if (Components[i] is TLMDSimplePanel) and
          (fSimplePanelList.indexof(Components[i].name)=-1)
       then begin
           sp :=  TLMDSimplePanel(Components[i]);
           sp.AutoSize    := false;
           sp.AllowSizing := true;
           if sp.align<>alClient then begin
             newWidth  := trunc( sp.Width  * fZoomFactor);
             newHeight := trunc( sp.Height * fZoomFactor);
             doResizeSimplePanel(sp, newWidth, newHeight);
             sp.Width  := newWidth;
             sp.Height := newHeight;
           end;
           fSimplePanelList.add(sp.name);
       end;

       resizeControl(Components[i]);
   end;

   //for i:=0 to ComponentCount-1 do
   //    if Components[i] is TLMDSimplePanel then
   //        TLMDSimplePanel(Components[i]).AutoSize := true;

end;

procedure TFrmSizedFonts.setFullScreen;
begin
   fLastParent := panPri.Parent;
   panPri.Parent := FrmPri;
   fIsFullScreen := true;
   resizeControls;
end;

procedure TFrmSizedFonts.setNormalScreen;
begin
   panPri.Parent := fLastParent;
   fIsFullScreen := false;
   resizeControls;
end;

procedure TFrmSizedFonts.SetParent(AParent: TWinControl);
begin
  inherited;
  InternalSetParent(aParent)
end;

procedure TFrmSizedFonts.SetZoomFactor(value: double);
begin
    if value<>fZoomFactor then begin
        fZoomFactor := value;
        resizeControls;
    end;
end;

{ TSizeInfoList }

function TSizeInfoList.Add(aName:string; aSize:integer): Integer;
var
    Item: TSizeInfo;
begin
    Item := TSizeInfo.create;
    Item.name := aName;
    Item.size := aSize;
    result := inherited add(Item);
end;

function TSizeInfoList.byName(aName: string): TSizeInfo;
var
    i : integer;
begin
    result := nil;
    for i:=0 to count-1 do
        if sametext(get(i).name,aName) then begin
            result := get(i);
            exit;
        end;
end;

procedure TSizeInfoList.Clear;
var
    i : integer;
begin
    for i:=0 to count-1 do
        get(i).free;
    inherited;
end;

function TSizeInfoList.exists(aName: string): boolean;
var
    i : integer;
begin
    result := false;
    for i:=0 to count-1 do
    if sametext(get(i).name,aName) then begin
        result := true;
        exit;
    end;
end;

function TSizeInfoList.Get(Index: Integer): TSizeInfo;
begin
    result := TSizeInfo(inherited get(Index));
end;

procedure TSizeInfoList.Put(Index: Integer; Item: TSizeInfo);
begin
    if not exists(Item.name) then
        inherited Put(Index, Item);
end;


{ TOnChangeInfoList }
{
function TOnChangeInfoList.Add(aName: string; aMthd: TMethod): Integer;
var
    Item: TOnChangeInfo;
begin
    Item := TOnChangeInfo.create;
    Item.name := aName;
    Item.mthd := aMthd;
    result := inherited add(Item);
end;

function TOnChangeInfoList.byName(aName: string): TOnChangeInfo;
var
    i : integer;
begin
    result := nil;
    for i:=0 to count-1 do
        if sametext(get(i).name,aName) then begin
            result := get(i);
            exit;
        end;
end;


procedure TOnChangeInfoList.Clear;
var
    i : integer;
begin
    for i:=0 to count-1 do
        get(i).free;
    inherited;
end;

function TOnChangeInfoList.exists(aName: string): boolean;
var
    i : integer;
begin
    result := false;
    for i:=0 to count-1 do
    if sametext(get(i).name,aName) then begin
        result := true;
        exit;
    end;
end;

function TOnChangeInfoList.Get(Index: Integer): TOnChangeInfo;
begin
    result := TOnChangeInfo(inherited get(Index));
end;

procedure TOnChangeInfoList.Put(Index: Integer; Item: TOnChangeInfo);
begin
    if not exists(Item.name) then
        inherited Put(Index, Item);
end;
}

end.

