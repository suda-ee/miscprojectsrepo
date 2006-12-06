include(/usr/local/lib/m4/circuit_macros/mpost.m4)
include(/usr/local/lib/m4/circuit_macros/libcct.m4)
define(`dimen_', (dimen_*.8))
define(`elen_', (elen_*1.25))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 01
% 求图示电路的等效戴维宁电路（4-12b）
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.7,i); b_current(\unit{2}{\ampere},,O,E)
    resistor(up_ elen*.5, E); llabel(,\unit{10}{\ohm},)
    line right_ elen*.4; dot
    {battery(down_ elen*.3, ,R); llabel(,\unit{9}{\volt},); dot(,,1); "a" ljust}
    line right_ elen*.8
    resistor(down_ elen*.6, E); llabel(,\unit{6}{\ohm},)
    battery(down_ elen*.6, ,R); llabel(,\unit{3}{\volt},)
    line left_ elen*.8; dot
    {resistor(up_ elen*.6, E); rlabel(,\unit{10}{\ohm},); dot(,,1)
    "b" ljust}
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 02
% 求图示电路的等效戴维宁电路（4-10d）
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(right_ elen,E); rlabel(,\unit{0.2}{\siemens},); dot
    {
        source(down_ .75*elen,i); b_current(\unit{2}{\ampere},,O); dot
        {
            line right_ 1.5*elen; dot
        }
        resistor(down_ .75*elen,E); rlabel(,\unit{5}{\ohm},); dot
    }
    line right_ 1.5*elen
    source(down_ .75*elen,v); rlabel(+,\unit{10}{\volt},-)
    resistor(down_ .75*elen,E); rlabel(,\unit{5}{\ohm},)
    source(left_ .75*elen,i); llabel(\unit{1}{\ampere},,); b_current(,,O,E)
    source(left_ .75*elen,v); rlabel(+,\unit{5}{\volt},-)
    line left_ elen; "b" above; gap(up_ 1.5*elen,1); "a" below
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 03
% 图示网络中，已知当IS=0时，I=1.5mA；IS=10mA时，I=1.4mA，求当IS=15mA时，
% I的值。
.PS
    cct_init
    elen = elen_
    Origin: Here
    N: nport(wid elen*.5 ht elen "\parbox[c]{.5in}{\centering 线性\\ 
    含源\\ 电阻\\ 网络}",,,,,6)
    move to N.W1a
    line left_ elen*.2
    source(down_ to (Here.x, N.W1b.y), i); b_current(I_\mathrm{S},,O)
    line to N.W1b
    move to N.E1a
    arrowline(right_ elen*.2); llabel(,I,)
    resistor(down_ to (Here.x, N.E1b.y), E); rlabel(,R,)
    line to N.E1b
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 04
% 列出图中电路的结点电压方程.(3-15a)
.PS
    cct_init
    elen = elen_
    Origin: Here
    line left_ elen*.6
    source(up_ elen, i); b_current(\unit{4}{\ampere},,O,E)
    resistor(right_ elen*.6, E); llabel(,\unit{2}{\ohm},); dot
    {resistor(down_ elen*.5, E); rlabel(,\unit{3}{\ohm},);
    resistor(down_ elen*.5, E); rlabel(,\unit{2}{\ohm},); dot}
    {resistor(right_ elen*.7, E); rlabel(,\unit{2}{\ohm},); dot}
    line up_ elen*.3; source(right_ elen*.7, i);
    llabel(,,\unit{10}{\ampere})
    b_current(,,O,E); line down_ elen*.3
    {resistor(down_ elen, E); llabel(,\unit{3}{\siemens},); dot}
    resistor(right_ elen*.7, E); llabel(,\unit{2}{\siemens},)
    resistor(down_ elen, E); llabel(,\unit{6}{\siemens},)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 05
% 列出图中电路的结点电压方程.(3-15b)
.PS
    cct_init
    elen = elen_
    Origin: Here
    line left_ elen*.5
    source(up_ elen*.7, v); llabel(-,\unit{10}{\volt},+)
    resistor(right_ elen*.5, E); llabel(,\unit{1}{\ohm},); dot
    {resistor(down_ elen*.7, E); llabel(,\unit{5}{\ohm},); dot}
    {resistor(right_ elen*1.2, E); rlabel(,\unit{5}{\ohm},); dot}
    line up_ elen*.3; resistor(right_ elen*.6, E); llabel(,\unit{5}{\ohm},)
    source(right_ elen*.6, v); llabel(-,\unit{20}{\volt},+)
    line down_ elen*.3
    {resistor(down_ elen*.7, E); rlabel(,\unit{10}{\ohm},); dot}
    line right_ elen*.3
    source(down_ elen*.7, i); b_current(\unit{2}{\ampere},,O)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 06
% hugan
.PS
    cct_init
    elen = elen_
    Origin: Here
    Tr1: transformer(down_ elen*.6,,,A)
    llabel(,L_2,); rlabel(,L_1,)
    {move to Tr1.P1; move left_ elen*.05; move down_ elen*.1; "*" at Here}
    {move to Tr1.S1; move right_ elen*.05; move down_ elen*.1; "*" at Here}
    move to (Tr1.P1+Tr1.S1)/2; "M" at Here
    reversed(`arrowline', from Tr1.P1 left_ elen*.6); rlabel(,i_1,)
    "$+$" below
    line from Tr1.P2 left_ elen*.6; "$-$" above
    gap(up_ elen*.6,1); clabel(,u_1(t),)
    line from Tr1.S1 right_ elen*.6; "$+$" below
    reversed(`arrowline', from Tr1.S2 right_ elen*.6); rlabel(,i_2,)
    "$-$" above
    gap(up_ elen*.6,1); clabel(,u_2(t),)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 07
% 图示电路中的电压U和U1之值。
.PS
    cct_init
    elen = elen_
    Origin: Here
    dot
    {
        source(up_ elen*.7, i); rlabel(-,U_I,+)
        b_current(\unit{5}{\ampere},,O,E)
        resistor(up_ elen*.5, E); rlabel(,\unit{2}{\ohm},); dot
    }
    resistor(left_ elen*.6, E); llabel(,\unit{5}{\ohm},)
    consource(up_ elen*1.2, i); b_current(0.3U,below_,O,E)
    line right_ elen*1.3; "$+$" ljust
    consource(down_ elen*1.2, i); b_current(0.4U,,O,E)
    llabel(,U,); "$-$" ljust
    line left_ to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 08
% 图示电路中的电压U和U1之值。
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(up_ elen*.8, E); rlabel(-,U,+)
    llabel(,\unit{1}{\ohm},)
    line right_ elen*.6; dot
    {consource(down_ elen*.8, i); llabel(,,I_1); b_current(,,O,E); dot}
    line right_ elen*.4; dot
    {resistor(down_ elen*.8, E); llabel(I_1,\unit{2}{\ohm},); 
    b_current(); dot}
    line right_ elen*.8
    source(down_ elen*.8, i); b_current(\unit{5}{\ampere},below_,O)
    llabel(+,U_I,-)
    resistor(left_ elen*.8, E); rlabel(,\unit{4}{\ohm},)
    line left_ to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 09
% 在图示电路中，在开关S断开的条件下，求电源送出的电流和开关两端的电压Uab
% ；在开关闭合后，再求电源送出的电流和通过开关的电流。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen, v); llabel(-,\unit{3}{\volt},+)
    line right_ elen*.6; dot
    {
        resistor(down_ elen*.5, E); rlabel(,\unit{1}{\ohm},)
        dot; "a" rjust
        {resistor(down_ elen*.5, E); rlabel(,\unit{2}{\ohm},); dot}
        switch(right_ elen*.6); llabel(,S,); dot; "b" ljust
    }
    line right_ elen*.6
    resistor(down_ elen*.5, E); llabel(,\unit{3}{\ohm},)
    resistor(down_ elen*.5, E); llabel(,\unit{3}{\ohm},)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 10
% 电路如图，IS不变，当US=1V时，I=5A；US=2V时，I=8A；求当US=4V时，I的值。 
.PS
    cct_init
    elen = elen_
    Origin: Here
    dot
    {
        source(right_ elen*.7, i); llabel(,,I_\mathrm{S})
        b_current(,,O,E)
        resistor(right_ elen*.5, E); llabel(,R,)
        dot
        {resistor(right_ elen*.6, E); llabel(,R,); dot}
        resistor(up_ elen*.8, E); rlabel(I,R,)
        b_current(); dot
    }
    line up_ elen*.8
    resistor(right_ elen*1.2, E); llabel(,R,)
    resistor(right_ elen*.6, E); llabel(,R,)
    line down_ elen*1.2
    resistor(left_ elen*.9, E); llabel(,R,)
    source(left_ elen*.9, v); llabel(-,U_\mathrm{S},+)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 11
