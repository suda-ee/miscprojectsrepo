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
    source(up_ elen, v); llabel(-,\unit{2}{\volt},+); b_current(I_1,below_,O,E)
    resistor(right_ elen, E); llabel(,\unit{2}{\ohm},); dot
    {
        resistor(down_ elen, E); rlabel(,\unit{1}{\ohm},); dot
    }
    line right_ elen*.6
    consource(down_ elen, i); b_current(2I_1,,O)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 02
% 求下图所示电路的电压~$U_\mathrm{ab}$。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.7, v); llabel(-,\unit{45}{\volt},+);
    resistor(up_ elen*.7, E); llabel(,\unit{15}{\ohm},)
    line right_ elen*.7; dot
    {
        resistor(down_ elen*.7, E); llabel(,\unit{20}{\ohm},)
        source(down_ elen*.7, v); llabel(+,\unit{20}{\volt},-);
        dot
    }
    line right_ elen; dot; "a" above
    {
        resistor(down_ elen*1.4, E); llabel(,\unit{15}{\ohm},)
        dot
    }
    line right_ elen; dot
    {
        resistor(down_ elen*.7, E); llabel(,\unit{50}{\ohm},)
        source(down_ elen*.7, v); llabel(-,\unit{20}{\volt},+);
        dot
    }
    line right_ elen
    resistor(down_ elen*.7, E); llabel(,\unit{8}{\ohm},)
    source(down_ elen*.7, v); llabel(+,\unit{50}{\volt},-)
    line to Origin
    move right_ elen*1.7; "b" below
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 03
% 求下图所示电路中的电压~$U_\mathrm{o}$。
.PS
    cct_init
    elen = elen_
    Origin: Here; dot
    {
        resistor(up_ elen*1.2, E); rlabel(,\unit{10}{\ohm}); dot
    }
    line left_ elen*.5
    source(up_ elen*1.2, i); b_current(\unit{1}{\ampere},,O,E)
    line right_ elen*.5
    resistor(right_ elen*.8, E); llabel(,\unit{10}{\ohm},)
    source(right_ elen*.8, v); llabel(-,\unit{30}{\volt},+)
    dot
    {
        source(to Origin, i)
        b_current(, ,O)
        llabel(,\unit{7}{\ampere},)
    }
    resistor(down_ elen*1.2, E); llabel(+,U_\mathrm{o},-)
    rlabel(,\unit{20}{\ohm},); dot
    {
        resistor(left_ elen*1.6, E); rlabel(,\unit{10}{\ohm})
    }
    line down_ elen*.5
    source(left_ elen*1.6, i); b_current(\unit{2}{\ampere},,O,E)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 04
% 求下图所示电路中的~$U_3$。
.PS
    cct_init
    elen = elen_
    Origin: Here
    line up_ elen*1.4
    resistor(right_ elen, E); llabel(,\unit{6}{\ohm},)
    b_current(I_1); dot
    {
        resistor(down_ elen*0.7, E); rlabel(,\unit{4}{\ohm},)
        source(down_ elen*.7, v); rlabel(+,\unit{6}{\volt},-); dot
    }
    consource(right_ elen, v); llabel(+,10I_1,-)
    {
        move down_ elen*1.4
        line to Origin
    }
    "$+$" below
    gap(down_ elen*1.4, 1); clabel(,U_3,)
    "$-$" above
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 05
% 求图示电路的戴维宁或诺顿等效电路。
.PS
    cct_init
    elen = elen_
    Origin: Here
    line left_ elen*.6; dot
    {
        resistor(down_ elen, E); llabel(,\unit{\frac{1}{2}}{\siemens},); dot
    }
    line left_ elen*.3; dot
    {
        line up_ elen*.3
        resistor(left_ elen*.9, E); rlabel(,\unit{\frac{1}{2}}{\siemens},)
        line down_ elen*.3
    }
    line down_ elen*.2
    consource(left_ elen*.9, i); b_current(2U_1,,O,E)
    line up_ elen*.2; dot
    line left_ elen*.4; dot
    {
        resistor(down_ elen, E); rlabel(,\unit{\frac{1}{2}}{\siemens},)
        llabel(+,U_1,-); dot
    }
    line left_ elen*.8
    source(down_ elen, i); b_current(\unit{4}{\ampere},below_,O)
    line to (Origin.x,Here.y); "$1'$" ljust
    gap(up_ elen, 1); "$1$" ljust
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 06
% 图示电路中，开关~S~动作前电路已达稳定状态，原合在位置~1，$t=0$~时
% ~S~由位置~1~合向位置~2，求
% ~$t\geq 0$~时电感电流~$i_L$~的响应。
.PS
    cct_init
    elen = elen_
    Origin: Here
    consource(up_ elen*.7, v); llabel(-,6u,+)
    resistor(up_ elen*.7, E); llabel(,\unit{6}{\ohm},)
    resistor(right_ elen, E); llabel(,\unit{2}{\ohm},)
    rlabel(+,u,-); dot
    {
        resistor(down_ elen*1.4, E); rlabel(,\unit{3}{\ohm},); dot
    }
    line right_ elen*.6; "2" above
    {
        move right_ dimen_*.4 then down_ dimen_*.5
        {
            {arcd(Here,dimen_*.5,30,150) -> }
            {Point_(60); line to rvec_(dimen_*.7, 0)
            "S" rjust}
        }
        {inductor(down_ elen*1.4-dimen_/2, W); rlabel(,\unit{3}{\henry},)
        llabel(+,u_L(t),-); b_current(i_L(t),below_); dot}
        dot(,,1)
    }
    move right_ dimen_*.8; "1" above
    line right_ elen*.7
    resistor(down_ elen*.7, E); llabel(,\unit{3}{\ohm},)
    source(down_ elen*.7, v); llabel(+,\unit{15}{\volt},-)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 07
