unit ufmFrmBasePai;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TFrmBasePai = class(TForm)
  private
    FCacheInstance: Boolean;
    FModal: Boolean;
  protected  
    procedure SetCacheInstance(const Value: Boolean); virtual;
    procedure SetModal(const Value: Boolean); virtual;
    { Private declarations }
  public
    procedure AfterConstruction; override; 
  published 
    property CacheInstance: Boolean
      read FCacheInstance write SetCacheInstance;
      
    property Modal: Boolean
      read FModal write SetModal;
    { Public declarations }
  end;

var
  FrmBasePai: TFrmBasePai;

implementation

{$R *.dfm}

{ TFrmBasePai }

procedure TFrmBasePai.AfterConstruction;
begin
  inherited;
  FCacheInstance := True;
  FModal := False;
end;

procedure TFrmBasePai.SetCacheInstance(const Value: Boolean);
begin
  FCacheInstance := Value;
end;

procedure TFrmBasePai.SetModal(const Value: Boolean);
begin
  FModal := Value;
end;

end.
