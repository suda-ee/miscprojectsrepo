include(/usr/local/lib/m4/circuit_macros/libcct.m4)
define(`dimen_', (dimen_*.8))
define(`elen_', (elen_*1.25))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 01
% 求电压$U$，电流源$I_{\mathrm{S}}$吸收的功率$P_{\mathrm{S}}$。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ 1.5*elen, i); b_current(\unit{1}{\ampere},,O,E)
    llabel(,I_\mathrm{S},)
    arrowline(right_ .8*elen); llabel(,I,)
    {
        gap(down_ 1.5*elen); clabel(+,U,-)
    }
    line right_ .6*elen
    resistor(down_ .75*elen, E); llabel(,\unit{2}{\ohm},)
    source(down_ .75*elen, v); llabel(+,\unit{6}{\volt},-)
    rlabel(, U_\mathrm{S},)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 02
% 求下图电路中控制量$I_1$及电压$U_0$。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ 1.4*elen, v); llabel(-,\unit{20}{\volt},+);
    resistor(right_ .8*elen, E); llabel(,\unit{1}{\kilo\ohm},)
    b_current(I_1, below_); dot
    {
        resistor(down_ .7*elen, E); rlabel(,\unit{6}{\kilo\ohm},)
        consource(down_ .7*elen, v); llabel(+, 600I_1, -)
        dot
    }
    line right_ elen
    resistor(down_ 1.4*elen, E); rlabel(,\unit{5}{\kilo\ohm},)
    llabel(+, U_0, -)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 03
% 求输入电阻$R_{\mathrm{ab}}$。
.PS
    cct_init
    elen = elen_
    Origin: Here
    "a" rjust
    {
        resistor(right_ elen*.8, E); llabel(,R_2,)
        consource(down_ elen*.7, v); llabel(-,\mu U_1,+);
        resistor(down_ elen*.7, E); llabel(+,U_1,-);
        rlabel(, R_1,); line left_ elen*.8
    }
    gap(down_ elen*1.4, 1); "b" rjust
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 04
% 分别求 (1) 开路电压 $U_\mathrm{OC}|_\mathrm{ab}$；
% (2) 短路电流 $I_\mathrm{SC}|_\mathrm{ab}$；
% (3) ab 间接 $\unit{8/3}{\ohm}$ 电阻时的 $U_\mathrm{ab}$。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*1.4, v); llabel(-, \unit{12}{\volt}, +)
    line right_ elen*.5; dot
    {
        resistor(down_ elen*.7, E); rlabel(,\unit{2}{\ohm},); dot
        "a" ljust
        resistor(down_ elen*.7, E); llabel(,\unit{4}{\ohm},); dot
    }
    line right_ elen*.8
    resistor(down_ elen*.7, E); llabel(,\unit{4}{\ohm},); dot; "b" rjust
    resistor(down_ elen*.7, E); llabel(, \unit{2}{\ohm}, )
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 05
% 当 (1) $u = \unit{1}{\volt}$，(2) $u = \mathrm{e}^t \unit{}{\volt}$ 
% 时，分别求 $i$。
.PS
    cct_init
    elen = elen_
    Origin: Here
    "$+$" below
    arrowline(right_ elen*.6); llabel(,i,); dot
    {
        resistor(down_ elen*.6, E); rlabel(,\unit{1}{\ohm},); dot
    }
    line right_ elen/2
    capacitor(down_ elen*.6); llabel(,\unit{1}{\farad},)
    line left_ elen*1.1; "$-$" above
    gap(to Origin, 1); clabel(,u,)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 06
% 下图所示电路，开关合在位置 1 时已达稳定状态，$t = 0$ 时开关由位置 1
% 合向位置 2，求 $t \ge 0$ 时的电压 $u_L$。
.PS
    cct_init
    elen = elen_
    Origin: Here
    consource(left_ elen, v); llabel(-, 2i_1, +); dot
    {
        resistor(up_ elen*1.6, E)
        b_current(i_1,,,E); llabel(, \unit{4}{\ohm}, )
        dot
    }
    line left_ elen*.7
    source(up_ elen*1.6, i); llabel(,\unit{2}{\ampere},)
    b_current(,,O,E)
    line right_ elen*.7
    resistor(right_ elen*.8, E); llabel(,\unit{4}{\ohm}, )
    move left_ elen*.2
    reversed(`switch', right_ elen*.8, L, CD); llabel(2,S,)
    line right_ elen*.5
    inductor(down_ elen*1.6, W); rlabel(, \unit{0.1}{\henry}, )
    llabel(+, u_L, -); b_current(i_L)
    line to Origin; dot
    resistor(up_ elen*.7, E); rlabel(, \unit{2}{\ohm}, )
    source(up_ elen*.7, v); llabel(+, \unit{8}{\volt}, -)
    dot(,,1); "1" ljust
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 07
% 求下图电路的输入阻抗 $Z$ 和导纳 $Y$。
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
% 已知 $I_\mathrm{S} = \unit{10}{\ampere}$，求电流源发出的复功率。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*1.4, i); b_current(\mathdot{I}_\mathrm{S},, O, E)
    capacitor(right_ elen); llabel(+, \mathdot{U}_C, -)
    rlabel(, \unit{-\jimag 20}{\ohm}, )
    dot
    {
        consource(down_ elen*.7, v); llabel(-, 0.5 \mathdot{U}_C,+)
        resistor(down_ elen*.7, E); llabel(, \unit{10}{\ohm},)
        dot
    }
    line right_ elen
    resistor(down_ elen*1.4, E); llabel(,\unit{10}{\ohm},)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 09
% 求图示电路中的 $I_1$ 和 $U_\mathrm{ab}$。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen, v)
    llabel(-,U_\mathrm{S},+)
    resistor(right_ elen, E); rlabel(,\unit{6}{\ohm},)
    b_current(I_1)
    dot; "a" above
    {
        resistor(down_ elen, E); rlabel(,\unit{4}{\ohm},)
        dot; "b" below
    }
    resistor(right_ elen, E); rlabel(,\unit{5}{\ohm},)
    llabel(+, \unit{10}{\volt}, -)
    consource(down_ elen, i); b_current(I)
    b_current(0.9I_1, ,O, E)
    line to Origin
.PE
