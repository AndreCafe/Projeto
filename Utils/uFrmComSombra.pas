unit uFrmComSombra;
{
    ResourceString: Dario 13/03/13
    Nada para fazer
}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmSombra;

type
  TFrmComSombra = class(TForm)
  private
    { Private declarations }
    FSombra: TFrmSombra;
    FParentHWND : HWND;
    procedure CreateParams(var Params: TCreateParams); override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;

    constructor CreateEsp(aParentHWND: HWND; AOwner: TComponent); 

    destructor Destroy; override;

    function ShowModal: Integer; override;

    function ShowModalCustom(aFadeMS: Cardinal): Integer;
    
  end;

var
  FrmComSombra: TFrmComSombra;

implementation

{$R *.dfm}

{ TFrmComSombra }

constructor TFrmComSombra.Create(AOwner: TComponent);
begin
  FSombra := TFrmSombra.Create(nil);
  inherited;
end;

constructor TFrmComSombra.CreateEsp(aParentHWND: HWND; AOwner: TComponent);
begin
  FSombra := TFrmSombra.CreateEsp(aParentHWND);
  inherited Create(AOwner);
end;

procedure TFrmComSombra.CreateParams(var Params: TCreateParams);
begin
  inherited;
  params.ExStyle := params.ExStyle or WS_EX_APPWINDOW;
  params.WndParent := FSombra.Handle;
end;

destructor TFrmComSombra.Destroy;
begin
  FSombra.TimerFree.Enabled := True;
  inherited;
end;

function TFrmComSombra.ShowModal: Integer;
begin
  FSombra.FadeIn;
  Result := inherited ShowModal;
  FSombra.Hide;
end;

function TFrmComSombra.ShowModalCustom(aFadeMS: Cardinal): Integer;
begin
  FSombra.FadeIn(aFadeMS);
  Result := inherited ShowModal;
  FSombra.Hide;
end;

end.
