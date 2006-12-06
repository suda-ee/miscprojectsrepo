include(/usr/local/lib/m4/circuit_macros/mpost.m4)
include(/usr/local/lib/m4/circuit_macros/libcct.m4)
define(`dimen_', (dimen_*.8))
define(`elen_', (elen_*1.25))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 1
% 图示电路中，当ω0 =1000 rad /s时电路发生谐振，此时I=1A，且R1=R2 =100Ω，
% L=0.2H。求电路发生谐振时电容C的值和电压U。
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(right_ elen*.8, E); llabel(,R_1,); b_current(i)
    move left_ elen*.25
    capacitor(right_ elen*.6); llabel(,C,); dot
    {
        inductor(down_ elen*.8); rlabel(,L,); dot
    }
    line right_ elen*.6
    resistor(down_ elen*.8, E); rlabel(,R_2,)
    line to (Origin.x, Here.y); "$-$" above
    gap(up_ elen*.8, 1); clabel(,u,); "$+$" below
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 2
% 电路如下图所示，试求节点A的电位和电流源供给电路的有功功率、无功功率。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, v); llabel(-,\unit{20}{\volt},+)
    line right_ elen*.3; dot
    {
        inductor(down_ elen*.8); llabel(,\unit{j4}{\ohm},); dot
        ground(,,E)
    }
    resistor(right_ elen*.8, E); llabel(,\unit{4}{\ohm},); dot; "A" above
    {
        capacitor(down_ elen*.8); llabel(,,\unit{-j4}{\ohm}); dot
    }
    resistor(right_ elen*.8, E); llabel(,\unit{2}{\ohm},)
    source(down_ elen*.8, i); b_current(\unit{j10}{\ampere},,O)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 3
% 下图为一简单电力系统，已知负载电压UL=480V，感性负载Z1吸收的功率为10kW
% ，Z2吸收的功率为12kW，功率因数cos?1=0.8，cos?2=0.75，传输线阻抗ZW
% =0.35+j1.5Ω，试求电源发出的复功率以及电压。
.PS
    cct_init
    elen = elen_
    Origin: Here
    dot
    resistor(left_ elen*.8, E); llabel(,Z_\mathrm{W},)
    source(up_ elen*.8, v); llabel(-,\mathdot{U}_\mathrm{S},+)
    resistor(right_ elen*.8, E); llabel(,Z_\mathrm{W},)
    b_current(\mathdot{I}_\mathrm{L}); dot
    {
        resistor(down_ elen*.8, E); llabel(,Z_1,);
        rlabel(+,\mathdot{U}_\mathrm{L},-); dot
    }
    line right_ elen*.6
    resistor(down_ elen*.8, E); llabel(,Z_2,)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 4
