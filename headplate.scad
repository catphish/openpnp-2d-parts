$fn=50;
$thickness=6;
$width=66;
$height=115;
$motorshaft=12.5;
$motormount=31;
$motoroffset=1;
$mgnmount=20;
$mgnoffset=80;
$drill3=3.2;

difference() {
    union() {
        hull() {
            translate([0,0,0]) cylinder(r=5,h=$thickness);
            translate([$height,-5,0]) cube([5,5,$thickness]);
            translate([0,$width,0]) cylinder(r=5,h=$thickness);
            translate([$height,$width,0]) cube([5,5,$thickness]);
        }
    }
    // Motor
    translate([$motoroffset + $motormount/2,$width/2,-1]) cylinder(r=$motorshaft,h=$thickness+2);

    translate([$motoroffset,$width/2 + $motormount/2,-1]) cylinder(r=$drill3/2,h=$thickness+2);
    translate([$motoroffset,$width/2 + $motormount/2,-0.5]) cylinder(r=3,h=3.5);

    translate([$motoroffset,$width/2 - $motormount/2,-1]) cylinder(r=$drill3/2,h=$thickness+2);
    translate([$motoroffset,$width/2 - $motormount/2,-0.5]) cylinder(r=3,h=3.5);

    translate([$motoroffset + $motormount,$width/2 - $motormount/2,-1]) cylinder(r=$drill3/2,h=$thickness+2);
    translate([$motoroffset + $motormount,$width/2 - $motormount/2,-0.5]) cylinder(r=3,h=3.5);

    translate([$motoroffset + $motormount,$width/2 + $motormount/2,-1]) cylinder(r=$drill3/2,h=$thickness+2);
    translate([$motoroffset + $motormount,$width/2 + $motormount/2,-0.5]) cylinder(r=3,h=3.5);

    // Rear Slider
    translate([$mgnoffset, $width/2+$mgnmount/2,-1]) cylinder(r=$drill3/2,h=$thickness+5);
    translate([$mgnoffset, $width/2-$mgnmount/2,-1]) cylinder(r=$drill3/2,h=$thickness+5);
    translate([$mgnoffset-$mgnmount, $width/2+$mgnmount/2,-1]) cylinder(r=$drill3/2,h=$thickness+5);
    translate([$mgnoffset-$mgnmount, $width/2-$mgnmount/2,-1]) cylinder(r=$drill3/2,h=$thickness+5);

    // Vertical Rails
    for (y = [9.5,$width-9.5]){
        for (x = [10,50,90]){
            translate([x,y,-1]) cylinder(r=$drill3/2,h=$thickness+2);
        }
    }

    // Belt clamp
    for (y = [0,$width]){
        for (x = [$mgnoffset-37-6,$mgnoffset-37+6]){
            translate([x,y,-1]) cylinder(r=$drill3/2,h=$thickness+2);
            translate([x,y,-0.5]) cylinder(r=3,h=3.5);
        }
    }
}


$cameraholes=34;
$depth=38;
$drill32=2.2;

translate([$height-1,0,43]) rotate([0,90,0]) {
    difference() {
        hull() {
            translate([0,0,0]) cylinder(r=5,h=$thickness);
            translate([0,$width,0]) cylinder(r=5,h=$thickness);
            translate([$depth,-5,0]) cube([5,5,$thickness]);
            translate([$depth,$width,0]) cube([5,5,$thickness]);
        }

        translate([15+$cameraholes/2, $width/2+$cameraholes/2, -1])cylinder(r=$drill32/2,h=$thickness+2);
        translate([15+$cameraholes/2, $width/2-$cameraholes/2, -1])cylinder(r=$drill32/2,h=$thickness+2);
        translate([15-$cameraholes/2, $width/2+$cameraholes/2, -1])cylinder(r=$drill32/2,h=$thickness+2);
        translate([15-$cameraholes/2, $width/2-$cameraholes/2, -1])cylinder(r=$drill32/2,h=$thickness+2);
        
        translate([15-20,$width/2-15,-1]) cube([40,30,$thickness+2]);
    }
}
