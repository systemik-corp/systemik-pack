program calender;

uses Crt,Dos;

{ Jos dickmann Software (c) 1997 for public domain  }
{ More Turbo pascal sources on the internet page....}
{ http://www.universal.nl/users/dickmann/pascal.htm }
{ E-mail address....... j.w.j.dickmann@universal.nl }

{const
  mnd : array[1..12] of string[9] = ('Januari','Februari','Maart','April',
 'Mei','Juni','Juli','Augustus','September','Oktober','November','December');}
const
  mnd : array[1..12] of string[9] = ('Styczeä','Luty','Marzec','Kwiecieä',
 'Maj','Czerwiec','Lipiec','Sierpieä','Wrzesieä','Pa«dziernik','Lipiec','Grudzieä');

var
  jaar,maand,dag,weekdag : word;
  x,y,p,pp,p1,u,q        : integer;
  s0                     : string;
  ch                     : char;
  regs                   : registers;


Function NumbofDaysInMth(y1,m : Word): Byte;

begin
  Case m of
    1,3,5,7,8,10,12: NumbofDaysInMth := 31;
    4,6,9,11       : NumbofDaysInMth := 30;
    2              : NumbofDaysInMth := 28 +
                     ord((y1 mod 4) = 0);
  end;
end;

procedure Qtext(x1,y1 :byte;str :string;kleur,achtergrondkleur : Byte);

begin
  textbackground(achtergrondkleur);
  textcolor(kleur);
  gotoxy(x1,y1);write(str);
  textbackground(0);
end;

procedure qhor(x1,y1,aantal,teken,kleur :byte);

begin
  for p1 :=1 to aantal do qtext(x1+p1-1,y1,chr(teken),kleur,0);
end;

procedure qver(x1,y1,aantal,teken,kleur :byte);

begin
  for p1 :=1 to aantal do qtext(x1,y1+p1-1,chr(teken),kleur,0);
end;

procedure Qfill_screen(char,color :byte);

begin
  regs.ah :=10;
  regs.al :=char;
  regs.bh :=0;
  regs.bl :=color;
  regs.ch :=7;
  regs.cl :=208;
  intr(16,regs);
  textbackground(0);
end;


begin
  clrscr;
  Qfill_screen(178,8);
  Qtext(10,21,' Arrow-keys --> <-- is scroll months / escape is exit ',15,4);
  Qhor(11,22,54,176,8);
  Qtext(28,5,'ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿',3,0);
  Qver(28,6,11,179,3);Qver(66,6,11,179,3);
  Qtext(28,17,'ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ',3,0);
  Qhor(30,18,39,176,8);Qver(67,6,12,176,8);Qver(68,6,12,176,8);
  window(29,6,65,16);clrscr;
  Qhor(2,2,34,196,5);
  {Qtext(2,3,'Zon  Maa  Din  Woe  Don  Vry  Zat',9,0);}
  Qtext(2,3,'Ndz  Pon  Wto  Sro  Czw  Pia  Sob',9,0);
  getdate(jaar,maand,dag,weekdag);

  x :=3+(weekdag*5); { X coordinaten  van de weekdag }
  for p :=dag-1 downto 1 do begin
    dec(x,5);
    if x <0 then x :=33;
  end;

  repeat
    Qtext(2,1,mnd[maand]+'     ',11,0);
    str(jaar,s0);Qtext(32,1,s0,11,0);
    pp :=NumbofDaysInMth(jaar,maand);  { telt het aantal dagen in een maand }

    u :=x;
    y :=5;
    for p :=5 to 10 do Qhor(2,p,34,32,7);               { maakt veld schoon }
    for p :=1 to pp do begin
      if p <10 then q :=1 else q :=0;
      str(p,s0);Qtext(x+q,y,s0,7,0);
      if p = dag then Qtext(x+q,y,s0,14,4);
      inc(x,5);if x >33 then begin x :=3;inc(y,1);end;
    end;

    repeat
      ch :=readkey;
    until ch in[#75,#77,#27];

    case ch of
      #75:begin
            dec(maand);sound(200);delay(5);nosound;
            pp :=NumbofDaysInMth(jaar,maand);
            x :=u;
            for p :=pp downto 1 do begin
              dec(x,5);if x <0 then x :=33;
            end;
          end;
      #77:begin inc(maand);sound(300);delay(5);nosound;end;
    end;

    if Maand<1 then begin
      Maand:=12; Dec(jaar);
      pp :=NumbofDaysInMth(jaar,maand);
      x :=u;
      for p :=pp downto 1 do begin
        dec(x,5);if x <0 then x :=33;
      end;
    end;
    if Maand>12 then begin Maand:=1;Inc(jaar);end;
    if jaar<1 then jaar:=1; if jaar>9999 then jaar:=9999;
  until ch in[#27];
  halt;
End.
