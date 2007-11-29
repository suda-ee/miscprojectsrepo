include(/usr/local/lib/m4/circuit_macros/mpost.m4)
include(/usr/local/lib/m4/circuit_macros/libcct.m4)
define(`dimen_', (dimen_*.8))
define(`elen_', (elen_*1.25))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 01
% 电路如下图所示，试求其中受控源的功率。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen, v); rlabel(-,U,+); b_current(\unit{0.5}{\ampere},,O,E)
    resistor(right_ elen*1.2, E); rlabel(,\unit{2}{\ohm},)
    consource(down_ elen, v); llabel(+,2U,-)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 02
% 求下图所示电路的电流~$I$。($10'$)
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.7, v); llabel(-,\unit{10}{\volt},+);
    resistor(up_ elen*.7, E); llabel(,\unit{4}{\ohm},)
    line right_ elen*.9; dot
    {
        resistor(down_ elen*.7, E); rlabel(,\unit{4}{\ohm},)
        source(down_ elen*.7, v); rlabel(+,\unit{4}{\volt},-);
        dot
    }
    line right_ elen*.9; dot
    {
        resistor(down_ elen*.7, E); rlabel(,\unit{2}{\ohm},)
        source(down_ elen*.7, v); rlabel(+,\unit{6}{\volt},-);
        dot
    }
    {resistor(right_ elen, E); rlabel(,\unit{4}{\ohm},); dot}
    line up_ elen*.5
    source(right_ elen, i); b_current(,,O)
    llabel(\unit{1}{\ampere},,)
    line down_ elen*.5
    {resistor(down_ elen*1.4, E); rlabel(,\unit{10}{\ohm},); dot}
    line right_ elen*.6
    resistor(down_ elen*1.4, E); llabel(,\unit{10}{\ohm},)
    b_current(I)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 03
