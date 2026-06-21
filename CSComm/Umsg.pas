unit UMsg;
interface
Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  lmdclass, lmdctrl, lmdmsg, lmdGraph;

function ConfirmaExclusao(St : String) : Boolean;
function SimNao(St : String) : Boolean;
function NaoSim(St : String) : Boolean;
function Gravar(St : String) : Word;
function Cancelar(St : String) : Boolean;
procedure ErroOk(St : String);
procedure MsgOk(St : String);

implementation

procedure MsgOk(St : String);
var MBox : TLmdMessageBoxDlg;
begin
  MBox := TLmdMessageBoxDlg.Create(nil);
  MBox.CaptionTitle := 'Informação';
  MBox.CaptionAlignment := taCenter;
  MBox.MessageFont.Style := [fsBold];
  MBox.ButtonTitles.Add('&Ok');
  MBox.MessageDlg(St, mtInformation, [mbOk], 0);
  MBox.Free;
end;

procedure ErroOk(St : String);
var MBox : TLmdMessageBoxDlg;
begin
  MBox := TLmdMessageBoxDlg.Create(nil);
  MBox.CaptionTitle := 'Erro!';
  MBox.CaptionAlignment := taCenter;
  MBox.MessageFont.Style := [fsBold];
  MBox.ButtonTitles.Add('&Ok');
  MBox.MessageDlg(St, mtError, [mbOk], 0);
  MBox.Free;
end;

function NaoSim(St : String) : Boolean;
var MBox : TLmdMessageBoxDlg;
begin
  MBox := TLmdMessageBoxDlg.Create(nil);
  MBox.CaptionTitle := 'Atenção!';
  MBox.CaptionAlignment := taCenter;
  MBox.MessageFont.Style := [];
  MBox.ButtonTitles.Add('&Não');
  MBox.ButtonTitles.Add('&Sim');
  NaoSim := (MBox.MessageDlg(St, mtConfirmation, [mbNo, mbYes], 0)=mrNo);
  MBox.Free;
end;

function SimNao(St : String) : Boolean;
var MBox : TLmdMessageBoxDlg;
begin
  MBox := TLmdMessageBoxDlg.Create(nil);
  MBox.CaptionTitle := 'Atenção!';
  MBox.CaptionAlignment := taCenter;
  MBox.MessageFont.Style := [fsBold];
  MBox.ButtonTitles.Add('&Sim');
  MBox.ButtonTitles.Add('&Não');
  SimNao := (MBox.MessageDlg(St, mtConfirmation, [mbYes, mbNo], 0)=mrYes);
  MBox.Free;
end;

function Cancelar(St : String) : Boolean;
var MBox : TLmdMessageBoxDlg;
begin
  MBox := TLmdMessageBoxDlg.Create(nil);
  MBox.CaptionTitle := 'Atenção!';
  MBox.CaptionAlignment := taCenter;
  MBox.MessageFont.Style := [fsBold];
  MBox.ButtonTitles.Add('&Cancelar');
  MBox.ButtonTitles.Add('&Ok');
  Cancelar := (MBox.MessageDlg(St, mtConfirmation, [mbOk, mbCancel], 0)=mrCancel);
  MBox.Free;
end;

function Gravar(St : String) : Word;
var MBox : TLmdMessageBoxDlg;
begin
  MBox := TLmdMessageBoxDlg.Create(nil);
  MBox.CaptionTitle := 'Atenção!';
  MBox.CaptionAlignment := taCenter;
  MBox.MessageFont.Style := [fsBold];
  MBox.ButtonTitles.Add('&Cancelar');
  MBox.ButtonTitles.Add('&Sim');
  MBox.ButtonTitles.Add('&Não');
  Gravar := MBox.MessageDlg(St, mtConfirmation, [mbCancel, mbYes, mbNo], 0);
  MBox.Free;
end;

function ConfirmaExclusao(St : String) : Boolean;
begin
  ConfirmaExclusao := SimNao('Confirma exclusão de "'+St+'" ?');
end;

end.
 