% 如图所示，AB端加正弦交流电压，其有效值为U，角频率为?时改变电容器C。问：
% （1）使AB间的功率因数cos?=1时，需要对电阻有什么限制？
% （2）使AB间的功率因数时，电容C的值多大？并说明电阻R与电抗X之间的关系。
.PS
    cct_init
    elen = elen_
    Origin: Here
    inductor(right_ elen*.8); rlabel(,X,); dot
    {
        resistor(down_ elen*.8, E); rlabel(,R,); dot
    }
    line right_ elen*.4
    capacitor(down_ elen*.8); llabel(,C,); variable()
    line to (Origin.x, Here.y); "$-$" above; "B" rjust
    gap(up_ elen*.8, 1); clabel(,\mathdot{U},)
    "$+$" below; "A" rjust
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 5
% 如下图所示，在以下3种情况下，求图示电路中理想变压器的匝比n。若：
% （1） 10?电阻的功率为2?电阻功率的25%；
% （2） ；
% （3） a,b端的输入电阻为8?。
.PS
    cct_init
    elen = elen_
    Origin: Here
    Tr1: transformer(down_ elen*.8,,,A)
    {move to Tr1.P1; move left_ elen*.05; move down_ elen*.1; "*" at Here}
    {move to Tr1.S1; move right_ elen*.05; move down_ elen*.1; "*" at Here}
    move to (Tr1.P1+Tr1.S1)/2; "$1$:$n$" above
    resistor(from Tr1.P1 left_ elen*.8, E); rlabel(,\unit{2}{\ohm},);
    dot
    {
        consource(down_ elen*.8, i); b_current(3\mathdot{U}_2,,O); dot
    }
    line left_ elen*.2; dot; "a" above
    line left_ elen*.2
    source(down_ elen*.8, v); rlabel(+,\mathdot{U}_\mathrm{S},-)
    line right_ elen*.2; dot; "b" below
    line right_ elen
    line from Tr1.S1 right_ elen*.6
    resistor(down_ elen*.8, E); rlabel(+,\mathdot{U}_2,-)
    llabel(,\unit{10}{\ohm},)
    line left_ elen*.6
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 6
% 如下左图所示电路，已知ω=103rad/s，ZS= RS +jXS=(50+j100)Ω，R=100Ω，现只
% 备有电容器。试问当ZS与R不变时，在R与电源之间应连接一个什么样的电路，才
% 能使R获得最大功率？画出电路图，并算出元件值。
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(up_ elen*.5, E); llabel(,Z_\mathrm{S},);
    source(up_ elen*.7, v); llabel(-,\mathdot{U}_\mathrm{S},+);
    line right_ elen*.4; dot; "a" below
    line right_ elen*.4
    resistor(down_ elen*1.2, E); llabel(,R,)
    line left_ elen*.4; dot; "b" above
    line left_ elen*.4
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 7
% 如下图所示电路，电源角频率?=103rad/s，负载Z的实部与虚部均可调，试求负
% 载所能获得的最大功率。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, v);
    llabel(-,100\Varangle{0\degree}\unit{}{\volt},+)
    resistor(right_ elen*.7, E); llabel(,\unit{2}{\ohm},); dot
    {
        resistor(down_ elen*.8, E); rlabel(,\unit{4}{\ohm},)
        b_current(\mathdot{I}_1,, O, E); dot
    }
    line right_ elen*.4; dot
    {
        capacitor(down_ elen*.8); llabel(,,\unit{250}{\micro\farad}); dot
    }
    consource(right_ elen*.8, v); llabel(+,2\mathdot{I}_1,-)
    resistor(down_ elen*.8, E); llabel(,Z,); variable()
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 8
% 如下图所示电路，其中R1=1?，R2=1?，C1=0.25F，C2=0.25F，L=0.5H，求从电源
% 获得最大传输功率时负载的ZX值。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.6, v); llabel(-,2\sin \omega t,+)
    resistor(up_ elen*.4, E); llabel(,R_1,)
    inductor(right_ elen*.9); llabel(,L,); dot
    {
        resistor(down_ elen*.5, E); rlabel(,R_2,); dot
        {
            capacitor(down_ elen*.5); llabel(,,C_1); dot
        }
        line left_ elen*.3
        capacitor(down_ elen*.5); rlabel(,,C_2); dot
    }
    line right_ elen*.5
    resistor(down_ elen, E); llabel(,Z_X,)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 9
