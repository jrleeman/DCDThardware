// Resolution
$fn=100;

// Base of stand
// Note, remote the radius from the dimensions
// of th rectangular base
base_width = 50;
base_thickness = 10;
base_length = 65;
curve_radius = 5;

// Magnet Holes
magnet_radius = 6.35 + 0.2;
magnet_depth = 3.175 +0.05;

// Risers
riser_radius = 3.38 + 0.2; // Loose fit clear drill for 1/4"
riser_separation = 50;

// Nut Size
nut_width = 12.6; // point to point
nut_depth = 6.1;

// Raft
raft_width = 5;
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

// Make Risers holes for the DCDT Mount
translate([base_length/2-riser_separation/2,base_width/4,0]) cylinder(base_thickness*1.5,riser_radius,riser_radius);
translate([base_length/2+riser_separation/2,base_width/4,0]) cylinder(base_thickness*1.5,riser_radius,riser_radius);

// Make nut retainers for risers
translate([base_length/2-riser_separation/2,base_width/4,base_thickness-nut_depth])cylinder(nut_depth*2.1, r1=nut_width/2+0.2, r2=nut_width/2+0.2, $fn=6);
translate([base_length/2-riser_separation/2,base_width/4,base_thickness-nut_depth*0.1])cylinder(nut_depth*0.15, r1=nut_width/2+0.2, r2=nut_width/2+1.2, $fn=6);

translate([base_length/2+riser_separation/2,base_width/4,base_thickness-nut_depth])cylinder(nut_depth*2.1, r1=nut_width/2+0.2, r2=nut_width/2+0.2, $fn=6);
translate([base_length/2+riser_separation/2,base_width/4,base_thickness-nut_depth*0.1])cylinder(nut_depth*0.15, r1=nut_width/2+0.2, r2=nut_width/2+1.2, $fn=6);



// Make holes in base for magnets
translate([base_length/8,base_width/4*3,base_thickness-magnet_depth]) cylinder(magnet_depth, magnet_radius,magnet_radius);
translate([base_length/8*4,base_width/4,base_thickness-magnet_depth]) cylinder(magnet_depth, magnet_radius,magnet_radius);
translate([base_length/8*7,base_width/4*3,base_thickness-magnet_depth]) cylinder(magnet_depth, magnet_radius,magnet_radius);

}

// Make a pseudo raft
translate([-1,base_width,0]) cube([raft_width,raft_length,raft_thickness]);
translate([-1,-1*raft_length,0]) cube([raft_width,raft_length,raft_thickness]);

translate([base_length-raft_width+1,base_width,0]) cube([raft_width,raft_length,raft_thickness]);
translate([base_length-raft_width+1,-1*raft_length,0]) cube([raft_width,raft_length,raft_thickness]);

translate([base_length/2-raft_width/2,base_width+3,0]) cube([raft_width,raft_length,raft_thickness]);
translate([base_length/2-raft_width/2,-1*raft_length-3,0]) cube([raft_width,raft_length,raft_thickness]);
