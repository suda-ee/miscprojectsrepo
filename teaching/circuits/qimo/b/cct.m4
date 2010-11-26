include(/usr/local/lib/m4/circuit_macros/libcct.m4)
define(`dimen_', (dimen_*.8))
define(`elen_', (elen_*1.25))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 01
% ��ͼ�и������Ĺ���(��˵�������ջ��Ƿ���)��
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
% fig 04
% ����� $I$��
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
% fig 05 ��ͼ��ʾ��·������� I �͵�ѹ U��
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
% fig 06 ��ͼ��ʾ��·��$R_\mathrm{L}$ �ɱ䣬�� $R_\mathrm{L}$ ȡ��ֵʱ��
% �������ʣ������������ʡ�
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
% ����ͼ��·�е������迹 $Z$ �͵��� $Y$��
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
% �г���ͼ��·�Ļ�·�������̻����ѹ���̡�
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