% 试用叠加定理图示电路中电阻支路的电流I1、I3。
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(up_ elen*.8, E); llabel(,\unit{10}{\ohm},I_1)
    b_current(,,,E); dot; "\ding{172}" rjust
    {
        line up_ elen*.4
        source(right_ elen*1.6, i); llabel(,,\unit{2}{\ampere})
        b_current(,,O,E)
        line down_ elen*.4; dot; "\ding{174}" ljust above
    }
    resistor(right_ elen*.8, E); b_current(,,O)
    llabel(I_2,\unit{10}{\ohm},); dot; "\ding{173}" above
    {source(down_ elen*.8, v); rlabel(+,\unit{4}{\volt},-); dot; ground(,,E)}
    resistor(right_ elen*.8, E); rlabel(,\unit{30}{\ohm},)
    b_current(I_3,,O,E)
    resistor(down_ elen*.8, E); llabel(,\unit{10}{\ohm},)
    b_current(I_4,,,)
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
% fig 13
% 图示为一电阻串并联电路，求图中电压uab
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*1.2, v); llabel(-,\unit{4}{\volt},+)
    line right_ elen*.4; dot
    {
        resistor(down_ elen*.6, E); llabel(,\unit{2}{\ohm},); A: dot
        "a" rjust
        resistor(down_ elen*.6, E); llabel(,\unit{2}{\ohm},); dot
    }
    resistor(right_ elen, E); llabel(,\unit{2}{\ohm},); dot
    {
        resistor(down_ elen*.6, E); rlabel(,\unit{1}{\ohm},); B: dot
        "b" ljust
        resistor(down_ elen*.6, E); rlabel(,\unit{2}{\ohm},); dot
    }
    line right_ elen*.3
    resistor(down_ elen*1.2, E); llabel(,\unit{6}{\ohm},)
    line to Origin
    gap(from A right_ to B); clabel(+,u_\mathrm{ab},-)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 14
% 试用支路分析法求图示电路中的电压u和电流ix。
.PS
    cct_init
    elen = elen_
    Origin: Here
    consource(up_ elen*.9, v); llabel(-,4i_x,+)
    resistor(right_ elen*.6, E); llabel(,\unit{5}{\ohm},); dot
    {
        source(down_ elen*.9, i); llabel(+,u,-); rlabel(\unit{2}{\ampere},,)
        b_current(,,O); dot
    }
    resistor(right_ elen*.8, E); llabel(,\unit{2}{\ohm},)
    source(down_ elen*.9, v); llabel(+,\unit{5}{\volt},-);
    rlabel(i_x,,); b_current()
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 15
% 图示为一有源一端口网络A对负载RL供电。当负载RL变动时，输出电压和电流也
% 随之改变，并记录如下两组数据：i=2A时，u=8V. i=4A 时，u=6V. 试确定有源
% 一端口网络A的等效电路的参数
.PS
    cct_init
    elen = elen_
    Origin: Here
    N1: nport(wid .3 ht .8 "A",0,0,1,0,5,dimen_/2,N)
    resistor(from N1.E1a down_ to N1.E1b, E); variable(,A,,dimen_*.6)
    dlabel(.2,.14,,R_\mathrm{L},)
    dlabel(.2,-.12,+,u,-)
    move to N1.E1a; "a" above
    move to N1.E1b; "b" below
    move to N1.E1a; move left_ elen*.2
    arrowline(right_ elen*.2); llabel(,i,)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 16
% 图示RC电路，原处于直流稳态，当t=0时，开关从1投向2。试按uC(t) 的三要素
% 定性作出uC(t) 的波形图。
.PS
    cct_init
    elen = elen_
    Origin: Here
    dot; line left_ elen*.4
    source(up_ elen*.8, v); llabel(-,\unit{3}{\volt},+)
    reversed(`switch', right_ elen*.8,,O); llabel(1,,t=0)
    resistor(right_ elen*.8, E); llabel(,\unit{1}{\ohm},)
    capacitor(down_ elen*.8); llabel(+,u_\mathrm{C}(t),-)
    rlabel(,\unit{1}{\farad},)
    line to Origin
    source(up_ elen*.6, v); rlabel(-,\unit{-3}{\volt},+)
    dot(,,1); "$2$" rjust
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 17
% 图示RC电路，原处于直流稳态，当t=0时，开关从1投向2，试按uC(t) 的三要素
% 定性作出uC(t) 的波形图。
.PS
    cct_init
    elen = elen_
    Origin: Here
    dot; line left_ elen*.4
    source(up_ elen*.8, v); llabel(-,\unit{3}{\volt},+)
    reversed(`switch', right_ elen*.8,,O); llabel(1,,t=0)
    resistor(right_ elen*.6, E); llabel(,\unit{2}{\ohm},)
    inductor(down_ elen*.8); b_current(i_\mathrm{L}(t))
    rlabel(,\unit{1}{\henry},)
    line to Origin
    source(up_ elen*.6, v); rlabel(-,\unit{5}{\volt},+)
    dot(,,1); "$2$" rjust
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 18
% 求图示电路的入端阻抗Rab
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(right_ elen*.8, E); llabel(i,\unit{2}{\ohm},)
    b_current(); dot
    {
        consource(down_ elen*.8, i); b_current(2i,,O)
        dot
    }
    line right_ elen*.4
    resistor(down_ elen*.8, E); llabel(,\unit{2}{\ohm},)
    line left_ elen*1.2; "b" above
    gap(up_ elen*.8,1); "a" above
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 19
% 如图所示电路，原已处于稳态，在t=0时开关K断开，求uc(0+)和uL(0+).
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, v); llabel(-,\unit{12}{\volt},+)
    switch(up_ elen*.6); rlabel(,K,)
    line right_ elen*.6; dot
    {
        capacitor(down_ elen*.6); llabel(,\unit{2}{\farad},)
        dot
        {resistor(right_ elen, E); llabel(,\;\unit{3}{\ohm},); dot}
        inductor(down_ elen*.8); rlabel(,\unit{1}{\henry},)
        llabel(+,u_\mathrm{L},-); dot
    }
    line right_ elen
    resistor(down_ elen*.6, E); llabel(,\unit{6}{\ohm},)
    capacitor(down_ elen*.8); rlabel(,\unit{2}{\farad},)
    llabel(+,u_\mathrm{C},-)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 20
% 图a的VCR为u=10-2i，求b图的VCR。
.PS
    cct_init
    elen = elen_
    Origin: Here
    N1: nport(wid .3 ht .8 "A",0,0,1,0,5,dimen_*.6,N)
    move right_ elen*.3
    N2: nport(wid .3 ht .8 "A",0,0,1,0,5,dimen_*.6)
    move to N1.E1a; move left_ elen*.2
    arrowline(right_ elen*.2); llabel(,i,)
    gap(from N1.E1a down_ to N1.E1b, 1)
    clabel(+,u,-)
    source(from N2.E1a down_ to N2.E1b, i);
    b_current(,below_,O)
    dlabel(.18,-.12,\unit{4}{\ampere})
    arrowline(from N2.E1a right_ elen*.3); llabel(,i,)
    {line from N2.E1b right_ elen*.3}
    gap(down_ to (Here.x, N2.E1b.y), 1)
    clabel(+,u,-)
    move to N1.E1b then left_ elen*.35 then down_ elen*.3; "a" at Here
    move to N2.E1b then left_ elen*.15 then down_ elen*.3; "b" at Here
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 21
% 对于题图所示电路，已知U0 =2.5 V，试用戴维宁定理求解电阻R。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, v); llabel(-,\unit{10}{\volt},+)
    resistor(right_ elen*.6, E); llabel(,\unit{2}{\ohm},); dot
    {
        source(down_ elen*.8, i)
        b_current(\unit{5}{\ampere},below_,O); dot
    }
    resistor(right_ elen*.8, E); llabel(,\unit{1}{\ohm},); dot
    {
        resistor(down_ elen*.8, E); rlabel(,\unit{2}{\ohm},); dot
    }
    resistor(right_ elen*.6, E); llabel(,\unit{1}{\ohm},)
    resistor(down_ elen*.8, E); rlabel(,R,); llabel(+,U_0,-)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 22
% 试求题图所示电路的戴维宁等效电路。
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(left_ elen*.6, E); rlabel(,\unit{15}{\ohm},); dot
    {
        resistor(down_ elen*.6, E); llabel(,\unit{10}{\ohm},)
        source(down_ elen*.6, v); llabel(+,\unit{10}{\volt},-); dot
    }
    line left_ elen*.8; dot
    {
        resistor(down_ elen*1.2, E); llabel(,\unit{10}{\ohm},); dot
    }
    resistor(left_ elen*.8, E); rlabel(,\unit{30}{\ohm},); dot
    {
        resistor(down_ elen*1.2, E); llabel(,\unit{20}{\ohm},); dot
    }
    line left_ elen*.3
    source(down_ elen*1.2, i); b_current(\unit{1}{\ampere},below_,O)
    line to (Origin.x, Here.y)
    gap(up_ to Origin,1)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 23
