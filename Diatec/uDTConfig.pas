unit uDTConfig;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, OvcBase, OvcCmbx, OvcDrCbx, 
  lmdclass, uDTSyncDef,
  LMDCustomComponent, LMDContainerComponent, LMDBaseDialog;

type
  TfConfig = class(TForm)
    OvcController1: TOvcController;
    Panel1: TPanel;
    cmOk: TBitBtn;
    cmCancel: TBitBtn;
    lbDir: TLabel;
    lbSrv: TLabel;
    edDir: TEdit;
    edIPAdd: TEdit;
    cmDir: TSpeedButton;
    lbPorta: TLabel;
    edPort: TEdit;
    procedure cmCancelClick(Sender: TObject);
    procedure cmDirClick(Sender: TObject);
    procedure cmOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConfig: TfConfig;

implementation

uses uDTDM;

{$R *.DFM}

procedure TfConfig.cmCancelClick(Sender: TObject);
begin
   Close;
end;

procedure TfConfig.cmDirClick(Sender: TObject);
begin
   dlgDir.Execute;
   edDir.Text := dlgDir.Path;
end;

procedure TfConfig.cmOkClick(Sender: TObject);
Var List : TStringList;
begin
   List := TStringList.Create;
   try
     List.Values['Dir']   := Trim(edDir.Text);
     List.Values['IP']    := Trim(edIPAdd.Text);
     List.Values['Porta'] := edPort.Text;
     List.SaveToFile(Path+'DIATEC.INI');
   finally  
     List.Free;
   end;  

   //Variáveis de configuração
   cfgDir := edDir.Text;
   cfgSrv := edIPAdd.Text;
   cfgPort := StrToInt(edPort.Text);

end;

procedure TfConfig.FormShow(Sender: TObject);
begin
   edDir.Text := cfgDir;
   edIPAdd.Text := cfgSrv;
   edPort.Text := IntToStr(cfgPort);
end;

end.

