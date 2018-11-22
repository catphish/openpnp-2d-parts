$fn=50;
$thickness=6;
$drill3=3.2;
$drill5=5.3;
difference() {
    hull() {
        translate([0,0,0]) cylinder(r=5, h=$thickness);
        translate([50,0,0]) cylinder(r=5, h=$thickness);
        translate([0,42,0]) cylinder(r=5, h=$thickness);
        translate([50,42,0]) cylinder(r=5, h=$thickness);
    }

    translate([15,11,-1]) cylinder(r=$drill3/2,h=$thickness+2);
    translate([15,31,-1]) cylinder(r=$drill3/2,h=$thickness+2);
    translate([35,11,-1]) cylinder(r=$drill3/2,h=$thickness+2);
    translate([35,31,-1]) cylinder(r=$drill3/2,h=$thickness+2);

    translate([15,0,-1]) cylinder(r=$drill5/2,h=$thickness+2);
    translate([15,42,-1]) cylinder(r=$drill5/2,h=$thickness+2);
    translate([35,0,-1]) cylinder(r=$drill5/2,h=$thickness+2);
    translate([35,42,-1]) cylinder(r=$drill5/2,h=$thickness+2);

    hull() {
        translate([-1.5,(42-7)/2,-1]) cylinder(h=$thickness+2,r=$drill3/2);
        translate([-1.5,(42+7)/2,-1]) cylinder(h=$thickness+2,r=$drill3/2);
    }
    hull() {
        translate([51.5,(42-7)/2,-1]) cylinder(h=$thickness+2,r=$drill3/2);
        translate([51.5,(42+7)/2,-1]) cylinder(h=$thickness+2,r=$drill3/2);
    }
}
