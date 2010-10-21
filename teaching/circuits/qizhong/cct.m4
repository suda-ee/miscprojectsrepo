include(/usr/local/lib/m4/circuit_macros/libcct.m4)
% define(`dimen_', (dimen_*.8))
% define(`elen_', (elen_*1.25))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 01 ��ͼʾ��·����һ�˿ڵ�· N1 �� N2 �Ĺ��ʡ�
.PS
    cct_init
    elen = elen_
    Origin: Here
    N1: nport(wid .3 ht .8 "N1",0,0,1,0,5,dimen_*.0,N)
    move right_ elen*1.2
    N2: nport(wid .3 ht .8 "N2",1,0,0,0,5,dimen_*.0, N)
    move to N1.E1a
    arrowline(right_ elen*.4); llabel(,\unit{2}{\ampere},)
    {
        resistor(right_ to N2.W1a, E); llabel(, \unit{1}{\ohm}, )
        line from N1.E1b to N2.W1b
    }
    gap(down_ to (Here.x, N1.E1b.y), 1)
    clabel(+,\unit{4}{\volt},-)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 02 ��ͼʾ��·�е�ѹ $U$ �͵��� $I$��
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen, i); llabel(-, u, +);
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
% fig 03 ��ͼʾ��·��������� $R_\mathrm{in}$��
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
% fig 04 ����ͼ��ʾ��·���õ��Ӷ�������� $I_x$��
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
% fig 05 ��ͼ��ʾ��·������� $I$ �͵�ѹ $U$��
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
% fig 06 �г�ͼ�е�·�Ľ���ѹ���̣�������
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*1.2, i); b_current(\unit{4}{\ampere},,O,E)
    resistor(right_ elen, E); llabel(,\unit{2}{\ohm},); dot
    {
        resistor(down_ elen*.6, E); rlabel(,\unit{3}{\ohm},)
        resistor(down_ elen*.6, E); rlabel(,\unit{2}{\ohm},); 
        dot
    }
    {
        resistor(right_ elen, E); rlabel(,\unit{2}{\ohm},); dot
    }
    line up_ elen*.6
    source(right_ elen, i); b_current(\unit{10}{\ampere},,O,E)
    line down_ elen*.6
    {
        resistor(down_ elen*1.2, E); rlabel(,\unit{3}{\siemens},); dot
    }
    resistor(right_ elen, E); llabel(,\unit{2}{\siemens},)
    resistor(down_ elen*1.2, E); llabel(,\unit{6}{\siemens},)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 07 ��ͼ��ʾ��·��$R_\mathrm{L}$ �ɱ䣬�� $R_\mathrm{L}$ ȡ��ֵʱ��
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
% fig 08 �û�·�������ͼ��ʾ��·�� $I_\mathrm{x}$ �Լ��ܿ�Դ�Ĺ��ʡ�
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen, v); llabel(-,\unit{50}{\volt},+); dot
    {
        consource(right_ elen, v); llabel(+, 10I_\mathrm{x}, -); dot
        {
            resistor(right_ elen, E); llabel(,\unit{20}{\ohm},); dot
        }
        resistor(down_ elen, E); rlabel(,\unit{10}{\ohm},)
        dot
    }
    line up_ elen*.6
    source(right_ elen*2, i); b_current(\unit{5}{\ampere}, ,O, E)
    line down_ elen*.6
    source(down_ elen, v); llabel(+, \unit{30}{\volt},-)
    b_current(I_\mathrm{x}, below_,O, E)
    resistor(left_ elen, E); llabel(, \unit{10}{\ohm}, )
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 09 ����ͼ��·��ŵ�ٻ��ά����Ч��·��
.PS
    cct_init
    elen = elen_
    Origin: Here
    line left_ elen*.6; dot
    {
        consource(down_ elen, i); b_current(2U_1, ,O, E); dot
    }
    {move left_ elen*.1; dot; "$-$" below}
    source(left_ elen*.8, v); rlabel(+, \unit{3}{\volt}, -)
    "$U_1$" below
    resistor(left_ elen*.8, E); rlabel(,\unit{2}{\ohm},)
    {move right_ elen*.1; dot; "$+$" below}
    source(down_ elen, v); rlabel(+, \unit{6}{\volt}, -)
    line to (Origin.x, Here.y)
    gap(up_ elen, 1)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 10 ����ʾ��·�еĵ��� $I$��
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(up_ elen*.8, E); llabel(, \unit{10}{\ohm},)
    source(up_ elen*.8, i); b_current(\unit{2}{\ampere}, , O, E)
    line right_ elen; dot
    {
        resistor(down_ .8*elen, E); llabel(,\unit{10}{\ohm},); dot
        {
            line right elen*.4
            source(down_ elen*.8, i); b_current(\unit{2}{\ampere}, , O, E)
            dot
        }
        source(down_ .8*elen, v); rlabel(+, \unit{40}{\volt}, -)
        dot
    }
    resistor(right_ 1.6*elen, E); llabel(,\unit{6}{\ohm},)
    resistor(down_ .8*elen, E); llabel(,\unit{4}{\ohm},)
    b_current(I, , O)
    source(down_ .8*elen,v); llabel(+,\unit{30}{\volt},-)
    line to Origin
.PE
