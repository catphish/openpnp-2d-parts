$fn=50;
$thickness=10;
$drill2=2.25;

difference() {
    translate([0,0,0])cylinder(r=$drill2,h=$thickness);
    translate([0,0,-1])cylinder(r=$drill2/2,h=$thickness+2);
}