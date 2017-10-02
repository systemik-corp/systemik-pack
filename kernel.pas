UNIT kernel;

INTERFACE

USES CRT,DOS,GRAPH;

PROCEDURE WriteXY(x,y:byte; s:string);
PROCEDURE Ramka(x1,y1,x2,y2:byte);
procedure kolor(t,b:byte);
procedure okno(x1,y1,x2,y2,t,b:byte);
procedure date;
procedure startkazio0OS;
procedure copyright;
procedure info;
procedure help;
procedure bsod;
procedure login;
procedure calc;

IMPLEMENTATION

PROCEDURE WriteXY(x,y:byte; s:string);
Begin
  GotoXY(x,y);
  Write(s);
End;

PROCEDURE Ramka(x1,y1,x2,y2:byte);              {7}
Var t:byte;
Begin
  WriteXY(x1,y1,chr(201));
  WriteXY(x1,y2,chr(200));
  WriteXY(x2,y1,chr(187));
  WriteXY(x2,y2,chr(188));
  For t:=x1+1 To x2-1 Do WriteXY(t,y1,chr(205));
  For t:=x1+1 To x2-1 Do WriteXY(t,y2,chr(205));
  For t:=y1+1 To y2-1 Do WriteXY(x1,t,chr(186));
  For t:=y1+1 To y2-1 Do WriteXY(x2,t,chr(186));
End;

procedure kolor(t,b:byte);
begin
textcolor(t);
textbackground(b);
end;

procedure okno(x1,y1,x2,y2,t,b:byte);
var i:byte;
begin
kolor(t,b);
window(x1,y1,x2,y2+1);
gotoxy(1,1);
write('-');
for i:=1 to x2-x1-1 do write('-');
write('-');
for i:=2 to y2-y1 do
begin
gotoxy(1,i);
write('|');
gotoxy(x2-x1+1,i);
write('|');
end;
gotoxy(1,y2-y1+1);
write('-');
for i:=1 to x2-x1-1 do write('-');
write('-');
window(x1+1,y1+1,x2-1,y2-1);
gotoxy(1,1);
clrscr;
end;

procedure date;
var d, m, r, dt:word;
begin
clrscr;
getdate(r,m,d,dt);
writeln('Dzisiaj jest ',d,'-',m,'-',r);
readln;
case dt of
0:writeln('Dzisiaj-jest-niedziela.');
1:writeln('Dzisiaj-jest-poniedzialek.');
2:writeln('Dzisiaj-jest-wtorek.');
3:writeln('Dzisiaj-jest-sroda.');
4:writeln('Dzisiaj-jest-czwartek.');
5:writeln('Dzisiaj-jest-piatek.');
6:writeln('Dzisiaj-jest-sobota.');
end;
readln;
end;

procedure startkazio0OS;
begin
clrscr;
writeln('Systemik TOS');
writeln('Wersja 1.0');
end;

procedure zegar;
var godz,min,sek,sek100:word;
var sgodz,smin,ssek:string;
begin
GetTime(godz,min,sek,sek100);
Str(godz,sgodz);                                         {1}
if length(sgodz)=1 then sgodz:='0'+sgodz;                {2}
Str(min,smin);                                           {1}
if length(smin)=1 then smin:='0'+smin;                   {2}
Str(sek,ssek);                                           {1}
if length(ssek)=1 then ssek:='0'+ssek;                   {2}
writeLn('Aktualna Godzina : ',sgodz,':',smin,':',ssek);
end;

procedure copyright;
begin
clrscr;
writeln('EXPLORER v1.0 beta, (c) 2011 Systemik');{ Name of program. }
readln;
end;

procedure info;
begin
writeln('Siemka kole˜!');
writeln('To jest pseudo-terminal.');
readln;
end;

procedure help;
begin
writeln('1-informacje');
writeln('2-czysc');
writeln('3-pomoc');
writeln('4-wyjdz');
readln;
end;

procedure bsod;
begin
clrscr;
kolor(15,1);
readln;
end;

procedure login;{logowanie}
var i:string;
begin
clrscr;
textbackground(blue);
textcolor(white);
write('Wpisz swoj login:');
readln(i);
textbackground(blue);
textcolor(white);
writeln('Witaj ',i,'!');
readln;
end;

procedure calc;{calculator}
var x,l,d,y,z:Real;
begin
clrscr;
writeln('wpisz');
Writeln('1 aby dodawac');
writeln('2 aby odejmowac');
writeln('3 aby mnozyc');
writeln('4 aby dzielic');
read(l);
writeln('Wpisz X');
readln(x);
writeln('Wpisz Y');
readln(y);
if l=1 then begin z:=x+y end;
if l=2 then begin z:=x-y end;
if l=3 then begin z:=x*y end;
if l=4 then begin z:=x/y end;
write('Licza Z jest rowna');
write(z:10:2);
readln;
end;
end.
