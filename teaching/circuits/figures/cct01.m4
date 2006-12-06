include(/usr/local/lib/m4/circuit_macros/mpost.m4)
include(/usr/local/lib/m4/circuit_macros/libcct.m4)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 1
% 如图所示电路，设各伏特计内阻无限大，若V的读数为2V，V1的读数为1V，则V2
% 的读数为________.
.PS
    cct_init
    elen = elen_
    Origin: Here
    line right_ .5*elen; dot
    {source(down_ elen, "V"); dot}
    {resistor(right_ elen, E); rlabel(,R,)}
    line up_ .5*elen; source(right_ elen, "V$_1$")
    line down_ .5*elen; dot
    {inductor(down_ elen); rlabel(,L,); dot}
    line right_ .5*elen
    source(down_ elen, "V$_2$"); line to (Origin.x, -elen)
    gap(up_ elen, 1)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 2
% 如图所示电路，设各伏特计内阻无限大，若V1的读数为 30V，V2的读数为 60V，
% 则Us=________.
.PS
    cct_init
    elen = elen_
    Origin: Here
    {source(down_ elen, v); rlabel(+,U_{\mathrm{s}},-)}
    line right_ .5*elen; dot
    {resistor(right_ elen, E); rlabel(,R,)}
    line up_ .5*elen; source(right_ elen, "V$_1$")
    line down_ .5*elen; dot
    {inductor(down_ elen); rlabel(,L,); dot}
    line right_ .5*elen
    source(down_ elen, "V$_2$"); line to (Origin.x, -elen)
    gap(up_ elen, 1)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 3
% 已知电路中电压、电流的有效值分别为I1=7A、I2=3A、Uab=4V、Ubc=8V，由此可
% 以确定图中两交流表的读数分别为A=_______________,V=_______________.
.PS
    cct_init
    elen = elen_
    Origin: Here
    line right_ .5*elen; dot
    {source(down_ 2*elen, "V"); dot}
    line right_ .5*elen; dot; rlabel(,,"a")
    {
        capacitor(down_ .8*elen); b_current(\mathdot{I}_1, below_, O, E)
        line right_ .25*elen; dot; "b" above
    }
    line right_ .5*elen
    inductor(down_ .8*elen); b_current(\mathdot{I}_2,,O,E)
    line left_ .25*elen
    inductor(down_ .6*elen); dot; "c" ljust
    source(down_ .6*elen, "A")
    line to (Origin.x, -2*elen)
    gap(up_ 2*elen, 1); clabel(,\sim,)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 4
% 图示电路中IR=3A. IL=4A. IC=8A，则电流表的读数分别为
% A1=______.A2=_______A3=________
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(right_ .8*elen, "A$_3$"); dot
    {
        resistor(down_ 1.4*elen, E); rarrow(\mathdot{I}_R)
        line right_ .6*elen
        inductor(up_ .8*elen); b_current(\mathdot{I}_L,,,E)
        line right_ .25*elen; dot
    }
    line right_ .85*elen; source(down_ .6*elen, "A$_1$")
    line right_ .25*elen
    capacitor(down_ 1.4*elen); larrow(\mathdot{I}_C)
    line left_ .8*elen
    {dot; source(up_ .6*elen, "A$_2$"); dot}
    line to (Origin.x, -2*elen); "$-$" above
    gap(up_ 2*elen, 1); clabel(,\mathdot{U},); "$+$" below
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 5
% 图示电路发生谐振时，电流表A2的读数为15A，电流表A的读数为12A，则电流表
% A1的读数=___________.
.PS
    cct_init
    elen = elen_
    Origin: Here
    line right_ .5*elen; dot
    {
        line down_ .3*elen
        inductor(right_ .6*elen); llabel(,L,)
        resistor(right_ .6*elen, E); llabel(,R,)
        source(right_ .6*elen, "A$_2$"); dot
    }
    line up_ .3*elen
    capacitor(right_ .9*elen); llabel(,C,)
    source(right_ .9*elen, "A$_1$")
    line down_ 1.2*elen; source(left_ .9*elen, "A")
    line to (Origin.x, -.9*elen); "$-$" above
    gap(up_ .9*elen, 1); clabel(,U_{\mathrm{S}},); "$+$" below
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 6
% 电路中两个伏特表的正确读数为：V1=________，V2=________。
.PS
    cct_init
    elen = elen_
    Origin: Here
    line right_ elen; dot
    {
        resistor(right_ .8*elen, E); llabel(,\unit{3}{\ohm},); dot
        {
            source(down_ .8*elen, "V$_2$"); dot
        }
        inductor(right_ .8*elen); llabel(,\unit{j4}{\ohm},); dot
    }
    line up_ .6*elen
    source(right_ 1.6*elen, "V$_1$"); line down_ .6*elen
    capacitor(right_ .8*elen); llabel(,\unit{-j8}{\ohm},)
    line down_ .8*elen then to (Origin.x, -.8*elen); "$-$" above
    gap(up_ .8*elen, 1); dlabel(0,-.5,,u_{\mathrm{S}}=1.414\cos\omega t\unit{}{\volt},); "$+$" below
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 7
% 根据图中电压表的读数，可确定U=________。
.PS
    cct_init
    elen = elen_
    Origin: Here
    line right_ .5*elen; dot
    {
        line up_ .5*elen; source(right_ .8*elen, "V$_1$")
        llabel(,,\unit{60}{\volt}); line down_ .5*elen
    }
    {
        line down_ .5*elen; source(right_ 1.6*elen, "V$_2$")
        rlabel(,,\unit{100}{\volt}); line up_ .5*elen
    }
    resistor(right_ .8*elen, E); dot
    capacitor(right_ .8*elen); llabel(+,\mathdot{U},-); dot
    line right_ .5*elen; gap(to Origin, 1)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 8
% 根据图中电流表的读数，可确定U=________、I=________。
.PS
    cct_init
    elen = elen_
    Origin: Here
    arrowline(up_ .5*elen); llabel(,\mathdot{I},); dot
    {
        capacitor(right_ .8*elen); llabel(,\unit{-j50}{\ohm},)
        source(right_ .8*elen, "A"); llabel(,\unit{2}{\ampere},); dot
    }
    line up_ .6*elen; resistor(right_ 1.6*elen, E)
    llabel(,\unit{50}{\ohm},); line to (1.6*elen, Origin.y); "$-$" rjust
    gap( to Origin, 1); clabel(,\mathdot{U},); "$+$" ljust
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 9
% 根据图中电流表的读数，可确定I=________、U=________。
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(up_ elen, E); b_current(\mathdot{I})
    llabel(,\unit{40}{\ohm},); dot
    {
        capacitor(right_ .8*elen); llabel(,\unit{-j30}{\ohm},)
        source(right_ .8*elen, "A"); llabel(,\unit{1}{\ampere},); dot
    }
    line up_ .6*elen; inductor(right_ 1.6*elen); llabel(,\unit{j15}{\ohm},)
    line to (1.6*elen, Origin.y); "$-$" rjust
    gap( to Origin, 1); clabel(,\mathdot{U},); "$+$" ljust
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 10
% 13、在给定的串并联电路中有可能发生________和________的谐振，且________
% 谐振的频率小于_______谐振的频率.
% 27、电路中，频率从零增加时，先发生________谐振，其谐振频率为_________， 
.PS
    cct_init
    elen = elen_
    Origin: Here
    line up_ elen/2; dot
    {
        line up_ elen/2; inductor(right_ elen*.8); rlabel(,L_1,)
        capacitor(right_ .8*elen); rlabel(,C,); line down_ elen/2
    }
    inductor(right_ 1.6*elen); rlabel(,L_2,); dot
    line down_ elen/2; gap(to Origin, 1)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 11
% 14．电路中，频率从零增加时，先发生________谐振，后发生__________谐振。
% 其中ω串=__________，ω并=____________。 
% 
% 28．电路中，频率从零增加时，先发生________谐振，其谐振频率为_________
.PS
    cct_init
    elen = elen_
    Origin: Here
    line right_ elen/3; dot
    {
        line up_ elen/3; inductor(right_ elen*.6); rlabel(,L_1,)
        capacitor(right_ .6*elen); rlabel(,C_1,); line down_ elen/3; dot
    }
    line down_ elen/3
    capacitor(right_ 1.2*elen); llabel(,C_2,); line up_ elen/3
    line right_ elen/3; gap(to Origin, 1)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 12
