// Resolution
$fn=50;

// DCDT
dcdt_radius = 9.75;
dcdt_center_offset = 2; // How far off center is the DCDT (wall thickness of mount)

// Groove for captive nut
nut_groove_width = 4.2;
nut_groove_height = 1.7;
nut_groove_off_bottom = 3;

// m3 hardware
m3_clear = 3.5/2; // Standard Fit
nut_driver_clearance = 7.9/2; // Radius of clearance for m3 nut driver
cap_head_clearance = 3.;
cap_head_depth_clearance = 3.5;

// Arm parameters
arm_length = 20;
wall_thickness = 2;
arm_width = dcdt_radius + dcdt_center_offset + nut_groove_width/2 + wall_thickness;
arm_height = nut_driver_clearance*2*2;

// Groove for threaded rod
rod_groove_width = 2.6; 
rod_groove_depth = arm_height - wall_thickness;

// Alignment arm
alignment_thickness = 2;
alignment_width = 8;

// Uncomment for printing orientation
rotate([0,-90,0])

difference(){
    
    union(){
        // Main body
        cube([arm_length,arm_width,arm_height]);
        
        // Alignment arm
        translate([-alignment_thickness, -alignment_width, 0])
        cube([alignment_thickness, alignment_width+arm_width, arm_height]);
    }
    
    // Groove for nut
    translate([m3_clear+wall_thickness*2,-nut_groove_width/2+dcdt_radius+dcdt_center_offset, nut_groove_off_bottom])
    cube([arm_length,nut_groove_width,nut_groove_height]);
    
    // All thread groove
    translate([m3_clear+wall_thickness*2,-rod_groove_width/2+dcdt_radius+dcdt_center_offset,0])
    cube([arm_length, rod_groove_width, rod_groove_depth]);
    
    // Holes for M3 Mounting Screws
    translate([m3_clear+wall_thickness,arm_width,m3_clear+wall_thickness]) 
    rotate([90,0,0])
    cylinder(arm_width,m3_clear,m3_clear);
    
    translate([m3_clear+wall_thickness,arm_width,arm_height-m3_clear-wall_thickness]) 
    rotate([90,0,0])
    cylinder(arm_width,m3_clear,m3_clear);    
}
