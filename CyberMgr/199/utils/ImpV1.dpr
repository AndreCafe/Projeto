library ImpV1;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  SysUtils,
  Classes,
  uImpFF1EngMgr in 'uImpFF1EngMgr.pas' {FFEngMgr: TffBaseEngineManager},
  uImpFF1Pri in 'uImpFF1Pri.pas' {FrmPri};

{$R *.RES}

  procedure ImportaFF;
  begin
    FFEngMgr := TFFEngMgr.Create(nil);
    try
      FrmPri := TFrmPri.Create(nil);
      try
        FrmPri.ShowModal;
      finally
        FrmPri.Free;
      end;  
    finally
      FFEngMgr.Free;
    end;
  end;

exports
  ImportaFF;
    
begin
end.
 