% 15．电路中，频率从零增加时，先发生________谐振，后发生__________谐振。
% 其中ω串=__________，ω并=____________。 
% 
% 29．电路中，频率从零增加时，先发生________谐振，其谐振频率为_________
.PS
    cct_init
    elen = elen_
    Origin: Here
    line right_ elen/3; dot
    {
        line up_ elen/3; inductor(right_ elen*.6); rlabel(,L_1,)
        line down_ elen/3; dot
    }
    line down_ elen/3
    capacitor(right_ .6*elen); llabel(,C_2,); line up_ elen/3
    capacitor(right_ .6*elen); llabel(,C_1,); gap(to Origin, 1)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 13
% 16．电路中，频率从零增加时，先发生________谐振，后发生__________谐振。
% 其中ω串=__________，ω并=____________。 
% 
% 30．电路中，频率从零增加时，先发生________谐振，其谐振频率为_________ 
.PS
    cct_init
    elen = elen_
    Origin: Here
    line right_ elen/3; dot
    {
        line up_ elen/3; inductor(right_ elen*.6); rlabel(,L_1,)
        line down_ elen/3; dot
    }
    line down_ elen/3
    capacitor(right_ .6*elen); llabel(,C,); line up_ elen/3
    inductor(right_ .6*elen); llabel(,L_2,); gap(to Origin, 1)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 14
% 17、在图示GCL并联电路上，若电路原已处在谐振状态，试分析下列几种情况下
% 电路将呈何种性质（阻性、容性、感性）（1）增大G，电路将呈    性。（2）
% 增大C，电路将呈    性。
% 18、在图示GCL并联电路上，若电路原已处在谐振状态，试分析下列几种情况下
% 电路将呈何种性质（阻性、容性、感性）（3）增大L，电路将呈    性。（4）
% 增大电源角频率ω，电路将呈    性。
% 
% 19、在图示GCL并联电路上，若电路原已处在谐振状态，试分析下列几种情况下
% 电路将呈何种性质（阻性、容性、感性）（1）减小G，电路将呈    性。（2）
% 减小C，电路将呈    性。
% 
% 20、在图示GCL并联电路上，若电路原已处在谐振状态，试分析下列几种情况下
% 电路将呈何种性质（阻性、容性、感性）（1）减小L，电路将呈    性。（2）
% 减小电源角频率ω，电路将呈    性。
.PS
    cct_init
    elen = elen_
    Origin: Here
    line right_ elen/3; dot
    {
        resistor(down_ elen*.6, E); rlabel(,G,); dot
    }
    line right_ elen/2; dot
    {capacitor(down_ .6*elen); rlabel(,C,); dot}
    line right_ elen/2
    inductor(down_ .6*elen); llabel(,L,);
    line to (Origin.x, Here.y); gap(to Origin, 1)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 15
% 21、在图示RLC并联电路上，当电路处在谐振状态下，因某种原因信号源的频率
% 略有降低，则电路将由阻性转化为＿＿＿＿＿性。
% 
% 22、在图示RLC并联电路上，当电路处在谐振状态下，因某种原因信号源的频率
% 略有升高，则电路将由阻性转化为＿＿＿＿＿性。
% 32、在图示RLC并联电路上，当电路处在谐振状态下，因某种原因信号源的频率
% 略有降低，则电路将由阻性转化为＿＿＿＿＿性。
% 
% 33、在图示RLC并联电路上，当电路处在谐振状态下，因某种原因信号源的频率
% 略有升高，则电路将由阻性转化为＿＿＿＿＿性。
.PS
    cct_init
    elen = elen_
    Origin: Here
    line right_ elen/3; dot
    {
        resistor(down_ elen*.6, E); rlabel(,R,); dot
    }
    line right_ elen/2; dot
    {capacitor(down_ .6*elen); rlabel(,C,); dot}
    line right_ elen/2
    inductor(down_ .6*elen); llabel(,L,);
    line to (Origin.x, Here.y); gap(to Origin, 1)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 16
% 31、图示电路的谐振频率ω0=____________
.PS
    cct_init
    elen = elen_
    Origin: Here
    line up_ elen/3; resistor(right_ elen*.6, E); llabel(,R,)
    capacitor(right_ elen*.6); llabel(,C,); dot
    {
        line up_ elen/3; inductor(right_ elen*.6); rlabel(,L,)
        line down_ elen/3; dot
    }
    line down_ elen/3
    resistor(right_ .6*elen, E); llabel(,R,); line up_ elen/3
    line right_ elen/3 then down_ elen/3; gap(to Origin, 1)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 17
% 34、图示RLC动态电路，由动态分析可得uC的零输入响应uC(t)=______
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(right_ elen*.6, E); llabel(,\unit{1}{\ohm},)
    inductor(right_ elen*.6); llabel(,\unit{1}{\henry},)
    capacitor(right_ .6*elen); llabel(,\unit{1}{\farad},)
    rlabel(+,u_C,-)
    line down_ elen/3 then left_ elen*1.8 then up_ elen/3
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 18
% 35、图示RLC动态电路，由动态分析可得uC的零输入响应uC(t)=______
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(right_ elen*.6, E); llabel(,\unit{2}{\ohm},)
    inductor(right_ elen*.6); llabel(,\unit{1}{\henry},)
    capacitor(right_ .6*elen); llabel(,\unit{1}{\farad},)
    rlabel(+,u_C,-)
    line down_ elen/3 then left_ elen*1.8 then up_ elen/3
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 19
% 36、图示RLC动态电路，由动态分析可得uC的零输入响应uC(t)=______
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(right_ elen*.6, E); llabel(,\unit{3}{\ohm},)
    inductor(right_ elen*.6); llabel(,\unit{1}{\henry},)
    capacitor(right_ .6*elen); llabel(,\unit{1}{\farad},)
    rlabel(+,u_C,-)
    line down_ elen/3 then left_ elen*1.8 then up_ elen/3
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 20
% 37、图示RLC动态电路，由动态分析可得uC的零输入响应uC(t)=______
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(right_ elen*.6, E); llabel(,\unit{4}{\ohm},)
    inductor(right_ elen*.6); llabel(,\unit{1}{\henry},)
    capacitor(right_ .6*elen); llabel(,\unit{1}{\farad},)
    rlabel(+,u_C,-)
    line down_ elen/3 then left_ elen*1.8 then up_ elen/3
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 21
% 图示RLC动态电路，由动态分析可得uC的零输入响应uC(t)=______
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(right_ elen*.6, E); llabel(,\unit{2}{\kilo\ohm},)
    inductor(right_ elen*.6); llabel(,\unit{1}{\henry},)
    capacitor(right_ .6*elen); llabel(,\unit{1}{\micro\farad},)
    rlabel(+,u_C,-)
    line down_ elen/3 then left_ elen*1.8 then up_ elen/3
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 22
% 图示电路中，已知I1=I2=7A，R=2Ω，电阻R上的功率消耗为_________W，若电流
% 源的频率升高一倍，则电阻R上的功率消耗为_________W.
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, i); llabel(,,\mathdot{I}_\mathrm{S})
    b_current(,,O,E)
    line right_ elen/2; dot
    {
        resistor(down_ elen*.8, E); llabel(,R,)
        b_current(\mathdot{I}_1,,O,E); dot
    }
    line right_ elen/2
    capacitor(down_ .8*elen); llabel(,C,)
    b_current(\mathdot{I}_2)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 23
% 求电路图中各电源的功率（注明性质）。P1A=____________，
% P1V=______________。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, i); b_current(\unit{1}{\ampere},,O)
    line right_ elen/2; dot
    {
        resistor(down_ elen*.8, E); llabel(\unit{1}{\ohm},,); dot
    }
    line right_ elen/2
    source(down_ .8*elen, v); llabel(+,\unit{1}{\volt},-)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 24
% 图示电路中，P2A=____________，P20V=______________。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, v); llabel(-,\unit{20}{\volt},+)
    resistor(right_ elen*.6, E); llabel(,\unit{5}{\ohm},,)
    source(right_ .8*elen, i); llabel(,\unit{2}{\ampere},)
    b_current(,,O)
    resistor(down_ .8*elen, E); rlabel(,\unit{10}{\ohm},)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 25
% 求电路图中各电源的功率（注明性质）。，P1V =____________，
% P1A=______________。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, v); llabel(-,\unit{1}{\volt},+)
    resistor(right_ elen*.6, E); llabel(,\unit{2}{\ohm},)
    source(down_ .8*elen, i); llabel(,\unit{1}{\ampere},)
    b_current(,,O,E)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 26
