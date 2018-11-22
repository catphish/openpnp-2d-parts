$cameraholes=34;

module cam() {
	// pcb:
	translate([-cx/2, -cy/2, 0]) {
	color("DarkSlateBlue") 
	difference() {
		cube([cx,cy,1]);
		
		translate([5,5,-1]) cylinder(d=2.5,h=6);
		translate([5,5+28,-1]) cylinder(d=2.5,h=6);
		translate([5+28,5+28,-1]) cylinder(d=2.5,h=6);
		translate([5+28,5,-1]) cylinder(d=2.5,h=6);
	}
	// m12 lens block:
	color([0.1,0.1,0.1]) {
		translate([cx/2, cy/2, 1]) cylinder(d=14,h=20);
	}
	}
}

$fn=50;
$thickness=6;
$width=80;
$depth=40;
$drill3=3.2;
$drill2=2.2;

difference() {
    hull() {
        translate([0,0,0]) cylinder(r=5,h=$thickness);
        translate([0,$width,0]) cylinder(r=5,h=$thickness);
        translate([$depth,-5,0]) cube([5,5,$thickness]);
        translate([$depth,$width,0]) cube([5,5,$thickness]);
    }

    // Captive nuts
    hull() {
        translate([$depth-5,10,-1]) cylinder(r=$drill3/2,h=$thickness+2);
        translate([$depth+10,10,-1]) cylinder(r=$drill3/2,h=$thickness+2);
    }
    hull() {
        translate([$depth+0,10-3,-1]) cylinder(r=0.5,h=$thickness+2);
        translate([$depth+0,10+3,-1]) cylinder(r=0.5,h=$thickness+2);
        translate([$depth+2,10-3,-1]) cylinder(r=0.5,h=$thickness+2);
        translate([$depth+2,10+3,-1]) cylinder(r=0.5,h=$thickness+2);
    }
    hull() {
        translate([$depth-5,$width-10,-1]) cylinder(r=$drill3/2,h=$thickness+2);
        translate([$depth+10,$width-10,-1]) cylinder(r=$drill3/2,h=$thickness+2);
    }
    hull() {
        translate([$depth+0,$width-10-3,-1]) cylinder(r=0.5,h=$thickness+2);
        translate([$depth+0,$width-10+3,-1]) cylinder(r=0.5,h=$thickness+2);
        translate([$depth+2,$width-10-3,-1]) cylinder(r=0.5,h=$thickness+2);
        translate([$depth+2,$width-10+3,-1]) cylinder(r=0.5,h=$thickness+2);
    }

    translate([$depth/2+$cameraholes/2, $width/2+$cameraholes/2, -1])cylinder(r=$drill2/2,h=$thickness+2);
    translate([$depth/2+$cameraholes/2, $width/2-$cameraholes/2, -1])cylinder(r=$drill2/2,h=$thickness+2);
    translate([$depth/2-$cameraholes/2, $width/2+$cameraholes/2, -1])cylinder(r=$drill2/2,h=$thickness+2);
    translate([$depth/2-$cameraholes/2, $width/2-$cameraholes/2, -1])cylinder(r=$drill2/2,h=$thickness+2);
    
    translate([$depth/2-15,$width/2-20,-1]) cube([30,40,$thickness+2]);
    translate([$depth/2-20,$width/2-15,-1]) cube([40,30,$thickness+2]);
}