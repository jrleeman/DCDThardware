// Resolution
$fn=100;

// Base of stand
// Note, remote the radius from the dimensions
// of th rectangular base
base_width = 15;
base_thickness = 7;
base_length = 65;
curve_radius = 5;

// Magnet Holes
magnet_radius = 6.35;
magnet_depth = 3.175;

// Risers
riser_radius = 3;
riser_height = 150;
riser_separation = 50;

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
translate([base_length/8,base_width/2,0]) cylinder(magnet_depth, magnet_radius,magnet_radius);
translate([base_length/8*4,base_width/2,0]) cylinder(magnet_depth, magnet_radius,magnet_radius);
translate([base_length/8*7,base_width/2,0]) cylinder(magnet_depth, magnet_radius,magnet_radius);

}

// Make Risers for the DCDT Mount
translate([base_length/2-riser_separation/2,base_width/2,base_thickness]) cylinder(riser_height,riser_radius,riser_radius);

translate([base_length/2+riser_separation/2,base_width/2,base_thickness]) cylinder(riser_height,riser_radius,riser_radius);

// Put Strain Reliefs on risers
translate([base_length/2-riser_separation/2,base_width/2,base_thickness]) cylinder(15,riser_radius*3,riser_radius);

translate([base_length/2+riser_separation/2,base_width/2,base_thickness]) cylinder(15,riser_radius*3,riser_radius);

// Make a pseudo raft
translate([-1,base_width,0]) cube([raft_width,raft_length,raft_thickness]);
translate([-1,-1*raft_length,0]) cube([raft_width,raft_length,raft_thickness]);

translate([base_length-raft_width+1,base_width,0]) cube([raft_width,raft_length,raft_thickness]);
translate([base_length-raft_width+1,-1*raft_length,0]) cube([raft_width,raft_length,raft_thickness]);

translate([base_length/2-raft_width/2,base_width+3,0]) cube([raft_width,raft_length,raft_thickness]);
translate([base_length/2-raft_width/2,-1*raft_length-3,0]) cube([raft_width,raft_length,raft_thickness]);
