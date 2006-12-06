include(/usr/local/lib/m4/circuit_macros/mpost.m4)
include(/usr/local/lib/m4/circuit_macros/libcct.m4)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 1
% ��ͼ��ʾ��·��������ؼ��������޴���V�Ķ���Ϊ2V��V1�Ķ���Ϊ1V����V2
% �Ķ���Ϊ________.
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
% ��ͼ��ʾ��·��������ؼ��������޴���V1�Ķ���Ϊ 30V��V2�Ķ���Ϊ 60V��
% ��Us=________.
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
% ��֪��·�е�ѹ����������Чֵ�ֱ�ΪI1=7A��I2=3A��Uab=4V��Ubc=8V���ɴ˿�
% ��ȷ��ͼ����������Ķ����ֱ�ΪA=_______________,V=_______________.
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
% ͼʾ��·��IR=3A. IL=4A. IC=8A���������Ķ����ֱ�Ϊ
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
% ͼʾ��·����г��ʱ��������A2�Ķ���Ϊ15A��������A�Ķ���Ϊ12A���������
% A1�Ķ���=___________.
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
% ��·���������ر����ȷ����Ϊ��V1=________��V2=________��
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
% ����ͼ�е�ѹ��Ķ�������ȷ��U=________��
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
% ����ͼ�е�����Ķ�������ȷ��U=________��I=________��
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
% ����ͼ�е�����Ķ�������ȷ��I=________��U=________��
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
% 13���ڸ����Ĵ�������·���п��ܷ���________��________��г����________
% г���Ƶ��С��_______г���Ƶ��.
% 27����·�У�Ƶ�ʴ�������ʱ���ȷ���________г����г��Ƶ��Ϊ_________�� 
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
% 14����·�У�Ƶ�ʴ�������ʱ���ȷ���________г�񣬺���__________г��
% ���Цش�=__________���ز�=____________�� 
% 
% 28����·�У�Ƶ�ʴ�������ʱ���ȷ���________г����г��Ƶ��Ϊ_________
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
% 15����·�У�Ƶ�ʴ�������ʱ���ȷ���________г�񣬺���__________г��
% ���Цش�=__________���ز�=____________�� 
% 
% 29����·�У�Ƶ�ʴ�������ʱ���ȷ���________г����г��Ƶ��Ϊ_________
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
% 16����·�У�Ƶ�ʴ�������ʱ���ȷ���________г�񣬺���__________г��
% ���Цش�=__________���ز�=____________�� 
% 
% 30����·�У�Ƶ�ʴ�������ʱ���ȷ���________г����г��Ƶ��Ϊ_________ 
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
% 17����ͼʾGCL������·�ϣ�����·ԭ�Ѵ���г��״̬���Է������м��������
% ��·���ʺ������ʣ����ԡ����ԡ����ԣ���1������G����·����    �ԡ���2��
% ����C����·����    �ԡ�
% 18����ͼʾGCL������·�ϣ�����·ԭ�Ѵ���г��״̬���Է������м��������
% ��·���ʺ������ʣ����ԡ����ԡ����ԣ���3������L����·����    �ԡ���4��
% �����Դ��Ƶ�ʦأ���·����    �ԡ�
% 
% 19����ͼʾGCL������·�ϣ�����·ԭ�Ѵ���г��״̬���Է������м��������
% ��·���ʺ������ʣ����ԡ����ԡ����ԣ���1����СG����·����    �ԡ���2��
% ��СC����·����    �ԡ�
% 
% 20����ͼʾGCL������·�ϣ�����·ԭ�Ѵ���г��״̬���Է������м��������
% ��·���ʺ������ʣ����ԡ����ԡ����ԣ���1����СL����·����    �ԡ���2��
% ��С��Դ��Ƶ�ʦأ���·����    �ԡ�
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
% 21����ͼʾRLC������·�ϣ�����·����г��״̬�£���ĳ��ԭ���ź�Դ��Ƶ��
% ���н��ͣ����·��������ת��Ϊ�ߣߣߣߣ��ԡ�
% 
% 22����ͼʾRLC������·�ϣ�����·����г��״̬�£���ĳ��ԭ���ź�Դ��Ƶ��
% �������ߣ����·��������ת��Ϊ�ߣߣߣߣ��ԡ�
% 32����ͼʾRLC������·�ϣ�����·����г��״̬�£���ĳ��ԭ���ź�Դ��Ƶ��
% ���н��ͣ����·��������ת��Ϊ�ߣߣߣߣ��ԡ�
% 
% 33����ͼʾRLC������·�ϣ�����·����г��״̬�£���ĳ��ԭ���ź�Դ��Ƶ��
% �������ߣ����·��������ת��Ϊ�ߣߣߣߣ��ԡ�
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
% 31��ͼʾ��·��г��Ƶ�ʦ�0=____________
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
% 34��ͼʾRLC��̬��·���ɶ�̬�����ɵ�uC����������ӦuC(t)=______
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
% 35��ͼʾRLC��̬��·���ɶ�̬�����ɵ�uC����������ӦuC(t)=______
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
% 36��ͼʾRLC��̬��·���ɶ�̬�����ɵ�uC����������ӦuC(t)=______
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
% 37��ͼʾRLC��̬��·���ɶ�̬�����ɵ�uC����������ӦuC(t)=______
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
% ͼʾRLC��̬��·���ɶ�̬�����ɵ�uC����������ӦuC(t)=______
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
% ͼʾ��·�У���֪I1=I2=7A��R=2��������R�ϵĹ�������Ϊ_________W��������
% Դ��Ƶ������һ���������R�ϵĹ�������Ϊ_________W.
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
% ���·ͼ�и���Դ�Ĺ��ʣ�ע�����ʣ���P1A=____________��
% P1V=______________��
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
% ͼʾ��·�У�P2A=____________��P20V=______________��
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
% ���·ͼ�и���Դ�Ĺ��ʣ�ע�����ʣ�����P1V =____________��
% P1A=______________��
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
% ͼʾ��·�У�I=____________��P6A=______________��
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
% ͼʾ��·�У�I=____________��P4A=______________��
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
% ͼʾ��·�У�I=____________��P10V=______________��
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
% ��ͼʾ��·���ݿ����I=__ _______��P2V=_____ _______
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
% ��ͼʾ��·���ݿ����Us=____ ________Pus=____ ________
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
% ��ͼʾ��·���ݿ����R=____________P3V=____________
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
% ��ͼʾ��·���ݿ����U=____________P2V=___ _________
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
% ��ͼʾ��·�п����I=____________P2V=_____ ______
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
% ��ͼʾ��·�����UR=____________P2V=____________
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
% ��ͼʾ��·�����U1=_________P5A=____ _______
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
% ��ͼʾ��·���ݿ����i=_______________uab=____________
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
% ͼʾ��·�У�i=_________A.
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
% ͼʾ��·�У�Ubd=_________V,  P2�� =________W.
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
% ����Ԫ����VARֱ����дͼ�е�δ֪����
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
% ����Ԫ����VARֱ����дͼ�Ե�δ֪������u=5Vʱ����i=___________����
% u=7e-2tVʱ����i=___ ________��
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
% ����Ԫ����VARֱ����дͼ�е�δ֪����
% ��uc=3Vʱ����i=____ _______��
% ��uc=e-3tVʱ����u=____  ________��
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
% fig 43
% ��Ԫ����VARֱ����дͼ�е�δ֪����
% ��iL =1Aʱ����i=__ ________��
% ��iL =-2etAʱ����i=__________��
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
% ��Ԫ����VARֱ����дͼ�Ե�δ֪����
% ��u=12Vʱ����i=_________��
% ��u=4sin2tVʱ����i=_________��
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
% ����Ԫ����VARֱ����дͼ�е�δ֪����
% ��uc=14Vʱ����u=__ _________��
% ��uc=sin5tVʱ����u=_________��
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
% ��Ԫ����VARֱ����дͼ�Ե�δ֪����
% ��iL=4Aʱ����u=__________��
% ��iL=sin9tAʱ����i=____ _______��
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
% ����Ԫ����VCRֱ����дͼ�е�δ֪����
% ��i=4Aʱ����u=____________�� 
% ��i=sin2t Aʱ����u=____________��
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
% ��Ԫ����VCRֱ����дͼ�Ե�δ֪����
% ��u=4Vʱ����i=____________��
% ��u=2e-2tVʱ����i=____________��
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
% ��ͼ��ʾ��·����Դ�Ľ�Ƶ�ʣ����迹Zab����_______.
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
% ��·��ͼ�����赥λΪ������Rab=_________��
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
% ��·��ͼ����R=_________
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
% ��·��ͼ����R=_________
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
% ��·�еĵ���i1=2e-2t��i2=e-4t������ֱ�����������·����ڵ�ѹ
% u1=____________,u2=__________   ��
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
% ͼʾRC��·��ԭ����ֱ����̬����t=0ʱ�����ش�1Ͷ��2������Ҫ�ع�ʽ
% uC(t)=_______________��
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
% ��������װ���У�Ҫ��Uo���US����֮һ���ڣ���XC=__________R��
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
% ��·�е���Cԭ�����ҵ�ѹԴuS(t)���ӣ���t=0ʱ������Ͷ�����࣬���ʼֵ
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
% ��֪��Դ����P�ĵ�ѹ����������ͼ����ȷ�����Ч��·������
% G=_________��B=___________��
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
% �����ѹ����ͬ����, ��ѹ�������Ĳο�������ͼ����u2��u1����λ��ϵ��
% _________. i2��i1����λ��ϵ��_______.
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
% �����ѹ����ͬ����, ��ѹ�������Ĳο�������ͼ����u2��u1����λ��ϵ��
% _________. i2��i1����λ��ϵ��_______.
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
% �����ѹ����ͬ����, ��ѹ�������Ĳο�������ͼ����u2��u1����λ��ϵ��
% _________. i2��i1����λ��ϵ��_______.
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
% ͼʾ���������ѹ���ĵ�·�У�
% ԭ�ߵĵ���I1=________����ѹU1=________����Ч�迹Zi=___________.
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
% ͼʾ��·�У���5V��ѹԴ��������ʱ��3�������ϵĵ���Ϊ_______
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
% ����дͼʾ��Դһ�˿�����ab���˵�
% ��1�� ��·��ѹuOC|ab=__________
% ��2�� ��·����iSC|ab=__________
% ��3�� ab�����Ӹ���RL=8/3�������ʱ�ĸ��ص�ѹuab=_______
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
% ��ͼʾ��·�ͱ�ƶ��������
% ����N1�Ĺ���Ϊ__________
% ����N2�Ĺ���Ϊ__________��ע�����ʣ�
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
% ��·����֪������ͼ��US=_________;  P5V=__________���ͷţ�
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
% ͼʾ��·�У���ѹ��V�Ķ���Ϊ___________.
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
% ��ͼ��ʾ��·����֪����I=10A����IL����_______.
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
% ͼʾ���������ѹ���ĵ�·�У�ԭ�ߵĵ���I1=________����ѹU1=________����
% Ч�迹Zi=___________.
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
% ͼʾ��·�Ķ˿����Է���U = _______
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
% ͼʾ��·�Ķ˿����Է���U = _______
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
% ͼʾ��·�Ķ˿����Է���U = _______ 
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
% ͼʾ��·�У���1�����ش�ʱ����ѹUAB ����2�����رպ�ʱ������IAB ��
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
% ��ͼʾ��·�еĵ�ѹUAB��U��
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
% ��ͼʾ��·�еĵ���I�͵�ѹUab ��
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
% �õ�Ч�任��ͼʾ��·�еĵ���I ��
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
% ��ͼ��ʾ��·���������Rin ��
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
% ��ͼ��ʾ��·���������Rin ��
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
% ��ͼ�л�����֧·2��4��7��8Ϊ��֧�Ļ�����·��.
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
% �Ի���ͼʾ����ͼ����֧·1��3��7��8Ϊ��֧�Ļ�����·��
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
% ͼʾ��·����֧·���������֧·����������Դ���˵ĵ�ѹ��
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
% ����ͼ��ʾ�����ź�Դ����RS=10K?�����ص���RL=10?��Ϊ��ʵ���迹ƥ�䣬��
% �����ѹ������ϵ�·������ʹ����RL�������ʣ������ѹ���ı��n=?��
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
% �ý���ѹ����ͼʾ��·��֧·����������Դ���˵ĵ�ѹ��
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
% �ý���ѹ����ͼʾ��·�Ľ���ѹUn1��Un2��Un3��
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
% ��·��ͼ��ʾ�������i1�͵�ѹus(P27,1-14a)
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
% ��·��ͼ��ʾ�����ѹԴ�͵���Դ�Ĺ���(P27,1-14b)
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
% ��ͼʾ��·����˵���(P44,2-5)
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
% ��ͼʾ��·����˵���(P48,2-12a)
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
% ��ͼʾ��Դ֧·�Ĺ��ʣ���֪��US=6V��R=3����IS=1A��I=2A����
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
% ��ͼʾ��Դ֧·�Ĺ��ʣ���֪��US=6V��R=3����IS=1A��I=2A����
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
% ��ͼʾ��Դ֧·�Ĺ��ʣ���֪��US=6V��R=3����IS=1A��I=2A����
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
% ��ͼʾ��Դ֧·�Ĺ��ʣ���֪��US=6V��R=3����IS=1A��I=2A����
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
% ��ͼʾ��·�и�Ԫ���Ĺ��ʣ���˵���Ƿ������ʻ������չ��ʡ�
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
% ͼʾ��·,�����ϵĵ���������ͼ��ʾ, u(0)=0,���ѹu(t),�������Ρ�
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
% fig 97
% ��ͼʾ��·�е�ѹU�͵���I ��
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
% ��ͼʾ��·�е���Դ���ܿص�ѹԴ�Ĺ��ʡ�
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
% ͼʾRLC��̬��·���ɶ�̬�����ɵ�uC����������ӦuC(t)=______
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
