include(/usr/local/lib/m4/circuit_macros/mpost.m4)
include(/usr/local/lib/m4/circuit_macros/libcct.m4)
define(`dimen_', (dimen_*.8))
define(`elen_', (elen_*1.25))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 1
% 电路如图所示，求电压源和电流源的功率(P27,1-14b)
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, i); b_current(\unit{2}{\ampere},,O,E)
    resistor(right_ elen*.8, E); rlabel(,\unit{5}{\ohm},)
    llabel(+,u_1,-); dot
    {
        source(down_ elen*.8, v); llabel(-,\unit{3}{\volt},+); dot
    }
    resistor(right_ elen*.8, E); llabel(,\unit{20}{\ohm},)
    consource(down_ elen*.8, i); b_current(0.05u_1,,O,E)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 2
% 按元件的VAR直接填写图旁的未知量。
% 当u=12V时，则i=_________，
% 当u=4sin2tV时，则i=_________，
.PS
    cct_init
    elen = elen_
    Origin: Here
    "$+$" below
    reversed(`arrowline', right_ elen*.6); llabel(,i,); dot
    {
        resistor(down_ elen*.6, E); rlabel(,\unit{2}{\siemens},); dot
    }
    line right_ elen/2
    capacitor(down_ elen*.6); llabel(,\unit{2}{\farad},)
    line left_ elen*1.1; "$-$" above
    gap(to Origin, 1); clabel(,u,)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 84
% 电路如图所示，求电流i1和电压us(P27,1-14a)
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, v); llabel(-,u_\mathrm{S},+)
    resistor(right_ elen*.8, E); llabel(,\unit{6}{\ohm},)
    b_current(i_1); dot
    {
        resistor(down_ elen*.8, E); llabel(,\unit{4}{\ohm},); dot
    }
    resistor(right_ elen*.8, E); rlabel(,\unit{5}{\ohm},)
    llabel(+,\unit{10}{\volt},-)
    consource(down_ elen*.8, i); b_current(i)
    b_current(0.9i_1,,O,E)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 12
% 已知题图所示电路中的网络N是由线性电阻组成。当is=1 A，us=2 V时，i=5 A；
% 当is = ?2 A，us = 4 V时，u = 24 V。试求当is = 2 A，us = 6 V时的电压u。
.PS
    cct_init
    elen = elen_
    Origin: Here
    N1: nport(wid .8 ht .8 "N",1,1,1,0,5,dimen_/2,N)
    source(from N1.W1b up_ to N1.W1a, i); llabel(,i_\mathrm{S},)
    b_current(,,O,E)
    source(from N1.N1a right_ to N1.N1b, v); llabel(+,u_\mathrm{S},-)
    resistor(from N1.E1a down_ to N1.E1b, E); llabel(,\unit{3}{\ohm},)
    rlabel(+,u,-); b_current(i)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 77
% 用回路电流方程和结点电压方程求图示电路中的受控源两端的电压U 。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, i); b_current(\unit{3}{\ampere},,O,E)
    line right_ elen*.4; dot; "\ding{172}" above
    {
        resistor(down_ elen*.8, E); llabel(,\unit{2}{\siemens},)
        b_current(I,below_); dot
    }
    line right_ elen*.2; dot
    {
        line down_ elen*.3
        resistor(right_ elen*1.1, E); llabel(,\unit{3}{\siemens})
        line up_ elen*.3; dot; "\ding{173}" ljust above
    }
    line up_ elen*.3
    consource(right_ elen*1.1, i); llabel(-,U,+)
    b_current(10I,below_,O)
    line down_ elen*.3 then right_ elen*.2
    source(down_ elen*.8, v); llabel(+,\unit{5}{\volt},-)
    line to Origin
    move right_ elen*.4; "\ding{174}" below
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 29
% 图示电路中开关S打开前已处于稳态。t=0开关打开，求t>0时的ic(t)。（6-17）
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen,v); llabel(-,\unit{12}{\volt},+)
    resistor(right_ elen*.8, E); llabel(,\unit{1}{\kilo\ohm},); dot
    {
        resistor(down_ elen*.4, E); llabel(,\unit{1}{\kilo\ohm},)
        arrowline(down_ elen*.2); llabel(,i_C,)
        capacitor(down_ elen*.4); rlabel(\unit{20}{\micro\farad},); dot
    }
    line right_ elen*.8
    switch(down_ elen*.5,,O); llabel(,S,)
    resistor(down_ elen*.5, E); llabel(,\unit{1}{\kilo\ohm})
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 70
% 如图所示电路，已知A，为使负载ZL获得最大功率，求负载阻抗ZL和吸收的功率PLmax.
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, i); b_current(i_\mathrm{S},,O,E)
    line right_ elen*.3; dot
    {
        capacitor(down_ elen*.8); llabel(,-\unit{j5}{\ohm},); dot
    }
    resistor(right_ elen*.8, E); llabel(,\unit{15}{\ohm},); dot
    {
        inductor(down_ elen*.8); llabel(,\unit{j10}{\ohm},); dot
    }
    line right_ elen*.8
    resistor(down_ elen*.8, E); llabel(,Z_\mathrm{L},)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 93
% 图中，R1=6Ω，L=0.3H，R2=6.25Ω，C=0.012F,u(t)=,求稳态电流、和，并画出电
% 路的相量图。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, v); rlabel(-,u,+)
    resistor(right_ elen*.4, E); llabel(,R_1,)
    arrowline(right_ elen*.2); llabel(,i_1,)
    inductor(right_ elen*.4); llabel(,L,); dot
    {
        resistor(down_ elen*.8, E); rlabel(,R_2,)
        b_current(i_2,); dot
    }
    line right_ elen*.6
    capacitor(down_ elen*.8); rlabel(,C,); llabel(+,u_2,-)
    b_current(i_3,below_)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ 1.5*elen,v); rlabel(-,\unit{10}{\ampere},+)
    resistor(right_ .75*elen,E); llabel(,\unit{1}{\ohm},)
    switch(right_ .75*elen,,O); llabel(S_1,,); dot
    {
        inductor(down_ 1.5*elen); b_current(i_L,below_,); llabel(+,u_L,-);
        rlabel(,\unit{0.2}{\henry},); dot
    }
    line right_ .75*elen; dot
    {
        resistor(down_ 1.5*elen,E); llabel(\unit{6}{\ohm},,); dot
    }
    switch(right_ .75*elen,,C); rlabel(,S_2,); dot
    {
        resistor(down_ 1.5*elen, E); llabel(,,\unit{3}{\ohm}); dot
    }
    line right_ .75*elen; source(down_ 1.5*elen,i)
    b_current(\unit{3}{\ampere},,O)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
.PS
    cct_init
    elen = elen_
    Origin: Here
    line right_ .3*elen; dot
    {
        line up_ elen*.3
        inductor(right_ elen*1.4); llabel(,\mathrm{j}\omega L,)
        line down_ elen*.3; dot
    }
    resistor(right_ elen*.5, E); rlabel(,R_0,); dot
    {
        capacitor(down_ elen*.9); llabel(,\frac{1}{\mathrm{j}\omega C},)
        dot
    }
    resistor(right_ elen*.9, E); rlabel(,Z,)
    b_current(\mathdot{I}_0,,O,E)
    line right_ elen*.3
    resistor(down_ elen*.9, E); llabel(,R_0,)
    line to (Origin.x, Here.y); "$-$" above
    gap(up_ elen*.9, 1); clabel(,\mathdot{U},); "$+$" below
.PE
