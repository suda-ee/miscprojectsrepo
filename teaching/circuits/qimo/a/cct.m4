include(/usr/local/lib/m4/circuit_macros/libcct.m4)
define(`dimen_', (dimen_*.8))
define(`elen_', (elen_*1.25))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 01
% ��ͼʾ��·�ж�����Դ�Ĺ��ʡ�
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen, i); b_current(\unit{2}{\ampere},,O,E)
    rlabel(-,U,+)
    resistor(right_ elen, E); rlabel(,\unit{5}{\ohm},)
    llabel(+,U_1,-); dot
    {
        source(down_ elen, v); llabel(-,\unit{3}{\volt},+)
        b_current(I,below_,O,E); dot
    }
    resistor(right_ elen, E); llabel(,\unit{20}{\ohm},)
    consource(down_ elen, i); llabel(,,0.05U_1)
    b_current(,,O,E)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 02
% ��·����ͼ��ʾ������~$I_1$~��~$U_{\mathrm{ab}}$��
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen, v); llabel(-,U_\mathrm{S},+);
    resistor(right_ elen, E); llabel(,\unit{6}{\ohm},)
    b_current(I_1); dot; "a" above
    {
        resistor(down_ elen, E); rlabel(,\unit{4}{\ohm},)
        dot; "b" below
    }
    resistor(right_ elen, E); llabel(,\unit{5}{\ohm},)
    rlabel(+, \unit{10}{\volt}, -)
    consource(down_ elen, i); b_current(I)
    b_current(0.9 I_1, , O, E)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 03
% ����ͼ��ʾ��·�ĵ���~$I$��
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.7, v); llabel(-,\unit{10}{\volt},+);
    resistor(up_ elen*.7, E); llabel(,\unit{4}{\ohm},)
    line right_ elen*.9; dot
    {
        resistor(down_ elen*.7, E); rlabel(,\unit{4}{\ohm},)
        source(down_ elen*.7, v); rlabel(+,\unit{4}{\volt},-);
        dot
    }
    line right_ elen*.9; dot
    {
        resistor(down_ elen*.7, E); rlabel(,\unit{2}{\ohm},)
        source(down_ elen*.7, v); rlabel(+,\unit{6}{\volt},-);
        dot
    }
    {resistor(right_ elen, E); rlabel(,\unit{4}{\ohm},); dot}
    line up_ elen*.5
    source(right_ elen, i); b_current(,,O)
    llabel(\unit{1}{\ampere},,)
    line down_ elen*.5
    {resistor(down_ elen*1.4, E); rlabel(,\unit{10}{\ohm},); dot}
    line right_ elen*.6
    resistor(down_ elen*1.4, E); llabel(,\unit{10}{\ohm},)
    b_current(I)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 04
% �ֱ���~$u = \unit{12}{\volt}$~��~$u = 4 \sin 2t \unit{}{\volt}$~ʱ
% ��~$i$��
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
% fig 05
% ��֪��ͼ��ʾ��·�е�����N�������Ե�����ɡ���is=1 A��us=2 Vʱ��i=5 A��
% ��is = ?2 A��us = 4 Vʱ��u = 24 V������is = 2 A��us = 6 Vʱ�ĵ�ѹu��
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
% fig 06
% ��ͼ�е�~$U_x$��
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen, v); llabel(-, \unit{20}{\volt}, +); dot
    {
        line up_ elen*.6
        source(right_ elen*2, i)
        b_current(\unit{0.15}{\ampere},,O,E)
        line down_ elen*.6
    }
    resistor(right_ elen, E); llabel(,\unit{24}{\ohm},); dot
    {
        resistor(down_ elen, E); llabel(,\unit{32}{\ohm}, )
        rlabel(+, U_x, -); dot
    }
    resistor(right_ elen, E); llabel(,\unit{8}{\ohm},); dot
    consource(down_ elen, i); b_current(0.05 U_x, ,O, E)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 07
% ��~ab~�˿ڵĴ�ά����ŵ�ٵ�Ч��·��
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen, v); llabel(-, \unit{10}{\volt},+)
    resistor(right_ elen*.8, E); llabel(,\unit{2}{\ohm},)
    dot
    {
        resistor(down_ elen, E); rlabel(,\unit{2}{\ohm},)
        dot
    }
    resistor(right_ elen*.8, E); llabel(,\unit{2}{\ohm},)
    dot
    {
        resistor(down_ elen, E); rlabel(,\unit{2}{\ohm},)
        dot
    }
    resistor(right_ elen*.8, E); llabel(,\unit{1}{\ohm},)
    dot
    {
        resistor(down_ elen, E); rlabel(,\unit{1}{\ohm},)
        dot
    }
    line right_ elen*.3; "a" below
    {
        move down_ elen; "b" above
        line to Origin
    }
    gap(down_ elen, 1)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 08
% ��֪~$\mathdot{I}_{\mathrm{S}} = 6 \Varangle{0\degree}\unit{}{\ampere}$��Ϊʹ
% ~$Z_\mathrm{L}$~�������ʣ������迹~$Z_\mathrm{L}$~�����յĹ���
% ~$P_\mathrm{Lmax}$��
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen, i);
    b_current(\mathdot{I}_\mathrm{S}, , O, E)
    line right_ elen*.5; dot
    {
        capacitor(down_ elen); llabel(,-\jimag \unit{5}{\ohm},)
        dot
    }
    resistor(right_ elen, E); llabel(,\unit{15}{\ohm},); dot
    {
        inductor(down_ elen, W); llabel(,,\jimag \unit{10}{\ohm}); dot
    }
    line right_ elen*.8
    resistor(down_ elen, E); llabel(,Z_\mathrm{L},); variable()
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 09
% ͼʾ��·�У�����~S~����ǰ��·�Ѵ��ȶ�״̬��ԭ����λ��~1��$t=0$~ʱ
% ~S~��λ��~1~����λ��~2����
% ~$t\geq 0$~ʱ��е���~$i_L$~����Ӧ��
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
% fig 10
% ����ͼ�е�·�Ļ�·�������̡�
.PS
    cct_init
    elen = 1.2*elen_
    Origin: Here
    source(up_ elen,v); llabel(-,\mathdot{U}_{\rm S},+); dot;
    "\ding{172}" rjust
    {line up_ .6*elen then right_ .6*elen; dot(,,1); "$+$" ljust}
    inductor(right_ elen,W); rlabel(,{\rm j}\unit{15}{\ohm},);dot; "\ding{173}" above
    {
        capacitor(down_ elen); llabel(,,-{\rm j}\unit{5}{\ohm}); dot;
        ground(,,E)
    }
    resistor(right_ elen,E); llabel(,\unit{1}{\ohm},); dot;
    "\ding{174}" ljust
    {
        line up_ .6*elen then left_ .6*elen; dot(,,1); "$-$" rjust
        "$\mathdot{U}_{\rm o}$" at (elen,Here.y)
    }
    consource(down_ elen,i); b_current(g\mathdot{U}_{\rm o},,O,E)
    line to Origin
    arcd((.5*elen,.5*elen),.3*elen,180,-90) -> cw
    arcd((elen+.5*elen,.5*elen),.3*elen,180,-90) -> cw
.PE