% 电压，50Hz的正弦电源，供给二并联负载，它们向电源吸取电流，现并联电容使
% 功率因数提高到，求电路的入端电流和电容C。
.PS
    cct_init
    elen = elen_
    Origin: Here
    arrowline(right_ elen*.3); llabel(,\mathdot{I}\RSquote,)
    {
        line dashed down_ elen*.3
        capacitor(down_ elen*.2)
        line dashed down_ elen*.3
    }
    arrowline(right_ elen*.4); llabel(,\mathdot{I},); dot
    {
        ebox(down_ elen*.8, .3, .3); clabel(,P_1,); dot
    }
    line right_ elen*.5
    ebox(down_ elen*.8, .3, .3); clabel(,P_2,)
    line left_ elen*1.2; "$-$" above
    gap(up_ elen*.8, 1); clabel(,\mathdot{U},); "$+$" below
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 24
% 图示RC电路,若输入周期性矩形波电压u(t) (见图b), 在示波器上测得矩形波作
% 用期间的半周期内(0~T/2)的输出电压波形(见图c), 请继续作出(T/2~T)半周期
% 内的输出电压波形.
.PS
    cct_init
    elen = elen_
    Origin: Here
    capacitor(right_ elen*.6); llabel(,C,); dot
    R1: resistor(down_ elen*.6, E); rlabel(,R,); dot
    line left_ elen*.6; "$-$" above
    gap(up_ elen*.6, 1); clabel(,u(t),); "$+$" below
    line from R1.end right_ elen*.3
    line from R1.start right_ elen*.3; "$+$" below
    gap(down_ elen*.6, 1); clabel(,u_\mathrm{o}(t),); "$-$" above
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 25
% 求题图中的电流ic(t)和i(t)
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, v); llabel(-,4t\mathrm{e}^{-2t}\unit{}{\volt},+)
    arrowline(right_ elen*.7); llabel(,i(t),); dot
    {
        resistor(down_ elen*.8, E); llabel(,\unit{2}{\ohm},)
        rlabel(+,u(t),-); dot
    }
    line right_ elen*.7
    capacitor(down_ elen*.8); b_current(,,O)
    llabel(i_\mathrm{C}(t),,\unit{0.5}{\farad})
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 26
% 求题图中当iL(0)=0时电压源输出的电流i(t)。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, v); llabel(-,7\cos 2t\unit{}{\volt},+)
    arrowline(right_ elen*.4); llabel(,i(t),); dot
    {
        capacitor(down_ elen*.8); llabel(,\unit{1}{\farad},); dot
    }
    line right_ elen*.6
    inductor(down_ elen*.8);
    llabel(,\unit{1}{\henry},)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 27
% 写出题图所示电路以i2(t)为输出变量的输入?输出方程。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, v); llabel(-,u_\mathrm{S}(t),+)
    resistor(right_ elen*.6, E); llabel(,R_1,); dot
    {
        capacitor(down_ elen*.8); rlabel(,C,); dot
    }
    arrowline(right_ elen*.5); llabel(,i_2(t),)
    resistor(down_ elen*.8, E); rlabel(,R,)
    llabel(+,u_2(t),-)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 28
% 题图所示电路在换路前已工作了很长的时间，试求电路电感电流初始值和电容电
% 压及其一阶导数的初始值。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen, v); llabel(-,\unit{10}{\volt},+)
    resistor(right_ elen*.5, E); llabel(,\unit{80}{\ohm},); dot
    {
        resistor(down_ elen, E); llabel(,\unit{80}{\ohm},); dot
    }
    resistor(right_ elen*.5, E); llabel(,\unit{40}{\ohm},)
    inductor(right_ elen*.5); llabel(,\unit{1}{\milli\henry},); dot
    {
        resistor(down_ elen*.5, E); rlabel(,\unit{20}{\ohm},)
        capacitor(down_ elen*.5); rlabel(,\unit{1}{\micro\farad},); dot
    }
    line right_ elen*.3
    reversed(`switch', down_ elen,R,O); llabel(,S,\;(t=0))
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 29
% 题图所示电路在换路前已工作了很长的时间，试求开关闭合后电感电流和电容电
% 压的一阶导数的初始值。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, v); llabel(-,\unit{16}{\volt},+)
    resistor(right_ elen*.8, E); llabel(,\unit{16}{\ohm},); dot
    {
        resistor(down_ elen*.8, E); rlabel(,\unit{20}{\ohm},); dot
    }
    line right_ elen*.3; dot
    {
        capacitor(down_ elen*.8); llabel(,,\unit{0.5}{\micro\farad}); dot
    }
    {
        resistor(right_ elen, E); rlabel(,\unit{40}{\ohm},); dot
    }
    line up_ elen*.3
    inductor(right_ elen*.5); llabel(,\unit{0.5}{\henry},)
    switch(right_ elen*.5,,C); llabel(,S(t=0),)
    line down_ elen*.3
    resistor(down_ elen*.8, E); rlabel(,\unit{40}{\ohm},)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 30
% 在题图所示电路中，若电流i (t)=1cos314t A，试求电压uR(t)、uL(t)、uC(t)
% 和u(t)，并绘出相量图。
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(right_ elen*1.5, E); llabel(+,u_R(t),-)
    rlabel(,\unit{100}{\ohm},); b_current(i(t),below_)
    inductor(down_ elen*.6); rlabel(,\unit{0.1}{\henry},)
    llabel(+,u_L(t),-)
    capacitor(down_ elen*.6); rlabel(,\unit{10}{\micro\farad},)
    llabel(+,u_C(t),-); line to (Origin.x, Here.y); "$-$" above
    gap(up_ elen*1.2, 1); clabel(,u(t),); "$+$" below
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 31
% 在题图所示电路中，电容端电压相量为。试求和，并绘出相量图。  
.PS
    cct_init
    elen = elen_
    Origin: Here
    inductor(right_ elen*.8); llabel(,\;\;\unit{j100}{\ohm},)
    b_current(\mathdot{I}); dot
    {
        resistor(down_ elen*.6, E); rlabel(,\unit{150}{\ohm},); dot
    }
    line right_ elen
    capacitor(down_ elen*.6); rlabel(,-\unit{j200}{\ohm},)
    llabel(+,100\Varangle{0\degree}\unit{}{\volt},-)
    line to (Origin.x, Here.y); "$-$" above
    gap(up_ elen*.6, 1); clabel(,\mathdot{U},); "$+$" below
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 32
% 如图所示电路，若Uab=4V，求Us.
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(right_ elen*.6, E); llabel(,\unit{1}{\ohm},); dot
    "a" above
    inductor(right_ elen*.6); llabel(,\unit{j2}{\ohm},)
    line down_ elen*.5; dot
    {
        reversed(`inductor',left_ elen*.6); rlabel(,\unit{-j2}{\ohm},); dot
        "b" above
        resistor(left_ elen*.6, E); rlabel(,\unit{1}{\ohm},); dot
    }
    line down_ elen*.5
    source(left_ elen*1.2, v); rlabel(-,U_\mathrm{S},+)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 33
% 如图所示电路，求电流i.
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, v); llabel(-,\unit{8}{\volt},+)
    arrowline(right_ elen*.3); llabel(,i,); dot
    {
        resistor(down_ elen*.8, E); llabel(,\unit{8}{\ohm},); dot
    }
    resistor(right_ elen*.8, E); llabel(,\unit{4}{\ohm},)
    consource(down_ elen*.8, v); llabel(+,2i,-)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 34
