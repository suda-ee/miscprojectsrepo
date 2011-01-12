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
    source(up_ elen, i); b_current(\unit{2}{\ampere},,O, E)
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 03 求图示电路中电压 $U$ 和电流 $I$。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen, i); llabel(-, U, +);
    b_current(\unit{10}{\ampere}, below_, O, E)
    line right_ elen; dot
    {
        resistor(down_ elen, E); rlabel(,,\unit{3}{\ohm});
        b_current(I); dot
    }
    line right_ elen*.6; dot
    {
        consource(down_ elen, i); b_current(2I,,O, E); dot
    }
    line right_ elen*.6
    resistor(down_ elen, E); llabel(,\unit{1}{\ohm},)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 4
% 求图中的 $U_\mathrm{x}$。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen, v); llabel(-,\unit{20}{\volt},+); dot
    {
        resistor(right_ elen, E); llabel(,\unit{24}{\ohm},); dot
        {
            resistor(right_ elen, E); llabel(,\unit{8}{\ohm},); dot
        }
        resistor(down_ elen, E); llabel(,\unit{32}{\ohm},)
        rlabel(+,U_\mathrm{x},-); dot
    }
    line up_ elen*.6
    source(right_ elen*2, i); b_current(\unit{0.15}{\ampere},,O,E)
    line down_ elen*.6
    consource(down_ elen, i); b_current(0.05U_\mathrm{x},,O, E)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 5
% 求图中的电压 $U_2$。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen, v); llabel(-, \unit{2}{\volt}, +)
    line right_ elen*.6; dot
    {
        resistor(down_ elen, E); llabel(,\unit{4}{\ohm},)
        b_current(I_1, below_); dot
    }
    line right_ elen*.4; dot
    {
        line up_ elen*.3
        resistor(right_ elen*1.1, E); llabel(,\unit{3}{\ohm})
        line down_ elen*.3; dot
    }
    line down_ elen*.3
    consource(right_ elen*1.1, i)
    b_current(2I_1,,O)
    line up_ elen*.3 then right_ elen*.6
    source(down_ elen, i); llabel(+, U_2,-)
    b_current(\unit{3}{\ampere}, below_,O)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 06
% 下图中负载电阻 $R_\mathrm{L}$ 可变，问 $R_\mathrm{L}$ 等于何值时可吸收
% 最大功率，并求此功率。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.7, v); llabel(-, \unit{6}{\volt}, +)
    resistor(up_ elen*.7, E); llabel(, \unit{2}{\ohm},)
    b_current(I_1, , O, E)
    line right_ elen*.6; dot
    {
        resistor(down_ elen*1.4, E); rlabel(, \unit{2}{\ohm},); dot
    }
    line right_ elen*.4; dot
    {
        consource(down_ elen*1.4, i); b_current(4I_1, ,O); dot
    }
    consource(right_ elen*.8, v); llabel(-, 2I_1, +)
    resistor(right_ elen*.8, E); llabel(, \unit{4}{\ohm}, )
    resistor(down_ elen*1.4, E); llabel(, R_\mathrm{L}, )
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
        inductor(down_ elen, W); rlabel(,\unit{\jimag 2}{\ohm},)
        dot
    }
    line right_ elen*.8
    capacitor(down_ elen); llabel(,\unit{-\jimag 1}{\ohm},)
    line left_ elen*1.8
    gap(up_ elen, 1)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 08
% 列写下图电路的回路电流方程和节点电压方程。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen, v); llabel(-, \mathdot{U}_\mathrm{S}, +)
    dot
    {
        inductor(right_ elen, W); rlabel(, \unit{\jimag 5}{\ohm},); dot
        {
            capacitor(down_ elen); llabel(\unit{-\jimag 5}{\ohm}); dot
        }
        resistor(right_ elen, E); llabel(, \unit{1}{\ohm},)
        dot
    }
    line up_ elen*.5 then right_ elen*.5
    GG: Here
    move right_ elen
    line right_ elen*.5 then down_ elen*.5
    consource(down_ elen, i); b_current(g\mathdot{U}_\mathrm{o}, , O, E)
    line to Origin
    move to GG
    gap(right_ elen, 1); clabel(+, \mathdot{U}_\mathrm{o}, -)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 09
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
