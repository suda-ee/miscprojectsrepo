include(/usr/local/lib/m4/circuit_macros/mpost.m4)
include(/usr/local/lib/m4/circuit_macros/libcct.m4)
define(`dimen_', (dimen_*.8))
define(`elen_', (elen_*1.25))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 01
% ��ͼʾ��·�ĵ�Ч��ά����·��4-12b��
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
% ��ͼʾ��·�ĵ�Ч��ά����·��4-10d��
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
% ͼʾ�����У���֪��IS=0ʱ��I=1.5mA��IS=10mAʱ��I=1.4mA����IS=15mAʱ��
% I��ֵ��
.PS
    cct_init
    elen = elen_
    Origin: Here
    N: nport(wid elen*.5 ht elen "\parbox[c]{.5in}{\centering ����\\ 
    ��Դ\\ ����\\ ����}",,,,,6)
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
% �г�ͼ�е�·�Ľ���ѹ����.(3-15a)
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
% �г�ͼ�е�·�Ľ���ѹ����.(3-15b)
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
% ͼʾ��·�еĵ�ѹU��U1ֵ֮��
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
% ͼʾ��·�еĵ�ѹU��U1ֵ֮��
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
% ��ͼʾ��·�У��ڿ���S�Ͽ��������£����Դ�ͳ��ĵ����Ϳ������˵ĵ�ѹUab
% ���ڿ��رպϺ������Դ�ͳ��ĵ�����ͨ�����صĵ�����
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
% ��·��ͼ��IS���䣬��US=1Vʱ��I=5A��US=2Vʱ��I=8A����US=4Vʱ��I��ֵ�� 
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
% ���õ��Ӷ���ͼʾ��·�е���֧·�ĵ���I1��I3��
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
% fig 13
% ͼʾΪһ���贮������·����ͼ�е�ѹuab
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
% ����֧·��������ͼʾ��·�еĵ�ѹu�͵���ix��
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
% ͼʾΪһ��Դһ�˿�����A�Ը���RL���硣������RL�䶯ʱ�������ѹ�͵���Ҳ
% ��֮�ı䣬����¼�����������ݣ�i=2Aʱ��u=8V. i=4A ʱ��u=6V. ��ȷ����Դ
% һ�˿�����A�ĵ�Ч��·�Ĳ���
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
% ͼʾRC��·��ԭ����ֱ����̬����t=0ʱ�����ش�1Ͷ��2���԰�uC(t) ����Ҫ��
% ��������uC(t) �Ĳ���ͼ��
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
% ͼʾRC��·��ԭ����ֱ����̬����t=0ʱ�����ش�1Ͷ��2���԰�uC(t) ����Ҫ��
% ��������uC(t) �Ĳ���ͼ��
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
% ��ͼʾ��·������迹Rab
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
% ��ͼ��ʾ��·��ԭ�Ѵ�����̬����t=0ʱ����K�Ͽ�����uc(0+)��uL(0+).
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
% ͼa��VCRΪu=10-2i����bͼ��VCR��
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
% ������ͼ��ʾ��·����֪U0 =2.5 V�����ô�ά������������R��
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
% ������ͼ��ʾ��·�Ĵ�ά����Ч��·��
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
% ��ѹ��50Hz�����ҵ�Դ���������������أ��������Դ��ȡ�������ֲ�������ʹ
% ����������ߵ������·����˵����͵���C��
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
% ͼʾRC��·,�����������Ծ��β���ѹu(t) (��ͼb), ��ʾ�����ϲ�þ��β���
% ���ڼ�İ�������(0~T/2)�������ѹ����(��ͼc), ���������(T/2~T)������
% �ڵ������ѹ����.
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
% ����ͼ�еĵ���ic(t)��i(t)
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
% ����ͼ�е�iL(0)=0ʱ��ѹԴ����ĵ���i(t)��
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
% д����ͼ��ʾ��·��i2(t)Ϊ�������������?������̡�
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
% ��ͼ��ʾ��·�ڻ�·ǰ�ѹ����˺ܳ���ʱ�䣬�����·��е�����ʼֵ�͵��ݵ�
% ѹ����һ�׵����ĳ�ʼֵ��
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
% ��ͼ��ʾ��·�ڻ�·ǰ�ѹ����˺ܳ���ʱ�䣬���󿪹رպϺ��е����͵��ݵ�
% ѹ��һ�׵����ĳ�ʼֵ��
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
% ����ͼ��ʾ��·�У�������i (t)=1cos314t A�������ѹuR(t)��uL(t)��uC(t)
% ��u(t)�����������ͼ��
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
% ����ͼ��ʾ��·�У����ݶ˵�ѹ����Ϊ������ͣ����������ͼ��  
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
% ��ͼ��ʾ��·����Uab=4V����Us.
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
% ��ͼ��ʾ��·�������i.
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
% ��ͼ��ʾ���˿������Y������
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
% ��ͼ��ʾ��·��ԭ�Ѵ�����̬����t=0ʱ����K�Ͽ�������ݵ�ѹ���䵼���ĳ�ʼֵ��.
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
% ��ͼ��ʾг���·����Դ��Ƶ�ʣ���г��ʱUr0=2V��Uc0=100V����C��ֵ.
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
% ��ͼ��ʾ��·�����ѹu
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
% ��ͼ��a����ʾ��·����֪V�������ά�ϵ�Ч��·��b���еĲ�����
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
% ��ͼ��ʾ��·��ԭ�Ѵ�����̬����t=0ʱ����K�Ͽ�����ʱ��iL(t).
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
% ��ȷ��ͼʾ��·�в�ͬ�Ķ��������ѹusʱ�������ѹu2
%��1�� us(t)��2V, ��2��us(t)��2V, 
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
% ����ͼ��·�ĵ�ѹU.
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
% ����ͼ��·���������Ri��
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
% ������ͼ��·�еĵ�ѹU1��U2.
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
% fig 45
% ����ͼ�е�UA��UB��UC��Ϊ���٣�
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
% ����ͼ��ʾ��·�����ʣ�����RΪ��ֵʱ�ɻ�õ�����ʣ������Ϊ���٣� 
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
% ͼʾ��·�У�uS=��(t),  R1 = 6����R2 = 3����L = 2H�������i�ĵ�λ��Ծ��Ӧ��
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
% ������ͼ��򵥵ĵ�Ч��·.
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
% ����ͼ��ʾ��·����1���õ��Ӷ������U����2������Դ����10��ʱU��
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
% ����ͼ��ʾ����ab���Ĵ�ά�ϵ�Ч��·��ŵ�ٵ�Ч��·��
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
% ͼʾ��·�У�R1=4����R2=1����R3=6����Us=20V����·ǰ�Ѵﵽ��̬����·��uc
% ��0+����ic��0+���� iL��0+����
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
% ͼʾ��·�У�R1=1����R2=2����C=3F���Լ���uc�ĵ�λ��Ծ��Ӧ��
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
% ͼʾ��·��I1��I2��I3Ϊ�����г���ͼ�����׷��̡�
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
% ͼʾ���˿������Z�����У���   ����D
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
% ͼʾ���˿������Z�����У���   ����C
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
% ͼʾ���˿������Z�����У���   ����C
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
% ͼʾ���˿������Z�����У���   ����C
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
% ͼʾ���˿������Y�����У���   ����A
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
% ͼʾ���˿������Y�����У���   ����A
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
% ����ͼ��ʾ��·�Ķ��˿������Y������
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
% ����ͼ��ʾ�����ʣ�
%��1�� ������RΪ���ʱ�������չ�����󣿲��������ʣ���2�� ��R=80����
% ��ʹR�еĵ���Ϊ�㣬��a,b��Ӧ��һ��ʲô����Ԫ���������ֵ��󣿻�����Ӧ
% �ĵ�·ͼ��
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
% ��ͼ��ʾ���Ե�·����֪R5=8?ʱ��I5=20A��I0= -11A��R5=2ʱ��I5=50A��I0=
% -5A������R5Ϊ��ֵʱ�������ĵĹ�����󣬲��������ʡ�
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
% ͼʾ��·���ܿص�ѹԴ�ĵ�ѹUd= rIa
% (1) ��I1��I2��I3Ϊ�����г���ͼ�����׷��̣� (2) ��ͼ���ܿ�Դ�ĵ�ѹUd��
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
% ��ͼ��ʾ��·����3A�ĵ�Դ�Ͽ�ʱ��2A�ĵ�Դ�������Ϊ28W����ʱU2=8V����2A
% �ĵ�Դ�Ͽ�ʱ��3A�ĵ�Դ�������Ϊ54W����ʱU1=12V������������Դͬʱ��
% ��ʱ��ÿ����Դ��������ʡ�
.PS
    cct_init
    elen = elen_
    Origin: Here
    N: nport(wid elen*.5 ht elen "\parbox[c]{.5in}{\centering ����\\ 
    ����\\ ����}",,,,,6)
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
% ��·����ͼ��ʾ��Ӧ�õ��Ӷ������ѹU��
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
% ����ͼ��ʾ��·������ȥ���Ǹ�Ԫ������ʹ�õ��Ӷ�����U�����õ��Ӷ�����U0
% ����ʹU=23V����ԴӦ��α䶯��
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
% ��ͼʾ��·�ж�����Դ�Ĺ��ʡ�
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
% ��ͼʾ��·�е�ѹU1��U2 ��
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
% ���õ��Ӷ���ͼʾ��·�еĵ�ѹU�͵���Ix��
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
% ��ͼ��ʾ��·����֪A��Ϊʹ����ZL�������ʣ������迹ZL�����յĹ���PLmax.
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
% ����ͼ�Ĵ�ά�ϵ�Ч��·��
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
% ����ͼ��ʾ����ab���Ĵ�ά�ϵ�Ч��·��
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
% ��ͼ�У�R1=18����R2=4����R3=6����R4=8����R5=12����Us=60V��RL�ɵ�������RL��
% �ܻ�õ������Pmax.
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
% ���ܿ�Դ��CCCS���ĵ����·���ֱ���K�պ�ǰ��RL��õ�����ʡ�
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
% �û�·��������ͼʾ��·��֧·����������Դ���˵ĵ�ѹ��
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
% �û�·����������ͼʾ��·�еĵ���I1 ��
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
% �û�·�������̺ͽ���ѹ������ͼʾ��·�е��ܿ�Դ���˵ĵ�ѹU ��
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
% ���ý�㷨��ͼʾ��·��2A����Դ�����Ĺ��ʡ�
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
% ��ͼʾ��·�еĵ���I�͵�ѹU��
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
% �õ�Ч�任��ͼ��ʾ��·�еĵ���I ��
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
% �õ�Ч�任��ͼ��ʾ��·�еĵ���I ��
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
% ��ͼʾ��·�������迹��
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
% ����ͼ�е������迹 R_ab
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
% �û�·��������ͼʾ��·�е�ѹԴ�͵���Դ�Ĺ���(P75,3-13a)
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
% ��ͼʾ��·�еĵ���I�͵�ѹU��
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
% �ý���ѹ����ͼʾ��·�е�ѹU��3-20����
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
% �ý���ѹ����ͼʾ��·��6V��ѹԴ�Ĺ��ʣ�3-21����
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
% ��ͼʾ��·�еĵ�ѹu2 ��4-3��
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
% ��ͼʾ��·�и�֧·������
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
% ��ͼʾ��·�ĵ�Ч��ά����·��4-12c��
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
% ��ͼʾ��·�ĵ�Ч��ά����·��4-12d��
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
% ͼʾ��·����֧·���������֧·���������ù���ƽ��У�顣
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
% ͼ�У�R1=6����L=0.3H��R2=6.25����C=0.012F,u(t)=,����̬�������ͣ���������
% ·������ͼ��
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
% ��ͼ��ʾ��·��A��B����迹ģֵΪ5k������Դ��Ƶ�ʦ�=1000rad/s��Ϊʹ��ǰ
% 300����R��C��ֵ��
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
% ����ͼ��ʾ��·��г���Ƶ�ʣ��Լ�г��ʱ�ĵ�Ч�迹��R��L��C�Ĺ�ϵ��
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
% ͼʾ��·�У�������=104 rad/sʱ����I����Чֵ�����ֵΪ1A����ʱUL=10 V
% ���󣺣�1�� R��L��C��Ʒ������Q��2�� ��ѹuC ��
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
% ͼʾ��·�У����ҵ�ѹ��ЧֵU=210 V��������ЧֵI=3 A���ҵ������ѹͬ�࣬
% �ݿ�XC=15������R2��XL ��
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
% ͼ4-8��ʾ��·�У���R=10����L=1H��C=0.1F�� �� 
% 1����Ϊ��ֵʱ��·����г��
% 2����г��ʱ�ĵ���i��
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
% ͼʾRLC��̬��·���ɶ�̬�����ɵ�uC����������ӦuC(t)=______
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
