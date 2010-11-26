include(/usr/local/lib/m4/circuit_macros/libcct.m4)
define(`dimen_', (dimen_*.8))
define(`elen_', (elen_*1.25))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 01
% 求图中各器件的功率(须说明是吸收还是发出)。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen, i); b_current(\unit{2}{\ampere},,O)
    line right_ elen*.6; dot
    {
        resistor(down_ elen, E); llabel(\unit{5}{\ohm},,); dot
    }
    line right_ elen*.6
    source(down_ elen, v); llabel(+,\unit{15}{\volt},-)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 02
% 求下图所示电路的电压 $U_\mathrm{cb}$。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen, i); b_current(\unit{2}{\ampere},,O,E)
    resistor(right_ elen, E); rlabel(,\unit{5}{\ohm},)
    llabel(+,U_1,-); dot; "a" above
    {
        source(down_ elen, v); llabel(-,\unit{3}{\volt},+)
        dot; "b" below
    }
    resistor(right_ elen, E); llabel(,\unit{20}{\ohm},)
    dot; "c" above
    consource(down_ elen, i); llabel(,,0.05U_1)
    b_current(,,O,E)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 03
% 求图中电路在~ab~端口的戴维宁或诺顿等效电路。
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(right_ elen,E); llabel(,\unit{0.2}{\siemens},); dot
    {
        source(down_ .75*elen,i); b_current(\unit{2}{\ampere},,O); dot
        {
            line right_ 1.5*elen; dot
        }
        resistor(down_ .75*elen,E); rlabel(,\unit{5}{\ohm},); dot
    }
    line right_ 1.5*elen
    source(down_ .75*elen,v); llabel(+,\unit{10}{\volt},-)
    resistor(down_ .75*elen,E); llabel(,\unit{5}{\ohm},)
    source(left_ .75*elen,i); b_current(\unit{1}{\ampere},,O,E)
    source(left_ .75*elen,v); llabel(+,\unit{5}{\volt},-)
    line left_ elen; "b" above; gap(up_ 1.5*elen, 1); "a" below
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 04
% 求电流 $I$。
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(up_ elen, E); llabel(, \unit{4}{\ohm},);
    dot
    {
        line up_ elen*.8
        resistor(right_ elen*2, E); rlabel(, \unit{20}{\ohm},)
        llabel(-, U_\mathrm{x}, +)
        line down_ elen*.8; dot
    }
    resistor(right_ elen, E); llabel(, \unit{20}{\ohm},); dot
    {
        source(down_ elen, i); b_current(\unit{3.5}{\ampere}, below_, O); dot
    }
    consource(right_ elen, v); llabel(+, 0.5 U_\mathrm{x}, -)
    arrowline(down_ elen); llabel(, I, )
    resistor(left_ elen, E); rlabel(, \unit{35}{\ohm}, )
    resistor(left_ elen, E); llabel(, \unit{2}{\ohm}, )
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 05 如图所示电路，求电流 I 和电压 U。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen, v); llabel(-,\unit{10}{\volt},+)
    resistor(right_ elen, E); b_current(I,,O,E); llabel(,\unit{2}{\ohm},)
    dot
    {
        source(down_ elen, i); rlabel(+, U, -)
        b_current(\unit{5}{\ampere}, ,O); dot
    }
    resistor(right_ elen, E); llabel(,\unit{1}{\ohm},)
    consource(down_ elen, v); llabel(+, 2I, -)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 06 如图所示电路，$R_\mathrm{L}$ 可变，问 $R_\mathrm{L}$ 取何值时可
% 获得最大功率，并求出该最大功率。
.PS
    cct_init
    elen = elen_
    Origin: Here
    consource(up_ elen*1.4, i); b_current(0.1U_R,,O)
    line right_ elen*.8; dot
    {
        resistor(down_ elen*.7, E); llabel(,\unit{10}{\ohm},)
        rlabel(+, U_R, -)
        source(down_ elen*.7, v); llabel(+, \unit{20}{\volt}, -); dot
    }
    resistor(right_ elen, E); llabel(, \unit{5}{\ohm},); dot
    {
        source(down_ elen*1.4, i); b_current(\unit{2}{\ampere}, ,O); dot
    }
    line right_ elen*.8
    resistor(down_ elen*1.4, E); llabel(,R_\mathrm{L},)
    variable()
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 07
% 求下图电路中的输入阻抗 $Z$ 和导纳 $Y$。
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(right_ elen, E); llabel(, \unit{1}{\ohm},); dot
    {
        capacitor(down_ elen); rlabel(,\unit{-\jimag 1}{\ohm},)
        dot
    }
    resistor(right_ elen, E); llabel(,\unit{1}{\ohm},)
    inductor(down_ elen, W); llabel(,\unit{\jimag 1}{\ohm},)
    line left_ elen*2
    gap(up_ elen, 1)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 08
% 列出下图电路的回路电流方程或结点电压方程。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen,v); llabel(-,\mathdot{U}_{\rm S},+)
    resistor(right_ elen*.7, E); llabel(,\unit{1}{\ohm},); dot
    {
        line up_ elen*.6
        resistor(right_ elen*2, E); llabel(, \unit{1}{\ohm},)
        b_current(\mathdot{I}, ,O)
        line down_ elen*.6
    }
    resistor(right_ elen, E); llabel(,\unit{1}{\ohm},); dot
    {
        consource(down_ elen, v); rlabel(+, 2\mathdot{I}, -); dot;
    }
    capacitor(right_ elen); rlabel(,\unit{-\jimag 10}{\ohm},); dot;
    inductor(down_ elen, W); llabel(,\jimag \unit{10}{\ohm},)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 09
% 图示电路中，开关 S 动作前电路已达稳定状态，原合在位置 1，$t=0$ 时
% S 由位置 1 合向位置 2，求 $t\geq 0$ 时电感电压 $u_L$ 的响应。
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
