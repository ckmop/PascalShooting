{$A+,B-,D-,E+,F+,G+,I+,L+,N-,O-,P-,Q-,R-,S-,T-,V+,X+}
{$M 16384,0,655360}
Program t;
Uses dos;
Var x:word;
    s:string;
    c:Integer;
Procedure faster;Assembler;
Asm
  cli
  in al,21h
  push ax
  mov al,0ffh
  out 21h,al
  mov al,36h
  out 43h,al
  jmp @@1
@@1:
  jmp @@3
@@3:
  mov ax,x
  out 40h,al
  jmp @@2
@@2:
  jmp @@4
@@4:
  mov al,ah
  out 40h,al
  pop ax
  out 21h,al
  sti
End;
Begin
  if ParamCount = 0 then
    Writeln('No parameters on command line')
  else if ParamCount>1 then
    Writeln('Too many parameters')
  else
  begin
    s:=paramStr(1);
    val(s,x,c);
    if c<>0 then
      Writeln('Error in parameters')
    else faster;
  end;
end.