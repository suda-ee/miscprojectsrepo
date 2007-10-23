include(/usr/local/lib/m4/circuit_macros/mpost.m4)
include(/usr/local/lib/m4/circuit_macros/libcct.m4)
define(`dimen_', (dimen_*.8))
define(`elen_', (elen_*1.25))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 1 求受控源吸收的功率。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.6, v); llabel(-,\unit{12}{\volt},+)
    resistor(up_ elen*.6, E); llabel(,\unit{3}{\ohm},)
    arrowline(right_ elen); llabel(,I_1,); dot
    {resistor(down_ elen*1.2, E); rlabel(,\unit{2}{\ohm},); dot}
    line right_ elen*.8
    consource(down_ elen*1.2, i); b_current(0.5I_1, ,O)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 2 图示电路中，已知~$U=\unit{3}{\volt}$，求~$R$。
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(left_ elen, E); llabel(,\unit{2}{\ohm},); dot
    {
        resistor(up_ elen*1.4, E); rlabel(,\unit{2}{\ohm},); dot
    }
    line left_ elen*.6
    source(up_ elen*1.4, i); b_current(\unit{1}{\ampere},,O,E)
    line right_ elen*1.6; dot
    {
        resistor(down_ elen*.7, E); rlabel(,\unit{4}{\ohm},)
        source(down_ elen*.7, v); llabel(+,\unit{10}{\volt},-); dot
    }
    line right_ elen
    resistor(down_ elen*1.4, E); rlabel(,R,); llabel(+,U,-)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 3 电路如下图所示，求电路~$I$。
.PS
    cct_init
    elen = elen_
    Origin: Here
    {
        source(up_ elen*.7, i); b_current(\unit{2}{\ampere},,O); dot
        source(up_ elen*.7, i); b_current(\unit{6}{\ampere},,O,E); dot
    }
    line left_ elen*.8
    source(up_ elen*.7, v); llabel(-,\unit{6}{\volt},+); dot
    {
        line right_ elen*.8
    }
    resistor(up_ elen*.7, E); llabel(,\unit{10}{\ohm},)
    line right_ elen*1.8
    resistor(down_ elen*1.4, E); rlabel(,\unit{2}{\ohm},);
    b_current(I)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 4 如图示电路，求~ab~两端的输入电路~$R_{\mathrm{ab}}$。
.PS
    cct_init
    elen = elen_
    Origin: Here
    line left_ elen*.8; dot
    {
        line left_ elen
        consource(up_ elen*.7, i); b_current(u_1/15,,O)
        line right_ elen
    }
    resistor(up_ elen*.7, E); llabel(,\unit{15}{\ohm},)
    rlabel(-,u_1,+); dot
    resistor(up_ elen*.7, E); rlabel(,\unit{5}{\ohm},)
    line right_ elen*.8; "a" ljust
    gap(down_ elen*1.4, 1); "b" ljust
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 5 试列写以下电路的回路电流方程。
.PS
    cct_init
    elen = elen_
    Origin: Here
    dot
    {
        resistor(right_ elen*.7, E); llabel(,\unit{4}{\ohm},)
        source(right_ elen*.7, v); rlabel(-,\unit{4}{\volt},+); dot
        line right_ elen*.4
        resistor(right_ elen*.7, E); llabel(,\unit{5}{\ohm},)
        source(right_ elen*.7, v); llabel(+,\unit{5}{\volt},-); dot
    }
    source(up_ elen*1.8, i); b_current(\unit{1}{\ampere},,O,E)
    resistor(right_ elen*1.4, E); rlabel(,\unit{1}{\ohm},); dot
    {
        resistor(down_ elen*.6, E); llabel(,\unit{6}{\ohm},)
        source(down_ elen*.6, v); rlabel(+,\unit{7}{\volt},-)
        resistor(down_ elen*.6, E); llabel(,\unit{8}{\ohm},)
    }
    resistor(right_ elen*.9, E); llabel(,\unit{2}{\ohm},)
    source(right_ elen*.9, v); rlabel(+,\unit{2}{\volt},-)
    line down_ elen*2.8
    source(left_ elen*1.6, v); rlabel(-,\unit{3}{\volt},+)
    resistor(left_ elen*1.6, E); rlabel(,\unit{3}{\ohm},)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 6 用结点电压法求电压~$U$。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.7, i); b_current(\unit{5}{\ampere},,O,E)
    resistor(up_ elen*.7, E); llabel(,\unit{2}{\ohm},); dot
    {
        source(right_ elen, v); rlabel(-,\unit{6}{\volt},+); dot
        resistor(down_ elen*1.4, E); rlabel(,\unit{8}{\ohm},); 
        llabel(+,U,-);dot
    }
    line up_ elen*.7
    consource(right_ elen*2, i); b_current(0.1U,,O,E)
    line down_ elen*.7; dot
    {
        source(left_ elen, v); rlabel(+,\unit{12}{\volt},-)
    }
    resistor(down_ elen*1.4, E); llabel(,\unit{8}{\ohm},)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 7 求以下电路的诺顿或戴维宁等效电路。
.PS
    cct_init
    elen = elen_
    Origin: Here
    line left_ elen*.7; dot
    {
        line up_ elen*.6
        resistor(left_ elen*1.8, E); rlabel(,\unit{12}{\ohm},); 
        line down_ elen*.6; dot
    }
    {
        resistor(down_ elen*.9, E); llabel(,\unit{4}{\ohm},); dot
    }
    resistor(left_ elen*.9, E); rlabel(,\unit{3}{\ohm},); dot
    {
        source(down_ elen*.9, i); b_current(\unit{12}{\ampere},below_,O); dot
    }
    resistor(left_ elen*.9, E); rlabel(,\unit{3}{\ohm},)
    source(down_ elen*.9, v); rlabel(+,\unit{6}{\volt},-)
    line to (Origin.x, Here.y); "b" ljust
    gap(up_ elen*.9, 1); "a" ljust
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 8 如下图所示电路，用叠加定理求电流~$I_x$。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.7, v); llabel(-,\unit{18}{\volt},+); 
    resistor(up_ elen*.7, E); llabel(,\unit{2}{\ohm},); dot
    {
        resistor(right_ elen*1.2, E); rlabel(,\unit{2}{\ohm},); dot
    }
    line up_ elen*.6
    consource(right_ elen*1.2, i); b_current(0.5I_x,,O,E)
    line down_ elen*.6
    {
        source(down_ elen*1.4, i); b_current(\unit{3}{\ampere},,O); dot
    }
    line right_ elen
    resistor(down_ elen*1.4, E); rlabel(,\unit{3}{\ohm},)
    b_current(I_x)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 9 如图示电路，负载~$R_L$~可任意改变，问~$R_L$~为何值时其上可获得
% 最大功率，并求出该最大功率~$P_{L\mathrm{max}}$。
.PS
    cct_init
    elen = elen_
    Origin: Here
    consource(up_ elen, i); b_current(2I,,O,E)
    line right_ elen*.6; dot
    {
        resistor(down_ elen, E); llabel(,\unit{4}{\ohm},); dot
    }
    source(right_ elen*.8, v); llabel(-,\unit{12}{\volt},+)
    resistor(right_ elen*.8, E); b_current(I,below_); llabel(,\unit{6}{\ohm},); dot
    {
        resistor(down_ elen, E); rlabel(,\unit{10}{\ohm},); dot
    }
    line right_ elen*.6
    resistor(down_ elen, E); llabel(,R_L,); variable()
    line to Origin
.PE