% 图示电路中理想变压器的变比为10：1，求电压U2（10-18，1Ω改为5KΩ）
.PS
    cct_init
    elen = elen_
    Origin: Here
    Tr1: transformer(down_ elen*.8,,,A)
    {move to Tr1.P1; move left_ elen*.05; move down_ elen*.1; "*" at Here}
    {move to Tr1.S1; move right_ elen*.05; move down_ elen*.1; "*" at Here}
    move to (Tr1.P1+Tr1.S1)/2; "10:1" above
    resistor(from Tr1.P1 left_ elen*.7, E); rlabel(,\unit{5}{\kilo\ohm},)
    source(down_ elen*.8, v);
    rlabel(+,10\Varangle{0\degree}\unit{}{\volt},-)
    line to Tr1.P2
    line from Tr1.S1 right_ elen*.5
    resistor(down_ elen*.8, E); llabel(,\unit{50}{\ohm},)
    rlabel(+,\mathdot{U}_2,-)
    line to Tr1.S2
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 10
% 图示电路中R1=50Ω，L1=70mH，L2=25mH，M=25mH，C=1μF，V，ω=104rad/s。求各
% 支路电流。（10-15）
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(right_ elen*.4, E); llabel(,R_1,)
    L1: inductor(right_ elen*.6); llabel(,\mathrm{j}\omega L_1,)
    {"*" at last [].e below; Xi1: Here}
    dot
    {
        L2: inductor(down_ elen*.8); rlabel(,\mathrm{j}\omega L_2)
        {"*" at last [].n rjust; Xi2: Here}
        dot
    }
    line right_ elen*.3
    capacitor(down_ elen*.8); llabel(,\frac{1}{\mathrm{j}\omega C},)
    line to (Origin.x, Here.y); "$-$" above
    gap(up_ elen*.8, 1); clabel(,\mathdot{U},); "$+$" below
    move to (elen*.4, -elen*.25)
    B1: ["$\mathrm{j}\omega M$"] 
    arrow from B1.ne to Xi1 chop .1
    arrow from B1.e to Xi2 chop .15 chop .1
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 11
% 求图示一端口电路的戴维宁等效电路。已知R1= R2=6Ω，ωL1=ωL2=10Ω，ωM=5Ω，μ
% ，V。（10-12）
.PS
    cct_init
    elen = elen_
    Origin: Here
    reversed(`inductor', left_ elen*.7); llabel(,\mathrm{j}\omega L_2,)
    {move to last [].w then down_ elen*.1; "*" above rjust; Xi2: Here}; dot
    {
        resistor(down_ elen*.8, E); llabel(,R_2,); dot
    }
    reversed(`inductor', left_ elen*.7); llabel(,\mathrm{j}\omega L_1,)
    {move to last [].e then down_ elen*.1; "*" above ljust; Xi1: Here}
    resistor(left_ elen*.4, E); rlabel(,R_1,)
    source(down_ elen*.8, v); llabel(+,\mathdot{U}_1,-)
    line to (Origin.x, Here.y); "$1'$" above
    gap(up_ elen*.8, 1); "$1$" below
    move to (-elen*.7, elen*.35)
    B1: ["$\mathrm{j}\omega M$"] 
    arrow from B1 to Xi1 chop .05 chop .15
    arrow from B1 to Xi2 chop .05 chop .15
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 12
% 如图所示电路求u2 ， 其中R1= 1Ω， R2 = 2Ω，C = 1F，L = 2H ，us=costV
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, v); llabel(-,u_\mathrm{S},+)
    move down_ elen*.2
    resistor(up_ elen*.8, E); llabel(,R_1,)
    capacitor(right_ elen*.5); rlabel(,C,); dot
    {
        inductor(down_ elen*1.4); rlabel(,L,); dot
    }
    line right_ elen*.5; dot
    {
        consource(down_ elen*1.4, i); b_current(3u_2,below_,O); dot
    }
    line right_ elen*.6
    resistor(down_ elen*1.4, E); rlabel(,,R_2); llabel(+,u_2,-)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 13