% 图示电路中，I=____________，P6A=______________。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, i); llabel(\unit{6}{\ampere},,); b_current(,,O)
    line right_ elen; dot
    {
        source(down_ .8*elen, v); rlabel(+,\unit{10}{\volt},-)
        b_current(I,,O); dot
    }
    line right_ elen/2
    resistor(down_ elen*.8, E); llabel(,\unit{5}{\ohm},)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 27
% 图示电路中，I=____________，P4A=______________。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*1.6, i); llabel(,,\unit{3}{\ampere}); b_current(,,O,E)
    line right_ elen*.9; dot
    {
        source(down_ elen*1.6, v); rlabel(+,\unit{5}{\volt},-)
        b_current(I,,O); dot
    }
    resistor(right_ elen*.8, E); llabel(,\unit{1}{\ohm},)
    source(down_ .8*elen, i); llabel(,,\unit{4}{\ampere})
    b_current(,,O,E); source(down_ .8*elen, v);
    llabel(+,\unit{10}{\volt},-)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 28
% 图示电路中，I=____________，P10V=______________。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, v); llabel(-,\unit{10}{\volt},+)
    line right_ elen*.6; dot
    {
        resistor(down_ elen*.8, E); llabel(,\unit{2}{\ohm},)
        b_current(I,,O); dot
    }
    resistor(right_ elen*.8, E); llabel(,\unit{1}{\ohm},)
    source(down_ .8*elen, i); b_current(\unit{4}{\ampere},,O,E)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 29
% 由图示电路数据可求出I=__ _______、P2V=_____ _______
.PS
    cct_init
    elen = elen_
    Origin: Here
    line right_ elen/4; dot
    {
        source(right_ elen*.8, v); llabel(+,\unit{2}{\volt},-)
        b_current(I,below,,E)
        resistor(right_ elen*.6, E); llabel(,\unit{2}{\ohm},); dot
    }
    line up_ elen/2
    source(right_ 1.4*elen, "V"); llabel(+,\unit{3}{\volt},-)
    line down_ elen/2 then right_ elen/4
    gap(to Origin, 1)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 30
% 由图示电路数据可求出Us=____ ________Pus=____ ________
.PS
    cct_init
    elen = elen_
    Origin: Here
    line right_ elen/4; dot
    {
        source(right_ elen*.8, "A"); llabel(-,\unit{1}{\ampere},+)
        source(right_ elen*.8, v); llabel(+,U_\mathrm{S},-)
        resistor(right_ elen*.6, E); llabel(,\unit{3}{\ohm},); dot
    }
    line up_ elen*.6
    source(right_ 2.2*elen, "V"); llabel(+,\unit{1}{\volt},-)
    line down_ elen*.6 then right_ elen/4
    gap(to Origin, 1)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 31
% 由图示电路数据可求出R=____________P3V=____________
.PS
    cct_init
    elen = elen_
    Origin: Here
    line right_ elen/4; dot
    {
        source(right_ elen*.8, "A"); llabel(+,\unit{1}{\ampere},-)
        source(right_ elen*.8, v); llabel(-,\unit{3}{\volt},+)
        resistor(right_ elen*.6, E); llabel(,R,); dot
    }
    line up_ elen*.6
    source(right_ 2.2*elen, "V"); llabel(+,\unit{4}{\volt},-)
    line down_ elen*.6 then right_ elen/4
    gap(to Origin, 1)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 32
% 由图示电路数据可求出U=____________P2V=___ _________
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, v); llabel(-,\unit{2}{\volt},+)
    consource(right_ elen, v); llabel(+,3U,-)
    resistor(down_ .8*elen, E); llabel(+,U,-); rlabel(,\unit{4}{\ohm},)
    arrowline(left_ to Origin); rlabel(,I,)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 33
% 由图示电路中可求出I=____________P2V=_____ ______
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, v); llabel(-,\unit{2}{\volt},+)
    consource(right_ elen, v); llabel(+,2I,-)
    resistor(down_ .8*elen, E); llabel(+,U,-); rlabel(,\unit{4}{\ohm},)
    arrowline(left_ to Origin); rlabel(,I,)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 34
% 由图示电路可求出UR=____________P2V=____________
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, v); llabel(-,\unit{12}{\volt},+)
    resistor(right_ .8*elen, E); llabel(+,U_R,-); rlabel(,\unit{2}{\ohm},)
    arrowline(right_ elen/4); llabel(,I,)
    source(right_ elen*.8, v); llabel(+,\unit{2}{\volt},)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 35
% 由图示电路可求出U1=_________P5A=____ _______
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*1.4, v); llabel(-,\unit{15}{\volt},+)
    line right_ elen*.8; dot
    {
        resistor(down_ Here.y-Origin.y, E); rlabel(,\unit{6}{\ohm},)
        dot
    }
    line right_ elen*.8
    resistor(down_ elen*.6, E); llabel(+,U_1,-);
    rlabel(,\unit{2}{\ohm},);
    source(down elen*.8, i); llabel(+,U_2,-); rlabel(,\unit{5}{\ampere},)
    b_current(,,O,)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 36
% 由图示电路数据可求出i=_______________uab=____________
.PS
    cct_init
    elen = elen_
    Origin: Here
    B: dot; "b" below
    arrow left_ elen/4; "$\unit{-5}{\ampere}$" above
    ebox(from Origin up_ elen*.8, .16,.16); A: dot; "a" above
    arrow left_ elen/4; "$\unit{2}{\ampere}$" below
    ebox(from A right_ elen, .16,.16); llabel(+,\unit{3}{\volt},-)
    D: dot; "d" above; arrow <- right_ elen/4;
    "$\unit{4}{\ampere}$" above
    ebox(from D down_ elen*.8,.16,.16); llabel(-,\unit{-4}{\volt},+)
    C: dot; "c" below; arrow <- right_ elen/4; "$i$" below
    ebox(from C left_ elen, .16,.16); llabel(-,\unit{5}{\volt},+)
    ebox(from D to B, .16,.16)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 37
% 图示电路中，i=_________A.
.PS
    cct_init
    elen = elen_
    Origin: Here
    dot; arrow <- left_ elen/4; "$\unit{6}{\ampere}$" above_
    source(from Origin up_ elen*.8, v); llabel(-,\unit{4}{\volt},+)
    line right_ elen*.8; dot;
    {arrow up_ elen/4; "$\unit{5}{\ampere}$" above_}
    {resistor(down_ elen*.8, E); llabel(,\unit{1}{\ohm},); dot}
    resistor(right_ elen*.8, E); llabel(,R,); dot
    {arrow right_ elen/4; "$i$" below_}
    resistor(down_ elen*.8, E); llabel(,\unit{2}{\ohm},)
    reversed(`arrowline',left_ elen*.8); llabel(,\unit{15}{\ampere},)
    resistor(left_ elen*.8, E); llabel(-,\unit{1}{\volt},+)
    rlabel(,\unit{1}{\ohm},)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 38
% 图示电路中，Ubd=_________V,  P2Ω =________W.
.PS
    cct_init
    elen = elen_
    Origin: Here
    C: dot; "c" below
    {
        Point_(150); resistor(to rvec_(elen*.8,0), E);
        dlabel(.12,.15,,\unit{1}{\ohm},)
        b_current(\unit{1}{\ampere},below,,E); dot(,,1); "a" rjust
    }
    {
        Point_(-150); resistor(to rvec_(elen*.8,0), E);
        dlabel(.12,.15,,\unit{1}{\ohm},)
        dot(,,1); "b" rjust
    }
    resistor(right_ elen*.6, E); llabel(,\unit{2}{\ohm},);
    dot; "d" below
    {
        Point_(30); resistor(to rvec_(elen*.6,0), E);
        dlabel(.12,.15,,\unit{1}{\ohm},)
        PT1: dot; arrowline(to rvec_(elen/3,0))
        dlabel(.12,.1,,\unit{1}{\ampere},)
        dot(,,1); "e" below
    }
    {
        Point_(-30); resistor(to rvec_(elen*.6,0), E);
        dlabel(.12,-.15,,\unit{1}{\ohm},)
        PT2: dot; reversed(`arrowline', to rvec_(elen/3,0))
        dlabel(.12,.1,,\unit{1}{\ampere},)
        dot(,,1); "f" below
    }
    down_; resistor(from PT1 to PT2, E); dlabel(.12,.15,,\unit{1}{\ohm},)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 39
% 根据元件的VAR直接填写图中的未知量。
.PS
    cct_init
    elen = elen_
    Origin: Here
    "$+$" below
    resistor(right_ elen*.8, E); llabel(,\unit{2}{\ohm},); b_current(i)
    inductor(down_ elen*.6); rlabel(,\unit{4}{\henry},)
    line left_ elen*.8; "$-$" above
    gap(to Origin, 1); clabel(,u,)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 40
