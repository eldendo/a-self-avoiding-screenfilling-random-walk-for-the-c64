10 rem a better self avoiding random walk with backtracking with range
12 rx=2:ry=2
15 gosub 1000
17 dim s((rx+1)*(ry+1)*3):sp=0:rem stack
20 r=rnd(-ti)
25 print chr$(147)
30 a=1024:poke a,81:d=0 
40 if d=15 then 600
50 on 4*rnd(1) goto 100,200,300
60 dd=d:d=d or 1: if(dd and 1)=1 or mod(a-1024)>=2*rx or peek(a+2)<>32 then 40
70 poke a+1,67:poke a+2,81
75 s(sp)=d:s(sp+1)=a:s(sp+2)=a+1:sp=sp+3:d=0:a=a+2
80 goto 40
100 dd=d:d=d or 4:if (dd and 4)=4 or mod(a-1024)<=0 or peek(a-2)<>32 then 40
110 poke a-1,67:poke a-2,81
115 s(sp)=d:s(sp+1)=a:s(sp+2)=a-1:sp=sp+3:d=0:a=a-2
120 goto 40
200 dd=d:d=d or 2:if (dd and 2)=2 or a>=1024+ry*80 or peek(a+80)<>32 then 40
210 poke a+40,66:poke a+80,81
215 s(sp)=d:s(sp+1)=a:s(sp+2)=a+40:sp=sp+3:d=0:a=a+80
220 goto 40
300 dd=d:d=d or 8:if (dd and 8)=8 or a<=1104 or peek(a-80)<>32 then 40
310 poke a-40,66:poke a-80,81
315 s(sp)=d:s(sp+1)=a:s(sp+2)=a-40:sp=sp+3:d=0:a=a-80
320 goto 40

599 rem backtracking
600 if sp>=((rx+1)*(ry+1)*3-5) then print "solution found":end
603 poke a,32
605 poke s(sp-1),32
610 a=s(sp-2)
625 d=s(sp-3)
630 sp=sp-3
640 goto 40

999 fast modulo calculation
1000 dim mod(999)
1010 for i = 0 to 999
1020 mod(i)=i-int(i/40)*40
1030 next
1040 return
