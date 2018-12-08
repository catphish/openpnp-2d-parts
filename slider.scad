$fn=50;
$thickness=6;
$drill3=3.2;
$drill5=5.3;
difference() {
    union() {
        hull() {
            translate([-23,-33,0]) cylinder(r=5, h=$thickness+2,center=true);
            translate([23,-33,0]) cylinder(r=5, h=$thickness+2,center=true);
            translate([-23,20,0]) cylinder(r=5, h=$thickness+2,center=true);
            translate([23,20,0]) cylinder(r=5, h=$thickness+2,center=true);
        }
        hull() {
            translate([-33,-21,0]) cylinder(r=5, h=$thickness+2,center=true);
            translate([33,-21,0]) cylinder(r=5, h=$thickness+2,center=true);
            translate([-33,-33,0]) cylinder(r=5, h=$thickness+2,center=true);
            translate([33,-33,0]) cylinder(r=5, h=$thickness+2,center=true);
        }
    }
    translate([0,0,4]) cube([40,100,4],center=true);

    translate([-10,-10,0]) cylinder(r=$drill3/2,h=$thickness+3,center=true);
    translate([-10,10,0]) cylinder(r=$drill3/2,h=$thickness+3,center=true);
    translate([10,-10,0]) cylinder(r=$drill3/2,h=$thickness+3,center=true);
    translate([10,10,0]) cylinder(r=$drill3/2,h=$thickness+3,center=true);

    translate([-10,-21,0]) cylinder(r=$drill5/2,h=$thickness+3,center=true);
    translate([10,-21,0]) cylinder(r=$drill5/2,h=$thickness+3,center=true);

    translate([-33,-27-6,0]) cylinder(r=$drill3/2,h=$thickness+3,center=true);
    translate([-33,-27+6,0]) cylinder(r=$drill3/2,h=$thickness+3,center=true);
    translate([33,-27-6,0]) cylinder(r=$drill3/2,h=$thickness+3,center=true);
    translate([33,-27+6,0]) cylinder(r=$drill3/2,h=$thickness+3,center=true);
}
