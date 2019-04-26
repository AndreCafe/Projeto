program extimgs2;

uses
  ncDebug,
  ncPRExtractImgs in 'ncPRExtractImgs.pas';

var 
  T : TThreadExtImgs;  

begin

  T := TThreadExtImgs.Create(ParamStr(1), 0);
  T.Resume;
  T.WaitFor;

end.