% 根据元件的VAR直接填写图旁的未知量。当u=5V时，则i=___________，当
% u=7e-2tV时，则i=___ ________，
.PS
    cct_init
    elen = elen_
    Origin: Here
    "$+$" below
    arrowline(right_ elen*.6); llabel(,i,); dot
    {
        resistor(down_ elen*.6, E); rlabel(,\unit{2}{\siemens},); dot
    }
    line right_ elen/2
    capacitor(down_ elen*.6); llabel(,\unit{2}{\farad},)
    line left_ elen*1.1; "$-$" above
    gap(to Origin, 1); clabel(,u,)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 41
% 根据元件的VAR直接填写图中的未知量。
% 当uc=3V时，则i=____ _______，
% 当uc=e-3tV时，则u=____  ________，
.PS
    cct_init
    elen = elen_
    Origin: Here
    "$+$" below
    resistor(right_ elen*1.2, E); rlabel(,\unit{2}{\ohm},)
    capacitor(down_ elen*.6); llabel(,\unit{6}{\farad},)
    rlabel(+,u_{\mathrm{C}},-)
    line left_ elen*1.2; "$-$" above
    gap(to Origin, 1); clabel(,u,)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 42
% 按元件的VAR直接填写图旁的未知量。
% 当iL =1A时，则i=__________，
% 当 iL =e-tA时，则i=__________，
.PS
    cct_init
    elen = elen_
    Origin: Here
    "$+$" below
    arrowline(right_ elen*.6); llabel(,i,); dot
    {
        resistor(down_ elen*.8, E); rlabel(,\unit{3}{\siemens},); dot
    }
    line right_ elen/2
    inductor(down_ elen*.8); llabel(,\unit{6}{\henry},)
    b_current(i_\mathrm{L})
    line left_ elen*1.1; "$-$" above
    gap(to Origin, 1); clabel(,u,)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 43
% 按元件的VAR直接填写图中的未知量。
% 当iL =1A时，则i=__ ________，
% 当iL =-2etA时，则i=__________，
.PS
    cct_init
    elen = elen_
    Origin: Here
    "$+$" below
    arrowline(right_ elen*.6); llabel(,i,); dot
    {
        resistor(down_ elen*.8, E); rlabel(,\unit{3}{\siemens},); dot
    }
    resistor(right_ elen/2, E); llabel(,\unit{2}{\ohm},)
    inductor(down_ elen*.8); llabel(,\unit{4}{\henry},)
    b_current(i_\mathrm{L})
    line left_ elen*1.1; "$-$" above
    gap(to Origin, 1); clabel(,u,)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 44
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
% fig 45
% 根据元件的VAR直接填写图中的未知量。
% 当uc=14V时，则u=__ _________，
% 当uc=sin5tV时，则u=_________，
.PS
    cct_init
    elen = elen_
    Origin: Here
    "$+$" below
    resistor(right_ elen*1.2, E); llabel(,\unit{2}{\ohm},)
    b_current(i,,O)
    capacitor(down_ elen*.6); llabel(,\unit{6}{\farad},)
    rlabel(+,u_\mathrm{C},-)
    line left_ elen*1.2; "$-$" above
    gap(to Origin, 1); clabel(,u,)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 46
