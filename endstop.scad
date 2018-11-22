$fn=50;
$drill3=3.2;
$drill5=5.3;
$thickness=6;
$width=25;
$length=60;

difference() {
    union() {
        hull() {
            translate([0,0,0]) cylinder(r=5,h=$thickness);
            translate([0,30,0]) cylinder(r=5,h=$thickness);
            translate([$width,0,0]) cylinder(r=5,h=$thickness);
            translate([$width,30,0]) cylinder(r=5,h=$thickness);
        }
        hull() {
            translate([0,0,0]) cylinder(r=5,h=$thickness);
            translate([0,$length,0]) cylinder(r=5,h=$thickness);
            translate([5,0,0]) cylinder(r=5,h=$thickness);
            translate([5,$length,0]) cylinder(r=5,h=$thickness);
        }
    }
    translate([$width/2+10,5,-1]) cylinder(r=$drill5/2,h=$thickness+2);
    translate([$width/2-10,5,-1]) cylinder(r=$drill5/2,h=$thickness+2);

    translate([7,$length+2-5,-1]) cylinder(r=$drill3/2,h=$thickness+2);
    translate([7,$length+2-5-19,-1]) cylinder(r=$drill3/2,h=$thickness+2);
}