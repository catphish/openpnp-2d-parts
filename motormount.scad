$fn=50;
$drill5=5.3;
$drill3=3.2;
$thickness=6;

$motorshaft=12.5;
$motormount=31;
$motoroffsetx=32;
$motoroffsety=53;

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
    translate([5,2.5,-1]) cylinder(r=$drill5/2,h=$thickness+2);
    translate([25,2.5,-1]) cylinder(r=$drill5/2,h=$thickness+2);
    translate([5,22.5,-1]) cylinder(r=$drill5/2,h=$thickness+2);
    translate([25,22.5,-1]) cylinder(r=$drill5/2,h=$thickness+2);

    // Motor
    translate([$motoroffsetx, $motoroffsety,-1]) cylinder(r=$motorshaft,h=$thickness+2);
    translate([$motoroffsetx - $motormount/2, $motoroffsety + $motormount/2,-1]) cylinder(r=$drill3/2,h=$thickness+2);
    translate([$motoroffsetx - $motormount/2, $motoroffsety - $motormount/2,-1]) cylinder(r=$drill3/2,h=$thickness+2);
    translate([$motoroffsetx + $motormount/2, $motoroffsety - $motormount/2,-1]) cylinder(r=$drill3/2,h=$thickness+2);
    translate([$motoroffsetx + $motormount/2, $motoroffsety + $motormount/2,-1]) cylinder(r=$drill3/2,h=$thickness+2);

}