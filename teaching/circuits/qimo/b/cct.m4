include(/usr/local/lib/m4/circuit_macros/libcct.m4)
define(`dimen_', (dimen_*.8))
define(`elen_', (elen_*1.25))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 01
% ��·����ͼ��ʾ�����������ܿ�Դ�Ĺ��ʡ�
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen, v); rlabel(-,U,+); b_current(\unit{0.5}{\ampere},,O,E)
    resistor(right_ elen*1.2, E); rlabel(,\unit{2}{\ohm},)
    consource(down_ elen, v); llabel(+,2U,-)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 02
% ����ͼ��ʾ��·�ĵ�ѹ~$U_\mathrm{cb}$��
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
% ����ͼ��ʾ��·�еĵ�ѹ��~$U_\mathrm{o} / U_\mathrm{S}$��
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen, v); llabel(-, U_\mathrm{s}, +)
    resistor(right_ elen*.8, E); llabel(, \unit{2}{\ohm}, ); dot
    {
        resistor(down_ elen, E); rlabel(,\unit{2}{\ohm},); dot
    }
    resistor(right_ elen, E); rlabel(,\unit{1}{\ohm},)
    llabel(+, U_3, -); dot
    {
        consource(down_ elen, i); b_current(2U_3, , O, ); dot
    }
    line right_ elen*.8; dot
    {
        resistor(down_ elen, E); rlabel( ,\unit{1}{\ohm}, ); dot
    }
    line right_ elen*.4; "$+$" below
    {
        move down_ elen; "$-$" above
        line to Origin
    }
    gap(down_ elen, 1); clabel(, U_\mathrm{o}, )
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 04
% ��Ԫ����VARֱ����дͼ�Ե�δ֪����
% ��iL =1Aʱ����i=__________��
% �� iL =e-tAʱ����i=__________��
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
% fig 05
% ͼʾ��·�У�������Դ~$i_\mathrm{s1}$~�͵�ѹԴ~$u_\mathrm{s1}$~����ʱ
% ~($u_\mathrm{s2}$~����)����ѹ~$u_\mathrm{ab}$~��ԭ��~0.5~������
% ~$i_\mathrm{s1}$~��~$u_\mathrm{s2}$~����ʱ~($u_\mathrm{s1}$~����)��
% ��ѹ~$u_\mathrm{ab}$~��ԭ����~0.3~�����ʣ���~$i_\mathrm{s1}$~����
% ~($u_\mathrm{s1}$��$u_\mathrm{s2}$~������)~ʱ����ѹ~$u_\mathrm{ab}$~Ӧ
% Ϊԭ���ļ�����
.PS
    cct_init
    elen = elen_
    Origin: Here
    N1: nport(wid .8 ht .8 "��Դ\\��·",1,1,1,1, 5,dimen_/2,N)
    source(from N1.W1b up_ to N1.W1a, i); llabel(,i_\mathrm{s1},)
    b_current(,,O,E)
    source(from N1.N1a right_ to N1.N1b, v); llabel(-, u_\mathrm{s1}, +)
    source(from N1.S1a right_ to N1.S1b, v); rlabel(-, u_\mathrm{s2}, +)
    gap(from N1.E1a down_ to N1.E1b, 1); clabel(+, u_\mathrm{ab}, -)
    move to N1.E1a; "a" above
    move to N1.E1b; "b" below
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 06
% ����ͼ�еĵ���~$I_\mathrm{x}$��
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen, v); llabel(-, \unit{50}{\volt}, +); dot
    {
        line up_ elen*.6
        source(right_ elen*2, i)
        b_current(\unit{5}{\ampere},,O,E)
        line down_ elen*.6
    }
    consource(right_ elen, v); llabel(+, 10 I_\mathrm{x}, -)
    dot
    {
        resistor(down_ elen, E); rlabel(,,\unit{10}{\ohm})
        dot
    }
    resistor(right_ elen, E); rlabel(,\unit{20}{\ohm},)
    dot
    source(down_ elen, v); llabel(+, \unit{30}{\volt},-);
    b_current(I_\mathrm{x}, below_, O, E)
    resistor(left_ elen, E); llabel(, \unit{10}{\ohm}, ); dot
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 07
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
% fig 08
% ����ͼ��·�е�~$Z_\mathrm{L}$~�ܹ���õ�����ʡ�
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen,v); llabel(-,100\Varangle{90\degree}\unit{}{\volt},+)
    resistor(right_ elen*1.1, E); llabel(,\unit{20}{\ohm},);dot;
    {
        capacitor(down_ elen); rlabel(,,-\jimag\unit{10}{\ohm}); dot;
    }
    line right_ elen*.7; dot
    {
        source(down_ elen,i); b_current(5\Varangle{0\degree}\unit{}{\ampere},,O); dot;
    }
    line right_ elen; dot
    {
        inductor(down_ elen,W); llabel(,\jimag\unit{20}{\ohm},); dot;
    }
    line right_ elen
    resistor(down_ elen, E); llabel(,Z_\mathrm{L},)
    variable()
    {
        line to Origin
    }
    "0" below
    gap(up_ elen, 1); "1" above
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 09
% ͼʾ��·��~$t=0$~ʱ����~$S_1$~�򿪣�$S_2$~�պϣ��ڿ��ض���ǰ����·�Ѵ�
% �ȶ�������~$t\geq 0$~ʱ��~$u_L(t)$��$i_L(t)$��
.PS
    cct_init
    elen = 1.2*elen_
    Origin: Here
    source(up_ 1.5*elen,v); rlabel(-,\unit{10}{\ampere},+)
    resistor(right_ .75*elen,E); llabel(,\unit{1}{\ohm},)
    switch(right_ .75*elen,,O); llabel(S_1,,); dot
    {
        inductor(down_ 1.5*elen,W); b_current(i_L,below_,); llabel(+,u_L,-);
        rlabel(,\unit{0.2}{\henry},); dot
    }
    line right_ .75*elen; dot
    {
        resistor(down_ 1.5*elen,E); llabel(\unit{6}{\ohm},,); dot
    }
    switch(right_ .75*elen,,C); rlabel(,S_2,); dot
    {
        resistor(down_ 1.5*elen, E); llabel(,,\unit{3}{\ohm}); dot
    }
    line right_ .75*elen; source(down_ 1.5*elen,i)
    b_current(\unit{3}{\ampere},,O)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 11
% �г���ͼ��·�Ľ���ѹ���̡�
.PS
    cct_init
    elen = elen_
    Origin: Here
    {
        inductor(right_ elen*.6, W); llabel(, \jimag 8 \unit{}{\ohm}, )
        resistor(right_ elen*.6, E); llabel(, \unit{1}{\ohm}, ); dot
        "\ding{173}" ljust
    }
    line up_ elen*.8
    source(right_ elen*1.2, v); llabel(-, \mathdot{U}_\mathrm{s}, +); dot
    "\ding{172}" above
    {
        resistor(down_ elen*.8, E); rlabel(,\unit{1}{\ohm},)
        resistor(down_ elen*.8, E); rlabel(,\unit{1}{\ohm},); dot
        "\ding{174}" below
    }
    line right_ elen*.5; dot
    {
        source(down_ elen*1.6, i); b_current(\mathdot{I}_\mathrm{s}, ,O, E)
        dot
    }
    line right_ elen*.5
    capacitor(down_ elen*1.6); llabel(,\frac{1}{\jimag 8}\unit{}{\ohm},)
    line left_ elen
    resistor(left_ elen*1.2, E); llabel(, \unit{1}{\ohm}, )
    line to Origin
    ground(, , E, L)
.PE
