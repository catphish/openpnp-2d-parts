$fn=50;
$cameraholes=34;
$thickness=6;
$width=50;
$depth=45;
$drill5=5.3;
$drill2=2.2;

difference() {
    union() {
        hull() {
            translate([0,0,0]) cylinder(r=5,h=$thickness);
            translate([0,$width,0]) cylinder(r=5,h=$thickness);
            translate([$depth,-5,0]) cube([5,5,$thickness]);
            translate([$depth,$width,0]) cube([5,5,$thickness]);
        }
        hull() {
            translate([0,-5,0]) cube([5,5,$thickness]);
            translate([$depth,-5,0]) cube([5,5,$thickness]);
            translate([$depth-1,-5,39]) cube([5,5,$thickness]);
        }
        hull() {
            translate([0,$width,0]) cube([5,5,$thickness]);
            translate([$depth,$width,0]) cube([5,5,$thickness]);
            translate([$depth-1,$width,39]) cube([5,5,$thickness]);
        }
        translate([$depth-1,-5,$thickness]) cube([$thickness, $width+10, 45-$thickness]);
    }
    translate([15+$cameraholes/2, $width/2+$cameraholes/2, -1])cylinder(r=$drill2/2,h=$thickness+2);
    translate([15+$cameraholes/2, $width/2-$cameraholes/2, -1])cylinder(r=$drill2/2,h=$thickness+2);
    translate([15-$cameraholes/2, $width/2+$cameraholes/2, -1])cylinder(r=$drill2/2,h=$thickness+2);
    translate([15-$cameraholes/2, $width/2-$cameraholes/2, -1])cylinder(r=$drill2/2,h=$thickness+2);
    
    translate([15-15,$width/2-20,-1]) cube([30,40,$thickness+2]);
    translate([15-20,$width/2-15,-1]) cube([40,30,$thickness+2]);

    translate([$depth-2,$width/2-10,15]) rotate([0,90,0]) cylinder(r=$drill5/2,h=$thickness+2);
    translate([$depth-2,$width/2+10,15]) rotate([0,90,0]) cylinder(r=$drill5/2,h=$thickness+2);
    translate([$depth-2,$width/2-10,35]) rotate([0,90,0]) cylinder(r=$drill5/2,h=$thickness+2);
    translate([$depth-2,$width/2+10,35]) rotate([0,90,0]) cylinder(r=$drill5/2,h=$thickness+2);

//    translate([$depth-5,$width/2+10,-1]) cylinder(r=$drill5/2,h=$thickness+2);
//    translate([$depth-25,$width/2-10,-1]) cylinder(r=$drill5/2,h=$thickness+2);
//    translate([$depth-25,$width/2+10,-1]) cylinder(r=$drill5/2,h=$thickness+2);
}