unit UMsg;
{
    ResourceString: Dario 13/03/13
}

interface
Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

function ConfirmaExclusao(St : String) : Boolean;
function SimNao(St : String) : Boolean;
function NaoSim(St : String) : Boolean;
function Gravar(St : String) : Word;
function Cancelar(St : String) : Boolean;
procedure ErroOk(St : String);
procedure MsgOk(St : String);

implementation

// START resource string wizard section
resourcestring
  SMensagem = 'Mensagem';
  SErro = 'Erro!';
  SAtenção = 'Atenção';
  SConfirmaExclusãoDe = 'Confirma exclusão de "';

// END resource string wizard section


procedure MsgOk(St : String);
begin
  MessageBox(GetActiveWindow, PChar(St), PChar(SMensagem), MB_OK + MB_ICONINFORMATION);
end;

procedure ErroOk(St : String);
begin
  MessageBox(GetActiveWindow, PChar(St), PChar(SErro), MB_OK + MB_ICONERROR);
end;

function NaoSim(St : String) : Boolean;
begin
  Result := (MessageBox(GetActiveWindow, PChar(St), PChar(SAtenção), MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION)=IDNO);
end;

function SimNao(St : String) : Boolean;
begin
  Result := (MessageBox(GetActiveWindow, PChar(St), PChar(SAtenção), MB_YESNO + MB_DEFBUTTON1 + MB_ICONQUESTION)=IDYES);
end;

function Cancelar(St : String) : Boolean;
begin
  Result := (MessageBox(GetActiveWindow, PChar(St), PChar(SAtenção), MB_OKCANCEL + MB_DEFBUTTON1 + MB_ICONQUESTION)=IDCANCEL);
end;

function Gravar(St : String) : Word;
begin
  Result := MessageBox(GetActiveWindow, PChar(St), PChar(SAtenção), MB_YESNOCANCEL + MB_DEFBUTTON3 + MB_ICONQUESTION);
end;

function ConfirmaExclusao(St : String) : Boolean;
begin
  ConfirmaExclusao := SimNao(SConfirmaExclusãoDe+St+'" ?');
end;

end.
 


