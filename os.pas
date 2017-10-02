program mytos;
USES CRT,DOS,kernel;
var a:string;
const
 StrName      = 'EXPLORER 1.0-bulid 1115     [_][ ][X]';   { Name of program. }
 StrMenu      = 'F3 Podgl¹d F4 Edycja F9 Zmieñ ESC=Stop ENTER=START'; { Bottom-left help message. }
{writeln('F3 Wklej  F4 Zmieñ  F5 Copy  F6 Cut  F7 UtwKat  F8 Usuñ');}

begin
clrscr;
startkazio0OS;
login;
writeln('Witaj w MyTerminal (MyTerm)!');
writeln('i-informacje');
writeln('c-czysc');
writeln('3-pomoc');
writeln('4-kalkulator');
writeln('ESC - Wyjscie');
read(a);
 repeat
   a:=readkey;
if a='i' then info;
if a='c' then clrscr;
if a='3' then help;
if a='4' then calc;
  Until a=#27;
readln;
end.
