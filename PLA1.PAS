{$A+,B-,D-,E+,F+,G+,I+,L-,N-,O-,R-,S-,V+,X+}
{$M 2048,0,655360}
program starwar;
uses qkb,crt,screen,t;
const cc1=256*(8+1*17);cc2=5*16+7;
      maxzd=100;
      w3:array[0..3] of byte=(186,185,184,183);
      wcc:array[0..3] of byte=(11,12,14,15);
      m:array[1..8] of shortint=(-1,-1, 0, 1, 1, 1, 0,-1);
      n:array[1..8] of shortint=( 0, 1, 1, 1, 0,-1,-1,-1);
      fx:array[1..8] of byte=(72,73,77,81,80,79,75,71);
      conm:array[1..4] of byte=(4,4,4,4);
      use:array[1..4,0..4] of integer=
      ((0,100,200,400,600),
       (0,100,200,300,400),
       (0,300,300,300,300),
       (0,200,500,800,1200));
      dol:byte=0;
      kp:byte=1;pqw:byte=0;
      guo:boolean=false;
      pwr:boolean=true;
      tr:array[0..14] of byte=(43,219,175,176,177,178,124,125,126,127,44, 128,136,220,221);
      wli:array[0..14] of byte=(4,  3,  0,  0,  0,  0,  0,  0,  0,  0, 6,   4, 10,  1, 10);
      grt:string[16]=#0#0'Å'#0#0'{ÉÇÑz'#0'ÜÖá'#0#15;
      ert=#0#0#15#0#0#15#15#15#15#15#0#15#15#15#0#12;
      flq=#0#0'õ°õ'#0#0#0'öüüüô'#0'¢ü è ü£'#0'êüüüë'#0#0#0'úñú'#0#0;
      flr='ÉÇíÇÑ¢èüè£ â†ä '#14;
      fls=#0'õ°õ'#0'ãÇíÇåéèüèç â†ä '#13;
      flt='öÇMÇôêO=Oë ììì '#12;
      flu=#0'ÉÇíÇÑ'#0'î¢èOè£ïúúäìâúú'#11;
      flv='ÉÇíÇÑ¢èüè£ â†ä '#10;
      fyc=#0#0'õ'#0#0'ûMèMù'#0#0'ú'#0#0#9;
      flx='ÉÇíÇÑ¢èüè£ â†ä '#8;
      bz2=#164#165#166#167#168#169#170#171#172#10#11#12#13#14#15;
      linx:byte=70;
      dud=#0'+'#0'+++'#0'+'#0#6;
      www=#20#23#21#22#11;
      hel='±|≤'#127'€~∞}Ø'#5;
      fy0=#0'õÇõ'#0'ÉèüèÑ î†ï '#9;
      fy1=#0'Ç'#0'îèï ñ '#9;
      fy2='âíäóèò ì '#10;
      fy3='ö¬ô√<¥ê¡ë'#10;
      fy4=#0'õ'#0'û<ù'#0'ú'#0#3;
      fy5=' ° ¢ü£ † '#12;
      fy6=#0'õÅõ'#0'ÉÇíÇÑ';
      fy7='âíä ì '#13;
      fy9='ã¬å√*¥é¡ç'#13;
      ppp='ãåéç'#12;
      fy8='ãèåè≈èéèç'#12;
      fya='èô'#0'üüùèë'#0;
      fyb=#0'öèûüü'#0'êè';
      lik:byte=240;ljk:integer=0;
      onh:boolean=false;onj:boolean=false;
      w1:byte=0;
var qe:array[-1..52,-1..82] of byte;
    iniy:array[1..4] of byte;
    wlo,ppq,wii:array[byte] of byte;
    tm,tn:array[0..72] of integer;
    na,x,y,li,mx,my,cx,cy,cx1,cy1,sp,p,q:array[1..101] of integer;
    pa,pb,pc,pd,pe,pf,pg,ph,pi,pj:array[1..40] of integer;
    dx,dy,dg,dw,ds,dp,dq,dm,dn,dr:array[1..maxzd] of integer;
    xx,xy,xp,xq,xc:array[1..10] of shortint;
    i,j,lif,maxlife,q0,q1,q2,te,q3,q4,c,d,z,z1,e,f,r1,l,s,ss,r,ma,kq,tre:integer;
    k,k0,k1,k6,k5,ki,ko,k3,k2,k4,k7,k8,k9:integer;
    b:integer;sou,ind:boolean;ch:char;ee:boolean;
    h,h1,h2,h3,h4:array[1..40] of shortint;
    stas:array[1..50,2..69] of byte;
    power:word;
Function sgn(m:integer):shortint;
Begin
 if m>0 then sgn:=1 else
 if m=0 then sgn:=0 else sgn:=-1;
End;
Procedure turn(a,k,s:integer);
Begin
  x[j]:=x[i];y[j]:=y[i];cx[j]:=0;cy[j]:=0;cx1[j]:=0;cy1[j]:=0;
  mx[j]:=tm[a];my[j]:=tn[a];na[j]:=k;sp[j]:=s;
End;
procedure short(a,b:integer;var k:integer);
var x1,y1,f,na,h:integer;
begin
  x1:=r-a;y1:=c-b;k:=5;
  if x1<0 then na:=-1 else if x1>0 then na:=1 else na:=0;
  if y1<0 then h:=-1 else if y1>0 then h:=1 else h:=0;
  if abs(x1)>abs(y1)*2 then h:=0;
  if abs(y1)>abs(x1)*2 then na:=0;
  for f:=1 to 8 do if (m[f]=na) and (n[f]=h) then k:=f;
end;
function inj(var j:integer):boolean;
begin
  repeat inc(j) until (j>100) or (na[j]=0);
  if j>100 then inj:=false else inj:=true;
end;
procedure shoot(Var a,b,na,d:integer);
var x1,y1:integer;z1:real;
begin
  x1:=abs(r-a);
  y1:=abs(c-b);
  z1:=sqrt(x1*x1+y1*y1);
  if z1=0 then
  begin
    z1:=100;x1:=1;
  end else z1:=100/z1;
  na:=round(x1*z1);d:=round(y1*z1);
  if r<a then na:=-na;
  if c<b then d:=-d;
end;
Procedure inp(s:integer);
Begin
  power:=power+s;
  na[i]:=7;sp[i]:=0;
End;
Function puts(x,y,p:integer;c:char):boolean;
Begin
  if sc[x,y] then a[x,y].c:=byte(c)+7*256;
  if sc[x+m[p],y+n[p]] then a[x+m[p],y+n[p]].c:=byte(c)+7*256;
  if sc[x-m[p],y-n[p]] then a[x-m[p],y-n[p]].c:=byte(c)+7*256;
  puts:=sc[x,y] or sc[x-m[p],y-n[p]] or sc[x+m[p],y+n[p]];
End;
Procedure move1(var x,p,t:integer;q:integer);
Begin
  inc(t,abs(p));
  while t>=q do
  begin
    dec(t,q);
    if p>0 then inc(x) else if p<0 then dec(x);
  end;
End;
Procedure move0;
Begin
  inc(cx[i],mx[i]);inc(cy[i],my[i]);
  while abs(cx[i])>sp[i] do
  begin
    inc(x[i],sgn(cx[i]));
    dec(cx[i],sgn(cx[i])*sp[i]);
  end;
  while abs(cy[i])>sp[i] do
  begin
    inc(y[i],sgn(cy[i]));
    dec(cy[i],sgn(cy[i])*sp[i]);
  end;
End;
Procedure move2;
Begin
  move0;
  inc(mx[i],cx1[i]);inc(my[i],cy1[i]);
  if abs(mx[i])>sp[i]*2 then mx[i]:=sgn(mx[i])*2*sp[i];
  if abs(my[i])>sp[i]*2 then my[i]:=sgn(my[i])*2*sp[i];
End;
Procedure poin(w,t,j:integer);
Begin
  sp[j]:=w;cx[j]:=0;cy[j]:=0;cx1[j]:=0;cy1[j]:=0;
  x[j]:=x[i];y[j]:=y[i];na[j]:=t;
  shoot(x[i],y[i],mx[j],my[j]);