% 求图所示二端口网络的Y参数。
.PS
    cct_init
    elen = elen_
    Origin: Here
    arrowline(right_ elen*.3); llabel(,I_1,); dot
    {
        resistor(right_ elen*.8, E); llabel(,R_1,); dot
        reversed(`arrowline', right_ elen*.3, E)
        llabel(,I_2,)
    }
    resistor(down_ elen*.8, E); llabel(,R_2,); dot
    {
        line left_ elen*.3; "$-$" above
        gap(up_ elen*.8,1); clabel(,U_1,); "$+$" below
    }
    resistor(right_ elen*.8, E); llabel(,R_4,); dot
    {resistor(up_ elen*.8, E); llabel(,R_3,)}
    line right_ elen*.3; "$-$" above
    gap(up_ elen*.8,1); clabel(,U_2,); "$+$" below
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 35
% 如图所示电路，原已处于稳态，在t=0时开关K断开，求电容电压和其导数的初始值。.
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.5, v); llabel(-,\unit{12}{\volt},+)
    switch(up_ elen*.5); llabel(,K,)
    line right_ elen*.6; dot
    {
        capacitor(down_ elen*.5); rlabel(,\unit{2}{\farad},); dot
        {
            resistor(right_ elen*.6, E); llabel(,\unit{3}{\ohm},); dot
        }
        inductor(down_ elen*.5); rlabel(,\unit{1}{\henry},); dot
    }
    line right_ elen*.6
    resistor(down_ elen*.5, E); llabel(,\unit{6}{\ohm},)
    capacitor(down_ elen*.5); llabel(+,u_C,-); rlabel(,\unit{2}{\farad},)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 36
% 如图所示谐振电路，电源角频率，，谐振时Ur0=2V、Uc0=100V，求C的值.
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.6, v); llabel(-,U_\mathrm{S},+)
    resistor(right_ elen*.8, E); llabel(,r,); rlabel(+,U_{r0},-)
    inductor(right_ elen*.5); llabel(,L,)
    capacitor(down_ elen*.6); llabel(+,u_{C0},-); rlabel(,C,)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 37
% 如图所示电路，求电压u
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(up_ elen*.7, E); llabel(,\unit{2}{\ohm},); dot
    {
        line up_ elen*.4; source(right_ elen*1.4, v)
        llabel(+,\unit{3}{\volt},-)
        line down_ elen*.4
    }
    resistor(right_ elen*.7, E); llabel(+,U,-); rlabel(,\unit{1}{\ohm},)
    dot
    {
        source(down_ elen*.7, i); llabel(\unit{1}{\ampere},,)
        b_current(,,O); dot
    }
    resistor(right_ elen*.7, E); llabel(,\unit{1}{\ohm},); dot
    source(down_ elen*.7, i); llabel(\unit{2}{\ampere},,)
    b_current(,,O)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 38
% 如图（a）所示电路，已知V，求其戴维南等效电路（b）中的参数和
.PS
    cct_init
    elen = elen_
    Origin: Here
    capacitor(left_ elen*.5); rlabel(,\unit{-j2}{\ohm},); dot
    {
        inductor(down_ elen*.5); llabel(,\unit{j5}{\ohm},)
        source(down_ elen*.5, v); llabel(+,U_\mathrm{S},-); dot
    }
    capacitor(left_ elen*.6); rlabel(,\unit{-j2}{\ohm},)
    resistor(down_ elen, E); llabel(,\unit{4}{\ohm},)
    line to (Origin.x, Here.y)
    gap(up_ elen, 1)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 39
% 如图所示电路，原已处于稳态，在t=0时开关K断开，求时的iL(t).
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, i); llabel(,,\unit{3}{\ampere})
    b_current(,,O,E)
    line right_ elen*.3; dot
    {
        switch(down_ elen*.8); llabel(,K,); dot
    }
    line right_ elen*.4; dot
    {
        resistor(down_ elen*.8, E); llabel(,\unit{6}{\ohm},); dot
    }
    resistor(right_ elen*.6, E); llabel(,\unit{3}{\ohm},)
    inductor(down_ elen*.8); llabel(,\unit{3}{\henry},)
    b_current(i_L(t))
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 40
% 试确定图示电路中不同的二种输入电压us时的输出电压u2
%（1） us(t)＝2V, （2）us(t)＝2V, 
.PS
    cct_init
    elen = elen_
    Origin: Here
    line left_ elen*.5
    L1:inductor(down_ elen*.5); llabel(,\unit{2}{\henry},)
    line left_ elen*.15; dot
    {resistor(down_ elen*.5, E); rlabel(,\unit{2}{\ohm},); dot}
    line left_ elen*.15
    L2:inductor(up_ elen*.5); llabel(,\unit{2}{\henry},)
    {move to (L1.start+L2.end)/2; "\unit{2}{\henry}" above;
    move down elen*.0; [arrowht=.05; arrowwid=.025; arcd(Here, elen*.15, 20, 160) <->]}
    {move to L1.start; "*" ljust below; move to L2.start; "*" rjust}
    reversed(`arrowline', left_ elen*.6); rlabel(,i_1,)
    source(down_ elen, v); rlabel(+,u_\mathrm{S},-)
    line right_ to (Origin.x, Here.y); "$-$" above
    gap(up_ elen, 1); clabel(,u_2,); "$+$" below
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 41
% 求下图电路的电压U.
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.5, v); llabel(-,\unit{24}{\volt},+)
    resistor(right_ elen*.4, E); llabel(,\unit{6}{\ohm},); dot
    {resistor(down_ elen*.5, E); llabel(,\unit{3}{\ohm},); dot; "b" below}
    {resistor(right_ elen*.7, E); llabel(,\unit{4}{\ohm},); dot; "a" ljust above}
    line up_ elen*.4
    source(right_ elen*.7, i); llabel(,,\unit{4}{\ampere})
    b_current(,,O,E); line down_ elen*.4 then right_ elen*.3
    resistor(down_ elen*.5, E); rlabel(,\unit{2}{\ohm},)
    llabel(+,U,-); line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 42
% 求下图电路的输入电阻Ri。
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(right_ elen*.6, E); llabel(,R_1,)
    resistor(down_ elen*.7, E); rlabel(,R_2,); b_current(I_2)
    line right_ elen*.3; dot
    {resistor(down_ elen*.4, E); llabel(,R_3,); dot}
    {line right_ elen*.5; resistor(up_ elen*.7, E); rlabel(,,R_4); dot}
    consource(up_ elen*.7, i)
    b_current(\beta I_2,below_,O); line right_ elen
    resistor(down_ elen*1.1, E); rlabel(,R_5,)
    line to (Origin.x, Here.y); gap(up_ elen*1.1, 1); llabel(,R_\mathrm{i},)
    move down_ elen*.5; line -> right elen*.2
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 43
% 计算下图电路中的电压U1与U2.
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, i); b_current(\unit{8}{\ampere},,O,E)
    line right_ elen*.8; dot
    {resistor(down_ elen*.8, E); rlabel(,\unit{18}{\ohm},);
    llabel(+,U_1,-); dot}
    resistor(right_ elen*.9, E); llabel(,\unit{4}{\ohm},); dot
    {resistor(down_ elen*.8, E); rlabel(,\unit{6}{\ohm},); dot}
    line right_ elen*.7
    resistor(down_ elen*.8, E); rlabel(,\unit{3}{\ohm},)
    llabel(+,U_2,-)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 44
% 求下图的戴维南等效电路。
.PS
    cct_init
    elen = elen_
    Origin: Here
    line left_ elen*.2; dot
    {consource(left_ elen*.7, i); rlabel(,0.8I,); b_current(,below_,O,E); dot}
    line down_ elen*.3
    resistor(left_ elen*.7, E); llabel(,\unit{10}{\ohm},);
    line up_ elen*.3
    resistor(left_ elen*.7, E); rlabel(,\unit{30}{\ohm},I)
    b_current(,below_,O,E)
    source(down_ elen*.8, v); llabel(+,\unit{12}{\volt},-)
    line to (Origin.x, Here.y); "b" above
    gap(up_ elen*.8, 1); "a" below
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 45
% 求下图中的UA，UB，UC各为多少？
.PS
    cct_init
    elen = elen_
    Origin: Here
    line down_ elen*.1; dot
    {line left_ elen*.4; source(down_ elen*.6, i);
    llabel(,\unit{8}{\ampere},); rlabel(+,U_A,-); b_current(,,O);
    line right_ elen*.4; dot}
    line right_ elen*.4
    resistor(down_ elen*.6, E); llabel(,\unit{2}{\siemens},);
    line left_ elen*.4 then down_ elen*.1; dot
    {line left_ elen*.4; source(down_ elen*.6, i);
    llabel(,\unit{8}{\ampere},); rlabel(+,U_B,-); b_current(,,O,E);
    line right_ elen*.4; dot}
    line right_ elen*.4
    resistor(down_ elen*.6, E); llabel(,\unit{0.5}{\siemens},);
    line left_ elen*.4 then down_ elen*.1 then right_ elen*1.5 then up_ elen*.45
    dot
    {line left_ elen*.4; source(up_ elen*.6, i);
    rlabel(,\unit{24}{\ampere},); llabel(-,U_C,+); b_current(,,O,E);
    line right_ elen*.4; dot}
    line right_ elen*.4
    resistor(up_ elen*.6, E); rlabel(,\unit{4}{\siemens},);
    line left_ elen*.4 then up_ elen*.45
    arrowline(left_ elen*1.5); llabel(,I,)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 46
% 如下图所示电路，试问：电阻R为何值时可获得的最大功率，最大功率为多少？ 
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.6, v); llabel(-,\unit{24}{\volt},+); dot
    {line right_ elen*.3; resistor(down_ elen*.6, E);
    llabel(,\unit{6}{\ohm},); dot}
    resistor(up_ elen*.4, E); llabel(,\unit{6}{\ohm},)
    line right_ elen*.9; dot
    {resistor(down_ elen, E); rlabel(\unit{3}{\ohm},); dot}
    line right_ elen*.4
    resistor(down_ elen, E); rlabel(R,)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 47
% 图示电路中，uS=ε(t),  R1 = 6Ω，R2 = 3Ω，L = 2H，求电流i的单位阶跃响应。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, v); rlabel(-,u_\mathrm{S},+)
    resistor(right_ elen*.8, E); llabel(,R_1,); b_current(); dot
    {
        inductor(down_ elen*.8); rlabel(,L,i); b_current(,below_,O,E);
        dot
    }
    line right_ elen*.3
    resistor(down_ elen*.8, E); llabel(,R_2,)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 48
% 画出下图最简单的等效电路.
.PS
    cct_init
    elen = elen_
    Origin: Here
    line left_ elen*.4; dot
    {
        source(down_ elen*.7, i); b_current(\unit{5}{\ampere},,O,E); dot
        {line left_ elen*.4}
        source(down_ elen*.7, i); b_current(\unit{2}{\ampere},,O,E); dot
    }
    line left_ elen*.4
    resistor(down_ elen*.7, E); rlabel(,\unit{5}{\ohm},); dot
    source(down_ elen*.7, v); rlabel(+,\unit{6}{\volt},-)
    line to (Origin.x, Here.y); "b" ljust
    gap(up_ elen*1.4, 1); "a" ljust
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 49
% 如下图所示电路：（1）用叠加定理求和U；（2）电流源增加10倍时U。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, v); llabel(-,\unit{10}{\volt},+)
    resistor(right_ elen*.6, E); llabel(,\unit{6}{\ohm},)
    b_current(I_1); dot
    {resistor(down_ elen*.8, E); llabel(,\unit{4}{\ohm},); rlabel(+,U,-);
    b_current(I_2); dot}
    line right_ elen*.7
    source(down_ elen*.8, i); b_current(\unit{4}{\ampere},,O)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 50
