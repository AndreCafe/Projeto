unit ncDMmate;

interface

uses
  SysUtils, Classes, ncMateTls, ncDebug, IdBaseComponent, IdComponent, uLogs,
  IdTCPServer;

type
  TdmMate = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure MateTlsOnRead(Sender: TObject; var p: Pointer; len: uint64);
    procedure MateTlsOnActive(Sender: TObject);
  private
    { Private declarations }
  public
    MateTls : TMateTls;
    { Public declarations }
  end;

var
  dmMate: TdmMate;

implementation

{$R *.dfm}

procedure TdmMate.DataModuleCreate(Sender: TObject);
begin
    DebugMsg('TdmMate.DataModuleCreate');
    glog.Log(self,[lcDebug], 'TdmMate.DataModuleCreate');

    MateTls := TMateTls.create;
    MateTls.IP := '127.0.0.1';
    MateTls.Port := 16220;

    MateTls.OnRead :=  MateTlsOnRead;
    MateTls.OnActive := MateTlsOnActive;

    MateTls.Resume;
end;

procedure TdmMate.DataModuleDestroy(Sender: TObject);
begin
    glog.Log(self,[lcDebug], 'TdmMate.DataModuleDestroy');
    DebugMsg('TdmMate.DataModuleDestroy');

    MateTls.Terminate;
    MateTls.WaitFor;
    MateTls.Free;
    MateTls := nil;

    glog.Log(self,[lcDebug], 'TdmMate.DataModuleDestroy 2');
end;

procedure TdmMate.MateTlsOnActive(Sender: TObject);
var
    sl : TStringList;
    b : Pointer;
    len : uint64;
begin
    glog.Log(self,[lcDebug], 'TdmMate.MateTlsOnActive' );

    sl := TStringList.Create();
    sl.LoadFromFile('C:\925600.txt');

    while MateTls.Ativo do begin

        len := length(sl.Text);
        Getmem(b,len);
        try
          move(sl.Text[1], b^, len);
          MateTls.Write(b, len);
        finally
          freemem(b);
        end;

        sleep(0);

    end;

    glog.Log(self,[lcDebug], 'TdmMate.MateTlsOnActive ends execution' );

end;

procedure TdmMate.MateTlsOnRead(Sender: TObject; var p: Pointer; len: uint64);
var
    s : string;
begin
    SetLength(s, len);
    move(p^, s[1], len);

    glog.Log(self,[lcDebug], 'TdmMate.MateTlsOnRead: ...'+inttostr(len));
    freemem(p);

end;

end.
