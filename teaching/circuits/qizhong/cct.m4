include(/usr/local/lib/m4/circuit_macros/mpost.m4)
include(/usr/local/lib/m4/circuit_macros/libcct.m4)
.PS
    cct_init
    elen = elen_
    Origin: Here
    ebox(right_ 2*elen, .3, .2); b_current(i_1,,O); dot(,,1); "\ding{172}" above
    {
        ebox(down_ elen, .3, .2); b_current(i_4,,); dot(,,1); "\ding{173}" ljust
        {
            ebox(down_ elen, .3,.2); b_current(i_5,,O,E)
        }
        ebox(left_ 2*elen,.3,.2); b_current(i_2,,,E)
    }
    line right_ elen
    ebox(down_ 2*elen, .3,.2); b_current(i_6,,O); line left_ elen
    dot(,,1); "\ding{174}" below
    ebox(left_ 2*elen,.3,.2); b_current(i_3,,O,E); dot(,,1)
    ebox(up_ elen, .3, .2); b_current(i_8,,); dot(,,1)
    ebox(up_ elen,.3,.2); b_current(i_7,,,E); dot(,,1)
.PE
.PS
    cct_init
    elen = elen_
    Origin: Here
    {
        line up_ elen
        ebox(right_ 2*elen,.3,.2); llabel(+,u_5,-)
        line down_ elen
    }
    dot(,,1); ebox(right_ 2*elen,.3,.2); rlabel(+,u_1,-); dot(,,1)
    {
        ebox(down_ elen,.3,.2); rlabel(+,u_2,-); dot(,,1)
    }
    line right_ elen; ebox(down_ elen,.3,.2); llabel(+,u_6,-)
    line left_ elen; dot(,,1)
    ebox(left_ 2*elen,.3,.2); llabel(-,u_3,+); dot(,,1)
    ebox(up_ elen,.3,.2); llabel(+,u_4,-)
.PE
.PS
    cct_init
    elen = elen_
    Origin: Here
    line left_ elen; dot(,,1)
    {
        source(down_ elen,i); b_current(,,O,E); llabel(,\unit{10}{\ampere},)
        line left_ elen/2
    }
    line left_ elen
    resistor(down_ elen,E); llabel(,\unit{5}{\ohm},); line right_ elen/2
    dot(,,1); source(down_ elen,v); rlabel(+,\unit{20}{\volt},-)
    line right_ 1.5*elen; "$-$" above; "b" ljust;
    gap(up_ 2*elen); clabel(,U_{\mathrm{OC}},); "$+$" below
    "a" ljust
.PE
.PS
    cct_init
    elen = elen_
    Origin: Here
    line left_ elen; dot(,,1)
    {
        source(down_ 1.5*elen,i); b_current(,,O); llabel(,\unit{2}{\ampere},)
        dot(,,1)
    }
    line left_ elen; resistor(down_ .75*elen, E); rlabel(,\unit{5}{\ohm},)
    source(down_ .75*elen,v); rlabel(-,\unit{5}{\volt},+)
    line right_ 2*elen; "b" ljust; gap(up_ 1.5*elen); "a" ljust
.PE
.PS
    cct_init
    elen = elen_
    Origin: Here
    arrowline(right_ elen); rlabel(,I_1,); dot(,,1)
    {
        source(down_ .75*elen,v); b_current(I_2,,O); rlabel(+,\unit{2}{\volt},-)
        resistor(down_ .75*elen,E); llabel(,\unit{1}{\ohm},)
        dot(,,1)
    }
    line right_ elen
    resistor(down_ 1.5*elen,E); b_current(I_3,,); llabel(,\unit{3}{\ohm},)
    line left_ 2*elen
    resistor(up_ .75*elen,E); llabel(,\unit{3}{\ohm},)
    source(up_ .75*elen,v); llabel(-,\unit{9}{\volt},+)
.PE
.PS
    cct_init
    elen = elen_
    Origin: Here
    line right_ elen; dot(,,1); {move up .1; "a" rjust}
    {
        resistor(down_ 1.5*elen,E); llabel(,\unit{3}{\ohm},)
        dot(,,1)
    }
    {
        line up_ elen/2; source(right_ elen,i); b_current(,,O,E)
        llabel(,\unit{2}{\ampere},); line down_ elen/2; dot(,,1)
        {move up .1; "b" ljust}
    }
    resistor(right_ elen, E); rlabel(,\unit{1}{\ohm},)
    {
        resistor(down_ .75*elen,E); llabel(,\unit{2}{\ohm},)
        source(down_ .75*elen,v); llabel(+,\unit{4}{\volt},-)
        dot(,,1)
    }
    line right_ elen; source(down_ 1.5*elen,i)
    b_current(,,O,E); llabel(,\unit{4}{\ampere},)
    line left_ 2*elen; ground(,,E); line left_ elen
    source(up_ 1.5*elen,i); b_current(,,O,E); llabel(,\unit{4}{\ampere},)
