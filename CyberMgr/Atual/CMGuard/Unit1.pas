unit Unit1;

interface

 function Multiplica: Integer;

implementation

function Multiplica; external 'dllteste.dll' name 'Multiplica';

end.
 