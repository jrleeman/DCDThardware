// Resolution
$fn=50;

// Base of stand
// Note, remote the radius from the dimensions
// of th rectangular base
base_width = 15;
base_thickness = 7;
base_length = 65;
curve_radius = 5;

// Risers
riser_radius = 3.38 + 0.2; // Loose fit clear drill for 1/4"
riser_separation = 50;

// DCDT
dcdt_radius = 10.15;

// Screw Holes
screw_radius = 1.1310 + 0.2; //or 1.1303

// Raft
raft_width = 7;
raft_length = 40;
raft_thickness = 1;


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

// Make a pseudo raft
translate([-1,base_width,0]) cube([raft_width,raft_length,raft_thickness]);
translate([-1,-1*raft_length,0]) cube([raft_width,raft_length,raft_thickness]);

translate([base_length-raft_width+1,base_width,0]) cube([raft_width,raft_length,raft_thickness]);
translate([base_length-raft_width+1,-1*raft_length,0]) cube([raft_width,raft_length,raft_thickness]);

translate([base_length/2-raft_width/2,base_width+3,0]) cube([raft_width,raft_length,raft_thickness]);
translate([base_length/2-raft_width/2,-1*raft_length-3,0]) cube([raft_width,raft_length,raft_thickness]);


