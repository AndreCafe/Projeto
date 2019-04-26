unit ElevationUtils;
{
#===============================================================================

# Name:        ElevationUtils.pas
# Author:      Aleksander Oven
# Created:     2007-03-01
# Last Change: 2007-03-01
# Version:     1.0

# Description:

  Windows Vista COM Elevation Moniker implementation.

  http://msdn2.microsoft.com/en-us/library/ms679687.aspx

# Warnings and/or special considerations:

  Source code in this file is subject to the license specified below.

#===============================================================================

  The contents of this file are subject to the Mozilla Public License
  Version 1.1 (the "License"); you may not use this file except in compliance
  with the License. You may obtain a copy of the License at
  http://www.mozilla.org/MPL/

  Software distributed under the License is distributed on an "AS IS" basis,
  WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
  the specific language governing rights and limitations under the License.

  The Original Code is 'ElevationUtils.pas'.

  The Initial Developer of the Original Code is 'Aleksander Oven'.

  Contributor(s): None.

#===============================================================================
}
interface

uses
  Registry,
  Windows;

function IsElevated: Boolean;

function IsUACEnabled: Boolean;

implementation

type
  // Vista SDK - extended BIND_OPTS2 struct

  // Vista SDK - extended TOKEN_INFORMATION_CLASS enum
  TOKEN_INFORMATION_CLASS = (
    TokenICPad, // dummy padding element
    TokenUser,
    TokenGroups,
    TokenPrivileges,
    TokenOwner,
    TokenPrimaryGroup,
    TokenDefaultDacl,
    TokenSource,
    TokenType,
    TokenImpersonationLevel,
    TokenStatistics,
    TokenRestrictedSids,
    TokenSessionId,
    TokenGroupsAndPrivileges,
    TokenSessionReference,
    TokenSandBoxInert,
    TokenAuditPolicy,
    TokenOrigin,
    TokenElevationType,
    TokenLinkedToken,
    TokenElevation,
    TokenHasRestrictions,
    TokenAccessInformation,
    TokenVirtualizationAllowed,
    TokenVirtualizationEnabled,
    TokenIntegrityLevel,
    TokenUIAccess,
    TokenMandatoryPolicy,
    TokenLogonSid,
    MaxTokenInfoClass  // MaxTokenInfoClass should always be the last enum
  );

  TOKEN_ELEVATION = packed record
    TokenIsElevated: DWORD;
  end;
  PTOKEN_ELEVATION = ^TOKEN_ELEVATION;


function RegBool: Boolean;  
var R : TRegistry;
begin
  try
    R := TRegistry.Create;
    try
      R.Access := KEY_READ;
      R.RootKey := HKEY_LOCAL_MACHINE;
      if R.OpenKeyReadOnly('\Software\Microsoft\Windows\CurrentVersion\Policies\System') then
        Result := R.ReadBool('EnableLUA') else
        Result := False;
    finally
      R.Free;
    end;
  except
    Result := False;
  end;
end;

function IsWinVista: Boolean;
var
  VerInfo: TOSVersioninfo;
begin
  VerInfo.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);
  GetVersionEx(VerInfo);
  Result := (VerInfo.dwMajorVersion >= 6);
end;

function IsUACEnabled: Boolean;
begin
  Result := IsWinVista and RegBool;
end;

function GetTokenInformation(TokenHandle: THandle;
  TokenInformationClass: TOKEN_INFORMATION_CLASS; TokenInformation: Pointer;
  TokenInformationLength: DWORD; var ReturnLength: DWORD
): BOOL; stdcall; external advapi32 name 'GetTokenInformation';

function IsElevated: Boolean;
var
  Token: THandle;
  Elevation: TOKEN_ELEVATION;
  Dummy: Cardinal;
begin
  Result := False;
  
  if OpenProcessToken(GetCurrentProcess, TOKEN_QUERY, Token) then begin
    Dummy := 0;
    if GetTokenInformation(Token, TokenElevation, @Elevation,
      SizeOf(TOKEN_ELEVATION), Dummy)
    then
      Result := (Elevation.TokenIsElevated <> 0);

    CloseHandle(Token);
  end;
end;


end.
