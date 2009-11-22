include(/usr/local/lib/m4/circuit_macros/libcct.m4)
define(`dimen_', (dimen_*.8))
define(`elen_', (elen_*1.25))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 42
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
% fig 93
% ��ͼʾ��·�и�Ԫ���Ĺ��ʣ���˵���Ƿ������ʻ������չ��ʡ�
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
% fig 96
% ��ͼʾ��·�е�ѹU1��U2�͵���I ��
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
% fig 44
% ����ͼ�Ĵ�ά�ϵ�Ч��·��
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
% fig 11
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
% fig 20
% ͼ��ʾ��·�У�R1=15����R2=10����C=50��F �� t = 0ʱ������S�պϣ�����uc(0��
% ) = 9V�����·����������Ӧuc(t)��
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
.PS
    cct_init
    elen = 1.2*elen_
    Origin: Here
    source(up_ elen,i); b_current(\mathdot{I}_{\rm S},,O,E)
    resistor(right_ elen,E); llabel(,\unit{2}{\ohm},); dot
    {resistor(down_ elen,E); rlabel(,\unit{2}{\ohm},); dot}
    resistor(right_ elen,E); llabel(,\unit{2}{\ohm},); dot
    {inductor(down_ elen); rlabel(,{\rm j}\unit{4}{\ohm},); dot}
    line right_ .5*elen; "$1$" above; "$+$" below
    GGG: Here
    line right_ .5*elen
    resistor(down_ elen,E); b_current(\mathdot{I},,); llabel(,Z,)
    line to Origin
    move to GGG
    gap(down_ elen,1); clabel(,\mathdot{U},)
    "$1'$" below; "$-$" above
.PE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 2
% ��·����ͼ��ʾ������ڵ�A�ĵ�λ�͵���Դ������·���й����ʡ��޹����ʡ�
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
% fig 32
% ͼʾ��·�У����غ���1ʱ�Ѵ���̬��t=0ʱ������1����2����t>0ʱ��uL(t)����
% P140-��6-5���Ͽ��ؼ�ͷ����
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
% P223, 9-22
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(right_ elen*.8, E); rlabel(,R,); dot
    {capacitor(down_ elen*.8); rlabel(,\frac{1}{\mathrm{j}\omega C},); dot}
    resistor(right_ elen*.8, E); rlabel(,R,); dot
    {capacitor(down_ elen*.8); rlabel(,\frac{1}{\mathrm{j}\omega C},); dot}
    resistor(right_ elen*.8, E); rlabel(,R,)
    capacitor(down_ elen*.8); rlabel(,\frac{1}{\mathrm{j}\omega C},)
    llabel(+,\mathdot{U}_C,-)
    line to (Origin.x, Here.y); "$-$" above
    gap(up_ elen*.8, 1); clabel(,\mathdot{U}_{\mathrm{S}},)
    "$+$" below
.PE
