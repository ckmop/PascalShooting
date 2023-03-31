Uses qkb,t;
Var s:string;
Begin
  keybreak:=1;
  repeat
    s:=readkeys;writeln(s);
    wait(50);
  until s='999';
End.