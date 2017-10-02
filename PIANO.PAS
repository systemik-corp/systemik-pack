program dzwiek;
 uses crt;
  var a:char;

procedure d(a:word);
 begin
   sound(a);
   delay(35);
   nosound;
 end;

procedure graj;
 begin
   textbackground(1);
   clrscr;
   textcolor(15);
   gotoxy(1,1);
   write('SYSTEMiK');
   gotoxy(65,1);
   write('[ESC] - [Quit]');
   window(1,2,80,24);
   clrscr;
   writeln('ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป');
   writeln('บ   Program wczytuje dzwiฉki z klawiatury.  Gonik systemowy.                บ');
   writeln('บ Podaj jakฅ warto...                                                      บ');
   writeln('ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ');
   writeln('ณ   Klawisz    ณ   Dzwiฉk  ณ                                                   ');
   writeln('ณ      1       ณ     Do    ณ                    ÛÛÜ                            ');
   writeln('ณ      2       ณ     Re    ณ                    Û  ÛÜ                          ');
   writeln('ณ      3       ณ     Mi    ณ                    Û    ÛÜÜ                       ');
   writeln('ณ      4       ณ     Fa    ณ                    ÛÛÜ                            ');
   writeln('ณ      5       ณ     Sol   ณ                    Û  ÛÜ                          ');
   writeln('ณ      6       ณ     La    ณ                    Û    ÛÜÜ                       ');
   writeln('ณ      7       ณ     Si    ณ                    Û                              ');
   writeln('ณ      8       ณ     Do    ณ                    Û                              ');
   writeln('                                            ÜÜ  Û                              ');
   writeln('                                           ÛÛÛÛ Û                              ');
   writeln('                                          ÛÛÛÛÛÛ                               ');
   writeln('                                           ÛÛÛÛ                                ');
   writeln('                                            ฿฿                                 ');
   gotoxy(1,23);
   {write('อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ');}
 repeat
   a:=readkey;
    if a='1' then d(65);
    if a='2' then d(73);
    if a='3' then d(82);
    if a='4' then d(87);
    if a='5' then d(98);
    if a='6' then d(110);
    if a='7' then d(123);
    if a='8' then d(131);
  Until a = #27;
 end;

 procedure czysc;
   begin
     textmode(co80);
     textbackground(0);
     textcolor(7);
     clrscr;
   end;

 BEGIN
   graj;
   czysc;
 END.