unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, StdCtrls, cxControls, cxPC, ExtCtrls, dxBar;

type
  TForm1 = class(TForm)
    FM: TFormManager;
    dxBarManager1: TdxBarManager;
    Panel1: TPanel;
    cxPageControl1: TcxPageControl;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    cxTabSheet1: TcxTabSheet;
    Button4: TButton;
    Label1: TLabel;
    dxBarButton1: TdxBarButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2, Unit3;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FM.RegistraForm(TFrmTeste);
  FM.RegistraForm(TFrmBase3);  
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  FM.Mostrar(TFrmTeste);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  FM.Esconder(TFrmBaseClass(FM.FormAtivo.ClassType));
end;

procedure TForm1.Button3Click(Sender: TObject);
begin                                  
  FM.Mostrar(TFrmTeste);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  FM.Mostrar(TFrmBase3);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FM.Free;
end;

end.



                                                                     