$fn=50;
$drill2=2.15;
$drill6=6;
$surround=11;
$size = 8;
$thickness=8.5;
$xtrathickness=$thickness+7;

difference() {
    union() {
        hull() {
            translate([$size,$size,0]) cylinder(r=2, h=$thickness);
            translate([$size,-$size,0]) cylinder(r=2, h=$thickness);
            translate([-$size,$size,0]) cylinder(r=2, h=$thickness);
            translate([-$size,-$size,0]) cylinder(r=2, h=$thickness);
        }
        translate([0,0,0]) cylinder(r=($surround)/2,h=$xtrathickness);
    }

    translate([8, 8, -1]) cylinder(r=$drill2/2,h=$thickness+2);
    translate([8, -8, -1]) cylinder(r=$drill2/2,h=$thickness+2);
    translate([-8, 8, -1]) cylinder(r=$drill2/2,h=$thickness+2);
    translate([-8, -8, -1]) cylinder(r=$drill2/2,h=$thickness+2);

    translate([0,0, -1]) cylinder(r=$drill6/2,h=$xtrathickness+2);

    hull() {
        translate([$size+2,$size-4,-1]) cylinder(r=2, h=$thickness+2);
        translate([$size+2,-$size+4,-1]) cylinder(r=2, h=$thickness+2);
        translate([$size+0.5,$size-4,-1]) cylinder(r=2, h=$thickness+2);
        translate([$size+0.5,-$size+4,-1]) cylinder(r=2, h=$thickness+2);
    }

}