% 在电源和电动机之间串联一电感线圈可降低单相小功率电动机（例如电风扇）的
% 转速，但为避免电阻损耗能量，可以采用串联电容器的方法。今通过实验已经测
% 定，当电动机端电压 (即U1) 降至180V时最为合适，且此时电动机的等效电阻
% R=190?，电抗XL =260?。问：（1） 应串联多大容量的电容器，方能连接在
% U=220V，50Hz的电源上获得U1=180V 的电压？（2） 此时电容器承受的工作电压
% 是多少？（3） 试作出所述电容、电阻、电感三元件等效串联电路的电流、电压
% 相量图。
.PS
    cct_init
    elen = elen_
    Origin: Here
    arrowline(up_ elen*.5); llabel(,\mathdot{I},)
    resistor(right_ elen*.6, E); rlabel(,R,); llabel(+,,\!\mathdot{U}_1)
    inductor(right_ elen*.4, E); rlabel(,\mathrm{j}X_L,); llabel(,,-)
    capacitor(right_ elen*.7); llabel(,,-\mathrm{j}X_C);
    rlabel(+,\mathdot{U}_C,-)
    line down_ elen*.5; "$-$" rjust
    gap(left_ elen*1.7, 1); clabel(,\mathdot{U},)
    "$+$" ljust
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 14
% 图示电路处于谐振状态，其中Is = 1 A，U1= 50 V，R1=Xc=100Ω，求电压UL和电
% 阻R2 。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, i); b_current(\mathdot{I}_\mathrm{S},,O,E)
    line right_ elen*.6; dot
    {
        resistor(down_ elen*.8, E); llabel(,R_1,);
        rlabel(+,\mathdot{U}_1,-); dot
    }
    resistor(right_ elen*.9, E); llabel(,R_2,)
    inductor(down_ elen*.8); rlabel(,\mathrm{j}X_L,);
    llabel(+,\mathdot{U}_L,-)
    capacitor(left_ elen*.9); llabel(,-\mathrm{j}X_C);
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 15
% P107; 4-12(c)
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(left_ elen*.6, E); rlabel(,\unit{5}{\ohm},); dot
    {
        resistor(down_ elen*.8, E); llabel(,\unit{2}{\ohm},);
        move up_ elen*.2
        consource(down_ elen*.8, v); llabel(-,2i_1,+); dot
    }
    resistor(left_ elen*.8, E); llabel(,\unit{8}{\ohm},)
    source(down_ elen*1.4, v); llabel(+,\unit{4}{\volt},-);
    b_current(i_1,below_,O)
    line to (Origin.x, Here.y); "$1'$" above
    gap(up_ elen*1.4, 1); "$1$" below
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 16
% 图示电路中，Uc=50V，R1 =5Ω，R2 = R3=10Ω，C= 0.5F，Is =2A，电路换路前已
% 达到稳态，求s闭合后电容上的电压uc(t)。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, v); llabel(-,U_\mathrm{S},+)
    switch(right_ elen*.6,,C); llabel(S(t=0),); move left_ elen*.1
    resistor(right_ elen*.6,E); llabel(,R_1,); dot
    {
        capacitor(down_ elen*.8); llabel(+,u_C,-); rlabel(,C,); dot
    }
    resistor(right_ elen*.6, E); llabel(,R_2,); dot
    {
        resistor(down_ elen*.8, E); llabel(,R_3,); dot
    }
    line right_ elen*.7
    source(down_ elen*.8, i); b_current(I_\mathrm{S},,O)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 17
