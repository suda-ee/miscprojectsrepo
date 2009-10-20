include(/usr/local/lib/m4/circuit_macros/libcct.m4)
define(`dimen_', (dimen_*.8))
define(`elen_', (elen_*1.25))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 1 ���ܿ�Դ���յĹ��ʡ�
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.6, v); llabel(-,\unit{12}{\volt},+)
    resistor(up_ elen*.6, E); llabel(,\unit{3}{\ohm},)
    arrowline(right_ elen); llabel(,I_1,); dot
    {resistor(down_ elen*1.2, E); rlabel(,\unit{2}{\ohm},); dot}
    line right_ elen*.8
    consource(down_ elen*1.2, i); b_current(0.5I_1, ,O)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 2 ͼʾ��·�У���֪~$U=\unit{3}{\volt}$����~$R$��
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(left_ elen, E); llabel(,\unit{2}{\ohm},); dot
    {
        resistor(up_ elen*1.4, E); rlabel(,\unit{2}{\ohm},); dot
    }
    line left_ elen*.6
    source(up_ elen*1.4, i); b_current(\unit{1}{\ampere},,O,E)
    line right_ elen*1.6; dot
    {
        resistor(down_ elen*.7, E); rlabel(,\unit{4}{\ohm},)
        source(down_ elen*.7, v); llabel(+,\unit{10}{\volt},-); dot
    }
    line right_ elen
    resistor(down_ elen*1.4, E); rlabel(,R,); llabel(+,U,-)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 3 ��·����ͼ��ʾ�����·~$I$��
.PS
    cct_init
    elen = elen_
    Origin: Here
    {
        source(up_ elen*.7, i); b_current(\unit{2}{\ampere},,O); dot
        source(up_ elen*.7, i); b_current(\unit{6}{\ampere},,O,E); dot
    }
    line left_ elen*.8
    source(up_ elen*.7, v); llabel(-,\unit{6}{\volt},+); dot
    {
        line right_ elen*.8
    }
    resistor(up_ elen*.7, E); llabel(,\unit{10}{\ohm},)
    line right_ elen*1.8
    resistor(down_ elen*1.4, E); rlabel(,\unit{2}{\ohm},);
    b_current(I)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 4 ��ͼʾ��·����~ab~���˵������·~$R_{\mathrm{ab}}$��
.PS
    cct_init
    elen = elen_
    Origin: Here
    line left_ elen*.8; dot
    {
        line left_ elen
        consource(up_ elen*.7, i); b_current(u_1/15,,O)
        line right_ elen
    }
    resistor(up_ elen*.7, E); llabel(,\unit{15}{\ohm},)
    rlabel(-,u_1,+); dot
    resistor(up_ elen*.7, E); rlabel(,\unit{5}{\ohm},)
    line right_ elen*.8; "a" ljust
    gap(down_ elen*1.4, 1); "b" ljust
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 5 ����д���µ�·�Ļ�·�������̡�
.PS
    cct_init
    elen = elen_
    Origin: Here
    dot
    {
        resistor(right_ elen*.7, E); llabel(,\unit{4}{\ohm},)
        source(right_ elen*.7, v); rlabel(-,\unit{4}{\volt},+); dot
        line right_ elen*.4
        resistor(right_ elen*.7, E); llabel(,\unit{5}{\ohm},)
        source(right_ elen*.7, v); llabel(+,\unit{5}{\volt},-); dot
    }
    source(up_ elen*1.8, i); b_current(\unit{1}{\ampere},,O,E)
    resistor(right_ elen*1.4, E); rlabel(,\unit{1}{\ohm},); dot
    {
        resistor(down_ elen*.6, E); llabel(,\unit{6}{\ohm},)
        source(down_ elen*.6, v); rlabel(+,\unit{7}{\volt},-)
        resistor(down_ elen*.6, E); llabel(,\unit{8}{\ohm},)
    }
    resistor(right_ elen*.9, E); llabel(,\unit{2}{\ohm},)
    source(right_ elen*.9, v); rlabel(+,\unit{2}{\volt},-)
    line down_ elen*2.8
    source(left_ elen*1.6, v); rlabel(-,\unit{3}{\volt},+)
    resistor(left_ elen*1.6, E); rlabel(,\unit{3}{\ohm},)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 6 �ý���ѹ�����ѹ~$U$��
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen*.7, i); b_current(\unit{5}{\ampere},,O,E)
    resistor(up_ elen*.7, E); llabel(,\unit{2}{\ohm},); dot
    {
        source(right_ elen, v); rlabel(-,\unit{6}{\volt},+); dot
        resistor(down_ elen*1.4, E); rlabel(,\unit{8}{\ohm},); 
        llabel(+,U,-);dot
    }
    line up_ elen*.7
    consource(right_ elen*2, i); b_current(0.1U,,O,E)
    line down_ elen*.7; dot
    {
        source(left_ elen, v); rlabel(+,\unit{12}{\volt},-)
    }
    resistor(down_ elen*1.4, E); llabel(,\unit{8}{\ohm},)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 7 �����µ�·��ŵ�ٻ��ά����Ч��·��
