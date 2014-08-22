// Resolution
$fn=100;

// Base of stand
// Note, remote the radius from the dimensions
// of th rectangular base
base_width = 12;
base_thickness = 5;
base_length = 65;
curve_radius = 5;

// Risers
riser_radius = 3;
riser_separation = 50;

// DCDT
dcdt_radius = 9.5;

// Screw Holes
screw_radius = 1.25;

// Make the base of the stand with holes for the magnets
difference(){
// Base
linear_extrude(height = base_thickness) 
minkowski()
{
square([base_length ,base_width]);
circle(5);
}

// Make holes in base for magnets
translate([base_length/2,base_width/2,0]) cylinder(2*base_thickness,dcdt_radius,dcdt_radius);

translate([base_length/2-riser_separation/2,base_width/2,-0.5*base_thickness]) cylinder(2*base_thickness,riser_radius,riser_radius);

translate([base_length/2+riser_separation/2,base_width/2,-0.5*base_thickness]) cylinder(2*base_thickness,riser_radius,riser_radius);

// Make the screw holes for the risers
translate([base_length/2+riser_separation/2,0.7*base_width/2,0.5*base_thickness]) rotate([90,0,0]) cylinder(1.5*base_width,screw_radius,screw_radius);

translate([base_length/2-riser_separation/2,0.7*base_width/2,0.5*base_thickness]) rotate([90,0,0]) cylinder(1.5*base_width,screw_radius,screw_radius);

// Make the screw holes for the DCDT 
translate([base_length/2+dcdt_radius/1.25,base_width/2,0.5*base_thickness]) rotate([90,0,0]) cylinder(1.5*base_width,screw_radius,screw_radius);

translate([base_length/2-dcdt_radius/1.25,base_width/2,0.5*base_thickness]) rotate([90,0,0]) cylinder(1.5*base_width,screw_radius,screw_radius);


}