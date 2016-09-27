//aide mémoire 2h,5l,10e

module infos_lib_001() {
    echo("##########################################");
    echo("List of functions in lib_001 :");
    echo("arc_byangle() NOT READY");
    echo("bonbonne(u=1,$fn=12) TESTING");
    echo("coupole_bydeep(d,p,m=false)");
    echo("ring(h,i,o)");
    echo("##########################################");
}

// #################################################
module arc_byangle() {
    //
    echo("NOT READY");
    //
}

// #################################################
module bonbonne(u=1,$fn=12) {
    htr = 10*u;
    diam = 5*u;
    //
    rainh = htr/40;
    rainl = htr/4;
    //
    translate([0,0,htr/2]) {
        difference() {
            cylinder(h=htr,d=diam,center=true);
            translate([0,0,-rainl+2*rainh]) ring(rainh,(diam-diam/10),diam+1);
            translate([0,0,-rainl-2*rainh]) ring(rainh,(diam-diam/10),diam+1);
            //
            translate([0,0,(u/2)-(htr/2)]) coupole_bydeep(diam,u/2,m=true);
            //
        }
    }
    //
}

// #################################################
module coupole_bydeep(d,p,m=false,$fn=12) {
    h1 = sqrt(pow(d/2,2)+pow(p,2));
    cs1 = p/h1;
    r = h1/2/cs1;
    ang = 180-2*acos(cs1);
    dec = floor($fn/4);
    arc = [for (i=[1:dec-1]) let (ta = ang-(ang/dec)*i) [sin(ta)*r,(r-p)-(cos(ta)*r)]];
    pts = concat([[0,1],[d/2,1],[d/2,0]],arc,[[0,-p]]);
    if (m) difference() {
        translate([0,0,-(p+1)/2]) cube([d+1,d+1,p+1],center=true);
        rotate_extrude(angle=360) polygon(pts);
    }
    else intersection() {
        rotate_extrude(angle=360) polygon(pts);
    }
}

// #################################################
module ring(h,i,o) {
    difference() {
        cylinder(h,d=o,center=true);
        cylinder((h+1),d=i,center=true);
    }
}


