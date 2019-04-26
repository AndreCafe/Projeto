unit ncaTestePlus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin;

type
  TFrmTestePlus = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    Edit2: TEdit;
    edKeyIndex: TSpinEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTestePlus: TFrmTestePlus;

implementation

uses ncaK, ncClassesBase;

{$R *.dfm}

procedure TFrmTestePlus.Button1Click(Sender: TObject);
begin
  Edit2.Text := nexGetKH(edKeyIndex.Value, Edit1.Text, '', '');
end;

procedure TFrmTestePlus.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmTestePlus.FormCreate(Sender: TObject);
var G : TGUID;
begin
  if CreateGUID(G)=0 then 
    Edit2.Text := GuidStringClean(GUIDToString(G));
end;

end.
