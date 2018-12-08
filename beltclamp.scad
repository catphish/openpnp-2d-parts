$fn=50;
$clamp_height = 3;
$clamp_width = 10;
$clamp_length = 12;
$belt_pitch = 2;
$belt_width = 7;
$tooth_width = 1.3;
$tooth_height = .75;
$offset = $belt_pitch/4;
$drill3=3.2;

difference(){
    // basic shape
    union(0){
        translate(v = [0,0,$clamp_height/2]) cube([$clamp_length-2,$clamp_width,$clamp_height], center=true);
        translate(v = [-$clamp_length/2+1, 0, 0]) cylinder(r=$clamp_width/2,h=$clamp_height);
        translate(v = [$clamp_length/2-1, 0, 0]) cylinder(r=$clamp_width/2,h=$clamp_height);
        }
    // screw holes
    translate(v = [-$clamp_length/2, 0, -1]) cylinder(h=$clamp_height+2,r=$drill3/2);
    translate(v = [$clamp_length/2, 0, -1]) cylinder(h=$clamp_height+2,r=$drill3/2);
    // belt grip
    translate(v = [0,$offset,$clamp_height-$tooth_height])
    for ( i = [round(-$clamp_width/$belt_pitch/2) : round($clamp_width/$belt_pitch/2)]){
        translate(v = [0,$belt_pitch*i,$tooth_height])cube(size = [$belt_width, $tooth_width, $tooth_height*2], center = true);
    }
}
