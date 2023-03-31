{$A+,B-,D-,E+,F-,G+,I+,L+,N-,O-,R-,S-,V+,X+}
{$M 1024,0,655360}
Unit screen;
Interface
Type sc1=array[1..51,1..80] of record case byte of
                               1:(b,a:byte);
                               2:(c:word);
                               end;
     Cha=array[1..32] of byte;
     Allcha=array[0..255] of cha;
     Chafile=file of Allcha;
Procedure Setwin(a,b,c,d:byte);
Procedure clean(Var c);
Procedure clr(x,y,c,b:integer);
Procedure Sclr(x,y,c,b:byte;st:string);
Procedure show(x,y,c,b:shortint;st:string;var e:boolean);
Procedure usestexts(p:byte;s:string);
Procedure link;
Procedure readchar(p:byte;Var d:Allcha);
Procedure writechar(p:byte;Var d:Allcha);
Procedure newt(Var a:cha;asc,page,line:byte);
Procedure ramoff;
Procedure Cursor(sh,sl:byte);
Var a:sc1 absolute $b800:0;
    sc:array[-10..61,-10..91] of boolean;
Implementation
Uses crt;
var aa:cha;
    i,j,k:shortint;w:byte;t,rambase:word;
    x1,y1,x2,y2:byte;
    Line,asc,num,page:byte;
    d:Allcha;
Const m:array[1..8] of integer=(-1,-1, 0, 1, 1, 1, 0,-1);
      n:array[1..8] of integer=( 0, 1, 1, 1, 0,-1,-1,-1);
      li:word=$2000;lo:byte=$20;
Procedure RAMOn;Assembler;
Asm
  Cli
  Mov Dx,3c4h
  Mov Ax,402h
  Out Dx,Ax
  Mov Ax,704h
  Out Dx,Ax
  Mov Dx,3ceh
  Mov Ax,204h
  Out Dx,Ax
  Mov Ax,5
  Out Dx,Ax
  Mov Ax,6
  Out Dx,Ax
  Sti
End;
Procedure RAMOff;Assembler;
Asm
  Cli
  Mov Dx,3c4h
  Mov Ax,302h
  Out Dx,Ax
  Mov Ax,304h
  Out Dx,Ax
  Mov Dx,3ceh
  Mov Ax,4
  Out Dx,Ax
  Mov Ax,1005h
  Out Dx,Ax
  Mov Ax,RamBase
  Out Dx,Ax
  Sti
End;
Procedure Setwin;
Begin
  x1:=a;y1:=b;x2:=c;y2:=d;
  fillchar(sc,sizeof(sc),0);
  for i:=x1 to x2 do for j:=y1 to y2 do
  sc[i,j]:=true;
End;
Procedure clean;
Begin
  for i:=x1 to x1+(x2-x1) div 2 do
    for j:=y1 to y1+(y2-y1) div 2 do
    begin
      a[i,j].c:=byte(c)+7*256;a[i,y1+y2-j].c:=byte(c)+7*256;
      a[x1+x2-i,j].c:=byte(c)+7*256;a[x1+x2-i,y1+y2-j].c:=byte(c)+7*256;
    end;
End;
Procedure clr;
Begin
  for i:=1 to c do
    for j:=1 to b do
      if sc[x-1+i,y-1+j] then a[x-1+i,y-1+j].c:=32+7*256;
End;
Procedure Sclr;
Begin
  k:=0;
  for i:=1 to c do
    for j:=1 to b do
    begin
      inc(k);
      if sc[x-1+i,y-1+j] and (a[x-1+i,y-1+j].b=byte(st[k])) then
        a[x-1+i,y-1+j].b:=32;
    end;
End;
Procedure Cursor;assembler;
Asm
 mov ah,1
 mov ch,sh
 mov cl,sl
 int $10
End;

Procedure show;
Begin
  e:=false;
  if c*b<length(st) then t:=ord(st[c*b+1]) shl 8 else t:=$700;
  k:=0;
  for i:=1 to c do
    for j:=1 to b do
    begin
      inc(k);
      if sc[x-1+i,y-1+j] then
      begin
        e:=true;
        if st[k]<>#0 then
        begin
          a[x-1+i,y-1+j].c:=byte(st[k])+t;
        end;
      end;
    end;
End;
Procedure newt;Assembler;
Asm
  mov ax,$a000
  mov es,ax
  call ramon
  mov al,page
  xor ah,ah
  mul li
  mov di,ax
  mov al,asc
  xor ah,ah
  mul lo
  add di,ax
  mov cl,line
  xor ch,ch
  lds si,a
  rep movsb
  call ramoff
End;
Procedure link;assembler;
Asm
  mov  dx,$3c4
  mov  al,1
  out  dx,al
  inc  dx
  in   al,dx
  or   al,1
  out  dx,al
End;
Procedure usestexts;
Var f:chafile;i:byte;
Begin
  assign(f,s);reset(f);
  read(f,d);close(f);
  writechar(p,d);
End;
Procedure readchar;Assembler;
Asm
  call ramon
  push ds
  mov ax,$A000
  mov ds,ax
  mov al,p
  xor ah,ah
  mul li
  mov si,ax
  mov cx,$1000
  les di,d
  rep movsw
  pop ds
  call ramoff
End;
Procedure writechar;Assembler;
Asm
  call ramon
  mov ax,$A000
  mov es,ax
  mov al,p
  xor ah,ah
  mul li
  mov di,ax
  mov cx,$1000
  lds si,d
  rep movsw
  call ramoff
End;
Begin
  Asm
  Cli
  Mov  Dx,$3ce
  Mov  Ax,$606
  Out  Dx,Al
  Inc  Dx
  In   Al,Dx
  Xchg Ah,Al
  Mov  RamBase,Ax
  Sti
 End;
End.