include(/usr/local/lib/m4/circuit_macros/mpost.m4)
include(/usr/local/lib/m4/circuit_macros/libcct.m4)
define(`dimen_', (dimen_*.8))
define(`elen_', (elen_*1.25))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fig 1
% ͼʾ��·�У�����0 =1000 rad /sʱ��·����г�񣬴�ʱI=1A����R1=R2 =100����
% L=0.2H�����·����г��ʱ����C��ֵ�͵�ѹU��
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
% fig 3
% ��ͼΪһ�򵥵���ϵͳ����֪���ص�ѹUL=480V�����Ը���Z1���յĹ���Ϊ10kW
% ��Z2���յĹ���Ϊ12kW����������cos?1=0.8��cos?2=0.75���������迹ZW
% =0.35+j1.5���������Դ�����ĸ������Լ���ѹ��
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
% ��ͼ��ʾ��AB�˼����ҽ�����ѹ������ЧֵΪU����Ƶ��Ϊ?ʱ�ı������C���ʣ�
% ��1��ʹAB��Ĺ�������cos?=1ʱ����Ҫ�Ե�����ʲô���ƣ�
% ��2��ʹAB��Ĺ�������ʱ������C��ֵ��󣿲�˵������R��翹X֮��Ĺ�ϵ��
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
% ����ͼ��ʾ��������3������£���ͼʾ��·�������ѹ�����ѱ�n������
% ��1�� 10?����Ĺ���Ϊ2?���蹦�ʵ�25%��
% ��2�� ��
% ��3�� a,b�˵��������Ϊ8?��
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
% ������ͼ��ʾ��·����֪��=103rad/s��ZS= RS +jXS=(50+j100)����R=100������ֻ
% ���е����������ʵ�ZS��R����ʱ����R���Դ֮��Ӧ����һ��ʲô���ĵ�·����
% ��ʹR�������ʣ�������·ͼ�������Ԫ��ֵ��
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
% ����ͼ��ʾ��·����Դ��Ƶ��?=103rad/s������Z��ʵ�����鲿���ɵ�������
% �����ܻ�õ�����ʡ�
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
% ����ͼ��ʾ��·������R1=1?��R2=1?��C1=0.25F��C2=0.25F��L=0.5H����ӵ�Դ
% �������书��ʱ���ص�ZXֵ��
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
% ͼʾ��·�������ѹ���ı��Ϊ10��1�����ѹU2��10-18��1����Ϊ5K����
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
% ͼʾ��·��R1=50����L1=70mH��L2=25mH��M=25mH��C=1��F��V����=104rad/s�����
% ֧·��������10-15��
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
% ��ͼʾһ�˿ڵ�·�Ĵ�ά����Ч��·����֪R1= R2=6������L1=��L2=10������M=5������
% ��V����10-12��
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
% ��ͼ��ʾ��·��u2 �� ����R1= 1���� R2 = 2����C = 1F��L = 2H ��us=costV
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
% �ڵ�Դ�͵綯��֮�䴮��һ�����Ȧ�ɽ��͵���С���ʵ綯�����������ȣ���
% ת�٣���Ϊ�������������������Բ��ô����������ķ�������ͨ��ʵ���Ѿ���
% �������綯���˵�ѹ (��U1) ����180Vʱ��Ϊ���ʣ��Ҵ�ʱ�綯���ĵ�Ч����
% R=190?���翹XL =260?���ʣ���1�� Ӧ������������ĵ�����������������
% U=220V��50Hz�ĵ�Դ�ϻ��U1=180V �ĵ�ѹ����2�� ��ʱ���������ܵĹ�����ѹ
% �Ƕ��٣���3�� �������������ݡ����衢�����Ԫ����Ч������·�ĵ�������ѹ
% ����ͼ��
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
% ͼʾ��·����г��״̬������Is = 1 A��U1= 50 V��R1=Xc=100�������ѹUL�͵�
% ��R2 ��
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
% ͼʾ��·�У�Uc=50V��R1 =5����R2 = R3=10����C= 0.5F��Is =2A����·��·ǰ��
% �ﵽ��̬����s�պϺ�����ϵĵ�ѹuc(t)��
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
% ͼʾ��·�У�R1=10����R2=4����R3=15����L=1H����ѹu1�ĳ�ʼֵΪu1(0+) = 15V
% ������������ӦuL(t)��
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
% fig 21
% ͼʾ��·�У�us=2V��R1=1K����R2=2K����C=300��F��t <0ʱ��·������̬����t =
% 0ʱ��������s�պϣ���uc (t)��
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
% ͼʾ��·�У�R1=3����C=1F��     Uc��0����=100V��R2=6��������sԭ���ڶϿ�״
% ̬������ѹUc����50Vʱ�Զ���ͨ����t >0ʱ�ĵ��ݵ�ѹuc (t)�͵���ic(t)��
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
% ͼʾ��·�У�R1=6����R2 =5����R3 =20����L=2H��Us =12V��Is=3A��t < 0ʱ��·
% ������̬��t = 0ʱ��·����t > 0ʱ�ĵ���i(t)��ȫ��Ӧ��
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
% ͼʾ��·�У�Is =��(t)��L= 2H��R1 = R2 = 10������uL�ĵ�λ��Ծ��Ӧ��
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
% ͼʾ��·�У�R =1����L=1H��Is =1A����iL (0��)=2A����t��0+ʱu0(t)��
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
% ͼʾ����ʱ�����·�У�R =1����C=1F����i0(t)�ĵ�λ��Ծ��Ӧ��Ӧ��
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
% ͼʾ��·�У�R1=1����R2=2����C=3F��Is=��(t)����uc(0����= 0���Լ��㵥λ��Ծ
% ��Ӧuc��t����
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
% ͼʾ��·�п���S��ǰ�Ѵ�����̬��t=0���ش򿪣���t>0ʱ��uL(t)����6-11��
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
% ͼʾ��·�п���S��ǰ�Ѵ�����̬��t=0���ش򿪣���t>0ʱ��ic(t)����6-17��
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
% ͼʾ��·��t=0ʱ����S1�򿪣�S2�պϣ����ض���ǰ����·�Ѵ�����̬������t>0
% ʱ��iL(t)��uL(t)����6-18��
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
% ͼʾ��·�п���S��ǰ�Ѵ�����̬��R=2����L=4H��Us =10V��Is=2A���󿪹�S��
% �Ϻ�ĵ�·�е�iL(t)��i����P139��6-4��
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
% fig 33
% ͼʾ��·�е�·��·ǰ�Ѵﵽ��̬����s�պϺ�����ϵĵ�ѹuc(t)�������䲨��ͼ��
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
% ͼʾ��·��t=0ʱ����S�պϣ����ض���ǰ����·�Ѵ�����̬��iL(0-)=2A����t>0
% ʱ��iL(t)��uL(t)��
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
% ͼʾ��·�У�R1=R2 =10k����R3 =30k����C=10��F�� Is=1mA��t < 0ʱ��·������
% ̬��t = 0ʱ���ضϿ����󿪹ضϿ����uc(t ) ��u (t )���繤���Ӽ���P161��
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
% ͼʾ��·�У�R1=R2 =20k����Us =10V��L=1H�� Is=2mA��t < 0ʱ��·������̬��
% t = 0ʱ���رպϣ��󿪹رպϺ��iL(t )���繤���Ӽ���P162��5.4.2
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
% ����ͼ��ʾ���˿ڵ�Y������
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
% �������ͼ���˿����������Ҽ�������µ�Z������
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
% ��ͼʾ˫������Ŀ�·�迹����Z��
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