% xiti P322 16-4(a)
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(right_ elen*.8, E); llabel(,\unit{2}{\ohm},)
    b_current(I_1); dot
    {
        resistor(right_ elen*.4, E); llabel(,\unit{4}{\ohm},)
        consource(right_ elen*.8, v); rlabel(-,2I_1,+)
        b_current(I_2,,,E); line right_ elen*.2
    }
    resistor(down_ elen*.8, E); llabel(,\unit{1}{\ohm},); dot
    {
        line right_ elen*1.4; "$2'$" ljust; "$-$" above
        gap(up_ elen*.8, 1); clabel(,U_2,)
        "$2$" ljust; "$+$" below
    }
    line left_ elen*.8; "$1'$" rjust; "$-$" above
    gap(up_ elen*.8, 1); clabel(,U_1,)
    "$1$" rjust; "$+$" below
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 18
% xiti P322 16-4(b)
.PS
    cct_init
    elen = elen_
    Origin: Here
    arrowline(right_ elen*.4); llabel(,I_1,); dot
    {
        resistor(down_ elen*.8, E); llabel(,\unit{1}{\ohm},); dot
    }
    resistor(right_ elen*.8, E); llabel(,\unit{2}{\ohm},); dot
    {
        consource(down_ elen*.8, i); b_current(3I_1,below_,O); dot
    }
    line right_ elen*.3
    {
        reversed(`arrowline', right_ elen*.6); llabel(,I_2,)
    }
    resistor(down_ elen*.8, E); llabel(,,\unit{1}{\ohm}); dot
    {
        line right_ elen*.6; "$2'$" ljust; "$-$" above
        gap(up_ elen*.8, 1); clabel(,U_2,)
        "$2$" ljust; "$+$" below
    }
    line left_ elen*1.5; "$1'$" rjust; "$-$" above
    gap(up_ elen*.8, 1); clabel(,U_1,)
    "$1$" rjust; "$+$" below
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 19
% 图示电路中：R1=10Ω，R2=4Ω，R3=15Ω，L=1H，电压u1的初始值为u1(0+) = 15V
% ，求零输入响应uL(t)。
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(up_ elen, E); rlabel(,R_3,)
    line right_ elen*.8; dot
    {
        inductor(down_ elen*.6); llabel(+,u_L,-); rlabel(,L,)
        resistor(down_ elen*.4, E); rlabel(,R_2,); dot
    }
    line right_ elen*.8
    resistor(down_ elen, E); llabel(+,u_1,-); rlabel(,R_1)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 20
% 图所示电路中，R1=15Ω，R2=10Ω，C=50μF ， t = 0时将开关S闭合，并且uc(0—
% ) = 9V，求电路的零输入响应uc(t)。
.PS
    cct_init
    elen = elen_
    Origin: Here
    capacitor(up_ elen*.8); rlabel(-,u_C,+); llabel(,C,)
    b_current(i,,,E)
    switch(right_ elen*.9,,C); llabel(,S,); dot
    {
        resistor(down_ elen*.8, E); rlabel(,R_2,); dot
    }
    resistor(right_ elen*.4, E); llabel(,R_1,)
    consource(down_ elen*.8, v); llabel(+,6i,-)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 21
% 图示电路中，us=2V，R1=1KΩ，R2=2KΩ，C=300μF，t <0时电路处于稳态，在t =
% 0时，将开关s闭合，求uc (t)。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, v); llabel(-,U_\mathrm{S},+)
    resistor(right_ elen*.7,E); llabel(,R_1,); dot
    {
        capacitor(down_ elen*.8); rlabel(,C,)
        llabel(+,u_C,-); dot
    }
    switch(right_ elen*.7,,C); llabel(,S,)
    resistor(down_ elen*.8, E); llabel(,R_2,)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 22
% 图示电路中，R1=3Ω，C=1F，     Uc（0—）=100V，R2=6Ω，开关s原处于断开状
% 态，当电压Uc低于50V时自动导通，求t >0时的电容电压uc (t)和电流ic(t)。
.PS
    cct_init
    elen = elen_
    Origin: Here
    capacitor(up_ elen*.8); rlabel(-,U_C,+); llabel(,C,)
    arrowline(right_ elen*.7); llabel(,i_C,); dot
    {
        resistor(down_ elen*.8, E); llabel(,R_1,); dot
    }
    switch(right_ elen*.7,,C); llabel(,S,)
    resistor(down_ elen*.8, E); llabel(,R_2,)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 23
% 图示电路中，R1=6Ω，R2 =5Ω，R3 =20Ω，L=2H，Us =12V，Is=3A，t < 0时电路
% 处于稳态，t = 0时换路，求t > 0时的电流i(t)的全响应。
.PS
    cct_init
    elen = elen_
    Origin: Here
    switch(up_ elen*.8,,C); llabel(,S(t=0),)
    line right_ elen*.4; dot
    {
        source(down_ elen*.8, i); b_current(I_\mathrm{S},below_,O); dot
    }
    line right_ elen*.3; dot
    {
        resistor(down_ elen*.8, E); llabel(,R_1,); dot
    }
    inductor(right_ elen*.6); llabel(,L,); dot
    {
        resistor(down_ elen*.8, E); llabel(,R_2,); dot
    }
    source(right_ elen*.6, v); llabel(-,U_\mathrm{S},+)
    resistor(down_ elen*.8, E); llabel(,R_3,)
    b_current(i,,O,E)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 24
% 图示电路中，Is =ε(t)，L= 2H，R1 = R2 = 10Ω，求uL的单位阶跃响应。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8,i); b_current(I_\mathrm{S},,O,E)
    line right_ elen*.4; dot
    {
        resistor(down_ elen*.8, E); llabel(,R_2,); dot
    }
    resistor(right_ elen*.8, E); llabel(,R_1,)
    inductor(down_ elen*.8); rlabel(,L,); llabel(+,u_L,-)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 25
% 图示电路中，R =1Ω，L=1H，Is =1A，且iL (0—)=2A，求t≥0+时u0(t)。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.6,v); llabel(-,U_\mathrm{S},+)
    resistor(up_ elen*.4,E); llabel(,R,); dot
    {
        resistor(right_ elen*.8, E); rlabel(,R,); dot
    }
    line up_ elen*.3
    inductor(right_ elen*.8); llabel(,L,); b_current(i_L)
    line down_ elen*.3
    resistor(down_ elen, E); rlabel(,R,); llabel(+,u_0,-)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 26
% 图示线性时不变电路中，R =1Ω，C=1F，求i0(t)的单位阶跃响应响应。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8,v); llabel(-,U_\mathrm{S},+)
    resistor(right_ elen*.7,E); llabel(,R,); dot
    {
        capacitor(down_ elen*.8); llabel(,C,); rlabel(+,u_C,-); dot
    }
    line right_ elen*.6; dot
    {
        resistor(down_ elen*.8, E); llabel(,R,); dot
    }
    resistor(right_ elen*.6, E); llabel(,R,)
    arrowline(down_ elen*.8); llabel(,i_0(t),)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 27
% 图示电路中，R1=1Ω，R2=2Ω，C=3F，Is=ε(t)，且uc(0—）= 0，试计算单位阶跃
% 响应uc（t）。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8,i); b_current(i_\mathrm{S},,O,E)
    line right_ elen*.4; dot
    {
        resistor(down_ elen*.8, E); llabel(,R_2,); dot
    }
    resistor(right_ elen*.8, E); llabel(,R_1,)
    capacitor(down_ elen*.8); llabel(+,u_C,-); rlabel(,C,)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 28
% 图示电路中开关S打开前已处于稳态。t=0开关打开，求t>0时的uL(t)。（6-11）
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8,v); llabel(-,\unit{10}{\volt},+)
    resistor(right_ elen*.5, E); llabel(,\unit{2}{\ohm},); dot
    {
        source(down_ elen*.8, i); b_current(\unit{2}{\ampere},,O); dot
    }
    resistor(right_ elen*.5, E); llabel(,\unit{3}{\ohm},); dot
    {
        reversed(`switch', down_ elen*.8,R,O); llabel(,S,(t=0)); dot
    }
    resistor(right_ elen*1.2, E); llabel(,\unit{5}{\ohm},)
    inductor(down_ elen*.8); llabel(+,u_L,-); rlabel(,\unit{0.2}{\henry})
    line to Origin
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
% fig 30
% 图示电路中t=0时开关S1打开，S2闭合，开关动作前，电路已处于稳态。，求t>0
% 时的iL(t)和uL(t)。（6-18）
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen,v); llabel(-,\unit{10}{\volt},+)
    resistor(right_ elen*.4, E); llabel(,\unit{1}{\ohm},)
    switch(right_ elen*.4,,O); llabel(,S_1,); dot
    {
        inductor(down_ elen); rlabel(,\unit{0.3}{\henry},)
        llabel(+,u_L,-); b_current(i_L,below_); dot
    }
    line right_ elen*.6; dot
    {
        resistor(down_ elen, E); llabel(,\unit{4}{\ohm}); dot
    }
    switch(right_ elen,,C); llabel(,S_2,); dot
    {
        resistor(down_ elen, E); rlabel(,\unit{2}{\ohm}); dot
    }
    line right_ elen*.4
    source(down_ elen, i); b_current(\unit{3}{\ampere},,O)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 31