% 如下图所示，求ab处的戴维南等效电路和诺顿等效电路。
.PS
    cct_init
    elen = elen_
    Origin: Here
    line left_ elen*.8; dot
    {
        resistor(up_ elen*.4, E); rlabel(,\unit{6}{\ohm},); dot
        {
            line left_ elen*.35
            resistor(up_ elen*.6, E); rlabel(,\unit{6}{\ohm},); dot
        }
        line right_ elen*.35
        source(up_ elen*.6, v); rlabel(+,\unit{30}{\volt},-); dot
    }
    line left_ elen*.6; dot
    {
        resistor(up_ elen, E); rlabel(\unit{3}{\ohm},); dot
    }
    line left_ elen*.3
    resistor(up_ elen*.4, E); llabel(,\unit{7}{\ohm},)
    source(up_ elen*.6, i); b_current(\unit{4}{\ampere},,O,E)
    line to (Origin.x, Here.y); "a" ljust
    gap(down_ elen, 1); "b" ljust
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 51
% 图示电路中，R1=4Ω，R2=1Ω，R3=6Ω，Us=20V，换路前已达到稳态，求换路后uc
% （0+）、ic（0+）、 iL（0+）。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*1.1, v); llabel(-,U_\mathrm{S},+)
    reversed(`switch', right_ elen*.4,L,O); llabel(,S(t=0))
    resistor(right_ elen*.4,E); llabel(,R_1,); dot
    {
        resistor(down_ elen*.7, E); rlabel(,R_2,); llabel(i_C)
        b_current()
        capacitor(down_ elen*.4); rlabel(+,u_C,-); llabel(C,); dot
    }
    line right_ elen*.5
    resistor(down_ elen*.7, E); llabel(i_L,R_3,); b_current()
    inductor(down_ elen*.4); llabel(+,u_L,-); rlabel(,L,)
    line to Origin
    move right_ elen*.25; dot
    line up_ elen*.95; dot(,,1)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 52
% 图示电路中，R1=1Ω，R2=2Ω，C=3F，试计算uc的单位阶跃响应。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, i); b_current(i_\mathrm{S},below_,O,E)
    line right_ elen*.4; dot
    {
        resistor(down_ elen*.8, E); llabel(,R_1,); dot
    }
    resistor(right_ elen*.7, E); rlabel(,R_2,)
    capacitor(down_ elen*.8); llabel(+,u_C,-); rlabel(,,C)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 53
% 图示电路以I1、I2、I3为变量列出下图的网孔方程。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*1.6, v); llabel(-,\unit{5}{\volt},+)
    line right_ elen*.8; dot
    {
        resistor(down_ elen*.8, E); rlabel(,\unit{1}{\ohm},); dot
        {
        consource(right_ elen*.8, v); llabel(+,5I_\mathrm{a},-); dot
        }
        resistor(down_ elen*.8, E); llabel(,\unit{3}{\ohm},)
        b_current(I_\mathrm{a},below_); dot
    }
    line right_ elen*.8
    resistor(down_ elen*.8, E); llabel(,\unit{4.5}{\ohm},)
    resistor(down_ elen*.8, E); llabel(,\unit{4}{\ohm},)
    line to Origin
#    spline -> from (elen*.2, elen*.2) up_ elen*1.2 then right_ elen*.2 then down_ elen*1.2
#    move to (elen*.2, elen*.2); "$I_1$" ljust
#    arcd((elen*1.2, elen*1.2), elen*.2, -160, -10) -> cw
#    arcd((elen*1.2, elen*.4), elen*.2, 160, -90) -> cw
#    move to (elen*1.3, elen*1.35); "$I_2$" above
#    move to (elen*1.3, elen*.25); "$I_3$" below
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 54
% 图示二端口网络的Z参数中，（   ）。D
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(right_ elen*.8, E); llabel(,R_1,)
    b_current(\mathdot{I}_1); dot
    {
        resistor(right_ elen*.8, E); llabel(,R_3,)
        b_current(\mathdot{I}_2,,,E)
    }
    consource(down_ elen*.7, v); llabel(+,2\mathdot{U}_2,-)
    resistor(down_ elen*.5, E); llabel(,R_2,); dot
    {
        line right_ elen*.8; "$-$" above; gap(up_ elen*1.2, 1);
        clabel(,\mathdot{U}_2,); "$+$" below
    }
    line left_ elen*.8; "$-$" above; gap(up_ elen*1.2, 1)
    clabel(,\mathdot{U}_1,); "$+$" below
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 55
% 图示二端口网络的Z参数中，（   ）。C
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(right_ elen*.7, E); llabel(,R,)
    b_current(\mathdot{I}_1)
    inductor(right_ elen*.5); llabel(,\mathrm{j}X_L,); dot
    {
        reversed(`arrowline', right_ elen*.6)
        llabel(,\mathdot{I}_2,)
    }
    capacitor(down_ elen*.7); rlabel(,-\mathrm{j}X_C,); dot
    {
        line right_ elen*.6; "$-$" above; gap(up_ elen*.7, 1);
        clabel(,\mathdot{U}_2,); "$+$" below
    }
    line left_ elen*1.2; "$-$" above; gap(up_ elen*.7, 1)
    clabel(,\mathdot{U}_1,); "$+$" below
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 56
% 图示二端口网络的Z参数中，（   ）。C
.PS
    cct_init
    elen = elen_
    Origin: Here
    arrowline(right_ elen*.3); llabel(,\mathdot{I}_1); dot
    {
        resistor(down_ elen*.8, E); llabel(,\unit{5}{\siemens},); dot
    }
    consource(right_ elen, i); b_current(3\mathdot{U}_1,,O,E); dot
    {
        reversed(`arrowline', right_ elen*.3)
        llabel(,\mathdot{I}_2,)
    }
    resistor(down_ elen*.8, E); rlabel(,\unit{15}{\siemens},); dot
    {
        line right_ elen*.3; "$-$" above; gap(up_ elen*.8, 1);
        clabel(,\mathdot{U}_2,); "$+$" below
    }
    line left_ elen*1.3; "$-$" above; gap(up_ elen*.8, 1)
    clabel(,\mathdot{U}_1,); "$+$" below
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 57
% 图示二端口网络的Z参数中，（   ）。C
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(right_ elen*.8, E); llabel(,\unit{4}{\ohm})
    b_current(\mathdot{I}_1)
    consource(right_ elen*.8, v); b_current(\mathdot{I}_2,,,E)
    rlabel(+,2\mathdot{U}_2,-); line right_ elen*.2
    move down elen*.8
    line left_ elen*1.8
    move right_ elen*1.8
    gap(up_ elen*.8, 1);
    clabel(-,\mathdot{U}_2,+)
    move left_ elen*1.8
    gap(down_ elen*.8, 1)
    clabel(+,\mathdot{U}_1,-)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 58
% 图示二端口网络的Y参数中，（   ）。A
.PS
    cct_init
    elen = elen_
    Origin: Here
    arrowline(right_ elen*.4); llabel(,\mathdot{I}_1); dot
    {
        reversed(`arrowline', right_ elen*.6); llabel(,\mathdot{I}_2)
    }
    resistor(down_ elen*.8, E); llabel(,Z,); dot
    {
        line right_ elen*.6
        gap(up_ elen*.8, 1);
        clabel(-,\mathdot{U}_2,+)
    }
    line left_ elen*.4
    gap(up_ elen*.8, 1)
    clabel(-,\mathdot{U}_1,+)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 59
% 图示二端口网络的Y参数中，（   ）。A
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(right_ elen, E); llabel(,Z,); b_current(\mathdot{I}_1)
    b_current(\mathdot{I}_2,,,E)
    move down_ elen*.8
    line left_ elen
    gap(up_ elen*.8, 1)
    clabel(-,\mathdot{U}_1,+)
    move right_ elen
    gap(down_ elen*.8, 1);
    clabel(+,\mathdot{U}_2,-)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 60
% 求下图所示电路的二端口网络的Y参数。
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(right_ elen*.8, E); llabel(,R_1,i_1)
    b_current(,,O,E); dot
    {
        reversed(`arrowline', right_ elen*.3)
        llabel(,i_2,)
    }
    resistor(down_ elen*.8, E); rlabel(,R_2,); dot
    {
        line right_ elen*.3
        gap(up_ elen*.8, 1);
        clabel(-,u_2,+)
    }
    line left_ elen*.8
    gap(up_ elen*.8, 1)
    clabel(-,u_1,+)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 61
% 如下图所示，试问：
%（1） 当电阻R为多大时，它吸收功率最大？并求该最大功率；（2） 若R=80Ω，
% 欲使R中的电流为零，则a,b间应接一个什么理想元件？其参数值多大？画出对应
% 的电路图。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.6, v); llabel(-,\unit{50}{\volt},+)
    resistor(right_ elen*.6, E); llabel(,\unit{20}{\ohm},); dot
    {
        resistor(down_ elen*.6, E); llabel(,\unit{20}{\ohm},); dot
    }
    {
        resistor(right_ elen*.8, E); llabel(,\unit{20}{\ohm},); dot
    }
    line up_ elen*.4
    resistor(right_ elen*.8, E); llabel(,\unit{20}{\ohm},)
    line down_ elen*.4; "a" ljust above
    {
        resistor(down_ elen*.6, E); llabel(,R,); dot; "b" below ljust
    }
    resistor(right_ elen*.6, E); llabel(,\unit{20}{\ohm},)
    source(down_ elen*.6, v); llabel(+,\unit{50}{\volt},-)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 62
% 如图所示线性电路，已知R5=8?时，I5=20A，I0= -11A；R5=2时，I5=50A，I0=
% -5A。试求：R5为何值时，它消耗的功率最大，并求出最大功率。
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(up_ elen*.5, E); llabel(,R_0,); dot
    {
        resistor(right_ elen*.6, E); rlabel(,R_1,); dot
        resistor(right_ elen*.7, E); rlabel(,R_3,); dot
    }
    line up_ elen*.7
    resistor(right_ elen*.6, E); llabel(,R_2,); dot
    {
        resistor(down_ elen*.7, E); llabel(I_5,R_5,)
        variable(); b_current()
    }
    {
        resistor(right_ elen*.7, E); llabel(,R_4,); dot
    }
    line up_ elen*.5
    source(right_ elen*.7, i); b_current(\!\!I_\mathrm{S},,O)
    line down_ elen*1.7
    source(left_ elen*.9, v); llabel(-,U_\mathrm{S},+)
    arrowline(left_ elen*.4); llabel(,I_0,)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 63
% 图示电路中受控电压源的电压Ud= rIa
% (1) 以I1、I2、I3为变量列出下图的网孔方程； (2) 求图中受控源的电压Ud。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*1.6, v); llabel(-,\unit{5}{\volt},+)
    line right_ elen*.8; dot
    {
        resistor(down_ elen*.8, E); rlabel(,\unit{1}{\kilo\ohm},); dot
        {
        consource(right_ elen*.8, v); llabel(+,U_\mathrm{d},-); dot
        }
        resistor(down_ elen*.8, E); llabel(,\unit{3}{\kilo\ohm},)
        b_current(I_\mathrm{a},below_); dot
    }
    line right_ elen*.8
    resistor(down_ elen*.8, E); llabel(,\unit{4.5}{\kilo\ohm},)
    resistor(down_ elen*.8, E); llabel(,\unit{4}{\kilo\ohm},)
    line to Origin
    spline -> from (elen*.2, elen*.2) up_ elen*.8 then right_ elen*.3 then down_ elen*.8
    move to (elen*.2, elen*.2); "$I_1$" ljust
    arcd((elen*1.2, elen*1.2), elen*.2, -160, -10) -> cw
    arcd((elen*1.2, elen*.4), elen*.2, 160, -90) -> cw
    move to (elen*1.3, elen*1.35); "$I_2$" above
    move to (elen*1.3, elen*.25); "$I_3$" below
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 64
% 如图所示电路，当3A的电源断开时，2A的电源输出功率为28W，这时U2=8V。当2A
% 的电源断开时，3A的电源输出功率为54W，这时U1=12V。试求：两个电源同时作
% 用时，每个电源的输出功率。
.PS
    cct_init
    elen = elen_
    Origin: Here
    N: nport(wid elen*.5 ht elen "\parbox[c]{.5in}{\centering 线性\\ 
    电阻\\ 网络}",,,,,6)
    move to N.W1a
    line left_ elen*.3
    source(down_ to (Here.x, N.W1b.y), i)
    b_current(I_\mathrm{s1}=\unit{2}{\ampere},below_,O)
    line right_ elen*.3; "$-$" above
    gap(up_ to (Here.x, N.W1a.y)); clabel(,U_1,); "$+$" below
    line from N.E1a right_ elen*.3
    source(down_ to (Here.x, N.E1b.y), i)
    b_current(I_\mathrm{s2}=\unit{3}{\ampere},,O)
    line left_ elen*.3; "$-$" above
    gap(up_ to (Here.x, N.E1a.y)); clabel(,U_2,); "$+$" below
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 65
% 电路如下图所示，应用叠加定理求电压U。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*1.1, v); llabel(-,U_\mathrm{S},+)
    resistor(right_ elen*.6, E); llabel(,R_1,)
    b_current(I_1); dot
    {
        "$+$" rjust below
        resistor(down_ elen*.4, E); llabel(,R_2,)
        consource(down_ elen*.7, v); llabel(+,rI_1,-); dot
        "$-$" rjust above
        move up_ elen*.6; "$U$" rjust
    }
    line right_ elen*.7
    source(down_ elen*1.1, i); b_current(I_\mathrm{S},,O)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 66
% 如下图所示电路，从中去掉那个元件才能使用叠加定理求U，并用叠加定理求U0
% 。若使U=23V，电源应如何变动。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen, i); b_current(\unit{3}{\ampere},,O,E)
    line right_ elen*.3; dot
    {
        resistor(down_ elen, E); llabel(,\unit{5}{\ohm},); dot
    }
    line right_ elen*.6; dot
    {
        diode(down_ elen); llabel(,D,); dot
    }
    resistor(right_ elen*.5, E); llabel(,\unit{1}{\ohm},); dot
    {
        resistor(down_ elen*.4, E); llabel(,\unit{6}{\ohm},)
        source(down_ elen*.6, v); llabel(+,\unit{8}{\volt},-); dot
    }
    line right_ elen*.9
    consource(down_ elen, i); b_current(U_0/6,,O,E)
    rlabel(+,U_0,-)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 67
% 求图示电路中独立电源的功率。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, i); b_current(\unit{2}{\ampere},,O,E)
    rlabel(-,U,+)
    resistor(right_ elen*.8, E); rlabel(,\unit{5}{\ohm},)
    llabel(+,U_1,-); dot
    {
        source(down_ elen*.8, v); llabel(-,\unit{3}{\volt},+)
        b_current(I,below_,O,E); dot
    }
    resistor(right_ elen*.8, E); llabel(,\unit{20}{\ohm},)
    consource(down_ elen*.8, i); llabel(,,0.05U_1)
    b_current(,,O,E)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 68
% 求图示电路中电压U1，U2 。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, i); b_current(\unit{6}{\ampere},,O,E)
    rlabel(-,U_1,+)
    {
        line up_ elen*.4
        source(right_ elen*1.6, i)
        b_current(\unit{10}{\ampere},,O,E)
        line down_ elen*.4
    }
    resistor(right_ elen*.8, E); rlabel(,\unit{2}{\ohm},)
    b_current(I_1); dot
    {
        resistor(down_ elen*.8, E); llabel(,,\unit{1}{\ohm})
        b_current(I_2,below_); dot
    }
    resistor(right_ elen*.8, E); rlabel(,\unit{1}{\ohm},)
    b_current(I_3); dot
    consource(down_ elen*.8, i); rlabel(+,U_2,-); llabel(2U_1)
    b_current(,,O)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 69
% 试用叠加定理图示电路中的电压U和电流Ix。
.PS
    cct_init
    elen = elen_
    Origin: Here
    consource(up_ elen*.8, v); llabel(-,4I_x,+)
    resistor(right_ elen*.6, E); llabel(,\unit{5}{\ohm},); dot
    {
        source(down_ elen*.8, i); rlabel(+,U,-)
        b_current(\unit{2}{\ampere},,O); dot
    }
    resistor(right_ elen*.6, E); llabel(,\unit{2}{\ohm},)
    "$I_x$" ljust
    source(down_ elen*.8, v); llabel(+,\unit{5}{\volt},-)
    b_current()
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
% fig 71
% 求下图的戴维南等效电路。
.PS
    cct_init
    elen = elen_
    Origin: Here
    line left_ elen*.2; dot
    {
        resistor(left_ elen*.7, E); llabel(,\unit{3}{\ohm},); dot
    }
    line up_ elen*.3
    consource(left_ elen*.7, i); b_current(\;5I_1,below_,O)
    line down_ elen*.3
    {
        resistor(down_ elen*.6, E); rlabel(,\unit{1}{\ohm},); dot
    }
    resistor(left_ elen*.7, E); rlabel(,\unit{9}{\ohm},)
    b_current(I_1,below_,,E)
    source(down_ elen*.6, v); rlabel(+,\unit{10}{\volt},-)
    line to (Origin.x, Here.y); "b" ljust
    gap(up_ elen*.6, 1); "a" ljust
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 72
% 如下图所示，求ab处的戴维南等效电路。
.PS
    cct_init
    elen = elen_
    Origin: Here
    line left_ elen*.3; dot
    {
        source(down_ elen*.6, v); llabel(+,\unit{30}{\volt},-)
        line left_ elen*.2; dot
        resistor(down_ elen*.4, E); llabel(,\unit{6}{\ohm},); dot
    }
    line left_ elen*.4; dot
    {
        resistor(down_ elen*.6, E); rlabel(,\unit{6}{\ohm},)
        line right_ elen*.2
    }
    line left_ elen*.6; dot
    {
        resistor(down_ elen, E); llabel(,\unit{3}{\ohm},); dot
    }
    line left_ elen*.3
    source(down_ elen*.6, i); b_current(\unit{4}{\ampere},below_,O)
    resistor(down_ elen*.4, E); rlabel(,\unit{7}{\ohm},)
    line to (Origin.x, Here.y); "b" ljust
    gap(up_ elen, 1); "a" ljust
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 73
% 下图中，R1=18Ω；R2=4Ω；R3=6Ω；R4=8Ω；R5=12Ω；Us=60V；RL可调，试求RL所
% 能获得的最大功率Pmax.
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(up_ elen*.5, E); llabel(,R_2,); dot
    {
        resistor(right_ elen*.5, E); llabel(,R_5,)
        source(right_ elen*.8, v); llabel(-,U_\mathrm{S},+); dot
        resistor(down_ elen*.5, E); llabel(,R_4,); dot
    }
    resistor(up_ elen*.5, E); llabel(,R_1,)
    line right_ elen*1.3; dot
    {
        resistor(down_ elen*.5, E); llabel(,R_3,)
    }
    line right_ elen*.7
    resistor(down_ elen, E); llabel(,R_\mathrm{L},)
    rlabel(+,U,-); variable()
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 74
% 含受控源（CCCS）的电阻电路，分别求K闭合前后：RL获得的最大功率。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*1.2, v); llabel(+,\unit{2}{\volt},-)
    resistor(right_ elen*.6, E); rlabel(,\unit{2}{\ohm},); dot
    {
        consource(down_ elen*1.2, i); llabel(,2I,); b_current(,,O); dot
    }
    resistor(right_ elen*.8, E); llabel(,\unit{2}{\ohm},)
    b_current(I,below_,O)
    source(right_ elen*.6, v); llabel(-,\unit{4}{\volt},+); dot
    {
        switch(down_ elen*.6); rlabel(,K,)
        resistor(down_ elen*.6, E); rlabel(,\unit{2}{\ohm},); dot
    }
    line right_ elen*.4
    resistor(down_ elen*1.2, E); llabel(,R_\mathrm{L},)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 75
% 用回路电流法求图示电路的支路电流及电流源两端的电压。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*1.6, v); llabel(-,\unit{8}{\volt},+)
    b_current(i_1,below_,O,E)
    resistor(right_ elen*.8, E); llabel(,\unit{8}{\ohm},); dot
    {
        resistor(down_ elen*.95, E); llabel(i_2,\unit{2}{\ohm},)
        b_current(); move up_ elen*.3
        source(down_ elen*.95, i); b_current(\unit{1}{\ampere},below_,O,E); dot
    }
    resistor(right_ elen*.8, E); llabel(,\unit{4}{\ohm},)
    b_current(i_3,below_,O,E)
    source(down_ elen*1.6, v); llabel(+,\unit{10}{\volt},-)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 76
% 用回路电流方程求图示电路中的电流I1 。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, i); b_current(\unit{1}{\ampere},,O,E); dot
    {
        resistor(right_ elen*.6, E); llabel(,\unit{2}{\ohm},); dot
        {
            resistor(right_ elen*.6, E); llabel(,\unit{2}{\ohm},); dot
        }
        consource(down_ elen*.8, i); b_current(2I_1,,O); dot
    }
    line up_ elen*.4
    resistor(right_ elen*1.2, E); llabel(,\unit{1}{\ohm},)
    b_current(\;\;i_1,,O,E)
    line down_ elen*.4
    resistor(down_ elen*.8, E); llabel(,\unit{4}{\ohm},)
    line to Origin
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
% fig 78
% 试用结点法求图示电路中2A电流源发出的功率。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, i); b_current(\unit{2}{\ampere},,O,E)
    line right_ elen*.4; dot
    {
        resistor(down_ elen*.8, E); llabel(,\unit{10}{\ohm},); dot
    }
    source(right_ elen*1.2, v); llabel(+,\unit{5}{\volt},-); dot;
    {
        resistor(down_ elen*.8, E); rlabel(,\unit{10}{\ohm}); dot
    }
    line right_ elen*.4
    source(down_ elen*.8, i); b_current(\unit{1}{\ampere},,O)
    line left_ elen*.4
    source(left_ elen*1.2, v); llabel(-,\unit{5}{\volt},+)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 79
% 求图示电路中的电流I和电压U。
.PS
    cct_init
    elen = elen_
    Origin: Here
    dot; "$-$" above rjust
    {
        consource(up_ elen*.8, v); rlabel(-,3U,+); move down_ elen*.2
        resistor(up_ elen*.8, E); rlabel(,\unit{2}{\ohm},)
        dot; "$+$" rjust below
        move down_ elen*.7
        "$U$" rjust
    }
    resistor(left_ elen*.9, E); rlabel(,\unit{2.5}{\ohm},)
    source(up_ elen*1.4, v); llabel(-,\unit{8}{\volt},+)
    b_current(I,below_)
    resistor(right_ elen*.9, E); rlabel(,\unit{1.5}{\ohm},)
    line right_ elen*.7
    source(down_ elen*1.4, i); b_current(\unit{1}{\ampere},,O)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 80
% 用等效变换求图所示电路中的电流I 。
.PS
    cct_init
    elen = elen_
    Origin: Here
    consource(up_ elen*.8, i); b_current(2I,,O,E)
    line right_ elen*.4; dot
    {
        resistor(down_ elen*.8, E); llabel(,\unit{2}{\ohm},); dot
    }
    resistor(right_ elen, E); rlabel(,\unit{2}{\ohm},); dot
    {
        resistor(down_ elen*.8, E); rlabel(,\unit{8}{\ohm},)
        b_current(I); dot
    }
    line right_ elen*.4
    source(down_ elen*.8, i); b_current(\unit{1}{\ampere},,O)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 81
% 用等效变换求图所示电路中的电流I 。
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(up_ elen*.8, E); llabel(,\unit{1}{\ohm},); dot
    {
        resistor(right_ elen*.8, E); llabel(,\unit{2}{\ohm},); dot
        {
            resistor(right_ elen*.8, E); rlabel(,\unit{2}{\ohm},); dot
        }
        source(down_ elen*.8, i)
        b_current(\unit{2}{\ampere},below_,O); dot
    }
    line up_ elen*.6
    source(right_ elen*1.6, i); b_current(\unit{1}{\ampere},,O,E)
    line down_ elen*.6
    resistor(down_ elen*.8, E); llabel(,\unit{1}{\ohm})
    line to Origin
    spline -> from (elen*.2, elen*1.2) right_ elen*1.2 then down_ elen*.2 then left_ elen*.8
    "$I_\mathrm{L1}$" at (elen*.8, elen*1.1)
    arcd((elen*.35, elen*.3), elen*.2, 90, -150) -> cw
    "$I_\mathrm{L2}$" at (elen*.35, elen*.3)
    arcd((elen*1.15, elen*.3), elen*.2, 90, -150) -> cw
    "$I_\mathrm{L3}$" at (elen*1.15, elen*.3)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 82
% 求图示电路的输入阻抗。
.PS
    cct_init
    elen = elen_
    Origin: Here
    line right_ elen*.4; dot
    {
        inductor(down_ elen*.8); rlabel(,\unit{1}{\henry},);
        {
            move to last [].n; "*" ljust
        }
        dot
    }
    inductor(right_ elen*.8); llabel(,\unit{4}{\henry},)
    {move to last [].e; "*" below}
    inductor(down_ elen*.8); rlabel(,,\unit{0.2}{\farad})
    line left_ elen*1.2; "$1'$" rjust
    gap(up_ elen*.8, 1); "$1$" rjust
    arca(from (elen*.9, -elen*.1) to (elen*.5, -elen*.3),cw,elen*.6, <->)
    "$\unit{1}{\henry}$" at (elen*.82, -elen*.3)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 83
% 试求图中的输入阻抗 R_ab
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(right_ elen*.7, E); rlabel(,R_1,)
    b_current(i_1); dot
    {
        resistor(down_ elen*.8, E); llabel(,R_2,); dot
    }
    consource(right_ elen*.7, i); b_current(\beta i_1,below_,O)
    line down_ elen*.8 then left_ elen*1.4; "b" above
    gap(up_ elen*.8, 1); clabel(,R_\mathrm{ab},); "a" below
    move down_ elen*.4 then right_ elen*.15; line -> right_ elen*.3
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 84
% 用回路电流法求图示电路中电压源和电流源的功率(P75,3-13a)
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, v); llabel(-,\unit{10}{\volt},+); dot
    {
        resistor(right_ elen*.8, E); llabel(,\unit{1}{\ohm},); dot
        {
            resistor(right_ elen*.8, E); llabel(,\unit{3}{\ohm},); dot
        }
        resistor(down_ elen*.8, E); llabel(,\unit{2}{\ohm},)
        rlabel(+,U_\varphi,-); dot
    }
    line up_ elen*.4
    source(right_ elen*1.6, i); b_current(\unit{15}{\ampere},,O,E)
    line down_ elen*.4
    consource(down_ elen*.8, i); b_current(\frac{U_\varphi}{4},,O)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 85
% 求图示电路中的电流I和电压U。
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(up_ elen*1.4, E); llabel(,\unit{1}{\ohm},)
    rlabel(-,U,+); line right_ elen*.6; dot
    {
        consource(down_ elen*1.4, i); b_current(U,below_,O,E); dot
    }
    resistor(right_ elen*.8, E); b_current(I,,O)
    rlabel(,\unit{2}{\ohm},)
    source(down_ elen*.8, v); llabel(+,\unit{4}{\volt},-)
    move up_ elen*.2
    resistor(down_ elen*.8, E); llabel(,\unit{2}{\ohm},)
    consource(left_ elen*.8, v); rlabel(-,0.5I,+)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 86
% 用结点电压法求图示电路中电压U（3-20）。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, v); llabel(-,\unit{50}{\volt},+); dot
    {
        resistor(right_ elen*.8, E); llabel(,\unit{5}{\ohm},); dot
        {
            resistor(right_ elen*.8, E); llabel(,\unit{4}{\ohm},); dot
        }
        resistor(down_ elen*.8, E); llabel(,\unit{20}{\ohm},)
        rlabel(+,U,-); b_current(I); dot
    }
    line up_ elen*.4
    resistor(right_ elen*1.6, E); llabel(,\unit{10}{\ohm},)
    line down_ elen*.4
    consource(down_ elen*.8, v); llabel(+,15I,-)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 87
% 用结点电压法求图示电路中6V电压源的功率（3-21）。
.PS
    cct_init
    elen = elen_
    Origin: Here; dot
    {resistor(up_ elen*.8, E); rlabel(,\!\unit{1}{\ohm},); dot}
    arrowline(left_ elen*.6); rlabel(,I_1,)
    source(up_ elen*.8, v); llabel(-,\unit{6}{\volt},+); dot
    {
        resistor(right_ elen*.6, E); rlabel(,\unit{2}{\ohm},)
        resistor(right_ elen*.6, E); rlabel(,\unit{3}{\ohm},); dot
    }
    line up_ elen*.4
    resistor(right_ elen*1.2, E); rlabel(,\unit{4}{\ohm},)
    line down_ elen*.4; dot; move left_ elen*.1
    consource(right_ elen*.8, i); b_current(\;\;I_1/3,,O,E)
    source(down_ elen*.8, v); rlabel(-,\unit{12}{\volt},+)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 88
% 求图示电路中的电压u2 （4-3）
.PS
    cct_init
    elen = elen_
    Origin: Here
    battery(up_ elen*.8); llabel(,\unit{2}{\volt},)
    line right_ elen*.3; dot
    {
        resistor(down_ elen*.8, E); llabel(,\unit{4}{\ohm},)
        b_current(i_1); dot
    }
    line right_ elen*.3; dot
    {
        line down_ elen*.2
        consource(right_ elen*.8, i); b_current(2i_1,,O)
        line up_ elen*.2; dot
    }
    line up_ elen*.2
    resistor(right_ elen*.8, E); llabel(,\unit{3}{\ohm},)
    line down_ elen*.2 then right_ elen*.3
    source(down_ elen*.8, i); b_current(\unit{3}{\ampere},,O)
    rlabel(+,u_2,-)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 89
% 求图示电路中各支路电流。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, v); llabel(-,\unit{10}{\volt},+)
    resistor(right_ elen*.8, E); rlabel(+,u_1,-); llabel(,\unit{1}{\ohm},)
    b_current(i_1); dot
    {
        resistor(down_ elen*.8, E); llabel(,\unit{2}{\ohm},)
        b_current(i); dot
    }
    resistor(right_ elen*.8, E); llabel(,\unit{1}{\ohm},)
    b_current(i_2,below_,O,E)
    consource(down_ elen*.8, v); llabel(+,2u_1,-)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 90
% 求图示电路的等效戴维宁电路（4-12c）
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(left_ elen*.6, E); rlabel(,\unit{5}{\ohm},); dot
    {
        resistor(down_ elen*.8, E); llabel(,\unit{2}{\ohm},)
        move up_ elen*.2
        consource(down_ elen*.8, v); llabel(-,2i_1,+); dot
    }
    resistor(left_ elen*.6, E); rlabel(,\unit{8}{\ohm},)
    source(down_ elen*1.4, v); rlabel(+,\unit{4}{\volt},-)
    b_current(i_1,,O)
    line to (Origin.x, Here.y); "$1'$" above
    gap(up_ elen*1.4, 1); "$1$" below
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 91
% 求图示电路的等效戴维宁电路（4-12d）
.PS
    cct_init
    elen = elen_
    Origin: Here
    line left_ elen*.3; dot
    {
        resistor(down_ elen*.8, E); rlabel(,\unit{\frac{1}{5}}{\siemens},); dot
    }
    line left_ elen*.2; dot
    {
        line down_ elen*.2
        consource(left_ elen*.9, i); b_current(2u_1,below_,O,E)
        line up_ elen*.2; dot
    }
    line up_ elen*.2
    resistor(left_ elen*.9, E); rlabel(,\unit{\frac{1}{2}}{\siemens},)
    line down_ elen*.2 then left_ elen*.2; dot
    {
        resistor(down_ elen*.8, E); llabel(,\unit{\frac{1}{8}}{\siemens},)
        rlabel(+,u_1,-); dot
    }
    line left_ elen*.6
    source(down_ elen*.8, i); b_current(\unit{4}{\ampere},below_,O)
    line to (Origin.x, Here.y); "$1'$" above
    gap(up_ elen*.8, 1); "$1$" below
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 92
% 图示电路，用支路电流法求各支路电流，并用功率平衡校验。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, v); rlabel(-,\unit{8}{\volt},+)
    b_current(i_1,,O,E)
    resistor(right_ elen*.8, E); llabel(,\unit{8}{\ohm},); dot
    {
        resistor(down_ elen*.8, E); llabel(,\unit{2}{\ohm},)
        b_current(i_2); dot
    }
    resistor(right_ elen*.8, E); llabel(,\unit{4}{\ohm},)
    b_current(i_3,below_,O,E)
    source(down_ elen*.8, v); llabel(+,\unit{10}{\volt},-)
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
% fig 94
% 下图所示电路，A、B间的阻抗模值为5kΩ，电源角频率ω=1000rad/s，为使超前
% 300，求R和C的值。
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(right_ elen*.6, E); rlabel(,R,); dot
    {line right_ elen*.3}
    capacitor(down_ elen*.8); rlabel(,C,); dot
    {
        line right_ elen*.3; "$-$" above
        gap(up_ elen*.8, 1); clabel(,u_2,); "$+$" below
    }
    line left_ elen*.6; "$-$" above; "B" rjust
    gap(up_ elen*.8, 1); clabel(,u_1,); "$+$" below
    "A" rjust
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 95
% 求如图所示电路的谐振角频率，以及谐振时的等效阻抗与R、L、C的关系。
.PS
    cct_init
    elen = elen_
    Origin: Here
    capacitor(right_ elen*.6); rlabel(,C,); dot
    {
        resistor(down_ elen*.8, E); rlabel(,R,); dot
    }
    line right_ elen*.5
    inductor(down_ elen*.8); rlabel(,L,)
    line to (Origin.x, Here.y)
    gap(up_ elen*.8, 1)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 96
% 图示电路中，，当ω=104 rad/s时电流I的有效值最大，量值为1A，此时UL=10 V
% ，求：（1） R、L、C及品质因数Q（2） 电压uC 。
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(right_ elen*.8, E); llabel(,R,); b_current(i, )
    inductor(down_ elen*.6); rlabel(,L,); llabel(+,u_L,-)
    capacitor(left_ elen*.8); rlabel(,C,); llabel(+,u_C,-)
    "$-$" above
    gap(up_ elen*.6, 1); clabel(,u,)
    "$+$" below
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 97
% 图示电路中，正弦电压有效值U=210 V，电流有效值I=3 A，且电流与电压同相，
% 容抗XC=15Ω，求R2和XL 。
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(right_ elen*.8, E); llabel(,\unit{50}{\ohm},);
    b_current(\mathdot{I}); dot
    {
        capacitor(down_ elen); rlabel(,-\mathrm{j}X_C,); dot
    }
    line right_ elen*.4
    inductor(down_ elen*.5); llabel(,\mathrm{j}X_L,)
    resistor(down_ elen*.5, E); llabel(,R_2,)
    line to (Origin.x, Here.y); "$-$" above
    gap(up_ elen, 1); clabel(,\mathdot{U},)
    "$+$" below
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 98
% 图4-8所示电路中，设R=10Ω，L=1H，C=0.1F， 。 
% 1）ω为何值时电路发生谐振？
% 2）求谐振时的电流i。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, v); llabel(-,u_\mathrm{S},+);
    inductor(right_ elen*.8); b_current(i); rlabel(,L,); dot
    {
        capacitor(down_ elen*.8); rlabel(,C,); dot
    }
    line right_ elen*.5
    resistor(down_ elen*.8, E); rlabel(,R,)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 99
% 图示RLC动态电路，由动态分析可得uC的零输入响应uC(t)=______
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(right_ elen*.6, E); llabel(,\unit{1}{\kilo\ohm},)
    inductor(right_ elen*.6); llabel(,\unit{1}{\henry},)
    capacitor(right_ .6*elen); llabel(,\unit{1}{\micro\farad},)
    rlabel(+,u_C,-)
    line down_ elen/3 then left_ elen*1.8 then up_ elen/3
.PE
