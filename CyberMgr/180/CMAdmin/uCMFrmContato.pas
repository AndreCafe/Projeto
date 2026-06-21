unit uCMFrmContato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, LMDControl, LMDBaseControl, LMDBaseGraphicControl,
  LMDBaseLabel, LMDCustomSimpleLabel, LMDSimpleLabel, LMDApplicationCtrl,
  LMDCustomComponent, LMDSysInfo;

type
  TFrmContato = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    LMDSimpleLabel1: TLMDSimpleLabel;
    LMDSimpleLabel2: TLMDSimpleLabel;
    LMDSimpleLabel3: TLMDSimpleLabel;
    LMDSimpleLabel4: TLMDSimpleLabel;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmContato: TFrmContato;

implementation

{$R *.DFM}

procedure TFrmContato.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmContato.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