.PS
    cct_init
    elen = elen_
    Origin: Here
    line left_ elen*.7; dot
    {
        line up_ elen*.6
        resistor(left_ elen*1.8, E); rlabel(,\unit{12}{\ohm},); 
        line down_ elen*.6; dot
    }
    {
        resistor(down_ elen*.9, E); llabel(,\unit{4}{\ohm},); dot
    }
    resistor(left_ elen*.9, E); rlabel(,\unit{3}{\ohm},); dot
    {
        source(down_ elen*.9, i); b_current(\unit{12}{\ampere},below_,O); dot
    }
    resistor(left_ elen*.9, E); rlabel(,\unit{3}{\ohm},)
    source(down_ elen*.9, v); rlabel(+,\unit{6}{\volt},-)
    line to (Origin.x, Here.y); "b" ljust
    gap(up_ elen*.9, 1); "a" ljust
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 8 ����ͼ��ʾ��·���õ��Ӷ��������~$I_x$��
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
% fig 9 ��ͼʾ��·������~$R_L$~������ı䣬��~$R_L$~Ϊ��ֵʱ���Ͽɻ��
% ����ʣ�������������~$P_{L\mathrm{max}}$��
.PS
    cct_init
    elen = elen_
    Origin: Here
    consource(up_ elen, i); b_current(2I,,O,E)
    line right_ elen*.6; dot
    {
        resistor(down_ elen, E); llabel(,\unit{4}{\ohm},); dot
    }
    source(right_ elen*.8, v); llabel(-,\unit{12}{\volt},+)
    resistor(right_ elen*.8, E); b_current(I,below_); llabel(,\unit{6}{\ohm},); dot
    {
        resistor(down_ elen, E); rlabel(,\unit{10}{\ohm},); dot
    }
    line right_ elen*.6
    resistor(down_ elen, E); llabel(,R_L,); variable()
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% fig 10
% �����׵��������ͼ�еĵ��� $I_2$��

.PS
    cct_init
    elen = elen_
    Origin: Here
    arrowline(right_ elen); rlabel(,I_1,); dot
    {
        source(down_ .75*elen,v); b_current(I_2,,O); rlabel(+,\unit{2}{\volt},-)
        resistor(down_ .75*elen,E); llabel(,\unit{1}{\ohm},)
        dot
    }
    line right_ elen
    resistor(down_ 1.5*elen,E); b_current(I_3,,); llabel(,\unit{3}{\ohm},)
    line left_ 2*elen
    resistor(up_ .75*elen,E); llabel(,\unit{3}{\ohm},)
    source(up_ .75*elen,v); llabel(-,\unit{9}{\volt},+)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% fig 11
% �ý���ѹ����ͼ�� a��b ����ĵ�ѹ��
.PS
    cct_init
    elen = elen_
    Origin: Here
    line right_ elen; dot; {move up .1; "a" rjust}
    {
        resistor(down_ 1.5*elen,E); llabel(,\unit{3}{\ohm},)
        dot
    }
    {
        line up_ elen/2; source(right_ elen,i); b_current(,,O,E)
        llabel(,\unit{2}{\ampere},); line down_ elen/2; dot
        {move up .1; "b" ljust}
    }
    resistor(right_ elen, E); rlabel(,\unit{1}{\ohm},)
    {
        resistor(down_ .75*elen,E); llabel(,\unit{2}{\ohm},)
        source(down_ .75*elen,v); llabel(+,\unit{4}{\volt},-)
        dot
    }
    line right_ elen; source(down_ 1.5*elen,i)
    b_current(,,O,E); llabel(,\unit{4}{\ampere},)
    line left_ 2*elen; ground(,,E); line left_ elen
    source(up_ 1.5*elen,i); b_current(,,O,E); llabel(,\unit{4}{\ampere},)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% fig 12
