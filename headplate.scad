$fn=50;
$thickness=6;
$width=80;
$height=110;
$motorshaft=12.5;
$motormount=31;
$motoroffset=15;
$mgnmount=20;
$mgnoffset=25;
$drill=3.2;

difference() {
    hull() {
        translate([0,0,0]) cylinder(r=5,h=$thickness);
        translate([$height,0,0]) cylinder(r=5,h=$thickness);
        translate([0,$width,0]) cylinder(r=5,h=$thickness);
        translate([$height,$width,0]) cylinder(r=5,h=$thickness);
    }

    // Motor
    translate([$motoroffset + $motormount/2,$width/2,-1]) cylinder(r=$motorshaft,h=$thickness+2);
    translate([$motoroffset,$width/2 + $motormount/2,-1]) cylinder(r=$drill/2,h=$thickness+2);
    translate([$motoroffset,$width/2 - $motormount/2,-1]) cylinder(r=$drill/2,h=$thickness+2);
    translate([$motoroffset + $motormount,$width/2 - $motormount/2,-1]) cylinder(r=$drill/2,h=$thickness+2);
    translate([$motoroffset + $motormount,$width/2 + $motormount/2,-1]) cylinder(r=$drill/2,h=$thickness+2);

    // Rear Slider
    translate([$height-$mgnoffset, $width/2+$mgnmount/2,-1]) cylinder(r=$drill/2,h=$thickness+2);
    translate([$height-$mgnoffset, $width/2-$mgnmount/2,-1]) cylinder(r=$drill/2,h=$thickness+2);
    translate([$height-$mgnoffset-$mgnmount, $width/2+$mgnmount/2,-1]) cylinder(r=$drill/2,h=$thickness+2);
    translate([$height-$mgnoffset-$mgnmount, $width/2-$mgnmount/2,-1]) cylinder(r=$drill/2,h=$thickness+2);

    // Belt
    hull() {
        translate([$height-$mgnoffset-$mgnmount/2-3.5,-1.5,-1]) cylinder(h=$thickness+2,r=$drill/2);
        translate([$height-$mgnoffset-$mgnmount/2+3.5,-1.5,-1]) cylinder(h=$thickness+2,r=$drill/2);
    }
    hull() {
        translate([$height-$mgnoffset-$mgnmount/2-3.5,$width+1.5,-1]) cylinder(h=$thickness+2,r=$drill/2);
        translate([$height-$mgnoffset-$mgnmount/2+3.5,$width+1.5,-1]) cylinder(h=$thickness+2,r=$drill/2);
    }

    // Vertical Rails
    for (y = [10,$width-10]){
        for (x = [5,25,45,65,85, 105]){
            translate([x,y,-1]) cylinder(r=$drill/2,h=$thickness+2);
        }
    }
}
