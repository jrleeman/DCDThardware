// Resolution
$fn=50;

// DCDT
dcdt_radius = 10.5;

// m3 hardware
m3_clear = 3.5/2; // Standard Fit
m3_tap = 2.7/2; // Tap drill
nut_driver_clearance = 8/2; // Radius of clearance for m3 nut driver
cap_head_clearance = 7/2.;
cap_head_depth_clearance = 5;

// DCDT Mount
mount_wall_thickness = 2;
mount_height = dcdt_radius*2+mount_wall_thickness + cap_head_clearance*2; 
mount_width = dcdt_radius*2+2*mount_wall_thickness;
gap_width = 0.03 * mount_width;


// Holder parameters
base_width = mount_width + 2 * 2 * nut_driver_clearance;
base_thickness = 3;
base_length = 30;

// Base plate with holes for m3 mounts
mount_spacing = 20.;
mounts_from_edge = nut_driver_clearance;

// Clamp Screws
clamp_top_offset = cap_head_clearance * 1.2;
clamp_spacing = 20;

// Uncomment for printing orientation
rotate([90,0,0])

difference(){
    
    union(){
        // Base plate
        cube([base_width, base_length, base_thickness]);
        
        // DCDT Mounting Block
        translate([2*nut_driver_clearance,0,0])
        cube([mount_width, base_length, mount_height]);
        
        // Support Feet
        //translate([foot_radius, foot_radius, -foot_height])
        //cylinder(foot_height, foot_radius, foot_radius);
    }
        
    // Rail Mounting Holes
    translate([base_width-mounts_from_edge,base_length/2+mount_spacing/2,0]) 
    cylinder(base_thickness*2,m3_clear,m3_clear);
    
    translate([base_width-mounts_from_edge,base_length/2-mount_spacing/2,0]) 
    cylinder(base_thickness*2,m3_clear,m3_clear);
    
    translate([mounts_from_edge,base_length/2+mount_spacing/2,0]) 
    cylinder(base_thickness*2,m3_clear,m3_clear);
    
    translate([mounts_from_edge,base_length/2-mount_spacing/2,0]) 
    cylinder(base_thickness*2,m3_clear,m3_clear);
    
    // DCDT Hole
    translate([base_width/2,base_length/2,dcdt_radius+mount_wall_thickness]) 
    rotate([90,0,0])
    cylinder(base_length*2,dcdt_radius,dcdt_radius, center=true);
    
    // Clamping Gap
    translate([-gap_width/2+base_width/2,0,base_thickness])
    cube([gap_width, base_length, mount_height]);
    
    // Holes for clamp screws
    
    // Clear fit side screw holes
    translate([base_width/2,base_length/2+clamp_spacing/2,mount_height-clamp_top_offset]) 
    rotate([0,90,0])
    cylinder(mount_width,m3_clear,m3_clear);
    
    translate([mount_width/2+base_width/2-cap_head_depth_clearance,base_length/2+clamp_spacing/2,mount_height-clamp_top_offset]) 
    rotate([0,90,0])
    cylinder(mount_width,cap_head_clearance,cap_head_clearance);
    
    
    translate([base_width/2,base_length/2-clamp_spacing/2,mount_height-clamp_top_offset]) 
    rotate([0,90,0])
    cylinder(mount_width,m3_clear,m3_clear);
    
    translate([mount_width/2+base_width/2-cap_head_depth_clearance,base_length/2-clamp_spacing/2,mount_height-clamp_top_offset]) 
    rotate([0,90,0])
    cylinder(mount_width,cap_head_clearance,cap_head_clearance);
    
    // Threaded clamp screw holes
    translate([0,base_length/2+clamp_spacing/2,mount_height-clamp_top_offset]) 
    rotate([0,90,0])
    cylinder(mount_width,m3_tap,m3_tap);
    
    translate([0,base_length/2-clamp_spacing/2,mount_height-clamp_top_offset]) 
    rotate([0,90,0])
    cylinder(mount_width,m3_tap,m3_tap);
}

