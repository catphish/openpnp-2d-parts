$fn=50;
$drill3=3.2;
$drill2=2.15;

$thickness=6;
difference() {
    cube([30,25+$thickness,$thickness]);
    translate([10.9,-1,-1]) cube([8.2,$thickness+1,$thickness+2]);
    translate([10.9,$thickness-0.8,-1]) cylinder(r=0.8,h=$thickness+2);
    translate([19.2,$thickness-0.8,-1]) cylinder(r=0.8,h=$thickness+2);

    translate([7,$thickness/2,-1]) cylinder(r=$drill3/2,h=$thickness+2);
    translate([23,$thickness/2,-1]) cylinder(r=$drill3/2,h=$thickness+2);

    // Motor
    translate([15, 12.5+$thickness, -1]) cylinder(r=8,h=$thickness+2);
    translate([15+8, 12.5+$thickness+8, -1]) cylinder(r=$drill2/2,h=$thickness+2);
    translate([15+8, 12.5+$thickness-8, -1]) cylinder(r=$drill2/2,h=$thickness+2);
    translate([15-8, 12.5+$thickness+8, -1]) cylinder(r=$drill2/2,h=$thickness+2);
    translate([15-8, 12.5+$thickness-8, -1]) cylinder(r=$drill2/2,h=$thickness+2);
}