% 按元件的VAR直接填写图旁的未知量。
% 当iL=4A时，则u=__________，
% 当iL=sin9tA时，则i=____ _______，
.PS
    cct_init
    elen = elen_
    Origin: Here
    "$+$" below
    reversed(`arrowline', right_ elen*.6); llabel(,i,); dot
    {
        resistor(down_ elen*.8, E); rlabel(,\unit{4}{\ohm},); dot
    }
    line right_ elen/2
    inductor(down_ elen*.8); llabel(,\unit{8}{\henry},)
    b_current(i_\mathrm{L})
    line left_ elen*1.1; "$-$" above
    gap(to Origin, 1); clabel(,u,)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 47
% 根据元件的VCR直接填写图中的未知量。
% 当i=4A时，则u=____________， 
% 当i=sin2t A时，则u=____________。
.PS
    cct_init
    elen = elen_
    Origin: Here
    "$+$" below
    resistor(right_ elen*.8, E); llabel(,\unit{2}{\ohm},)
    b_current(i)
    inductor(down_ elen*.6); llabel(,\unit{4}{\henry},)
    line left_ elen*.8; "$-$" above
    gap(to Origin, 1); clabel(,u,)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 48
% 按元件的VCR直接填写图旁的未知量。
% 当u=4V时，则i=____________，
% 当u=2e-2tV时，则i=____________，
.PS
    cct_init
    elen = elen_
    Origin: Here
    "$+$" below
    arrowline(right_ elen*.6); llabel(,i,); dot
    {
        resistor(down_ elen*.6, E); rlabel(,\unit{2}{\siemens},); dot
    }
    line right_ elen/2
    capacitor(down_ elen*.6); llabel(,\unit{2}{\farad},)
    line left_ elen*1.1; "$-$" above
    gap(to Origin, 1); clabel(,u,)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 49
% 如图所示电路，电源的角频率，则阻抗Zab等于_______.
.PS
    cct_init
    elen = elen_
    Origin: Here
    "a" rjust
    resistor(right_ elen*.6, E); llabel(,\unit{2}{\ohm},)
    capacitor(down_ elen*.6); llabel(,\unit{0.1}{\farad},)
    line left_ elen*.6; "b" rjust
    gap(to Origin, 1)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 50
% 电路如图，电阻单位为Ω，则Rab=_________。
.PS
    cct_init
    elen = elen_
    Origin: Here
    "a" rjust
    resistor(right_ elen, E); llabel(,\unit{2.6}{\ohm},); Da: dot
    Point_(-120); resistor(from Here to rvec_(.8*elen,0), E)
    dlabel(.12, -.15,,\unit{3}{\ohm},); Db: dot
    move to Da
    Point_(-60); resistor(from Da to rvec_(.8*elen,0), E)
    dlabel(.12, .15,,\unit{3}{\ohm},); Dc: dot
    resistor(from Db to Dc, E); dlabel(.12, .12,,\unit{3}{\ohm},)
    move to Db
    Point_(-60); resistor(from Db to rvec_(.8*elen,0), E)
    dlabel(.12, -.15,,\unit{3}{\ohm},); Dd: dot
    Point_(-120); resistor(from Dc to Dd, E)
    dlabel(.12, .15,,\unit{3}{\ohm},)
    line left_ elen; "b" rjust
    gap(to Origin, 1)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 51
% 电路如图，则R=_________
.PS
    cct_init
    elen = elen_
    Origin: Here
    line right_ elen*.5; dot
    {Point_(-45); resistor(to rvec_(elen*.6,0), E)
    dlabel(.12, -.16,\unit{40}{\ohm},,); Lj1: Here}
    resistor(right_ elen*.8, E); llabel(,\unit{40}{\ohm},); Lj2: dot
    line down_ elen*.8; dot; {line to Lj1}
    resistor(left_ elen*.8, E); llabel(,\unit{20}{\ohm},); dot
    {Point_(45); resistor(to rvec_(elen*.6, 0), E);
    dlabel(.12, .17,\unit{20}{\ohm},,); line to Lj2}
    line left_ elen*.5
    gap(to Origin, 1)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 52
% 电路如图，则R=_________
.PS
    cct_init
    elen = elen_
    Origin: Here
    line right_ elen*.5; dot
    {resistor(down_ elen*.6, E); dlabel(.12, .24,,\unit{400}{\ohm},); dot}
    resistor(right_ elen*.8, E); llabel(,\unit{200}{\ohm},); dot
    {resistor(down_ elen*.6, E); dlabel(.12, .24,,\unit{200}{\ohm},); dot}
    resistor(right_ elen*.8, E); llabel(,\unit{100}{\ohm},)
    resistor(down_ elen*.6, E); llabel(,\unit{100}{\ohm},)
    resistor(left_ elen*.8, E); llabel(,\unit{100}{\ohm},)
    resistor(left_ elen*.8, E); llabel(,\unit{200}{\ohm},)
    line left_ elen*.5
    gap(to Origin, 1); dlabel(.12,.05,,R,); move down_ elen*.3; line -> right_ elen*.3
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 53
% 电路中的电流i1=2e-2t，i2=e-4t，可以直接求出两个回路的入口电压
% u1=____________,u2=__________   。
.PS
    cct_init
    elen = elen_
    Origin: Here
    "$+$" below
    resistor(right_ elen*.8, E); llabel(,\unit{2}{\ohm},)
    b_current(i_1); Trp1: Here
    inductor(down_ elen*.6); rlabel(*,\unit{6}{\henry},)
    line left_ elen*.8; "$-$" above
    gap(to Origin, 1); clabel(,u_1,)
    move to Trp1; move right .13*elen; "\unit{3}{\henry}" at Here
    move right .13*elen; move right elen*.8; NE: Here; "$+$" below
    resistor(left_ elen*.8, E); rlabel(,\unit{2}{\ohm},); 
    b_current(i_2,below_)
    reversed(`inductor', down_ elen*.6); llabel(,\unit{4}{\henry},*)
    line right_ elen*.8; "$-$" above
    gap(to NE, 1); clabel(,u_2,)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 54
% 图示RC电路，原处于直流稳态，当t=0时，开关从1投向2，则按三要素公式
% uC(t)=_______________。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, v); llabel(-,\unit{3}{\volt},+)
    reversed(`switch', right_ elen, L, O); llabel(1,,)
    resistor(right_ elen*.8, E); llabel(,\unit{2}{\ohm},)
    capacitor(down_ elen*.8); llabel(+,u_\mathrm{C}(t),-)
    rlabel(,\unit{1}{\farad},)
    line left_ elen*1.3; dot
    {line left_ elen*.5}
    source(up_ elen*.65, v); rlabel(-, \unit{5}{\volt}, +)
    dot(,,1); "$2$" rjust
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 55
% 阻容移相装置中，要求Uo落后US六分之一周期，则XC=__________R。
.PS
    cct_init
    elen = elen_
    Origin: Here
    "$+$" below
    resistor(right_ elen*.8, E); llabel(,R,)
    capacitor(down_ elen*.6); llabel(+,u_\mathrm{o},-); rlabel(,C,)
    line left_ elen*.8; "$-$" above
    gap(to Origin, 1); clabel(,u_S,)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 56
% 电路中电容C原与正弦电压源uS(t)连接，当t=0时，开关投向电阻侧，则初始值
% uC(0+)=________V, i(0+)=_______A
.PS
    cct_init
    elen = elen_
    Origin: Here
    Point_(135); switch(to rvec_(dimen_/3,0), R, O); SS1: Here; "$1$" above
    {move to Origin; Point_(45); line to rvec_(dimen_/3,0) invis; SS2: Here}
    line left_ elen*.5; {dot(at SS1,,1)}
    source(down_ elen*.8, v); rlabel(+,u_\mathrm{S}(t),-); SW: Here
    move to SS2; "$2$" above
    arrowline(right_ elen*.6); llabel(,i,); {dot(at SS2,,1)}
    resistor(down_ elen*.8, E); llabel(,\unit{2}{\ohm},); SE: Here
    capacitor(from Origin to (Origin.x, SW.y)); llabel(+, u_\mathrm{C}, -); dot
    dot(at Origin,,1)
    line from SW to SE
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 57
% 已知无源网络P的电压、电流相量图，试确定其等效电路参数：
% G=_________，B=___________。
.PS
    cct_init
    elen = elen_
    Origin: Here
    "$+$" below
    arrowline(right_ elen*.6); llabel(,\mathdot{I},)
    line up_ elen*.1 then right_ elen*.5 then down_ elen*.8 then left_ elen*.5 then up_ elen*.7
    move down_ elen*.6
    line left_ elen*.6; "$-$" above
    gap(to Origin, 1); clabel(,\mathdot{U},)
    move right_ elen*1.5
    {line -> right_ elen
    "$\mathdot{U}$" above; move left_ elen*.5; "$U=\unit{50}{\volt}$" above}
    {Point_(-60); line -> to rvec_(elen,0);
    "$\mathdot{I}$" below; 
    move to (Here+(elen*0.5*sin(60),-elen*0.5*cos(60)));
    move down_ .15; "$I=\unit{5}{\ampere}$" rjust}
    CC: Here
    arcd(Here, elen*.2, -60, 0)
    move to (CC+(elen*.2, -elen*.2))
    "$\unit{60}{\degree}$" ljust
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 58
% 理想变压器的同名端, 电压、电流的参考方向如图，则u2与u1的相位关系是
% _________. i2与i1的相位关系是_______.
.PS
    cct_init
    elen = elen_
    Origin: Here
    "$+$" below
    arrowline(right_ elen*.6); llabel(,i_1,)
    Tr1: transformer(down_ elen*.6,,,A) with .P1 at Here;
    {move to Tr1.P1; move left_ elen*.05; move down_ elen*.1; "*" at Here}
    {move to Tr1.S2; move right_ elen*.05; move up_ elen*.05; "*" at Here}
    move to Tr1.P2; line left_ elen*.6; "$-$" above
    gap(to Origin, 1); clabel(,u_1,)
    move to Tr1.S1
    line right_ elen*.6
    resistor(down_ elen*.6, E); llabel(,\unit{2}{\ohm},)
    arrowline(left_ to Tr1.S2); llabel(,i_2,)
    move to Tr1.S1; move right_ elen*.2; "$-$" below
    gap(down_ elen*.6, 1); clabel(, u_2,); "$+$" above
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 59
% 理想变压器的同名端, 电压、电流的参考方向如图，则u2与u1的相位关系是
% _________. i2与i1的相位关系是_______.
.PS
    cct_init
    elen = elen_
    Origin: Here
    "$+$" below
    arrowline(right_ elen*.6); llabel(,i_1,)
    Tr1: transformer(down_ elen*.6,,,A) with .P1 at Here;
    {move to Tr1.P1; move left_ elen*.05; move down_ elen*.1; "*" at Here}
    {move to Tr1.S1; move right_ elen*.05; move down_ elen*.1; "*" at Here}
    move to Tr1.P2; line left_ elen*.6; "$-$" above
    gap(to Origin, 1); clabel(,u_1,)
    move to Tr1.S1
    arrowline(right_ elen*.6); llabel(,i_2,)
    resistor(down_ elen*.6, E); llabel(,\unit{2}{\ohm},)
    line left_ to Tr1.S2
    move to Tr1.S1; move right_ elen*.2; "$+$" below
    gap(down_ elen*.6, 1); clabel(, u_2,); "$-$" above
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 60
% 理想变压器的同名端, 电压、电流的参考方向如图，则u2与u1的相位关系是
% _________. i2与i1的相位关系是_______.
.PS
    cct_init
    elen = elen_
    Origin: Here
    "$+$" below
    arrowline(right_ elen*.6); llabel(,i_1,)
    Tr1: transformer(down_ elen*.6,,,A) with .P1 at Here;
    {move to Tr1.P1; move left_ elen*.05; move down_ elen*.1; "*" at Here}
    {move to Tr1.S1; move right_ elen*.05; move down_ elen*.1; "*" at Here}
    move to Tr1.P2; line left_ elen*.6; "$-$" above
    gap(to Origin, 1); clabel(,u_1,)
    move to Tr1.S1
    arrowline(right_ elen*.6); llabel(,i_2,)
    resistor(down_ elen*.6, E); llabel(,\unit{2}{\ohm},)
    line left_ to Tr1.S2
    move to Tr1.S1; move right_ elen*.2; "$-$" below
    gap(down_ elen*.6, 1); clabel(, u_2,); "$+$" above
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 61
% 图示含有理想变压器的电路中，
% 原边的电流I1=________，电压U1=________，等效阻抗Zi=___________.
.PS
    cct_init
    elen = elen_
    Origin: Here
    "$+$" below
    arrowline(right_ elen*.6); llabel(,\mathdot{I}_1,)
    Tr1: transformer(down_ elen*.6,,,A) with .P1 at Here;
    {move to Tr1.P1; move left_ elen*.05; move down_ elen*.1; "*" at Here}
    {move to Tr1.S1; move right_ elen*.05; move down_ elen*.1; "*" at Here}
    move to Tr1.P2; line left_ elen*.6; "$-$" above
    gap(to Origin, 1); clabel(,\mathdot{U}_1,)
    move to Tr1.S1
    reversed(`arrowline', right_ elen*.6); llabel(,\mathdot{I}_2,)
    resistor(down_ elen*.6, E); llabel(,Z_\mathrm{L}=\unit{2}{\ohm},)
    line left_ to Tr1.S2
    move to Tr1.S1; move right_ elen*.2; "$+$" below
    gap(down_ elen*.6, 1); clabel(,\unit{10}{\volt},); "$-$" above
    move to (Tr1.P1+Tr1.S1)/2; "10:1" above
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 62
% 图示电路中，当5V电压源单独作用时，3Ω电阻上的电流为_______
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, i); llabel(,,\unit{5}{\ampere})
    b_current(,,O,E)
    line right_ elen*.5; dot
    {
        resistor(down_ elen*.8, E); llabel(,\unit{2}{\ohm},); dot
    }
    resistor(right_ elen*.8, E); rlabel(,\unit{3}{\ohm}); larrow(I, <-)
    source(down_ elen*.8, v); llabel(+,\unit{5}{\volt},-)
    line left_ to (Origin.x, Here.y)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 63
