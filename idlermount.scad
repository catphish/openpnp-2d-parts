$fn=50;
$drill=5.3;
$thickness=6;
difference() {
    union() {
        hull() {
            translate([0,0,0]) cylinder(r=5, h=$thickness);
            translate([0,30,0]) cylinder(r=5, h=$thickness);
            translate([30,0,0]) cylinder(r=5, h=$thickness);
            translate([30,30,0]) cylinder(r=5, h=$thickness);
        }
        hull() {
            translate([0,30,0]) cylinder(r=5, h=$thickness);
            translate([0,70,0]) cylinder(r=5, h=$thickness);
            translate([50,30,0]) cylinder(r=5, h=$thickness);
            translate([50,70,0]) cylinder(r=5, h=$thickness);
        }
        translate([35,20,0]) cube([5,5,$thickness]);
    }
    translate([40,20,-1]) cylinder(r=5,h=$thickness+2);
    translate([5,2.5,-1]) cylinder(r=$drill/2,h=$thickness+2);
    translate([25,2.5,-1]) cylinder(r=$drill/2,h=$thickness+2);
    translate([5,22.5,-1]) cylinder(r=$drill/2,h=$thickness+2);
    translate([25,22.5,-1]) cylinder(r=$drill/2,h=$thickness+2);

    translate([23,63,-1]) cylinder(r=$drill/2,h=$thickness+2);
    translate([45,44,-1]) cylinder(r=$drill/2,h=$thickness+2);
}