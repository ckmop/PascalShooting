{$A+,B-,D-,E+,F+,G+,I+,L+,N-,O-,R-,S-,V+,X+}
{$M 1024,0,65536}
Unit qkb;
Interface
Const
  _Esc_=1;
  _F1_=59;
  _F2_=60;
  _F3_=61;
  _F4_=62;
  _F5_=63;
  _F6_=64;
  _F7_=65;
  _F8_=66;
  _F9_=67;
  _F10_=68;
  _F11_=87;
  _F12_=88;
  _Print_Screen_=55;
  _Pr_sc_=55;
  _Scroll_lock_=70;
  _Sc_lk_=70;
  _Pause_=29;
  _Left_point_=41;
  _No1_=2;
  _No2_=3;
  _No3_=4;
  _No4_=5;
  _No5_=6;
  _No6_=7;
  _No7_=8;
  _No8_=9;
  _No9_=10;
  _No0_=11;
  _Dec_=12;
  _Equ_=13;
  _Backspace_=14;
  _Backsp_=14;
  _Tab_=15;
  _Q_=16;
  _W_=17;
  _E_=18;
  _R_=19;
  _T_=20;
  _Y_=21;
  _U_=22;
  _I_=23;
  _O_=24;
  _P_=25;
  _Left_I_=26;
  _Right_I_=27;
  _Enter_=28;
  _Caps_lock_=58;
  _A_=30;
  _S_=31;
  _D_=32;
  _F_=33;
  _G_=34;
  _H_=35;
  _J_=36;
  _K_=37;
  _L_=38;
  _Cut_=39;
  _Right_point_=40;
  _Left_Shift_=42;
  _Z_=44;
  _X_=45;
  _C_=46;
  _V_=47;
  _B_=48;
  _N_=49;
  _Dec_2_=74;
  _Inc_=78;
  _M_=50;
  _Little_=51;
  _Big_=52;
  _Line_=53;
  _Right_Shift_=54;
  _Ctrl_=29;
  _Back_line_=43;
  _Alt_=56;
  _Space_=57;
  _Ins_=82;
  _Home_=71;
  _Page_up_=73;
  _Del_=83;
  _End_=79;
  _Page_down_=81;
  _Up_=72;
  _Down_=80;
  _Left_=75;
  _Right_=77;
  _Numlock_=69;
  keyt:boolean=false;
  breaktype:byte=0;
var
    oldint9:pointer;
    kenu:byte;
    Function onkey(s:byte):boolean;
    Function readkeys:string;
    Function newkey:boolean;
    Function Lastkey:byte;
Implementation
Uses dos;
Var oldexit:pointer;
    keyon:array[0..255] of boolean;
    range:array[0..255] of byte;
Const st:byte=0;no:byte=0;
Function onkey;
Begin
  Onkey:=keyon[s];
End;
Procedure int9;interrupt;Assembler;
Asm
  push ds
  in al,60h
  test al,80h
  jnz @@1
  and al,7fh
  mov kenu,al
  mov keyt,1
  xor ah,ah
  lea bx,keyon[0]
  add bx,ax
  mov cl,al
  mov al,1
  mov [bx],al
  lea bx,range[0]
  mov al,no
  inc al
  xor ah,ah
  add bx,ax
  mov no,al
  mov [bx],cl
  jmp @@3
@@1:
  mov cl,0
  and al,7fh
  xor ah,ah
  lea bx,keyon[0]
  add bx,ax
  mov al,0
  mov ds:[bx],al
@@3:
  mov ah,breaktype
  cmp ah,2
  jz @@2
  pushf
  call oldint9
  cmp ah,1
  jnz @@4
  mov ax,40h
  push ax
  pop es
  mov al,es:[1ch]
  mov es:[1ah],al
  jmp @@4
@@2:
  in al,61h
  or al,80h
  out 61h,al
  and al,7fh
  out 61h,al
  mov al,20h
  out 20h,al
@@4:
  pop ds
end;
Function readkeys;
Var s:string;
Begin
  s:='';
  while st<>no do
  begin
    inc(st);s:=s+char(range[st]);
  end;
  readkeys:=s;
End;
Procedure exlit;
Begin
  setintvec($9,oldint9);
  exitproc:=oldexit;
End;
Function Lastkey:byte;Assembler;
Asm
  xor ah,ah
  mov al,keyt
  cmp al,1
  jnz @@1
  mov keyt,0
  mov al,kenu
  jmp @@2
@@1:
  mov al,$ff
@@2:
End;
Function newkey;
Begin
  if st=no then newkey:=false else newkey:=true;
end;
begin
  breaktype:=0;
  keyt:=false;
  getintvec($9,oldint9);
  oldexit:=exitproc;
  exitproc:=@exlit;
  fillchar(keyon,sizeof(keyon),0);
  setintvec($9,@int9);
end.