% 求下图中的电压~$\mathdot{U}$。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen, i); rlabel(-,\mathdot{U},+)
    b_current(2\Varangle{0\degree}\unit{}{\ampere},,O,E)
    line right_ elen*.7; dot
    {
        resistor(down_ elen, E); llabel(,\unit{1}{\ohm},); dot
    }
    line right_ elen*.8; dot
    {
        capacitor(down_ elen); llabel(,,-\jimag \unit{0.5}{\ohm})
    }
    line right_ elen
    inductor(down_ elen, W); llabel(,\jimag \unit{1}{\ohm},)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 08
% 给出图中电路的结点电压方程和回路电流方程。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen,v); llabel(-,\mathdot{U}_{\rm S},+)
    resistor(right_ elen*.7, E); llabel(,\unit{1}{\ohm},); dot
    "\ding{172}" below
    {
        line up_ elen*.8
        resistor(right_ elen*2, E); llabel(,\unit{1}{\ohm},)
        b_current(\mathdot{I},,O)
        line down_ elen*.8
    }
    resistor(right_ elen, E); rlabel(,\unit{1}{\ohm},); dot
    "\ding{173}" above
    {
        consource(down_ elen, v); rlabel(+,2\mathdot{I},-); dot;
        ground(,,E)
    }
    capacitor(right_ elen); llabel(,-\jimag \unit{10}{\ohm},); dot;
    "\ding{174}" ljust
    inductor(down_ elen,W); llabel(,\jimag \unit{10}{\ohm},)
    line to Origin
    arcd((.8*elen,.5*elen),.3*elen,180,-90) -> cw
    arcd((2.2*elen,.5*elen),.3*elen,180,-90) -> cw
    arcd((1.5*elen,1.4*elen),.2*elen,0,270) ->
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 09
% 求下图中电流源发出的复功率。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*1.4,i); b_current(10\Varangle{0\degree},,O,E)
    capacitor(right_ elen); rlabel(,-\jimag\unit{20}{\ohm},)
    llabel(+,\mathdot{U}_C,-);dot;
    {
        consource(down_ elen*.7,v); llabel(-,0.5\mathdot{U}_C,+)
        resistor(down_ elen*.7, E); rlabel(,\unit{10}{\ohm}); dot;
    }
    line right_ elen
    resistor(down_ elen*1.4, E); llabel(,\unit{10}{\ohm},)
    line to Origin
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
        capacitor(down_ elen); rlabel(,-\jimag\unit{1}{\ohm}); dot;
    }
    resistor(right_ elen*.8, E); llabel(,\unit{1}{\ohm},)
    inductor(down_ elen, W); llabel(,\jimag \unit{1}{\ohm},)
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
    line right_ elen; dot
    {
        resistor(down_ elen*.7, E); rlabel(,\unit{40}{\ohm},)
        inductor(down_ elen*.7, W); rlabel(,\jimag\unit{40}{\ohm},); dot;
    }
    resistor(right_ elen*.8, E); llabel(,\unit{40}{\ohm},)
    capacitor(down_ elen*1.4); llabel(,-\jimag\unit{40}{\ohm},)
    line to (Origin.x, Here.y)
    gap(up_ elen*1.4, 1)
.PE