% 试填写图示有源一端口网络ab两端的
% （1） 开路电压uOC|ab=__________
% （2） 短路电流iSC|ab=__________
% （3） ab间若接负载RL=8/3Ω，则此时的负载电压uab=_______
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*1.2, v); llabel(-,\unit{12}{\volt},+)
    line right_ elen*.6; dot
    {
        resistor(down_ elen*.6, E); rlabel(,\unit{2}{\ohm},); dot
        {line right_ elen*.2; dot(,,1); "a" above}
        resistor(down_ elen*.6, E); rlabel(,\unit{4}{\ohm},); dot
    }
    line right_ elen*.6
    resistor(down_ elen*.6, E); llabel(,\unit{4}{\ohm},); dot
    {line left_ elen*.2; dot(,,1); "b" above}
    resistor(down_ elen*.6, E); llabel(,\unit{2}{\ohm})
    line left_ to (Origin.x, Here.y)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 64
% 按图示电路和表计读数可求得
% 网络N1的功率为__________
% 网络N2的功率为__________（注明性质）
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(right_ elen*.8, "A"); llabel(+,\unit{2}{\ampere},-); dot
    {
        source(down_ elen*.8, "V"); llabel(+,\unit{4}{\volt},-); dot
    }
    resistor(right_ elen*.8, E); llabel(,\unit{1}{\ohm},)
    {line up_ elen*.1 then right_ elen*.5 then down_ elen then left_ elen*.5 then up_ elen*.9}
    move down_ elen*.8
    line left_ elen*1.6 then down_ elen*.1 then left_ elen*.5 then up_ elen then right_ elen*.5 then down_ elen*.9
    move up_ elen*.4; "N$_1$" rjust
    move right_ elen*1.6; "N$_2$" ljust
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 65
% 电路及已知参数如图，US=_________;  P5V=__________（释放）
.PS
    cct_init
    elen = elen_
    Origin: Here
    line right_ elen*.5; dot
    source(right_ elen, v); llabel(+,\unit{5}{\volt},-); dot
    {
        reversed(`arrowline', right_ elen*.5);
        llabel(,\unit{6}{\ampere},)
    }
    resistor(down_ elen, E); llabel(,\unit{1}{\ohm},)
    b_current(\unit{1}{\ampere}); dot
    {line right_ elen*.5; "c" ljust; gap(up_ elen,1); "b" ljust}
    resistor(left_ elen, E); rlabel(,\unit{2}{\ohm},)
    b_current(\unit{2}{\ampere},,,E); dot
    {
        line left_ elen*.5; "d" rjust; gap(up_ elen, 1); "a" rjust
    }
    source(up_ elen, v); llabel(-,U_\mathrm{S},+)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 66
% 图示电路中，电压表V的读数为___________.
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, v); llabel(-,\unit{3}{\volt},+)
    resistor(right_ elen*.8, E); llabel(,\unit{2}{\ohm},); dot
    {
        resistor(down_ elen*.8, E); rlabel(,\unit{1}{\ohm},); dot
    }
    resistor(right_ elen*.8, E); llabel(,\unit{3}{\ohm},)
    source(down_ elen*.8, "V"); llabel(+,,-); dot
    {
        resistor(left_ elen*.8, E); rlabel(,\unit{4}{\ohm},)
    }
    line down_ elen*.4
    source(left_ elen*.8, i); llabel(,,\unit{5}{\ampere})
    b_current(,,O,E); line up_ elen*.4 then left_ elen*.8
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 67
% 如图所示电路，已知、、I=10A，则IL等于_______.
.PS
    cct_init
    elen = elen_
    Origin: Here
    arrowline(right_ elen*.5); llabel(,i,); dot
    {
        inductor(down_ elen*.8); rlabel(,L,)
        b_current(i_\mathrm{L},,O,E); dot
    }
    line right_ elen*.5
    capacitor(down_ elen*.8); llabel(,C,)
    line left_ elen; gap(up_ elen*.8, 1)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 68
% 图示含有理想变压器的电路中，原边的电流I1=________，电压U1=________，等
% 效阻抗Zi=___________.
.PS
    cct_init
    elen = elen_
    Origin: Here
    "$+$" below
    arrowline(right_ elen*.6); llabel(,\mathdot{I}_1,)
    Tr1: transformer(down_ elen*.6,,,A) with .P1 at Here;
    {move to Tr1.P1; move left_ elen*.05; move down_ elen*.1; "*" at Here}
    {move to Tr1.S1; move right_ elen*.05; move down_ elen*.1; "*" at Here}
    move to Tr1.P2; line left_ elen*.6; "$-$" above
    gap(to Origin, 1); clabel(,\mathdot{U}_1,)
    move to Tr1.S1
    reversed(`arrowline', right_ elen*.6); llabel(,\mathdot{I}_2,)
    resistor(down_ elen*.6, E); llabel(,Z_\mathrm{L}=\unit{2}{\ohm},)
    line left_ to Tr1.S2
    move to Tr1.S1; move right_ elen*.2; "$+$" below
    gap(down_ elen*.6, 1); clabel(,\unit{10}{\volt},); "$-$" above
    move to (Tr1.P1+Tr1.S1)/2; "1:10" above
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 69
% 图示电路的端口特性方程U = _______
.PS
    cct_init
    elen = elen_
    Origin: Here
    arrowline(right_ elen*.7); llabel(,I,); dot
    {
        resistor(down_ elen*.8, E); rlabel(,\unit{10}{\ohm},)
        dot
    }
    line right_ elen*.4
    source(down_ elen*.8, i); llabel(\unit{1}{\ampere},,)
    b_current(,,O)
    line left_ elen*1.1; "$-$" above; gap(up_ elen*.8, 1); clabel(,U,)
    "$+$" below
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 70
% 图示电路的端口特性方程U = _______
.PS
    cct_init
    elen = elen_
    Origin: Here
    arrowline(right_ elen*.7); llabel(,I,); dot
    {
        source(down_ elen*.7, v); rlabel(+,\unit{5}{\volt},-)
        resistor(down_ elen*.6, E); rlabel(,\unit{10}{\ohm},)
        dot
    }
    line right_ elen*.4
    source(down_ elen*1.3, i); llabel(\unit{2}{\ampere},,)
    b_current(,,O)
    line left_ elen*1.1; "$-$" above; gap(up_ elen*1.3, 1); clabel(,U,)
    "$+$" below
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 71
% 图示电路的端口特性方程U = _______ 
.PS
    cct_init
    elen = elen_
    Origin: Here
    arrowline(right_ elen*.9); llabel(,I,)
    source(down_ elen*.7, v); rlabel(+,\unit{5}{\volt},-); dot
    {
        line left_ elen*.2
        resistor(down_ elen*.7, E); rlabel(,\unit{5}{\ohm},)
        dot
    }
    line right_ elen*.2
    source(down_ elen*.7, i); llabel(,,\unit{10}{\ampere})
    b_current(,,O,E)
    line left_ elen*1.1; "$-$" above; gap(up_ elen*1.4, 1); clabel(,U,)
    "$+$" below
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 72
% 图示电路中，求（1）开关打开时，电压UAB 。（2）开关闭合时，电流IAB 。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*1.6, v); llabel(-,\unit{18}{\volt},+)
    arrowline(right_ elen*.6); llabel(,I,); dot
    {
        resistor(down_ elen*.8, E); llabel(,\unit{3}{\ohm},)
        b_current(I_1,below_,O,E); dot; "A" rjust
        {
            switch(right_ elen*.8)
        }
        resistor(down_ elen*.8, E); llabel(,\unit{6}{\ohm},)
        b_current(I_2,below_,O,E); dot
    }
    line right_ elen*.8
    resistor(down_ elen*.8, E); llabel(,\unit{6}{\ohm},); dot
    "B" ljust
    resistor(down_ elen*.8, E); llabel(,\unit{3}{\ohm},)
    line left_ to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 73
% 求图示电路中的电压UAB和U。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*1.6, i); llabel(-,U,+)
    b_current(\unit{16}{\ampere},below_,O,E)
    line right_ elen*.7; dot
    {
        resistor(down_ elen*1.6, E); rlabel(,\unit{4}{\ohm},)
        b_current(I_1,below_,O,E); dot
    }
    line right_ elen*.7; dot
    {resistor(down_ elen*.8, E); rlabel(,\unit{6}{\ohm},)
    dot; "A" rjust
    resistor(down_ elen*.8, E); rlabel(,\unit{2}{\ohm},); b_current(I_2,,O,E); dot}
    line right_ elen*.7
    resistor(down_ elen*.8, E); rlabel(,\unit{3}{\ohm},)
    dot; "B" ljust
    resistor(down_ elen*.8, E); rlabel(,\unit{5}{\ohm},) b_current(I_3,,O,E)
    line left_ to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 74
