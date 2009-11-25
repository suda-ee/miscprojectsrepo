include(/usr/local/lib/m4/circuit_macros/libcct.m4)
define(`dimen_', (dimen_*.8))
define(`elen_', (elen_*1.25))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 01
% ��ͼʾ��·�еĵ�ѹ $U$ �͵���Դ�Ĺ��� $P_\mathrm{S}$��
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen, i); llabel(,\unit{2}{\ampere},);
    rlabel(-, U, +)
    b_current(,,O,)
    resistor(right_ elen, E); rlabel(,\unit{5}{\ohm},)
    source(down_ elen, v); llabel(+, \unit{15}{\volt}, -)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 02
% ����ͼ��ʾ��·�ĵ�ѹ $U_\mathrm{cb}$��
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
% ��ͼ��ʾ��·�п����� $U_1$ ����ѹ $U$��
.PS
    cct_init
    elen = elen_
    Origin: Here
    line left_ elen
    source(up_ elen, v); llabel(-, \unit{2}{\volt}, +)
    resistor(right_ elen, E); llabel(, \unit{1}{\kilo\ohm}, )
    {
        gap(down_ elen); clabel(+,U_1, -)
    }
    resistor(right_ elen, E); llabel(,\unit{10}{\kilo\ohm},)
    consource(down_ elen, v); rlabel(+, U, -)
    llabel(+, 10 U_1, -)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 04
% ��������� $R_\mathrm{ab}$��
.PS
    cct_init
    elen = elen_
    Origin: Here
    "a" below
    resistor(right_ elen, E); llabel(,R_1,);
    b_current(i_1); dot
    {
        resistor(down_ elen, E); rlabel(,R_2,); dot
    }
    line right_ elen/2
    consource(down_ elen, i); llabel(, \beta i_1,)
    b_current(, , O)
    line to (Origin.x, Here.y)
    "b" above
    gap(to Origin, 1)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 05
% ��ͼ�е�·��~ab~�˿ڵĴ�ά����ŵ�ٵ�Ч��·��
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
% fig 06
% �� $i = \unit{1}{\ampere}$ �� $i = \mathrm{e}^{-t}\unit{}{\ampere}$
% ʱ��������µ� $u$��
.PS
    cct_init
    elen = elen_
    Origin: Here
    "$+$" below
    resistor(right_ elen, E); llabel(,\unit{1}{\ohm},)
    b_current(i)
    inductor(down_ elen, W); llabel(,\unit{1}{\henry},)
    line left_ elen; "$-$" above
    gap(to Origin, 1); clabel(,u,)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 07
% ͼʾ��·�У����� S ����ǰ��·�Ѵ��ȶ�״̬��ԭ����λ�� 1��$t=0$ ʱ
% S ��λ�� 1 ����λ�� 2���� $t\geq 0$ ʱ��е�ѹ $u_L$ ����Ӧ��
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
% fig 08
% ����ͼ��·�е������迹 $Z$ �͵��� $Y$��
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
% fig 09
% �г���ͼ��·�Ļ�·�������̻����ѹ���̡�
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen,v); llabel(-,\mathdot{U}_{\rm S},+)
    resistor(right_ elen*.7, E); llabel(,\unit{1}{\ohm},); dot
    {
        line up_ elen*.5
        arrowline(right_ elen*2); llabel(,\mathdot{I},)
        line down_ elen*.5
    }
    resistor(right_ elen, E); rlabel(,\unit{1}{\ohm},); dot
    {
        consource(down_ elen, i); b_current(\beta\mathdot{I},,O,E); dot;
    }
    resistor(right_ elen, E); llabel(,\unit{2}{\ohm},); dot;
    inductor(down_ elen, W); llabel(,\jimag \unit{4}{\ohm},)
    line to Origin
.PE