.PE
.PS
    cct_init
    elen = elen_
    Origin: Here
    line right_ elen; dot(,,1)
    {
        resistor(down_ .75*elen,E); rlabel(,\unit{4}{\ohm},); dot(,,1)
        {
            source(right_ elen,i); b_current(,,O,E)
            llabel(,\unit{3}{\ampere},); dot(,,1)
        }
        resistor(down_ .75*elen,E); rlabel(,\unit{2}{\ohm},); dot(,,1)
        dot(,,1)
    }
    line right_ elen; resistor(down_ .75*elen,E); llabel(,\unit{6}{\ohm},)
    resistor(down_ .75*elen,E); llabel(+,U,-); rlabel(,\unit{3}{\ohm},)
    line left_ 2*elen; source(up_ 1.5*elen,v); llabel(+,\unit{12}{\volt},-)
.PE
.PS
    cct_init
    elen = elen_
    Origin: Here
    dot(,,1); resistor(right_ elen,E); llabel(,\unit{2}{\ohm},)
    source(right_ elen,v); llabel(+,\unit{3}{\volt},-)
    dot(,,1); {line right_ elen/2}
    resistor(down_ elen,E); rlabel(,\unit{4}{\ohm},)
    dot(,,1)
    {
        line right_ elen/2; "b" above; gap(up_ elen); "a" below
    }
    line left_ 2*elen; dot(,,1)
    {resistor(up_ elen,E); rlabel(,\unit{2}{\ohm},)}
    line left_ elen/2
    source(up_ elen,i); b_current(,,O,E); llabel(,,\unit{1}{\ampere})
    line to Origin
.PE
.PS
    cct_init
    elen = elen_
    Origin: Here
    resistor(right_ elen,E); llabel(,\unit{5}{\ohm},); dot(,,1)
    {
        source(down_ .75*elen,i); b_current(\unit{3}{\ampere},,O); dot(,,1)
        {
            line right_ 1.5*elen; dot(,,1)
        }
        resistor(down_ .75*elen,E); rlabel(,\unit{0.2}{\siemens},); dot(,,1)
    }
    line right_ 1.5*elen
    source(down_ .75*elen,v); llabel(+,\unit{10}{\volt},-)
    resistor(down_ .75*elen,E); llabel(,\unit{5}{\ohm},)
    source(left_ .75*elen,v); llabel(+,\unit{6}{\volt},-)
    source(left_ .75*elen,i); b_current(\unit{1}{\ampere},,O,E)
    line left_ elen; "b" above; gap(up_ 1.5*elen); "a" below
.PE
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ .75*elen,v); llabel(-,\unit{12}{\volt},+)
    resistor(up_ .75*elen,E); llabel(,\unit{1}{\ohm},); dot(,,1)
    {
        line up_ 2*elen/3
        source(right_ 1.25*elen,i); b_current(\unit{4}{\ampere},,O,E)
        resistor(right_ 1.25*elen,E); llabel(,\unit{2}{\ohm},)
        line down_ 2*elen/3
    }
    resistor(right_ elen,E); b_current(I_{\mathrm{x}},,O,E); rlabel(,\unit{4}{\ohm},)
    dot(,,1)
    {
        consource(down_ 1.5*elen,v); rlabel(+,5I_{\mathrm{x}},-); dot(,,1)
    }
    line right_ elen/2; dot(,,1)
    {
        resistor(down_ 1.5*elen,E); llabel(,\unit{6}{\ohm},); dot(,,1)
    }
    resistor(right_ elen,E); llabel(,\unit{3}{\ohm},); dot(,,1)
    resistor(down_ 1.5*elen,E); b_current(I,,); llabel(,\unit{5}{\ohm},)
    line to Origin
.PE
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen,i); b_current(\unit{5}{\ampere},,O,E)
    llabel(I_{\mathrm{S}},,)
    dot(,,1)
    {
        line up_ 2*elen/3 then right_ .75*elen
        consource(right_ elen,i); b_current(\alpha I,,O)
        line right_ .75*elen then down_ 2*elen/3
    }
    resistor(right_ elen,E); llabel(,R_2,); rlabel(,\unit{2}{\ohm},); dot(,,1)
    {
        resistor(down_ elen,E); b_current(I,,)
        llabel(,\unit{1}{\ohm},); rlabel(,R_1,); dot(,,1)
    }
    resistor(right_ 1.5*elen,E); llabel(,R_3,); rlabel(,\unit{3}{\ohm},); dot(,,1)
    source(down_ elen,v); b_current(I_0,below_,O,E)
    llabel(-,\unit{5}{\volt},+); rlabel(,U_{\mathrm{S}},)
    line to Origin
.PE
.PS
    cct_init
    elen = elen_
    Origin: Here
    source(up_ elen, v); rlabel(-,\unit{10}{\volt},+)
    line right_ elen; dot
    {
        resistor(down_ elen, E); llabel(,\unit{1}{\ohm},); dot
    }
    line right_ elen
    source(down_ elen, i); b_current(,,O,E)
    llabel(,\unit{2}{\ampere},)
    line to Origin
.PE