% 图示电路中开关S打开前已处于稳态。R=2Ω，L=4H，Us =10V，Is=2A，求开关S闭
% 合后的电路中的iL(t)和i。（P139例6-4）
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen,v); llabel(-,U_\mathrm{S},+)
    resistor(right_ elen*.8, E); llabel(,R,); b_current(i)
    move left_ elen*.2
    switch(right_ elen*.6,,C); llabel(,S(t=0),); dot
    {
        source(down_ elen,i); b_current(I_\mathrm{S},below_,O,E); dot
    }
    line right_ elen*.2; "a" above; line right_ elen*.2
    inductor(down_ elen); llabel(,L,); b_current(i_L,)
    line left_ elen*.2; "b" below
    {line to Origin}
    gap(up_ elen, 1)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 32
% 图示电路中，开关合在1时已达稳态。t=0时开关由1合向2，求t>0时的uL(t)。（
% P140-例6-5书上开关箭头画错）
.PS
    cct_init
    elen = elen_
    Origin: Here
    dot
    consource(left_ elen,v); rlabel(-,2i_1,+); dot
    {
        resistor(up_ elen*1.5, E); rlabel(,\unit{4}{\ohm},);
        b_current(i_1,below_,,E); dot
    }
    line left_ elen*.4
    source(up_ elen*1.5,i); b_current(\unit{2}{\ampere},,O,E)
    line right_ elen*.4
    resistor(right_ elen*.6,E); llabel(,\unit{4}{\ohm},)
    reversed(`switch', right_ elen*.8, ,C); llabel(,2,S)
    line right_ elen*.6
    inductor(down_ elen*1.5); llabel(+,u_L,-); rlabel(,\unit{0.1}{\henry},)
    b_current(i_L,below_)
    line to Origin
    resistor(up_ elen*.55, E); rlabel(,\unit{2}{\ohm},)
    source(up_ elen*.8, v); llabel(+,\unit{8}{\volt},-); dot(,,1)
    "$1$" ljust
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 33
% 图示电路中电路换路前已达到稳态，求s闭合后电容上的电压uc(t)并作出其波形图。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, i); b_current(\unit{0.5}{\ampere},,O,E)
    line right_ elen*.8; dot
    {
        resistor(down_ elen*.8, E); rlabel(,\unit{10}{\ohm},); dot
    }
    line right_ elen*.6; dot
    {
        capacitor(down_ elen*.8); rlabel(,\unit{3}{\farad},)
        llabel(+,u_C,-); dot
    }
    switch(right_ elen*.6,,C); llabel(,S(t=0),)
    resistor(down_ elen*.8, E); llabel(,\unit{5}{\ohm},)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 34
% 图示电路中t=0时开关S闭合，开关动作前，电路已处于稳态，iL(0-)=2A。求t>0
% 时的iL(t)和uL(t)。
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.8, v); llabel(-,\unit{6}{\volt},+)
    resistor(right_ elen*.4, E); llabel(,\unit{4}{\ohm},); dot
    {
        resistor(down_ elen*.8, E); llabel(,\unit{4}{\ohm},); dot
    }
    switch(right_ elen*.5,,C); llabel(,(t=0),); rlabel(,S,)
    resistor(right_ elen*.5, E); llabel(,,\unit{3}{\ohm})
    inductor(down_ elen*.8); llabel(,\unit{0.5}{\henry},)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 35
% 图示电路中，R1=R2 =10kΩ，R3 =30kΩ，C=10μF， Is=1mA，t < 0时电路处于稳
% 态，t = 0时开关断开，求开关断开后的uc(t ) 和u (t )。电工电子技术P161例
% 5.4.1
.PS
    cct_init
    elen = elen_
    Origin: Here
    line left_ elen*.3
    source(up_ elen, i); b_current(I_\mathrm{S},,O,E)
    line right_ elen; dot
    {
        resistor(down_ elen*.4, E); rlabel(,R_1,); dot
        {
            resistor(down_ elen*.6, E); llabel(,R_2,); dot
        }
        line left_ elen*.4
        switch(down_ elen*.6,,O); llabel(,S); dot
    }
    resistor(right_ elen*.8, E); llabel(,R_3,)
    capacitor(down_ elen); rlabel(,C,); llabel(+,u_C,-); 
    b_current(i_C,below_)
    line to Origin; "$-$" above
    gap(up_ elen, 1); clabel(,u,)
    "$+$" below
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 36
% 图示电路中，R1=R2 =20kΩ，Us =10V，L=1H， Is=2mA，t < 0时电路处于稳态，
% t = 0时开关闭合，求开关闭合后的iL(t )。电工电子技术P162例5.4.2
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen, i); b_current(I_\mathrm{S},,O,E)
    line right_ elen*.4; dot
    {
        resistor(down_ elen, E); llabel(,R_1,)
    }
    switch(right_ elen*.9,,C); llabel(,S,); dot
    {
        resistor(down_ elen*.4, E); rlabel(,R_2,)
        source(down_ elen*.6, v); rlabel(+,U_\mathrm{S},-); dot
    }
    line right_ elen*.4
    inductor(down_ elen); llabel(,L); b_current(i_L)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 37
% 求如图所示二端口的Y参数。
.PS
    cct_init
    elen = elen_
    Origin: Here
    arrowline(right_ elen*.3); llabel(,\mathdot{I}_1,); dot
    {
        resistor(down_ elen*.8, E); llabel(,\unit{2}{\siemens},); dot
    }
    capacitor(right_ elen*.8, E); llabel(,\unit{j4}{\siemens},); dot
    {
        reversed(`arrowline', right_ elen*.8); llabel(,\mathdot{I}_2,)
    }
    inductor(down_ elen*.8, E); llabel(,-\unit{j1}{\siemens},); dot
    {
        line right_ elen*.8; "$-$" above
        gap(up_ elen*.8, 1); clabel(,\mathdot{U}_2,)
        "$+$" below
    }
    line left_ to (Origin.x, Here.y); "$-$" above
    gap(up_ elen*.8, 1); clabel(,\mathdot{U}_1,)
    "$+$" below
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 38
% 试求出下图二端口网络在正弦激励情况下的Z参数。
.PS
    cct_init
    elen = elen_
    Origin: Here
    arrowline(right_ elen*.3); llabel(,i_1,); dot
    {
        consource(right_ elen*.7, i); b_current(\mu i,below_,O); dot
    }
    line up_ elen*.3
    capacitor(right_ elen*.7); llabel(,C,)
    line down_ elen*.3
    {
        resistor(right_ elen*.8, E); llabel(,R,); b_current(i_2,,,E);
    }
    resistor(down_ elen*.8, E); llabel(,R,); b_current(i,,O,E)
    {
        line right_ elen*.8
        "$-$" above; "$2$" ljust
        gap(up_ elen*.8, 1); clabel(,u_2,)
        "$+$" below; "$2'$" ljust
    }
    line left_ to (Origin.x, Here.y); "$-$" above; "$1'$" rjust
    gap(up_ elen*.8, 1); clabel(,u_1,)
    "$+$" below; "$1$" rjust
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 39
% 求图示双口网络的开路阻抗矩阵Z。
.PS
    cct_init
    elen = elen_
    Origin: Here
    arrowline(right_ elen*.3); llabel(,I_1,); dot
    {
        line up_ elen*.3
        consource(right_ elen*1.4,i); b_current(gU,,O,E)
        line down_ elen*.3; dot
        reversed(`arrowline', right_ elen*.3); llabel(,I_2,)
    }
    resistor(right_ elen*.7, E); rlabel(,R_1,); dot
    {
        resistor(right_ elen*.7, E); rlabel(,R_3,)
    }
    resistor(down_ elen*.8, E); rlabel(,R_2,); llabel(+,U,-); dot
    {
        line right_ elen
        "$-$" above;
        gap(up_ elen*.8, 1); clabel(,U_2,)
        "$+$" below;
    }
    line left_ to (Origin.x, Here.y); "$-$" above;
    gap(up_ elen*.8, 1); clabel(,U_1,)
    "$+$" below;
.PE
