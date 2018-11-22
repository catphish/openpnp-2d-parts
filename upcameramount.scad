$cameraholes=34;


$fn=50;
$thickness=6;
$width=50;
$depth=85;
$drill5=5.3;
$drill2=2.2;

difference() {
    hull() {
        translate([0,0,0]) cylinder(r=5,h=$thickness);
        translate([0,$width,0]) cylinder(r=5,h=$thickness);
        translate([$depth,0,0]) cylinder(r=5,h=$thickness);
        translate([$depth,$width,0]) cylinder(r=5,h=$thickness);
    }

    translate([25+$cameraholes/2, $width/2+$cameraholes/2, -1])cylinder(r=$drill2/2,h=$thickness+2);
    translate([25+$cameraholes/2, $width/2-$cameraholes/2, -1])cylinder(r=$drill2/2,h=$thickness+2);
    translate([25-$cameraholes/2, $width/2+$cameraholes/2, -1])cylinder(r=$drill2/2,h=$thickness+2);
    translate([25-$cameraholes/2, $width/2-$cameraholes/2, -1])cylinder(r=$drill2/2,h=$thickness+2);
    
    translate([25-15,$width/2-20,-1]) cube([30,40,$thickness+2]);
    translate([25-20,$width/2-15,-1]) cube([40,30,$thickness+2]);

    translate([$depth-5,$width/2-10,-1]) cylinder(r=$drill5/2,h=$thickness+2);
    translate([$depth-5,$width/2+10,-1]) cylinder(r=$drill5/2,h=$thickness+2);
    translate([$depth-25,$width/2-10,-1]) cylinder(r=$drill5/2,h=$thickness+2);
    translate([$depth-25,$width/2+10,-1]) cylinder(r=$drill5/2,h=$thickness+2);
}