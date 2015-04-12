// Resolution
$fn=50;

// Base of stand
// Note, remote the radius from the dimensions
// of th rectangular base
base_width = 15;
base_thickness = 5;
base_length = 80;

// Screw Holes
screw_radius = 1.1310 + 0.1; 

difference(){
cube([base_length,base_width,base_thickness]);

translate([75,0.5*base_width,0]) cylinder(1.5*base_thickness,screw_radius,screw_radius);
translate([65,0.5*base_width,0]) cylinder(1.5*base_thickness,screw_radius,screw_radius);
translate([55,0.5*base_width,0]) cylinder(1.5*base_thickness,screw_radius,screw_radius);
translate([45,0.5*base_width,0]) cylinder(1.5*base_thickness,screw_radius,screw_radius);
translate([35,0.5*base_width,0]) cylinder(1.5*base_thickness,screw_radius,screw_radius);
translate([35,0.5*base_width,0]) cylinder(1.5*base_thickness,screw_radius,screw_radius);
translate([25,0.5*base_width,0]) cylinder(1.5*base_thickness,screw_radius,screw_radius);
translate([15,0.5*base_width,0]) cylinder(1.5*base_thickness,screw_radius,screw_radius);
}

translate([5,0,0])rotate([0,-90,0]) cube([20,15,5]);

translate([5,0,0])rotate([-90,-90,0]) linear_extrude(3) polygon(points=[[0,0],[20,0],[0,75],[0,0]],paths=[[0,1,2,3]]);

translate([5,12,0]) rotate([-90,-90,0]) linear_extrude(3) polygon(points=[[0,0],[20,0],[0,75],[0,0]],paths=[[0,1,2,3]]);