% ����ͼ��ʾ��·�����õ��Ӷ������ѹ $U$��
.PS
    cct_init
    elen = elen_
    Origin: Here
    line right_ elen; dot
    {
        resistor(down_ .75*elen,E); rlabel(,\unit{4}{\ohm},); dot
        {
            source(right_ elen,i); b_current(,,O,E)
            llabel(,\unit{3}{\ampere},); dot
        }
        resistor(down_ .75*elen,E); rlabel(,\unit{2}{\ohm},); dot
        dot
    }
    line right_ elen; resistor(down_ .75*elen,E); llabel(,\unit{6}{\ohm},)
    resistor(down_ .75*elen,E); llabel(+,U,-); rlabel(,\unit{3}{\ohm},)
    line left_ 2*elen; source(up_ 1.5*elen,v); llabel(+,\unit{12}{\volt},-)
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% fig 13
% ��ͼʾ��·�Ĵ�ά����ŵ�ٵ�Ч��·��
.PS
    cct_init
    elen = elen_
    Origin: Here
    dot; resistor(right_ elen,E); llabel(,\unit{2}{\ohm},)
    source(right_ elen,v); llabel(+,\unit{3}{\volt},-)
    dot; {line right_ elen/2}
    resistor(down_ elen,E); rlabel(,\unit{4}{\ohm},)
    dot
    {
        line right_ elen/2; "b" above; gap(up_ elen, 1); "a" below
    }
    line left_ 2*elen; dot
    {resistor(up_ elen,E); rlabel(,\unit{2}{\ohm},)}
    line left_ elen/2
    source(up_ elen,i); b_current(,,O,E); llabel(,,\unit{1}{\ampere})
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% fig 14
% ��ͼ�е�·�� ab �˿ڵĴ�ά����ŵ�ٵ�Ч��·��
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(right_ elen,E); llabel(,\unit{5}{\ohm},); dot
    {
        source(down_ .75*elen,i); b_current(\unit{3}{\ampere},,O); dot
        {
            line right_ 1.5*elen; dot
        }
        resistor(down_ .75*elen,E); rlabel(,\unit{0.2}{\siemens},); dot
    }
    line right_ 1.5*elen
    source(down_ .75*elen,v); llabel(+,\unit{10}{\volt},-)
    resistor(down_ .75*elen,E); llabel(,\unit{5}{\ohm},)
    source(left_ .75*elen,v); llabel(+,\unit{6}{\volt},-)
    source(left_ .75*elen,i); b_current(\unit{1}{\ampere},,O,E)
    line left_ elen; "b" above; gap(up_ 1.5*elen, 1); "a" below
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% fig 15
% ����ͼ��·�еĵ��� $I$��
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ .75*elen,v); llabel(-,\unit{12}{\volt},+)
    resistor(up_ .75*elen,E); llabel(,\unit{1}{\ohm},); dot
    {
        line up_ 2*elen/3
        source(right_ 1.25*elen,i); b_current(\unit{4}{\ampere},,O,E)
        resistor(right_ 1.25*elen,E); llabel(,\unit{2}{\ohm},)
        line down_ 2*elen/3
    }
    resistor(right_ elen,E); b_current(I_{\mathrm{x}},,O,E); rlabel(,\unit{4}{\ohm},)
    dot
    {
        consource(down_ 1.5*elen,v); rlabel(+,5I_{\mathrm{x}},-); dot
    }
    line right_ elen/2; dot
    {
        resistor(down_ 1.5*elen,E); llabel(,\unit{6}{\ohm},); dot
    }
    resistor(right_ elen,E); llabel(,\unit{3}{\ohm},); dot
    resistor(down_ 1.5*elen,E); b_current(I,,); llabel(,\unit{5}{\ohm},)
    line to Origin
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% fig 16
% ��ͼ��ʾ��·�У���֪ \unit{5}{\volt} ��ѹԴ $U_{\rm S}$ ֧·����
% $I_0=\unit{10}{\ampere}$����ȷ���ܿص���Դ�Ŀ���ϵ�� $\alpha$��
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen,i); b_current(\unit{5}{\ampere},,O,E)
    llabel(I_{\mathrm{S}},,)
    dot
    {
        line up_ 2*elen/3 then right_ .75*elen
        consource(right_ elen,i); b_current(\alpha I,,O)
        line right_ .75*elen then down_ 2*elen/3
    }
    resistor(right_ elen,E); llabel(,R_2,); rlabel(,\unit{2}{\ohm},); dot
    {
        resistor(down_ elen,E); b_current(I,,)
        llabel(,\unit{1}{\ohm},); rlabel(,R_1,); dot
    }
    resistor(right_ 1.5*elen,E); llabel(,R_3,); rlabel(,\unit{3}{\ohm},); dot
    source(down_ elen,v); b_current(I_0,below_,O,E)
    llabel(-,\unit{5}{\volt},+); rlabel(,U_{\mathrm{S}},)
    line to Origin
.PE