% 求图示电路中的电流I和电压Uab 。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, v); llabel(-,\unit{30}{\volt},+)
    b_current(I,below_,O,E)
    resistor(right_ elen*.6, E); llabel(,\unit{5}{\ohm},); dot
    {
        move up_ .1; "a" ljust
    }
    {
        resistor(down_ elen*.8, E); llabel(,\unit{2}{\ohm},)
        dot; "b" below
    }
    {
        resistor(right_ elen*.8, E); rlabel(,\unit{1}{\ohm},)
        dot; "c" above
        {resistor(right_ elen*.8, E); rlabel(,\unit{10}{\ohm},)}
        resistor(down_ elen*.8, E); llabel(,\unit{2}{\ohm},); dot
    }
    line up_ elen*.5
    resistor(right_ elen*1.6, E); llabel(,\unit{2}{\ohm},)
    line down_ elen*.5; dot; "d" ljust
    resistor(down_ elen*.8, E); llabel(,\unit{4}{\ohm},)
    line left_ to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 75
% 用等效变换求图示电路中的电流I 。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.6, v); llabel(-,\unit{12}{\volt},+)
    resistor(up_ elen*.6, E); llabel(,\unit{2}{\ohm},)
    line right_ elen*.5; dot
    {
        resistor(down_ elen*.6, E); llabel(,\unit{2}{\ohm},)
        source(down_ elen*.6, v); llabel(+,\unit{8}{\volt},-); dot
    }
    resistor(right_ elen*.8, E); llabel(,\unit{3}{\ohm},)
    b_current(I); dot
    {
        resistor(down_ elen*1.2, E); rlabel(,\unit{4}{\ohm},)
        dot
    }
    line right_ elen*.5
    resistor(down_ elen*.6, E); llabel(,\unit{4}{\ohm},)
    source(down_ elen*.6, v); llabel(+,\unit{8}{\volt},-)
    line left_ to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 76
% 求图所示电路的输入电阻Rin 。
.PS
    cct_init
    elen = elen_
    Origin: Here
    line left_ elen*.4; dot
    {consource(left_ elen*.8, i); b_current(3u,below_,O,E)}
    line up_ elen*.4
    resistor(left_ elen*.8, E); rlabel(,\unit{2}{\ohm},)
    line down_ elen*.4; dot
    {
        resistor(down_ elen*.6, E); llabel(,\unit{2}{\ohm},)
        dot
    }
    line left_ elen*.4
    resistor(down_ elen*.6, E); rlabel(,\unit{2}{\ohm},)
    line right_ elen*1.6;"$-$" above
    gap(up_ elen*.6, 1)
    clabel(,u,); "$+$" below
    move down_ elen*.3 then right_ elen*.1; line <- right_ elen*.3
    "$R_\mathrm{in}$" ljust
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 77
% 求图所示电路的输入电阻Rin 。
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(left_ elen*.8, E); llabel(,\unit{2}{\ohm},); dot
    {
        resistor(down_ elen*1.2, E); llabel(,\unit{8}{\ohm},)
        b_current(i_1); dot
    }
    line left_ elen*.4
    consource(down_ elen*.6, v); rlabel(+,4i_1,-)
    resistor(down_ elen*.6, E); rlabel(,\unit{4}{\ohm},)
    line right_ elen*1.2; gap(up_ elen*1.2, 1); rlabel(,R_\mathrm{in},)
    move down_ elen*.6; line -> left_ elen*.3
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 78
% 在图中画出以支路2、4、7、8为树支的基本回路组.
.PS
    cct_init
    elen = elen_
    Origin: Here
    dot
    line to (elen*.3, elen*.8); {move to (Origin+Here)/2; "1" rjust}
    dot; NW: Here
    {line to (elen*.6, Origin.y)
        {move to (NW+Here)/2; "2" ljust}
        dot; L2: Here
    }
    line right_ elen*.6
    {move to (NW+Here)/2; "3" above}
    dot; NE: Here
    {line to (elen*.6, Origin.y)
        {
            move to (NE+Here)/2; dot; C48: Here; move to (L2+C48)/2; "8" ljust
            move to (NE+C48)/2; "4" rjust
        }
    }
    {
        line to (elen*1.5, Origin.y); dot; SE: Here
        move to (SE+NE)/2; "5" ljust
    }
    line from C48 to SE
    {move to (SE+C48)/2; "6" above}
    line from L2 to SE
    {move to (SE+L2)/2; "7" below}
    line from L2 to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 79
