{$A+,B-,D+,E+,F-,G-,I-,L+,N-,O-,R+,S+,V+,X-}
{$M 16384,0,655360}
Uses crt,screen;
Var a,p:cha;
    b,h:array[1..32,1..8] of boolean;
    x1,y1,i,j,x,y:byte;line,asc:byte;
    c:char;
    k:word;
    tt:array[1..50,1..80] of boolean;
    s:string;
    t,mo:boolean;
    d:allcha;
Procedure onshow;
Begin
  a:=d[asc];Gotoxy(1,line+2);write('Asc:',asc,'    ');
  t:=false;
  for i:=1 to line do
  for j:=1 to 8 do
  begin
    b[i,9-j]:=odd(a[i]);
    a[i]:=a[i] div 2;
    if mo then gotoxy(9-j,i) else gotoxy(18-2*j,i);
    if not b[i,9-j] then write('.') else write('@');
  end;
  if mo then gotoxy(y,x) else gotoxy(y*2,x);
End;
Procedure save;
Begin
  for i:=1 to line do
  begin
    a[i]:=0;k:=256;
    for j:=1 to 8 do
    begin
      k:=k div 2;
      if b[i,j] then inc(a[i],k);
    end;
  end;
  d[asc]:=a;t:=false;
End;
Procedure sav;
Begin
  if t then
  begin
    gotoxy(20,1);write('Save?(Y/N)');
    repeat c:=Upcase(readkey) until (c='N') or (c='Y');
    gotoxy(20,1);write('          ');
    if c='Y' then save;
  end;
End;
Procedure texts(s:string);
Var f,g:chafile;
Begin
  fillchar(b,sizeof(b),0);fillchar(d,sizeof(d),0);
  clrscr;
  writeln('Mode:');
  writeln('1--80*25');
  writeln('2--80*50');
  c:=readkey;
  if upcase(c)='2' then
  begin
    mo:=true;textmode(co80+font8x8);line:=8;
  end else
  begin
    mo:=false;textmode(co80);line:=16;
  end;
  assign(f,s);assign(g,s);reset(f);
  if ioresult<>0 then readchar(0,d) else
  begin
    read(f,d);close(f);
  end;
  clrscr;fillchar(p,sizeof(p),0);
  for i:=1 to line do
  Begin
    for j:=1 to 8 do if mo then write('.') else write(' .');
    writeln;
  End;
  c:=' ';asc:=0;onshow;
  x:=1;y:=1;t:=false;
  repeat
    if mo then gotoxy(y,x) else gotoxy(y*2,x);
    c:=readkey;
    if c=#0 then c:=readkey;
    case UPCASE(c) of
    'M':if y<8 then inc(y);
    'K':if y>1 then dec(y);
    'H':if x>1 then dec(x);
    'P':if x<line then inc(x);
    'C':begin
          for i:=1 to line do for j:=1 to 8 do
          begin
            if mo then gotoxy(j,i) else gotoxy(j*2,i);
            write('.');b[i,j]:=false;
          end;
          t:=true;
        end;
    'L':begin
          h:=b;t:=true;
          for i:=1 to line do for j:=1 to 8 do
          begin
            b[i,j]:=h[i,9-j];
            if mo then gotoxy(j,i) else gotoxy(j*2,i);
            if not b[i,j] then write('.') else write('@');
          end;
        end;
    '.':begin
          sav;
          if asc=255 then asc:=0 else inc(asc);
          onshow;
        end;
    ',':begin
          sav;
          if asc=0 then asc:=255 else dec(asc);
          onshow;
        end;
    'Q':begin
          sav;
          if asc>245 then dec(asc,246) else inc(asc,10);
          onshow;
        end;
    'I':begin
          sav;
          if asc<10 then inc(asc,246) else dec(asc,10);
          onshow;
        end;
    'T':begin
          h:=b;
          for i:=1 to line do for j:=1 to 8 do
          begin
            b[i,j]:=h[line+1-i,j];
            if mo then gotoxy(j,i) else gotoxy(j*2,i);
            if not b[i,j] then write('.') else write('@');
          end;
          t:=true;
        end;
    ' ':begin
          b[x,y]:=not b[x,y];t:=true;
          if mo then gotoxy(y,x) else gotoxy(y*2,x);
          if not b[x,y] then write('.') else write('@');
        end;
    #13:begin
          save;
        end;
    'B':begin
          t:=false;onshow
        end;
    'R':begin
          save;p:=d[asc];
        end;
    'W':begin
          d[asc]:=p;onshow;
        end;
    end;
  until c=#27;
  rewrite(g);write(g,d);close(g);
End;
Begin
  write('Input filename:');readln(s);
  texts(s);
End.