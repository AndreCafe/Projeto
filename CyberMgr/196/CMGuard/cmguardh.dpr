library cmguardh;

 {
 Demo de Hook de teclado a nivel de sistema, Radikal.
 Como lo que queremos es capturar las teclas pulsadas en cualquier parte
 de Windows, necesitamos instalar la funcion CallBack a la que llamará
 el Hook en una DLL, que es ésta misma.
 }

 uses
  Windows,
  Messages,
  SysUtils,
  Classes;

{$R *.res}

const
  CM_ATIVOU     = WM_USER + $1000;
  
 var
  HookCBT     : HHook;
  HArq        : THandle;
  PWindow     : ^Integer;

 function CallBackDelHook( Code    : Integer;
                           wParam  : WPARAM;
                           lParam  : LPARAM
                           )       : LRESULT; stdcall;

 {Esta es la funcion CallBack a la cual llamará el hook.}
 {This is the CallBack function called by he Hook}
 begin
  {Si una tecla fue pulsada o liberada}
  {if a key was pressed/released}
 if code=HCBT_ACTIVATE then
  begin
    {Miramos si existe el fichero}
    {if the mapfile exists}
    HArq := CreateFileMapping($FFFFFFFF, nil, PAGE_READWRITE, 0, SizeOf(Cardinal), 'cmguardmf');
    if HArq<>0 then
    begin
      PWindow:=MapViewOfFile(HArq, FILE_MAP_ALL_ACCESS,0,0,0);
      PostMessage(PWindow^, CM_ATIVOU, wParam, lParam);  
      UnmapViewOfFile(PWindow);
      CloseHandle(HArq);
    end;
  end;    
     
   
  {Llamamos al siguiente hook de teclado de la cadena}
  {call to next hook of the chain}
  Result := CallNextHookEx(HookCBT, Code, wParam, lParam);
 end;

 procedure HookOn; stdcall;
 {Procedure que instala el hook}
 {procedure for install the hook}
 begin
   HookCBT := SetWindowsHookEx(WH_CBT, @CallBackDelHook, HInstance , 0);
 end;

 procedure HookOff;  stdcall;
 begin
   UnhookWindowsHookEx(HookCBT);
 end;

 exports
 {Exportamos las procedures...}
 {Export the procedures}
  HookOn,
  HookOff;

 begin
 end.