End;
Procedure shan(s,w,t,d:integer);
Var j,k,l,m:integer;
Begin
  j:=0;
  if inj(j) then
  begin
    poin(w,t,j);
    k:=j;m:=j;
  end;
  for l:=1 to s do
  if inj(j) then
  begin
    sp[j]:=w;cx[j]:=0;cy[j]:=0;cx1[j]:=0;cy1[j]:=0;
    x[j]:=x[i];y[j]:=y[i];na[j]:=t;
    mx[j]:=(tm[d]*my[k]+tn[d]*mx[k]) div 300;
    my[j]:=(tn[d]*my[k]-tm[d]*mx[k]) div 300;
    k:=j;
  end;
  for l:=1 to s do
  if inj(j) then
  begin
    sp[j]:=w;cx[j]:=0;cy[j]:=0;cx1[j]:=0;cy1[j]:=0;
    x[j]:=x[i];y[j]:=y[i];na[j]:=t;
    mx[j]:=(tn[d]*mx[m]-tm[d]*my[m]) div 300;
    my[j]:=(tn[d]*my[m]+tm[d]*mx[m]) div 300;
    m:=j;
  end;
End;
Procedure shan1(s,w,t,d,a:integer);
Var j,k,l,m:integer;
Begin
  j:=0;
  for k:=-s to s do
  begin
    l:=a+k*d;if l<0 then inc(l,72);
    if l>72 then dec(l,72);
    if inj(j) then
    begin
      na[j]:=t;sp[j]:=w;mx[j]:=tm[l] div 3;my[j]:=tn[l] div 3;
      cx[j]:=0;cy[j]:=0;x[j]:=x[i];y[j]:=y[i];
    end;
  end;
