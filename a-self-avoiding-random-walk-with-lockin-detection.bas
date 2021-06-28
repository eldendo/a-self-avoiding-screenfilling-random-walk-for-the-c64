10 rem a self avoiding random walk with lockin detection
20 r=rnd(-ti)
25 print chr$(147)
30 x=0:y=0:poke 1024,81 
40 a=1024+y*40+x:goto 500
50 on 4*rnd(1) goto 100,200,300
60 if x>=38 or peek(a+2)<>32 then 50
70 poke a+1,67:poke a+2,81:x=x+2
80 goto 40
100 if x<=0 or peek(a-2)<>32 then 50
110 poke a-1,67:poke a-2,81:x=x-2
120 goto 40
200 if y>=24 or peek(a+80)<>32 then 50
210 poke a+40,66:poke a+80,81:y=y+2
220 goto 40
300 if y<=0 or peek(a-80)<>32 then 50
310 poke a-40,66:poke a-80,81:y=y-2
320 goto 40
499 rem lockin detection 
500 if x<38 and peek(a+2)=32 then 50
510 if x>0 and peek(a-2)=32 then 50
520 if y<24 and peek(a+80)=32 then 50
530 if y>0 and peek(a-80)=32 then 50
540 for t=0 to 1000:next 
550 goto 25 