% 试画出图示有向图中以支路1、3、7、8为树支的基本回路组
.PS
    cct_init
    elen = elen_
    Origin: Here; dot
    {arrowline(up_ elen*.8); llabel(,1,); dot
    arrowline(right_ elen*.8); llabel(,2,); dot
    }
    {arrowline(right_ elen*.8); rlabel(,4,); dot
    arrowline(up_ elen*.8); rlabel(,3,)}; Point_(45)
    arrowline(to rvec_(sqrt(2)*elen*.4,0)); dlabel(.12,.08,,8,); dot
    {
        {arrowline(to rvec_(sqrt(2)*elen*.4,0)); dlabel(.12,.08,,6,)}
        {
            Point_(135); arrowline(to rvec_(sqrt(2)*elen*.4,0))
            dlabel(.12,.08,,5,)
        }
        Point_(-45); reversed(`arrowline', to rvec_(sqrt(2)*elen*.4, 0))
        dlabel(.12, .08, , 7, )
    }
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 80
% 图示电路，用支路电流法求各支路电流及电流源两端的电压。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*1.4, v); llabel(-,\unit{8}{\volt},+)
    b_current(I_1,below_,O,E)
    resistor(right_ elen*.6, E); llabel(,\unit{8}{\ohm},)
    dot; "a" above
    {resistor(down_ elen*.8, E); llabel(I_2,\unit{2}{\ohm},)
    b_current(); move up_ elen*.2;
    source(down_ elen*.8, i); b_current(\unit{1}{\ampere},,O,E); dot}
    resistor(right_ elen*.8, E); llabel(,\unit{4}{\ohm},)
    b_current(\;I_3,below_,O,E)
    source(down_ elen*1.4, v); llabel(+,\unit{10}{\volt},-)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 81
% 如下图所示，设信号源内阻RS=10K?，负载电阻RL=10?，为了实现阻抗匹配，用
% 理想变压器作耦合电路，问欲使负载RL获得最大功率，理想变压器的变比n=?。
.PS
    cct_init
    elen = elen_
    Origin: Here
    Tr1: transformer(down_ elen*.6,,,A); llabel(,L_2,); rlabel(,L_1,)
    {move to Tr1.P1; move left_ elen*.05; move down_ elen*.1; "*" at Here}
    {move to Tr1.S1; move right_ elen*.05; move down_ elen*.1; "*" at Here}
    move to (Tr1.P1+Tr1.S1)/2; "n:1" above
    move to Tr1.P1
    line left_ elen*.3; dot; "$1$" above
    resistor(left_ elen*.6, E); rlabel(,R_\mathrm{S},)
    source(down_ elen*.6, v); rlabel(+,\mathdot{U}_\mathrm{S},-)
    line right_ elen*.6; dot; "$1'$" below; line to Tr1.P2
    move to Tr1.S1
    line right_ elen*.3; dot; "$2$" above
    line right_ elen*.6
    resistor(down_ elen*.6, E); llabel(,R_\mathrm{L},)
    line left_ elen*.6; dot; "$2'$" below; line to Tr1.S2
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 82
% 用结点电压法求图示电路的支路电流及电流源两端的电压。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*1.4, v); llabel(-,\unit{8}{\volt},+)
    b_current(I_1,below_,O,E)
    resistor(right_ elen*.6, E); llabel(,\unit{8}{\ohm},)
    dot;
    {resistor(down_ elen*.8, E); llabel(I_2,\unit{2}{\ohm},)
    b_current(); move up_ elen*.2;
    source(down_ elen*.8, i); llabel(+,U,-)
    b_current(\unit{1}{\ampere},below_,O,E); dot;}
    resistor(right_ elen*.8, E); llabel(,\unit{4}{\ohm},)
    b_current(\;I_3,below_,O,E)
    source(down_ elen*1.4, v); llabel(+,\unit{10}{\volt},-)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 83
% 用结点电压法求图示电路的结点电压Un1、Un2、Un3。
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(up_ elen*.8, E); llabel(,\unit{1}{\ohm},)
    dot; "\ding{172}" rjust
    {line up_ elen*.5; source(right_ elen*1.4, v);
    llabel(+,\unit{5}{\volt},-); b_current(I,below_,O,E)
    line down_ elen*.5
    }
    resistor(right_ elen*.6, E); llabel(,\unit{0.5}{\ohm},); dot;
    "\ding{173}" above
    {
        source(down_ elen*.8, v); llabel(+,\unit{10}{\volt},-)
        dot; "\ding{175}" below
    }
    resistor(right_ elen*.8, E); llabel(,\unit{1}{\ohm},)
    dot; "\ding{174}" ljust
    resistor(down_ elen*.8, E); llabel(,\unit{2}{\ohm},)
    line to Origin
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
% fig 85
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
% fig 86
% 求图示电路的入端电阻(P44,2-5)
.PS
    cct_init
    elen = elen_
    Origin: Here
    arrowline(right_ elen*.3); llabel(,i,); dot
    {
        resistor(down_ elen*.6, E); dlabel(.12,.15,,R_1,); dot
    }
    {resistor(right_ elen*.8, E); dlabel(.12,-.12,,R_2,); dot}
    line up_ elen*.4
    consource(right_ elen*.8, i); b_current(\alpha i,,O,E)
    line down_ elen*.4
    resistor(down_ elen*.6, E); llabel(,R_3,)
    line left_ elen*1.1; "$1'$" below
    gap(up_ elen*.6,1); "$1$" above
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 87
% 求图示电路的入端电阻(P48,2-12a)
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(right_ elen*.6, E); llabel(,R_2,)
    consource(down_ elen*.6, v); llabel(-,\mu u_1,+)
    resistor(down_ elen*.6, E); llabel(,R_1,); rlabel(+,u_1,-)
    line left_ elen*.6; "b" above
    gap(up_ elen*1.2,1); "a" below
    move down_ elen*.6; "$R_\mathrm{ab}$" rjust
    line -> right_ elen*.2
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 88
% 求图示有源支路的功率（已知：US=6V，R=3Ω，IS=1A，I=2A）。
.PS
    cct_init
    elen = elen_
    Origin: Here
    arrowline(right_ elen*.4); llabel(,I,)
    source(down_ elen*.6, v); llabel(+,U_\mathrm{S},-)
    resistor(down_ elen*.6, E); llabel(,R,)
    line left_ elen*.4
    move to Origin
    gap(down_ elen*1.2,1,A); rlabel(,U,)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 89
% 求图示有源支路的功率（已知：US=6V，R=3Ω，IS=1A，I=2A）。
.PS
    cct_init
    elen = elen_
    Origin: Here
    reversed(`arrowline', right_ elen*.4); llabel(,I,)
    source(down_ elen*.6, v); llabel(+,U_\mathrm{S},-)
    resistor(down_ elen*.6, E); llabel(,R,)
    line left_ elen*.4
    move to Origin
    gap(down_ elen*1.2,1,A); rlabel(,U,)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 90
% 求图示有源支路的功率（已知：US=6V，R=3Ω，IS=1A，I=2A）。
.PS
    cct_init
    elen = elen_
    Origin: Here
    arrowline(right_ elen*.4); llabel(,I,); dot
    {source(down_ elen*.7, i); b_current(I_\mathrm{S},,O); dot}
    line right_ elen*.5
    resistor(down_ elen*.7, E); llabel(,R,)
    line left_ elen*.9
    move to Origin
    gap(down_ elen*.7,1,A); rlabel(,U,)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 91
% 求图示有源支路的功率（已知：US=6V，R=3Ω，IS=1A，I=2A）。
.PS
    cct_init
    elen = elen_
    Origin: Here
    reversed(`arrowline', right_ elen*.4); llabel(,I,); dot
    {source(down_ elen*.7, i); b_current(I_\mathrm{S},,O); dot}
    line right_ elen*.5
    resistor(down_ elen*.7, E); llabel(,R,)
    line left_ elen*.9
    move to Origin
    gap(down_ elen*.7,1,A); rlabel(,U,)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 92
% 求图示电路中各元件的功率，并说明是发出功率还是吸收功率。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.7, v); llabel(-,\unit{10}{\volt},+)
    resistor(right_ elen*.7, E); llabel(,\unit{1}{\ohm},)
    source(down_ elen*.7, i); llabel(+,U,-)
    b_current(\unit{2}{\ampere},below_,O,E)
    arrowline(left_ elen*.7); llabel(,I,)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 93
% 求图示电路中各元件的功率，并说明是发出功率还是吸收功率。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.9, v); llabel(-,\unit{10}{\volt},+)
    reversed(`arrowline', right_ elen*.4); llabel(,I_1,); dot
    {resistor(down_ elen*.9, E); llabel(,\unit{1}{\ohm},)
    b_current(I_2); dot}
    line right_ elen*.8
    source(down_ elen*.9, i); b_current(\unit{2}{\ampere},,O,)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 94
.PS
    cct_init
    elen = elen_
    Origin: Here
    arrowline(right_ elen*.3); llabel(,i,)
    inductor(down_ elen*.6); llabel(,\unit{2}{\henry},)
    line left_ elen*.3; move to Origin
    gap(down_ elen*.6,1,A); rlabel(,u,)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 95
% 图示电路,电容上的电流波形如图所示, u(0)=0,求电压u(t),并画波形。
.PS
    cct_init
    elen = elen_
    Origin: Here
    arrowline(right_ elen*.3); llabel(,i,)
    capacitor(down_ elen*.6); llabel(,\unit{0.5}{\farad},)
    line left_ elen*.3; move to Origin
    gap(down_ elen*.6,1,A); rlabel(,u,)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 96
% 求图示电路中电压U1，U2和电流I 。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8,i); llabel(-,U_1,+);
    b_current(\unit{1}{\ampere},below_,O,E)
    resistor(right_ elen*.6,E); llabel(,\unit{1}{\ohm},); dot
    {resistor(down_ elen*.8, E); dlabel(.15,.16,,\unit{2}{\ohm},); dot}
    line right_ elen*.6; dot
    {source(down_ elen*.8, v); llabel(+,\unit{10}{\volt},-)
    b_current(I,below_,O,E); dot}
    resistor(right_ elen,E); llabel(,\unit{1}{\ohm},)
    source(down_ elen*.8, i); llabel(+,U_2,-)
    b_current(\unit{2}{\ampere},below_,O,E)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 97
% 求图示电路中电压U和电流I 。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8,i); llabel(-,U,+);
    b_current(\unit{10}{\ampere},below_,O,E)
    line right_ elen*.6; dot
    {resistor(down_ elen*.8, E); llabel(I,,\unit{3}{\ohm})
    b_current(); dot}
    line right_ elen*.6; dot
    {consource(down_ elen*.8, i); b_current(2I,,O,E); dot}
    line right_ elen*.6
    resistor(down_ elen*.8, E); llabel(,\unit{1}{\ohm},)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 98
% 求图示电路中电流源和受控电压源的功率。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8,i); llabel(-,U,+);
    b_current(\unit{7}{\ampere},below_,O,E)
    line right_ elen*.6; dot
    {resistor(down_ elen*.8, E); llabel(I_1,\unit{3}{\ohm},)
    b_current(); dot}
    resistor(right_ elen*.8, E); llabel(,\unit{1}{\ohm},I)
    b_current(,,O,E)
    consource(down_ elen*.8, v); llabel(+,0.5I_1,-)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 99
% 图示RLC动态电路，由动态分析可得uC的零输入响应uC(t)=______
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(right_ elen*.6, E); llabel(,\unit{4}{\kilo\ohm},)
    inductor(right_ elen*.6); llabel(,\unit{1}{\henry},)
    capacitor(right_ .6*elen); llabel(,\unit{1}{\micro\farad},)
    rlabel(+,u_C,-)
    line down_ elen/3 then left_ elen*1.8 then up_ elen/3
.PE
