library ImpNX;

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
//  ShareMem,
  nxReplacementMemoryManager,
  SysUtils,
  Classes,
  uDMBaseImpNX2 in 'uDMBaseImpNX2.pas' {dmBaseImpNX2: TDataModule},
  uDMImpNX2 in 'uDMImpNX2.pas' {dmImpNX2: TDataModule};

{$R *.res}

function CriaDM: Integer;
begin
  Result := Integer(TDMImpNX2.Create(nil));
end;

procedure DestroiDM(I: integer);
begin
  TObject(I).Free;
end;

exports
  CriaDM,
  DestroiDM;  

begin
end.
