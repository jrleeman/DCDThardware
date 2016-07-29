// Resolution
$fn=50;

// Properties
m3_clear = 3.7/2;
screw_centers = 30;

// Beam
width = 10;
length = screw_centers + width;

difference(){
    cube([width,length,width]);
     // Screw holes
    translate([width/2, width/2, 0])
    cylinder(h=2*width, r1=m3_clear, r2=m3_clear);
    
    translate([width/2, length-width/2, 0])
    cylinder(h=2*width, r1=m3_clear, r2=m3_clear);
}
