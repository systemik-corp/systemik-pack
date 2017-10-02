program program76;
uses crt,dos,kernel;

type
 tablica1=array[1..1000] of string[12];
 tablica2=array[1..1000] of longint;

var
 info:searchrec;
 p:string[128];
 i,j,ilel,wskg,wskr,wsks,wskgs:integer;
 a:tablica1;
 b:tablica2;
 znak:char;
 sciezka,sciezkas,klucz:string;

procedure pliki;
begin
i:=1;
p:=sciezka+klucz;
findfirst(p,anyfile,info);
while doserror<>18 do
begin
a[i]:=info.name;
b[i]:=info.size;
findnext(info);
i:=i+1;
end;
a[i]:='koniec';
end;

procedure ile;
begin
i:=0;
repeat
i:=i+1;
until a[i]='koniec';
ilel:=i-1;
end;

procedure pokaz;
begin
okno(1,1,79,25,15,1);
if ilel<23 then
for i:=1 to ilel do writeln(a[i]:13) else
begin
for i:=1 to ilel do writeln(a[i]:13);
write(a[23]:13);
end;
end;

procedure resetdane;
begin
for i:=1 to ilel+1 do
begin
a[i]:='';
b[i]:=0;
end;
end;

procedure przesuwanie;
begin
wskg:=1;
wskgs:=1;
wskr:=1;
wsks:=1;
repeat
if wskgs<>wskg then
begin
kolor(15,1);
clrscr;
for i:=0 to 21 do writeln(a[wskg+i]:13);
write(a[wskg+22]:13);
end;
gotoxy(1,wsks);
kolor(15,1);
write(a[wskg+wsks-1]:13);
gotoxy(1,wskr);
kolor(1,15);
write(a[wskg+wskr-1]:13);
znak:=readkey;
wsks:=wskr;
wskgs:=wskg;
if znak=#0 then
begin
znak:=readkey;
if znak=#72 then
begin
if (wskg>1) and (wskr=1) then wskg:=wskg-1;
if wskr>1 then wskr:=wskr-1;
end;
if znak=#80 then
begin
if (wskg<ilel-22) and (wskr=23) then wskg:=wskg+1;
if wskr<23 then wskr:=wskr+1;
end;
end;
if (znak=#13) and (b[wskg+wsks-1]=0) then
begin
if a[wskg+wsks-1]='..' then
begin
for i:=length(sciezka) downto 1 do
begin
{sciezka[i]:='';}
if sciezka[i-1]='\' then i:=1;
end;
sciezkas:='';
i:=1;
repeat
sciezkas:=sciezkas+sciezka[i];
{i=i+1;}
until sciezka[i]='';
sciezka:=sciezkas;
end;
if (a[wskg+wsks-1]<>'..') and (a[wskg+wsks-1]<>'.') then
sciezka:=sciezka+a[wskg+wsks-1]+'\';
resetdane;
pliki;
ile;
pokaz;
przesuwanie;
end;
until znak=#27;
end;

begin
sciezka:='c:\';
klucz:='*.*';
clrscr;
pliki;
ile;
pokaz;
przesuwanie;
end.