% 求下图所示电路中的~$U$~和~$I$。
.PS
    cct_init
    elen = elen_
    Origin: Here
    {
        resistor(right_ elen*1.1, E); rlabel(,\unit{2}{\ohm}); dot
        resistor(right_ elen*1.1, E); rlabel(,\unit{2}{\ohm}); dot
    }
    source(up_ elen*.7, v); llabel(+,\unit{90}{\volt},-)
    resistor(up_ elen*.7, E); llabel(,\unit{1}{\ohm},)
    reversed(`arrowline', right_ elen*1.1); rlabel(,I,); dot
    {
        resistor(down_ elen*.7, E); llabel(,\unit{1}{\ohm},)
        move up_ elen*.2
        source(down_ elen*.9, i); llabel(-,U,+)
        b_current(\unit{20}{\ampere}, below_,O,E)
    }
    line right_ elen*1.1
    source(down_ elen*1.4, v); llabel(-,\unit{100}{\volt},+)
    line down_ elen*.6
    source(left_ elen*2.2, v); llabel(-,\unit{110}{\volt},+)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 04
% 求下图所示电路中的~$U_3$。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen, v); llabel(-,\unit{10}{\volt},+)
    resistor(right_ elen, E); llabel(,\unit{6}{\ohm},)
    b_current(I_1); dot
    {
        resistor(down_ elen, E); rlabel(,\unit{4}{\ohm},); dot
    }
    consource(right_ elen, v); llabel(+,10I_1,-)
    source(down_ elen, i); rlabel(+,U_3,-)
    b_current(\unit{4}{\ampere},,O)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 05
% 求图示电路的戴维宁或诺顿等效电路。
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(left_ elen*.8, E); rlabel(,\unit{5}{\ohm},); dot
    {
        resistor(down_ elen*.7, E); rlabel(,\unit{2}{\ohm},)
        consource(down_ elen*.7, v); rlabel(-,2I_1,+); dot
    }
    resistor(left_ elen*1.2, E); rlabel(,\unit{8}{\ohm},)
    source(down_ elen*1.4, v); rlabel(+,\unit{4}{\volt},-)
    b_current(I_1,,O)
    line to (Origin.x,Here.y); "$1'$" ljust
    gap(up_ elen*1.4, 1); "$1$" ljust
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 06
% 图示电路中，开关~S~闭合前电路已达稳定状态，$t=0$~时~S~闭合，求 ~$t\geq
% 0$~时电容电压~$u_C$~的响应。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*1.4, i); b_current(\unit{1}{\ampere},,O,E)
    line right_ elen*.8; dot
    {
        switch(down_ elen*.7,,C); llabel((t=0),S,)
        source(down_ elen*.7, v); rlabel(+,\unit{0.5}{\volt},-); dot
    }
    line right_ elen; dot
    {
        resistor(down_ elen*1.4, E); rlabel(,\unit{2}{\ohm},)
        llabel(+,u_1,-); dot
    }
    resistor(right_ elen*.9, E); rlabel(,\unit{4}{\ohm},); dot
    {
        consource(down_ elen*1.4, i); b_current(1.5u_1,,O); dot
    }
    line right_ elen
    capacitor(down_ elen*1.4); llabel(+,u_C,-); rlabel(,\unit{0.5}{\farad},)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 07
% 已知下图电路中~$I_1=I_2=\unit{10}{\ampere}$，求~$\mathdot{I}$~和
% ~$\mathdot{U}_\mathrm{S}$。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen, v); llabel(-,\mathdot{U}_\mathrm{S},+)
    inductor(right_ elen, W); rlabel(,\jimag \unit{10}{\ohm},)
    b_current(\mathdot{I}); dot
    {
        resistor(down_ elen, E); llabel(,\unit{10}{\ohm},)
        b_current(\mathdot{I}_1); dot
    }
    line right_ elen
    capacitor(down_ elen); b_current(\mathdot{I}_2)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 08
% 给出图中电路的结点电压方程和回路电流方程。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen,v); llabel(-,\mathdot{U}_{\rm S},+); dot;
    "\ding{172}" rjust
    {line up_ .6*elen then right_ .6*elen; dot(,,1); "$+$" ljust}
    inductor(right_ elen,W); rlabel(,{\rm j}\unit{5}{\ohm},);dot; "\ding{173}" above
    {
        capacitor(down_ elen); llabel(,,-{\rm j}\unit{5}{\ohm}); dot;
        ground(,,E)
    }
    resistor(right_ elen,E); llabel(,\unit{1}{\ohm},); dot;
    "\ding{174}" ljust
    {
        line up_ .6*elen then left_ .6*elen; dot(,,1); "$-$" rjust
        "$\mathdot{U}_{\rm o}$" at (elen,Here.y)
    }
    consource(down_ elen,i); b_current(g\mathdot{U}_{\rm o},,O,E)
    line to Origin
    arcd((.5*elen,.5*elen),.3*elen,180,-90) -> cw
    arcd((elen+.5*elen,.5*elen),.3*elen,180,-90) -> cw
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 09
% 求下图电路中当~$Z_\mathrm{L}$~能够获得的最大功率。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen,v); llabel(-,100\Varangle{90\degree}\unit{}{\volt},+)
    resistor(right_ elen*1.1, E); llabel(,\unit{20}{\ohm},);dot;
    {
        capacitor(down_ elen); rlabel(,,-\jimag\unit{10}{\ohm}); dot;
    }
    line right_ elen*.7; dot
    {
        source(down_ elen,i); b_current(5\Varangle{0\degree}\unit{}{\ampere},,O); dot;
    }
    line right_ elen; dot
    {
        inductor(down_ elen,W); llabel(,\jimag\unit{20}{\ohm},); dot;
    }
    line right_ elen
    resistor(down_ elen, E); llabel(,Z_\mathrm{L},)
    variable()
    {
        line to Origin
    }
    "0" below
    gap(up_ elen, 1); "1" above
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 10
% 试求下列电路的输入阻抗~$Z$~或导纳~$Y$。
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(right_ elen, E); llabel(,\unit{1}{\ohm},);dot;
    {
        inductor(down_ elen, W); rlabel(,\jimag\unit{2}{\ohm}); dot;
    }
    line right_ elen*.6
    capacitor(down_ elen); llabel(,-\jimag\unit{1}{\ohm},)
    line to (Origin.x, Here.y)
    gap(up_ elen, 1)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 11
% 试求下列电路的输入阻抗~$Z$~或导纳~$Y$。
.PS
    cct_init
    elen = elen_
    Origin: Here
    inductor(right_ elen*.8, W); rlabel(,\jimag\omega L,)
    b_current(\mathdot{I});dot;
    {
        resistor(down_ elen, E); rlabel(,R,); dot;
    }
    line right_ elen*.6
    consource(down_ elen, v); llabel(+,-r\mathdot{I},-)
    line to (Origin.x, Here.y)
    gap(up_ elen, 1)
.PE