End;
function gpt(x,y,c,b:integer;s:string):integer;
var k,i1,j1,q:integer;
begin
  k:=0;q:=0;
  for i1:=1 to c do
    for j1:=1 to b do
    begin
      inc(k);
      if sc[x-1+i1,y-1+j1] then
      begin
        te:=a[x-1+i1,y-1+j1].b;
        if (s[k]>#0) and (te=byte(s[k])) then a[x-1+i1,y-1+j1].c:=32+7*256;
        if (s[k]>#0) and (wlo[te]>0) then
        begin
          inc(q,wlo[te]);
          if (ppq[te]=0) or (te=44) then dw[qe[x-1+i1,y-1+j1]]:=9;
          if te=220 then ds[qe[x-1+i1,y-1+j1]]:=i;
        end;
      end;
    end;
  gpt:=q;
end;
procedure pla;
begin
  clr(r-1,c-2,3,5);
  if z=4 then
  begin
    clr(r-4,c-3,3,3);clr(r-4,c+1,3,3);
  end;
  k3:=0;
  if not sou or (dol>5) then
  for j:=1 to 4 do
  begin
    i:=j+j-1;
    if onkey(fx[i]) then
    begin
      c:=c+n[i];if (c<4) or (c>67) then c:=c-n[i];
      r:=r+m[i];if (r<3) or (r>49) then r:=r-m[i];
      k3:=k3-m[i];
    end;
  end;
  if k8<7 then inc(k8);
  if not onj and (k8>=6) then
  if (k7>1) and (k3<0) then begin dec(k7);k8:=0 end else
  if (k7<5) and (k3>0) then begin inc(k7);k8:=0 end;
  show(r-1,c-2,3,5,grt,ee);
  if z=4 then
  begin
    show(r-4,c-3,3,3,hel,ee);show(r-4,c+1,3,3,hel,ee);
  end;
  if onkey(44) and (b>0) and (not sou or (dol>50)) then
  begin
    sou:=true;dec(b);dol:=0;j:=0;
    for i:=1 to 4 do
    begin
      repeat inc(j) until (j>maxzd) or (dg[j]=0);
      if j<=maxzd then
      begin
        dg[j]:=10;dx[j]:=r;dy[j]:=c;dw[j]:=i;
      end;
    end;
  end;
  if onkey(_left_) and onkey(_right_) and not onkey(_x_) then onh:=true else
  begin
    if onh then onj:=not onj;
    onh:=false;
  end;
  if sou then
  begin
    inc(dol);
    if dol<100 then
    begin
      if dol mod 2=0 then show(r-1,c-2,3,5,ert,ee);
    end else
    sou:=false;
  end else
  show(r-1,c-2,3,5,grt,ee);
End;
Procedure cllin;
Var k:integer;
Begin
  textcolor(12);textbackground(7);
  gotoxy(linx+9,5);write(s);
  gotoxy(linx+8,30);write(lif);
  textcolor(15);textbackground(0);write('˛');
  textcolor(12);textbackground(7);
  gotoxy(linx+3,11);write(power);
  textcolor(15);textbackground(0);write('˛˛˛');
  textcolor(12);textbackground(7);
  gotoxy(linx+8,45);write(b);
End;
Procedure zd;
Var kk1,kk2,kk3,kk4:integer;
Procedure ZD9;
Begin
 a[dx[i],dy[i]].c:=32+7*256;
 a[dx[i]-dp[i],dy[i]-dq[i]].c:=32+7*256;
 a[dx[i]+dp[i],dy[i]+dq[i]].c:=32+7*256;
 if dw[i]=9 then
 begin
   dw[i]:=20;dg[i]:=8;dp[i]:=1;dx[i]:=x[ds[i]];dy[i]:=y[ds[i]];
 end else
 begin
   dy[i]:=dy[i]+dq[i];dx[i]:=dx[i]+dp[i];
   if odd (dp[i]+dq[i]) or (q2>0) then
   begin
     dy[i]:=dy[i]+dq[i];dx[i]:=dx[i]+dp[i];
   end;
   if (dx[i]<2) or (dx[i]>49) or
   (dw[i]=9) or (dy[i]<3) or (dy[i]>68) then dg[i]:=0 else
   begin
     a[dx[i],dy[i]].c:=220+5*256;
     a[dx[i]-dp[i],dy[i]-dq[i]].c:=220+5*256;
     a[dx[i]+dp[i],dy[i]+dq[i]].c:=220+5*256;
     qe[dx[i],dy[i]]:=i;
     qe[dx[i]-dp[i],dy[i]-dq[i]]:=i;
     qe[dx[i]+dp[i],dy[i]+dq[i]]:=i;
   end;
 end
End;
Begin
  k1:=0;k:=0;
  for i:=1 to 3 do
    for j:=1 to 5 do
    begin
      inc(k1);
      if (grt[k1]<>#0) and (r-2+i>0) then
      begin
        r1:=a[r-2+i,c-3+j].b;
        if (r1<>integer(grt[k1])) and (r1<>32) then k:=1;
      end;
    end;
  if (k=1) and not sou then
  begin
    dec(lif);
    dol:=80;sou:=true;
  end;
  for i:=1 to maxzd do
    case dg[i] of
    1:
    begin
      j:=0;dec(ds[i]);
      if ds[i] mod 3=0 then
      begin
        repeat inc(j) until (j>maxzd) or (dg[j]=0);
        dg[j]:=6;dx[j]:=dx[i];
        if j<i then dec(dx[j],2);
        dy[j]:=dy[i];dw[j]:=0;
      end;
      a[dx[i],dy[i]].c:=32+7*256;a[dx[i]+1,dy[i]].c:=32+7*256;
      if (dw[i]=9) or (ds[i]=0) or (dy[i]<3) or (dy[i]>68) then dg[i]:=0 else
      begin
        dy[i]:=dy[i]+dw[i];
        a[dx[i],dy[i]].c:=136+4*256;a[dx[i]+1,dy[i]].c:=136+5*256;
        qe[dx[i],dy[i]]:=i;qe[dx[i]+1,dy[i]]:=i;
      end;
    end;
    9:zd9;
    8:
    begin
      clr(dx[i]-1,dy[i]-1,3,3);
      if dp[i]=0 then dec(dx[i]) else if dp[i]=1 then
      begin
        k1:=dx[i];k2:=dy[i];
        dx[i]:=x[ds[i]];dy[i]:=y[ds[i]];
        if na[ds[i]]<8 then dp[i]:=2;
      end;
      if dp[i]>0 then dec(dw[i]);
      if (dx[i]<2) or (dw[i]=0) or (dx[i]>49) or (dy[i]<3) or (dy[i]>68) 
      then dg[i]:=0 else show(dx[i]-1,dy[i]-1,3,3,hel,ee);
    end;
    4:
    begin
      clr(dx[i]-1,dy[i]-1,3,3);
      if dw[i]=9 then
      begin
       j:=0;dg[i]:=0;
      end else
      begin
        dec(dx[i]);
        if q1=0 then
        begin
          if (dp[i]=0) and (dq[i]=0) then dq[i]:=2 else
          if (dp[i]=4) and (dq[i]=2) then dq[i]:=0 else
          dp[i]:=dp[i]+dq[i]-1;dy[i]:=dy[i]+(ds[i] div 2)-1;
        end;
        if abs(dp[i]-2)>q1 then
          if dp[i]>2 then inc(dy[i]) else dec(dy[i]);
        if (dx[i]<3) or (dy[i]<3) or (dy[i]>68) then dg[i]:=0 else
        begin
          show(dx[i]-1,dy[i]-1,3,3,hel,ee);
          for j:=1 to 3 do for k:=1 to 3 do
            qe[dx[i]-2+j,dy[i]-2+k]:=i;
        end;
      end;
    end;
    6:
    begin
      for k2:=1 to 3 do a[dx[i]+k2,dy[i]].c:=32+7*256;
      dx[i]:=dx[i]-2;
      if (dw[i]=9) or (dx[i]=-2) then dg[i]:=0 else
      begin
        if dx[i]=-1 then dx[i]:=0;
        for k2:=1 to 3 do
        begin
          qe[dx[i]+k2,dy[i]]:=i;a[dx[i]+k2,dy[i]].c:=136+5*256;
        end;
      end;
    end;
    2:
    begin
      for k2:=0 to 2 do a[dx[i]+k2,dy[i]].c:=32+7*256;
      dx[i]:=dx[i]-2;
      if (abs(dp[i])>q1) and odd(q3) then dy[i]:=dy[i]+sgn(dp[i]);
      if (dw[i]=9) or (dx[i]=-1) or (dy[i]=1) or (dy[i]=70) then dg[i]:=0 else
      begin
        if dx[i]=0 then dx[i]:=1;
        for k2:=0 to 2 do
        begin
          qe[dx[i]+k2,dy[i]]:=i;a[dx[i]+k2,dy[i]].c:=128+5*256;
        end;
      end;
    end;
    3:
    begin
      for k2:=0 to 3 do a[dx[i]+k2,dy[i]].c:=32+7*256;
      dx[i]:=dx[i]-3;
      if (dw[i]=9) or (dx[i]=-2) or (dy[i]=1) or (dy[i]=70) then dg[i]:=0 else
      begin
        if dx[i]<1 then dx[i]:=1;
        for k2:=0 to 3 do
        begin
          qe[dx[i]+k2,dy[i]]:=i;a[dx[i]+k2,dy[i]].c:=44+5*256;
        end;
      end;
    end;
    7:
    begin
      clr(dx[i]-1,dy[i]-1,3,3);
      if dw[i]=9 then dg[i]:=0 else
      begin
        if dw[i]=8 then
        begin
          if ds[i]=102 then dw[i]:=9 else
          if (na[ds[i]]<8) then dx[i]:=0 else
          begin
            dx[i]:=x[ds[i]];dy[i]:=y[ds[i]];
          end;
        end else
        begin
          move1(dx[i],tm[dr[i]],dm[i],150);
          move1(dy[i],tn[dr[i]],dn[i],150);
        end;
        show(dx[i]-1,dy[i]-1,3,3,dud,ee);
        if not ee then dg[i]:=0 else
        begin
          for j:=0 to 2 do qe[dx[i]+j-1,dy[i]]:=i;
          for j:=0 to 2 do qe[dx[i],dy[i]+j-1]:=i;
          if (ds[i]<102) and (na[ds[i]]<8) then ds[i]:=102;
          if ds[i]<102 then
          begin
            k1:=x[ds[i]]-dx[i];k2:=y[ds[i]]-dy[i];
            kk1:=sqr(k1)+sqr(k2);
            if kk1<=4 then dw[i]:=8 else
            begin
              kk2:=tn[dr[i]]*k1-tm[dr[i]]*k2;
              dr[i]:=dr[i]+3*sgn(kk2);
              if dr[i]<0 then inc(dr[i],72) else
              if dr[i]>=72 then dec(dr[i],72);
            end;
          end;
        end;
      end;
    end;
    10:
    begin
      case dw[i] of
      1,3:begin
            for j:=2 to 69 do a[dx[i],j].c:=32+7*256;
            for j:=2 to 69 do a[dx[i]+2-dw[i],j].c:=32+7*256;
          end;
      2,4:begin
            for j:=2 to 49 do a[j,dy[i]].c:=32+7*256;
            for j:=2 to 49 do a[j,dy[i]-3+dw[i]].c:=32+7*256;
          end;
      end;
      dx[i]:=dx[i]+m[dw[i]*2-1];dy[i]:=dy[i]+n[dw[i]*2-1];
      if (dx[i]=1) or (dx[i]=50) or (dy[i]=1) or (dy[i]=70) then dg[i]:=0 else
      case dw[i] of
      1,3:begin
            for j:=2 to 69 do a[dx[i],j].c:=219+11*256;
            for j:=2 to 69 do a[dx[i]+2-dw[i],j].c:=219+11*256;
          end;
      2,4:begin
            for j:=2 to 49 do a[j,dy[i]].c:=219+11*256;
            for j:=2 to 49 do a[j,dy[i]-3+dw[i]].c:=219+11*256;
          end;
      end;
    end;
  end;
end;
Procedure dozd;
Begin
  if onkey(45) then
  begin
    if kp=0 then
    begin
      case z1 of
      0:
      begin
        i:=0;kp:=4;
        repeat inc(i) until (i>maxzd) or (dg[i]=0);
        if i<=maxzd then
        begin
          dg[i]:=2;dx[i]:=r-2;dp[i]:=0;
          dy[i]:=c;dw[i]:=0;ds[i]:=0;
        end;
      end;
      1:
      begin
        i:=0;kp:=6;
        for j:=0 to 2 do
        begin
          repeat inc(i) until (i>maxzd) or (dg[i]=0);
          if i<=maxzd then
          begin
            dg[i]:=2;dx[i]:=r-2;dp[i]:=0;
            dy[i]:=c+j-1;dw[i]:=0;ds[i]:=0;
          end;
        end;
      end;
      2:
      begin
        i:=0;kp:=9;
        for j:=0 to 4 do
        begin
          repeat inc(i) until (i>maxzd) or (dg[i]=0);
          if i<=maxzd then
          begin
            dg[i]:=2;dx[i]:=r-2;dp[i]:=j-2;
            dy[i]:=c+j-2;dw[i]:=0;ds[i]:=0;
          end;
        end;
      end;
      3:
      begin
        i:=0;kp:=3;
        repeat inc(i) until (i>maxzd) or (dg[i]=0);
        if i<=maxzd then
        begin
          dg[i]:=3;dx[i]:=r-1;dp[i]:=0;
          dy[i]:=c;dw[i]:=0;ds[i]:=0;
        end;
      end;
      4:
      begin
        i:=0;kp:=6;
        for j:=1 to 3 do
        begin
          repeat inc(i) until (i>maxzd) or (dg[i]=0);
          if i<=maxzd then
          begin
            dg[i]:=3;dx[i]:=r-1;
            dy[i]:=c+j*2-4;dw[i]:=0;ds[i]:=0;
          end;
        end;
      end;
      end;
    end;
    i:=0;
    if ki=0 then
      Case z of
      2:
      begin
        for j:=0 to 1 do
        begin
          repeat inc(i) until (i>maxzd) or (dg[i]=0);
          if i<=maxzd then
          begin
            ki:=25;dg[i]:=1;
            dx[i]:=r-1;dy[i]:=c;
            dw[i]:=j*2-1;ds[i]:=15;
          end;
        end;
      end;
      1:
      begin
        if (k3=0) and (k4=0) then k3:=-1;
        for j:=0 to 1 do
        begin
          repeat inc(i) until (i>maxzd) or (dg[i]=0);
          if i<=maxzd then
          begin
            ki:=14;dg[i]:=9;
            dx[i]:=r;dy[i]:=c+1-j*2;
            dw[i]:=j*2-1;dp[i]:=m[k7];dq[i]:=n[k7]*2*j-n[k7];
          end;
        end;
      end;
      4:
      begin
        for j:=0 to 1 do
        begin
          repeat inc(i) until (i>maxzd) or (dg[i]=0);
          if i<=maxzd then
          begin
            ki:=25;dg[i]:=4;
            dx[i]:=r-3;dy[i]:=c-2+j*4;ds[i]:=2;
            dp[i]:=4*j;dq[i]:=2*j;
            dw[i]:=0;
          end;
        end;
      end;
      3:
      begin
        ki:=25;j:=0;repeat inc(j) until (j>101) or (na[j]>7);
        for k:=1 to 5 do
        begin
          repeat inc(i) until (i>maxzd) or (dg[i]=0);
          if i<=maxzd then
          begin
            dg[i]:=7;dr[i]:=k*6+36;
            dx[i]:=r;dy[i]:=c;dw[i]:=k+6;
            if dw[i]>8 then dec(dw[i],8);
            dm[i]:=0;dn[i]:=0;dw[i]:=0;
            ds[i]:=j;
            if j<>102 then
            begin
              repeat
                inc(j);if j=102 then j:=1;
              until (na[j]>7);
            end;
          end;
        end;
      end;
    end;
  end;
  if ki>0 then dec(ki);
  if kp>0 then dec(kp);
End;
procedure newz;
begin
  i:=101;lik:=240;ljk:=0;ind:=true;inc(ss);
  na[i]:=20;x[i]:=0;y[i]:=35;my[i]:=0;li[i]:=50;mx[i]:=100;tre:=10;
  cx[i]:=0;cy[i]:=0;cx1[i]:=0;cy1[i]:=0;sp[i]:=100;
  for i:=1 to 50 do a[i,1].c:=255+$4C00;
end;
procedure indark(d,j,i,s:integer);
begin
  na[i]:=d;
  x[i]:=random(46)+3;y[i]:=random(66)+3;
  if m[j]=1 then x[i]:=0 else if m[j]=-1 then x[i]:=51;
  if n[j]=1 then y[i]:=1 else if n[j]=-1 then y[i]:=70;
  mx[i]:=m[j]*100;my[i]:=n[j]*100;sp[i]:=s;cx[i]:=0;cy[i]:=0;
end;
procedure star;
begin
  q1:=1-q1;q0:=1-q0;
  inc(q2);if q2>2 then q2:=0;
  inc(q3);if q3>4 then q3:=0;
  inc(q4);if q4>3 then q4:=0;
  if onkey(_E_) then
  begin
    textmode(co80+font8x8);halt
  end else
  if onkey(_G_) and onkey(_Q_) and pwr then
  begin
    power:=10000;pwr:=false;cllin;
  end;
  for te:=1 to 10 do
  begin
    if (a[xx[te],xy[te]].b>179) and (a[xx[te],xy[te]].b<190) then
      a[xx[te],xy[te]].c:=32+7*256;
    inc(xp[te],xq[te]);
    while xp[te]>3 do
    begin
      inc(xx[te]);dec(xp[te],4);
    end;
    if xx[te]>50 then
    begin
      xx[te]:=1;xy[te]:=random(5)+te*7-5;
      xp[te]:=0;xq[te]:=random(6)+1;xc[te]:=random(4);
    end;
    if a[xx[te],xy[te]].b=32 then
      a[xx[te],xy[te]].c:=w3[xp[te]]+wcc[xc[te]]*256
  end;
end;
Procedure xus(p,ty,d:byte);
Begin
  j:=0;
  for k:=0 to 71 do if k mod d=0 then
  if inj(j) then
  begin
    mx[j]:=tm[k] div 3;my[j]:=tn[k] div 3;x[j]:=x[i];y[j]:=y[i];
    na[j]:=ty;sp[j]:=p;cx[j]:=0;cy[j]:=0;cx1[j]:=0;cy1[j]:=0;
  end;
End;
procedure do2;
begin
  j:=0;
  for k1:=1 to 4 do
  if inj(j) then
  begin
    p[j]:=k1*2-1;x[j]:=x[i];y[j]:=y[i];
    sp[j]:=150;na[j]:=2;mx[j]:=m[p[j]]*100;my[j]:=n[p[j]]*100;
    cx[j]:=0;cy[j]:=0;
  end;
end;
procedure do1;
begin
  j:=0;
  for k1:=1 to 4 do
  if inj(j) then
  begin
    p[j]:=k1*2;x[j]:=x[i];y[j]:=y[i];
    sp[j]:=150;na[j]:=2;mx[j]:=m[p[j]]*73;my[j]:=n[p[j]]*73;
    cx[j]:=0;cy[j]:=0;
  end;
end;
Procedure do3(f:byte);
begin
  j:=0;
  if inj(j) then
  begin
    p[j]:=f;x[j]:=x[i];y[j]:=y[i];
    sp[j]:=150;na[j]:=2;mx[j]:=-tn[f*9-9] div 3;my[j]:=tm[f*9-9] div 3;
    cx[j]:=0;cy[j]:=0;
  end;
end;
procedure lwa;
Var x1,y1:integer;
begin
  case ss of
  1:k2:=gpt(x[i]-2,y[i]-3,5,7,flq);
  2:k2:=gpt(x[i]-1,y[i]-2,3,5,flr);
  3:k2:=gpt(x[i]-1,y[i]-2,4,5,fls);
  4:k2:=gpt(x[i]-1,y[i]-2,3,5,flt);
  5:k2:=gpt(x[i]-1,y[i]-3,3,7,flu);
  end;
  if k2>0 then
  begin
    tre:=tre-k2;
    while (tre<1) and (li[i]>0) do
    begin
      inc(tre,ss*5+15);a[li[i],1].c:=32+7*256;dec(li[i]);
    end;
  end;
  if li[i]<=0 then
  begin
    j:=0;
    xus(100,4,6);
    inp(200);na[i]:=7;kq:=20;
  end else
  begin
    dec(lik);
    if lik=0 then
    begin
      lik:=240;inc(ljk);
    end;
    x1:=x[i];y1:=y[i];
    case ss of
    1:
    begin
      if q1=0 then
      begin
        move0;
        if ((x[i]<3) or (x[i]>48) or (y[i]<5) or (y[i]>66)) then
        begin
          if not ind then
          begin
            x[i]:=x1;y[i]:=y1;k:=random(8);cx[i]:=0;cy[i]:=0;
            mx[i]:=tm[k*9] div 3;my[i]:=tn[k*9] div 3;
          end;
        end else ind:=false;
      end;
      show(x[i]-2,y[i]-3,5,7,flq,ee);
      if (lik mod 30<16) and odd(lik) then
      begin
        j:=0;if inj(j) then poin(80,4,j);
      end;
      if lik=20 then shan(2,120,1,2);
      if (ljk>3) and (lik=30) then shan(3,80,1,2);
    end;
    2:
    begin
      if x[i]<3 then
      begin
        inc(x[i]);show(x[i]-1,y[i]-2,3,5,flr,ee);
        if x[i]=3 then
        begin
          mx[i]:=0;cy1[i]:=20;p[i]:=-2;
        end;
      end else
      begin
        move2;
        if (y[i]<4) or (y[i]>67) then
        begin
          y[i]:=y1;cy1[i]:=-cy1[i];p[i]:=-p[i];my[i]:=-my[i];cy[i]:=0;
        end;
        show(x[i]-1,y[i]-2,3,5,flr,ee);
        if q3=0 then
        begin
          cy1[i]:=cy1[i]+p[i];if abs(cy1[i])=20 then p[i]:=-p[i];
        end;
        if lik mod 70=0 then shan1(2,120,1,4,18);
        if lik mod 70=35 then shan(2,120,1,4);
        if (lik<40) and (lik mod 4=1) then
        begin
          j:=0;
          if inj(j) then
          begin
            na[j]:=2;x[j]:=x[i];y[j]:=y[i];sp[j]:=random(10)*10+80;
            mx[j]:=100;my[j]:=random(101);dec(my[j],50);p[j]:=5;
            cx[j]:=0;cy[j]:=0;
          end;
        end;
      end;
    end;
    3:
    begin
      if q1=0 then
      begin
        move0;
        if ((x[i]<2) or (x[i]>47) or (y[i]<6) or (y[i]>65)) then
        begin
          if not ind then
          begin
            x[i]:=x1;y[i]:=y1;k:=random(72);cx[i]:=0;cy[i]:=0;
            mx[i]:=tm[k] div 3;my[i]:=tn[k] div 3;
          end;
        end else ind:=false;
      end;
      show(x[i]-1,y[i]-2,4,5,fls,ee);j:=0;
      if lik=200 then
      begin
        for k:=0 to 1 do
        if inj(j) then
        begin
          na[j]:=23;x[j]:=x[i];y[j]:=y[i];cx[j]:=0;cy[j]:=0;p[j]:=0;
          my[j]:=(k*2-1)*50;sp[j]:=100;mx[j]:=0;li[j]:=50;
        end;
      end;
      if (lik<30) and (lik mod 5=0) and inj(j) then shan(1,70,1,4);
      if lik=100 then shan(2,90,4,3);
    end;
    4:
    begin
      kq:=2;
      if (lik>80) and (lik<220) then move0;
      if ind then mx[i]:=75;
      if ((x[i]<2) or (x[i]>47) or (y[i]<6) or (y[i]>65)) then
      begin
        if not ind then
        begin
          x[i]:=x1;y[i]:=y1;k:=random(36)*2;cx[i]:=0;cy[i]:=0;
          mx[i]:=tm[k] div 4;my[i]:=tn[k] div 4;
        end;
      end else ind:=false;
      show(x[i]-1,y[i]-2,3,5,flt,ee);j:=0;
      if lik=72 then p[i]:=37;
      if lik<72 then
        if inj(j) then
          if odd(lik) then turn(71-lik,1,300) else
          begin
            if p[i]=1 then p[i]:=71 else p[i]:=p[i]-2;
            turn(p[i],1,300);
          end;
      if (lik>110) and (lik mod 30=0) and inj(j) then shan(2,70,4,3);
      if (lik>70) and (lik<110) and (lik mod 10=0) then do2;
      if (lik>70) and (lik<110) and (lik mod 10=5) then do1;
    end;
    5:
    begin
      kq:=2;move0;
      if ((x[i]<2) or (x[i]>47) or (y[i]<7) or (y[i]>64)) then
      begin
        if not ind then
        begin
          x[i]:=x1;y[i]:=y1;k:=random(36)*2;cx[i]:=0;cy[i]:=0;
          mx[i]:=tm[k] div 4;my[i]:=tn[k] div 4;sp[i]:=100;
        end;
      end else ind:=false;
      show(x[i]-1,y[i]-3,3,7,flu,ee);j:=0;
      if (lik mod 3=0) and (ljk mod 3=0) then
      begin
        do3((lik div 3) mod 8+1);
        do3(8-(lik div 3) mod 8);
      end;
      if (ljk mod 3=0) and (lik<80) then
      begin
        x1:=x[i];y1:=y[i];
        x[i]:=x1+random(3)-1;y[i]:=y1+random(7)-3;
        k:=random(72);if inj(j) then turn(k,1,300);
        x[i]:=x1;y[i]:=y1;
      end;
      if (lik mod 20=0) and (ljk mod 3=2) then
      begin
        k:=random(100)+50;
        if inj(j) then poin(k,3,j);
        p[j]:=round(sqrt(sqr(x[j]-r)+sqr(y[j]-c))*k/100);
      end;
      if ljk mod 3=1 then
      begin
        if lik mod 14=0 then do1 else
        if lik mod 14=7 then do2;
        if lik<10 then
        begin
          shoot(x[i],y[i],mx[i],my[i]);sp[i]:=30;
        end;
      end;
      if (ljk mod 3=2) and (lik<41) and (lik mod 5=1) then
        shan1(2,80,4,2,(lik div 5)*9);
    end;
    end;
  end;
end;
Function inda(f,na,c,d:integer):boolean;
Var i,j,e:byte;
Begin
  inda:=false;
  for i:=1 to c do
    for j:=1 to d do if sc[f-1+i,na-1+j] then
    begin
      e:=a[f-1+i,na-1+j].b;
      if ppq[e]>0 then
      begin
        inda:=true;exit;
      end;
    end;
End;
Procedure E_move;
Begin
  for i:=1 to 100 do
    case na[i] of
    1:
      if sc[x[i],y[i]] and (ppq[a[x[i],y[i]].b]>0) then
      na[i]:=0
      else
      begin
        if sc[x[i],y[i]] and ((a[x[i],y[i]].b=173) or (a[x[i],y[i]].b=174)) then
          a[x[i],y[i]].c:=32+7*256;
        move0;
        if not sc[x[i],y[i]] then
        na[i]:=0
        else if q1=1 then a[x[i],y[i]].c:=173+3*256
        else a[x[i],y[i]].c:=174+3*256;
      end;
    2:
    begin
      ee:=puts(x[i],y[i],p[i],' ');
      move0;if sp[i]>50 then dec(sp[i],10);
      if p[i] mod 4=1 then ee:=puts(x[i],y[i],p[i],'≥') else
      if p[i] mod 4=3 then ee:=puts(x[i],y[i],p[i],'ƒ') else
      if p[i] mod 4=2 then ee:=puts(x[i],y[i],p[i],'/') else
      ee:=puts(x[i],y[i],p[i],'\');
      if not ee then na[i]:=0;
    end;
    3:
    begin
      sclr(x[i],y[i],2,2,www);
      move0;dec(p[i]);
      if p[i]=0 then
      begin
        na[i]:=0;j:=0;
        for k:=1 to 8 do
          if inj(j) then turn(k*9,1,300);
      end else
      show(x[i],y[i],2,2,www,ee);
    end;
    4:
    begin
      ee:=inda(x[i],y[i],2,2);
      for j:=0 to 1 do
      begin
        if sc[x[i]+j,y[i]] then a[x[i]+j,y[i]].c:=32+7*256;
        if sc[x[i]+j,y[i]+1] then a[x[i]+j,y[i]+1].c:=32+7*256;
      end;
      if ee then na[i]:=0 else
      begin
        move0;show(x[i],y[i],2,2,ppp,ee);
        if not ee then na[i]:=0;
      end;
    end;
  end;
  for i:=1 to 101 do
    case na[i] of
    9:
    begin
      k:=gpt(x[i]-1,y[i]-1,3,3,fy1);
      if k>li[i] then inp(1) else
      begin
        dec(li[i],k);move0;
        show(x[i]-1,y[i]-1,3,3,fy1,ee);
        if not ee then na[i]:=0 else
        begin
          if q[i]>0 then dec(q[i]);
          if q[i]=1 then
          begin
            j:=0;
            if inj(j) then poin(120,1,j);
            q[i]:=50;
          end;
        end;
      end;
    end;
    15:
    begin
      k:=gpt(x[i]-1,y[i]-1,3,3,fy5);
      if k>li[i] then inp(2) else
      begin
        dec(li[i],k);move2;
        show(x[i]-1,y[i]-1,3,3,fy5,ee);
        if not ee then na[i]:=0 else
        begin
          if q[i]>0 then dec(q[i]);
          if q[i]=1 then
          begin
            j:=0;
            if inj(j) then poin(150,1,j);
            q[i]:=70;
          end;
        end;
      end;
    end;
    8:
    begin
      k:=gpt(x[i]-1,y[i]-1,3,3,fy8);
      if k>0 then
      begin
        dec(li[i],k);
        if random(2)=0 then do1 else do2;inp(5);
      end else
      begin
        move2;
        show(x[i]-1,y[i]-1,3,3,fy8,ee);
        if not ee then na[i]:=0 else
        begin
          inc(cy1[i],p[i]);
          if abs(cy1[i])=13 then
          begin
            p[i]:=-p[i];inc(cy1[i],p[i]);
          end;
        end;
      end;
    end;
    7:
    begin
      if y[i]>67 then y[i]:=67;
      if y[i]<4 then y[i]:=4;
      case sp[i] of
      0,1:
        begin
          show(x[i]-1,y[i]-1,3,3,#1#2#3#4#5#6#7#8#9,ee);
          inc(sp[i]);
        end;
      2:
        begin                      
          show(x[i]-1,y[i]-2,3,5,bz2,ee);
          inc(sp[i]);
        end;
      else begin
          clr(x[i]-1,y[i]-2,3,5);
          na[i]:=0;
        end;
      end;
    end;
    10:
    begin
      k:=gpt(x[i]-1,y[i]-1,3,3,fy3);
      if k>li[i] then inp(10) else
      begin
        dec(li[i],k);move2;show(x[i]-1,y[i]-1,3,3,fy3,ee);
        if not ee then na[i]:=0 else
        begin
          if q[i]>0 then dec(q[i]);
          if q[i]=1 then shan(1,150,1,4);
        end;
      end;
    end;
    11:
    begin
      k:=gpt(x[i]-1,y[i]-2,3,5,fy0);
      if k>li[i] then inp(50) else
      begin
        dec(li[i],k);move0;
        if cx1[i]>0 then
        begin
          dec(cx1[i]);
          if cx1[i]=0 then
          begin
            p[i]:=300;mx[i]:=0;my[i]:=random(2)*200;dec(my[i],100);
          end;
        end else
        begin
          dec(p[i]);if p[i]=0 then
          begin
            cx1[i]:=600;mx[i]:=100*m[cy1[i]];my[i]:=100*n[cy1[i]];
          end else
          begin
            if y[i]<=3 then my[i]:=100;
            if y[i]>=68 then my[i]:=-100;
          end;
        end;
        if q[i]>0 then dec(q[i]) else q[i]:=40;
        if q[i]=30 then shan(2,100,1,3) else
        if q[i]=15 then
        begin
          do3(5);do3(6);do3(4);
        end;
        show(x[i]-1,y[i]-2,3,5,fy0,ee);
        if not ee then na[i]:=0;
      end;
    end;
    12:
    begin
      k:=gpt(x[i]-1,y[i]-2,3,5,fyc);
      if k>li[i] then inp(15) else
      begin
        dec(li[i],k);
        if p[i]>0 then dec(p[i]);
        if p[i]=1 then
        begin
          mx[i]:=61*random(2);my[i]:=0;dec(mx[i],30);
        end;
        dec(q[i]);if q[i]=0 then
        begin
          q[i]:=cx1[i];cy1[i]:=1-cy1[i];
          if cy1[i]=0 then do2 else do1;
        end;
        move0;
        show(x[i]-1,y[i]-2,3,5,fyc,ee);
        if not ee then na[i]:=0;
      end;
    end;
    13:
    begin
      k:=gpt(x[i]-1,y[i]-2,2,5,fy6);
      if k>li[i] then inp(16) else
      begin
        dec(li[i],k);move0;
        show(x[i]-1,y[i]-2,2,5,fy6,ee);
        if not ee then na[i]:=0 else
        begin
          if q[i]>0 then dec(q[i]) else q[i]:=p[i];
          if (q[i]<15) and (q[i] mod 4=0) then
          begin
            inc(y[i],2);j:=0;
            if inj(j) then poin(100,1,j);
            dec(y[i],4);if inj(j) then poin(100,1,j);
            inc(y[i],2);
          end;
        end;
      end;
    end;
    14:
    begin
      k:=gpt(x[i],y[i]-1,2,3,fy7);
      if k>li[i] then inp(1) else
      begin
        dec(li[i],k);
        move2;show(x[i],y[i]-1,2,3,fy7,ee);
        if not ee then na[i]:=0;
      end;
    end;
    16:
    begin
      k:=gpt(x[i]-1,y[i]-1,3,3,fy2);
      if k>li[i] then inp(8) else
      begin
        dec(li[i],k);move0;
        if q[i]>0 then dec(q[i]);
        if q[i]=1 then shan(3,100,1,4);
        show(x[i]-1,y[i]-1,3,3,fy2,ee);
        if not ee then na[i]:=0;
      end;
    end;
    17:
    begin
      k:=gpt(x[i]-1,y[i]-1,3,3,fy9);
      if k>li[i] then inp(10) else
      begin
        dec(li[i],k);move0;dec(q[i]);
        if q[i]=0 then q[i]:=60;
        if (q[i] mod 4=1) and (q[i]<30) then
        begin
          j:=0;
          if inj(j) then poin(100,1,j);
        end;
        show(x[i]-1,y[i]-1,3,3,fy9,ee);
        if not ee then na[i]:=0;
      end;
    end;
    19:
    begin
      k:=gpt(x[i]-1,y[i]-1,3,3,fy2);
      if k>li[i] then inp(16) else
      begin
        dec(li[i],k);
        move0;
        show(x[i]-1,y[i]-1,3,3,fy2,ee);
        if ee then
        begin
          if (q[i]>0) and (q2=0) then dec(q[i]);
          j:=0;
          if q2=0 then
          case q[i] of
          0:begin
              if inj(j) then turn(0,1,400);
              if inj(j) then turn(36,1,400);
              q[i]:=16;do3(5);
            end;
          1:begin
              if inj(j) then turn(4,1,400);
              if inj(j) then turn(32,1,400);
            end;
          2:begin
              if inj(j) then turn(10,1,400);
              if inj(j) then turn(26,1,400);
            end;
          3:begin
              if inj(j) then turn(22,1,400);
              if inj(j) then turn(14,1,400);
            end;
          4:begin
              if inj(j) then turn(20,1,400);
              if inj(j) then turn(16,1,400);
            end;
          end;
        end else na[i]:=0;
      end;
    end;
    20:lwa;
    21:
    begin
      k:=gpt(x[i]-1,y[i]-1,3,3,fy2);
      if k>li[i] then inp(8) else
      begin
        dec(li[i],k);inc(x[i]);
        if x[i]>50 then na[i]:=0 else
        begin
          show(x[i]-1,y[i]-1,3,3,fy2,ee);
          if (q[i]>0) and (x[i]>=r) then
          begin
            j:=0;q[i]:=0;
            for k:=1 to 3 do
            if inj(j) then
            begin
              na[j]:=2;x[j]:=x[i];y[j]:=y[i];p[j]:=k*2+1;
              mx[j]:=100*m[p[j]];my[j]:=100*n[p[j]];sp[j]:=100;
              cx[j]:=0;cy[j]:=0;
            end;
          end;
        end;
      end;
    end;
    22:
    begin
      k:=gpt(x[i]-1,y[i]-1,3,3,fy1);
      if k>li[i] then inp(5) else
      begin
        inc(x[i]);dec(li[i],k);
        if x[i]>50 then na[i]:=0 else
        begin
          show(x[i]-1,y[i]-1,3,3,fy1,ee);
          if (x[i]=5) or (x[i]=45) then
          begin
            j:=0;
            if inj(j) then poin(150,3,j);
            p[j]:=round(sqrt(sqr(x[j]-r)+sqr(y[j]-c))*3/2);
          end;
        end;
      end;
    end;
    23:
    begin
      k:=gpt(x[i]-1,y[i]-1,3,3,fy4);
      if k>li[i] then inp(8) else
      begin
        move0;dec(li[i],k);
        show(x[i]-1,y[i]-1,3,3,fy4,ee);
        if ((y[i]=3) or (y[i]=68)) and (my[i]<>0) then
        begin
          q[i]:=0;my[i]:=0;p[i]:=0;
        end;
        if (q[i]<100) and (my[i]=0) then
        begin
          inc(p[i]);
          if p[i]=30 then
          begin
            p[i]:=0;shan(2,100,1,2);
          end;
          inc(q[i]);
          if q[i]=100 then mx[i]:=100;
        end;
        if not ee then na[i]:=0;
      end;
    end;
    24:
    begin
      if y[i]<40 then k:=gpt(x[i]-1,y[i]-1,3,3,fya) else
      k:=gpt(x[i]-1,y[i]-1,3,3,fyb);
      if k>li[i] then inp(20) else
      begin
        move2;dec(li[i],k);
        if y[i]<40 then show(x[i]-1,y[i]-1,3,3,fya,ee) else
        show(x[i]-1,y[i]-1,3,3,fyb,ee);
        if p[i]=0 then
        begin
          inc(q[i]);if q[i]=5 then
          begin
            if y[i]<40 then
              if cx1[i]=-2 then do3(4) else do3(2)
            else
              if cx1[i]=-2 then do3(6) else do3(8);
            q[i]:=0;
          end;
        end else dec(p[i]);
        if not ee then na[i]:=0;
      end;
    end;
    else if na[i]>7 then na[i]:=0;
  end;
  for i:=1 to 101 do if na[i]>0 then guo:=false;
End;
Procedure Enemy;
Begin
  guo:=true;e_move;
  for i:=1 to 40 do if pa[i]>0 then guo:=false;
  for i:=1 to 40 do
    case pa[i] of
    1:
      begin
        inc(pc[i]);
        if pc[i]=20 then
        begin
          inc(pb[i]);pc[i]:=0;
          if pb[i]=5 then pa[i]:=0 else
          begin
            j:=0;
            if inj(j) then
            begin
              if pd[i]=0 then k:=random(8)+1 else k:=pd[i];
              indark(9,k,j,200-pe[i]);
              q[j]:=pf[i];cx1[j]:=0;cy1[j]:=0;li[j]:=1;
            end;
          end;
        end;
      end;
    2:begin
        inc(pc[i]);
        if pc[i]=10 then
        begin
          inc(pb[i]);pc[i]:=0;
          if pb[i]=8 then pa[i]:=0 else
          begin
            j:=0;
            if inj(j) then
            begin
              indark(15,pf[i],j,100);
              q[j]:=30;cx1[j]:=pd[i];cy1[j]:=pe[i];li[j]:=1;
            end;
          end;
        end;
      end;
    3:begin
        inc(pc[i]);
        if pc[i]=pd[i] then
        begin
          inc(pb[i]);pc[i]:=0;
          if pb[i]=pe[i] then pa[i]:=0 else
          begin
            j:=0;
            if inj(j) then
            begin
              k:=random(2);
              x[j]:=random(20)+2;y[j]:=1+k*69;sp[j]:=120;
              na[j]:=15;mx[j]:=random(30)+10;my[j]:=60+random(40);
              if k=1 then my[j]:=-my[j];
              cx[j]:=0;cy[j]:=0;q[j]:=pf[i];
              cx1[j]:=random(3)+1;cy1[j]:=random(7);dec(cy1[j],4);
              li[j]:=1;
            end;
          end;
        end;
      end;
    4:
      begin
        inc(pc[i]);
        if pc[i]=80 then
        begin
          inc(pb[i]);pc[i]:=0;
          if pb[i]=pd[i] then pa[i]:=0 else
          begin
            j:=0;
            for k:=0 to 1 do
            if inj(j) then
            begin
              indark(12,3+k*4,j,100);
              my[j]:=sgn(my[j])*30;sp[j]:=100;q[j]:=20;
              cx1[j]:=pe[i];cy1[j]:=0;p[j]:=pf[i];li[j]:=30;
            end;
          end;
        end;
      end;
    5:
      begin
        inc(pc[i]);
        if pc[i]=10 then
        begin
          pc[i]:=0;
          inc(pb[i]);
          if pb[i]=20 then pa[i]:=0 else
          begin
            j:=0;
            if inj(j) then
            begin
              indark(14,5,j,100);
              cx1[j]:=0;cy1[j]:=random(11);li[j]:=1;
              dec(cy1[j],5);mx[j]:=random(100)+100;my[j]:=random(101);
              dec(my[j],50);
            end;
          end;
        end;
      end;
    6:begin
        inc(pc[i]);
        if pc[i]=pd[i] then
        begin
          inc(pb[i]);pc[i]:=0;
          if pb[i]=pf[i] then pa[i]:=0 else
          begin
            j:=0;
            if inj(j) then
            begin
              indark(8,5,j,100);
              cx1[j]:=0;p[j]:=random(2)*2;
              dec(p[j]);cy1[j]:=-12*p[j];li[j]:=20;
              mx[j]:=pe[i];
            end;
          end;
        end;
      end;
    7:begin
        inc(pc[i]);
        if pc[i]=40 then
        begin
          pc[i]:=0;inc(pb[i]);
          if pb[i]=5 then pa[i]:=0 else
          begin
            j:=0;
            if inj(j) then
            begin
              indark(10,random(8)+1,j,pf[i]);
              cx1[j]:=-sgn(mx[j])*pd[i];cy1[j]:=-sgn(my[j])*pe[i];
              cx[j]:=0;cy[j]:=0;
              q[j]:=20;li[j]:=1;
            end;
          end;
        end;
      end;
    8:begin
        inc(pc[i]);
        if pc[i]=30 then
        begin
          pc[i]:=0;inc(pb[i]);
          if pb[i]=pf[i] then pa[i]:=0 else
          begin
            j:=0;
            if inj(j) then
            begin
              indark(21,5,j,100);q[j]:=1;li[j]:=1;
            end;
          end;
        end;
      end;
    10:begin
        inc(pc[i]);
        if pc[i]=30 then
        begin
          pc[i]:=0;inc(pb[i]);
          if pb[i]=pf[i] then pa[i]:=0 else
          begin
            j:=0;if inj(j) then
            begin
              indark(22,5,j,100);li[j]:=1;
            end;
          end;
        end;
      end;
    11:begin
        inc(pc[i]);
        if pc[i]=60 then
        begin
          pc[i]:=0;inc(pb[i]);
          if pb[i]=pf[i] then pa[i]:=0 else
          begin
            j:=0;if inj(j) then
            begin
              li[j]:=100;k:=random(2);
              if k=0 then
              begin
                my[j]:=50;y[j]:=0;
              end else
              begin
                my[j]:=-50;y[j]:=71;
              end;
              sp[j]:=200;p[j]:=pd[i];cx1[j]:=0;cy1[j]:=0;cx[j]:=0;cy[j]:=0;
              na[j]:=13;q[j]:=p[j];mx[j]:=0;x[j]:=random(40)+5;
            end;
          end;
        end;
       end;
    14:begin
        inc(pc[i]);
        if pc[i]=30 then
        begin
          pc[i]:=0;inc(pb[i]);
          if pb[i]=pf[i] then pa[i]:=0 else
          begin
            j:=0;
            if inj(j) then
            begin
              indark(16,5,j,150);
              q[j]:=15;li[j]:=20;
            end;
          end;
        end;
      end;
    15:
      begin
        inc(pc[i]);
        if pc[i]=40 then
        begin
          pc[i]:=0;inc(pb[i]);
          if pb[i]=pf[i] then pa[i]:=0 else
          begin
            j:=0;
            if inj(j) then 
            begin
              indark(17,5,j,400);
              cx1[j]:=0;cy1[j]:=0;
              q[j]:=60;li[j]:=30;
            end;
          end;
        end;
      end;
    16:
      begin
        j:=0;if inj(j) then
        begin
          indark(11,pf[i],j,300);cx1[j]:=80;cy1[j]:=pf[i];
          q[j]:=20;li[j]:=300;pa[i]:=0;
        end;
      end;
    18:
      begin
        inc(pc[i]);
        if pc[i]=80 then
        begin
          pc[i]:=0;inc(pb[i]);
          if pb[i]=5 then pa[i]:=0 else
          begin
            j:=0;
            if inj(j) then
            begin
              indark(19,5,j,300);li[j]:=60;q[j]:=5;
            end;
          end;
        end;
      end;
    19:
      begin
        inc(pc[i]);
        if pc[i]=50 then
        begin
          pc[i]:=0;inc(pb[i]);
          if pb[i]=pf[i] then pa[i]:=0 else
          begin
            j:=0;
            if inj(j) then
            begin
              indark(24,pd[i],j,50);li[j]:=20;q[j]:=0;p[j]:=30;
              y[j]:=pe[i];if pd[i]=5 then cx1[j]:=-2 else cx1[j]:=2;
              cy1[j]:=0;
            end;
          end;
        end;
      end
    else pa[i]:=0;
  end;
  if ma<40 then
  begin
    guo:=false;
    if q3=0 then dec(kq);
    if kq=0 then
    begin
      inc(ma);
      i:=0;repeat inc(i) until pa[i]=0;
      pa[i]:=h[ma];kq:=h1[ma]*5 div 2;
      pb[i]:=0;pc[i]:=0;pd[i]:=h2[ma];pe[i]:=h3[ma];pf[i]:=h4[ma];
      if pa[i]=0 then newz;
    end;
  end;
End;
Procedure shop;
Var e:boolean;k:byte;j:word;
Begin
  textcolor(12);textbackground(7);
  i:=32;k:=1;fillchar(iniy,sizeof(iniy),0);
  r:=40;c:=35;j:=0;b:=0;z:=0;z1:=0;lif:=20;
  gotoxy(linx+9,35);write('0');
  gotoxy(linx+9,40);write('0');
  gotoxy(linx+8,30);write('20');
  gotoxy(linx+8,45);write('0');
  gotoxy(linx+3,25);write('Exit');
  gotoxy(linx+1,30);write('*');
  gotoxy(linx+1,20);write('Cost:');e:=false;
  gotoxy(linx+3,21);write(0);
  repeat
    cllin;gotoxy(32,25);
    textcolor(15);textbackground(0);
    if q4>1 then write('S H O P') else write('       ');
    textcolor(12);textbackground(7);
    dozd;zd;star;show(r-1,c-2,3,5,grt,ee);wait(0);
    dozd;zd;star;show(r-1,c-2,3,5,grt,ee);wait(0);
    i:=lastkey;
    if i=_up_ then
    begin
      a[25+k*5,linx+1].c:=254+15*256;
      if k=0 then k:=5;dec(k);
      a[25+k*5,linx+1].c:=42+15*256;
    end else
    if i=_down_ then
    begin
      a[25+k*5,linx+1].c:=254+15*256;
      if k=4 then k:=0 else inc(k);
      a[25+k*5,linx+1].c:=42+15*256;
    end else
    if ((i=_left_) or (i=_right_)) and (k>0) then
    begin
      k1:=iniy[k];
      if i=_left_ then
        if k1=0 then iniy[k]:=conm[k] else dec(iniy[k]);
      if i=_right_ then
        if k1=conm[k] then iniy[k]:=0 else inc(iniy[k]);
      j:=j+use[k,iniy[k]]-use[k,k1];gotoxy(linx+3,21);write(j);
      textcolor(15);textbackground(0);write('˛˛');
      textcolor(12);textbackground(7);
      case k of
      3:begin
          z:=iniy[k];gotoxy(linx+9,40);write(z);
          if k1=4 then
          begin
            clr(r-4,c-3,3,3);clr(r-4,c+1,3,3);
          end;
          if z=4 then
          begin
            show(r-4,c-3,3,3,hel,ee);show(r-4,c+1,3,3,hel,ee);
          end;
        end;
      4:begin
          b:=iniy[k]*2;gotoxy(linx+8,45);write(b);
        end;
      1:begin
          lif:=20+iniy[k]*5;gotoxy(linx+8,30);write(lif);
        end;
      2:begin
          z1:=iniy[k];gotoxy(linx+9,35);write(z1);
        end;
      end;
    end else
    if (i=_space_) and (k=0) and (power>=j) then
    begin
      dec(power,j);e:=true;textcolor(15);textbackground(0);
      gotoxy(32,25);write('       ');
      gotoxy(linx+1,25);write('˛˛˛˛˛˛');
      gotoxy(linx+1,20);write('˛˛˛˛˛');
      gotoxy(linx+3,21);write('˛˛˛˛');
      textcolor(12);textbackground(7);
    end;
  until e;
End;
Procedure readfile;
Var f:file of shortint;
Begin
  assign(f,'stage.'+char(48+s));
  reset(f);
  for i:=1 to 40 do read(f,h[i]);
  for i:=1 to 40 do read(f,h1[i]);
  for i:=1 to 40 do read(f,h2[i]);
  for i:=1 to 40 do read(f,h3[i]);
  for i:=1 to 40 do read(f,h4[i]);
  close(f);
End;
begin
  ki:=0;ma:=0;q0:=0;q1:=0;q2:=0;q3:=0;q4:=0;kq:=10;power:=800;
  fillchar(ppq,sizeof(ppq),0);
  fillchar(stas,sizeof(stas),0);
  fillchar(wlo,sizeof(wlo),0);
  for i:=0 to 14 do wlo[tr[i]]:=wli[i];
  for i:=1 to 9 do ppq[tr[i]]:=1;ppq[15]:=1;
  for i:=0 to 72 do
  begin
    tm[i]:=round(sin(1.57*i/18)*300);
    tn[i]:=round(cos(1.57*i/18)*300);
  end;
  clrscr;cursor(32,32);
  breaktype:=1;k7:=1;k8:=0;
  fillchar(dg,sizeof(dg),0);
  textmode(co80+font8x8);randomize;link;
  usestexts(0,'p');
  for i:=1 to 50 do for j:=1 to 80 do a[i,j].a:=7;
  fillchar(wii,sizeof(wii),0);
  for i:=1 to 9 do wii[byte(grt[i])]:=1;
  for i:=2 to 50 do a[i,linx].c:=246+256*15;
  for j:=linx+1 to 80 do a[1,j].c:=248+256*15;
  a[1,linx].c:=250+15*256;
  for i:=2 to 50 do
  for j:=linx+1 to 80 do
   a[i,j].c:=254+256*15;
  textcolor(12);textbackground(7);
  gotoxy(linx+2,10);write('Power:');
  gotoxy(linx+2,35);write('Fire a:0');
  gotoxy(linx+2,40);write('Fire b:0');
  gotoxy(linx+2,30);write('Life :20');
  gotoxy(linx+2,45);write('Bomb :0');
  gotoxy(linx+2,5);write('Stage:');
  for i:=1 to 10 do
  begin
    xx[i]:=random(48)+1;xy[i]:=i*7-3;
    xp[i]:=1;xq[i]:=random(6)+1;xc[i]:=random(4);
    stas[xx[i],xy[i]]:=xp[i];
  end;
  fillchar(na,sizeof(na),0);
  d:=0;sou:=false;s:=1;ss:=0;                                                 If ParamCount>0 then Val(ParamStr(1),s,ss);
  cursor(32,32);                                                   If Paramcount>1 then Val(Paramstr(2),k,i) else k:=3;
  faster(45000-k*1000);
  fillchar(pa,sizeof(pa),0);
  setwin(1,2,50,69);
  repeat
    readfile;
    shop;show(r-1,c-2,3,5,grt,ee);
    repeat
      for i:=2 to 50 do a[i,linx].c:=246+256*15;
      j:=1;enemy;
      zd;dozd;pla;
      star;
      cllin;
      wait(0);
    until guo or (lif=0);
    if guo then
    begin
      ki:=0;
      repeat
        zd;star;pla;
        wait(0);
        inc(ki);
      until (ki>=80);
      ki:=1;ma:=0;if z=4 then
      begin
        clr(r-4,c-3,3,3);clr(r-4,c+1,3,3);
      end;
      repeat
        clr(r-1,c-2,3,5);dec(r);
        show(r-1,c-2,3,5,grt,ee);
        zd;star;
        wait(0);
      until (r=-3);
      for i:=1 to 50 do
        for j:=2 to 69 do
          a[i,j].c:=256*7+32;
      textcolor(15);textbackground(0);
      gotoxy(20,23);writeln('Life Power: ',lif,' x 10=',lif*10);
      power:=power+lif*10;wait(10);
      gotoxy(20,28);writeln('Bomb Power: ',b,  '  x 40=',b*40);
      power:=power+b*30;wait(10);
      repeat until onkey(_space_) or onkey(_x_);
      i:=byte(32);clean(i);
      inc(s);
    end;
  until (s=9) or (lif=0);
  faster(0);
  textmode(co80);
  gotoxy(35,13);writeln('GAME  OVER');
  If s=9 then
   Begin
    Writeln;
    Writeln('Congratulations!');Readln;
   End;
end.