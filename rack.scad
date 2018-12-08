// Rack and pinion gears GPL (c) SASA October 2013.
//
// Very simple rack and pinion gear based on GPL code.
//
// I've made corrections to both rack and gear code I used (below) and unified
// and simplified both bits of code.  Corrects the use of circular pitch so
// rack and pinion match nicely.  Ammendments to the code and interface to
// simplify use and improve readability. Many bells and whistles dropped in
// favour of being dead simple.  I also opted for hard wiring the pressure
// angle to 20 degrees since this seemed a kind of standard.
//
// Based on the works (thanks!): Parametric Involute Bevel and Spur Gears by
// GregFrost GNU GPL license.  http://www.thingiverse.com/thing:3575 Parametric
// Modular Rack by Mark "Ckaos" Moissette GNU GPL license.  (Rack based on the
// work of MattMoses and Fdavies
// http://forums.reprap.org/read.php?1,51452,52099#msg-52099 and Forrest Higgs:
// 
// The originals have many fine additions such as helical gears which I've
// dropped in favour of simplicity (as befits my needs) - it wouldn't be a big
// jobs to nobble my changes backwards or their features forwards.

pi=3.1415926535897932384626433832795;
$fn=50;



module rack(cp, N, width, thickness){
// cp = circular pitch - for rack = pitch in mm/per tooth
// N = number of teeth
// width = width of rack
// thickness = thickness of support under teeth (0 for no support)

	a = 1.0*cp/pi; // addendum (also known as "module")
	d = 1.1*cp/pi; // dedendum (this is set by a standard)
	height=(d+a);

	// find the tangent of pressure angle once
	tanPA = tan(20);
	// length of bottom and top horizontal segments of tooth profile
	botL = (cp/2 - 2*d*tanPA);
	topL = (cp/2 - 2*a*tanPA);

	slantLng=tanPA*height;
	realBase=2*slantLng+topL;

	offset=topL+botL+2*slantLng;
	length=(realBase+botL)*N;

	supportSize=width;
	translate([botL/2,0,0])
	rotate([90,0,0]){
		translate([0,supportSize/2,0]){
			union(){
				cube(size=[length,width,thickness],center=true);
				for (i = [0:N-1]){
					translate([i*offset-length/2+realBase/2,0,thickness/2]){
						trapezoid([topL,supportSize],[realBase,supportSize],height);
						}
					}
				}
			}
		}
	}


// Mathematical Functions
//===============

// Finds the angle of the involute about the base radius at the given distance (radius) from it's center.
//source: http://www.mathhelpforum.com/math-help/geometry/136011-circle-involute-solving-y-any-given-x.html

function involute_intersect_angle (base_radius, radius) = sqrt (pow (radius/base_radius, 2) - 1) * 180 / pi;

// Calculate the involute position for a given base radius and involute angle.

function rotated_involute(rotate,base_radius,involute_angle)=[cos(rotate)*involute(base_radius, involute_angle)[0]+sin(rotate)*involute(base_radius, involute_angle)[1],cos(rotate)*involute(base_radius, involute_angle)[1]-sin(rotate)*involute(base_radius, involute_angle)[0]];

function mirror_point(coord)=[coord[0],-coord[1]];

function rotate_point(rotate,coord)=[cos(rotate)*coord[0]+sin(rotate)*coord[1],cos(rotate)*coord[1]-sin(rotate)*coord[0]];

function involute (base_radius, involute_angle)=[base_radius*(cos(involute_angle)+involute_angle*pi/180*sin(involute_angle)),base_radius*(sin(involute_angle)-involute_angle*pi/180*cos(involute_angle))];


module trapezoid(top,base,height){
	//echo ("test",base[0]);
	basePT1=[ -base[0]/2, base[1]/2, 0];
	basePT2=[ base[0]/2, base[1]/2, 0];
	basePT3=[ base[0]/2, -base[1]/2, 0];
	basePT4=[ -base[0]/2, -base[1]/2, 0];
	topPT1=[ -top[0]/2, top[1]/2, height];
	topPT2=[ top[0]/2, top[1]/2, height];
	topPT3=[ top[0]/2, -top[1]/2, height];
	topPT4=[ -top[0]/2, -top[1]/2, height];
	polyhedron(points=[ basePT1, basePT2, basePT3, basePT4, topPT1, topPT2, topPT3, topPT4],faces=[[0,1,2], [0,2,3],[3,7,0], [7,4,0],[1,6,2], [1,5,6],[2,6,3], [3,6,7],[5,1,0],[4,5,0],[7,5,4],[5,7,6]]);
	}

// a simple pinion and translation / rotation to make it mesh the rack
//translate([0,-20,0]) rotate([0,0,360/16/2]) pinion(2.5,16,6,5);
mirror([0,1,0]) {
$thickness=6;
$drill3=3.2;

difference() {
    union() {
        // 0.8 mod pitch
        translate([73.9,1,$thickness]) rotate([0,180,0]) rack(2.513,25,$thickness,2);
        
        hull() {
            translate([0,0,0]) cube([5,5,$thickness]);
            translate([100,0,0]) cube([5,5,$thickness]);
            translate([0,25,0]) cube([5,5,$thickness]);
            translate([100,25,0]) cube([5,5,$thickness]);
        }

    }
    
    hull() {
        translate([40,5,-1]) cylinder(r=$drill3/2,h=$thickness+2);
        translate([40,10,-1]) cylinder(r=$drill3/2,h=$thickness+2);
    }
    hull() {
        translate([40,20,-1]) cylinder(r=$drill3/2,h=$thickness+2);
        translate([40,25,-1]) cylinder(r=$drill3/2,h=$thickness+2);
    }

    hull() {
        translate([50,5,-1]) cylinder(r=$drill3/2,h=$thickness+2);
        translate([50,10,-1]) cylinder(r=$drill3/2,h=$thickness+2);
    }

    hull() {
        translate([50,20,-1]) cylinder(r=$drill3/2,h=$thickness+2);
        translate([50,25,-1]) cylinder(r=$drill3/2,h=$thickness+2);
    }

//    hull() {
//        translate([0-5,5,-1]) cylinder(r=$drill3/2,h=$thickness+2);
//        translate([0-5,10,-1]) cylinder(r=$drill3/2,h=$thickness+2);
//    }
//    hull() {
//        translate([0-5,20,-1]) cylinder(r=$drill3/2,h=$thickness+2);
//        translate([0-5,25,-1]) cylinder(r=$drill3/2,h=$thickness+2);
//    }
}

$drill2=2.15;

translate([$thickness,0,$thickness-0.1]) rotate([0,-90,0])
difference() {
    cube([25,30,$thickness]);

    // Motor
    translate([12.5,15,-1]) cylinder(r=8,h=$thickness+2);
    translate([12.5+8, 15+8, -1]) cylinder(r=$drill2/2,h=$thickness+2);
    translate([12.5+8, 15-8, -1]) cylinder(r=$drill2/2,h=$thickness+2);
    translate([12.5-8, 15+8, -1]) cylinder(r=$drill2/2,h=$thickness+2);
    translate([12.5-8, 15-8, -1]) cylinder(r=$drill2/2,h=$thickness+2);
}

}