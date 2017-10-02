program contact;
uses crt;
var i,n,m,t:string;

begin
clrscr;
write('Wpisz imie:');
readln(i);
write('Wpisz nazwisko:');
readln(n);
write('Wpisz miasto:');
readln(m);
write('Wpisz nr telefonu:');
readln(t);
textbackground(red);
textcolor(white);
writeln('Imie:     ',i);
writeln('Nazwisko: ',n);
writeln('Miasto:   ',m);
writeln('Telefon:  ',t);
readln;
end.
