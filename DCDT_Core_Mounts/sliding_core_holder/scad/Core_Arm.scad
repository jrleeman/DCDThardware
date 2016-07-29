// Resolution
$fn=50;

// DCDT
dcdt_radius = 9.75;
dcdt_center_offset = 2; // How far off center is the DCDT (wall thickness of mount)

// Groove for captive nut
nut_groove_width = 4.4; // Was 4.2
nut_groove_height = 1.7;
nut_groove_off_bottom = 3;

// m3 hardware
m3_clear = 3.8/2; // Standard Fit
nut_driver_clearance = 7.9/2; // Radius of clearance for m3 nut driver
cap_head_clearance = 3.;
cap_head_depth_clearance = 3.5;

// Arm parameters
arm_length = 70;
wall_thickness = 2;
arm_width = dcdt_radius + dcdt_center_offset + nut_groove_width/2 + wall_thickness;
arm_height = nut_driver_clearance*2*2;

// Groove for threaded rod
rod_groove_width = 2.4; 
rod_groove_depth = arm_height - wall_thickness;

// Alignment arm
alignment_thickness = 2;
alignment_width = 8;

// Rail
rail_width = 10;

// Clearance notch for other rails
notch_offset = rail_width * 1.2;
notch_depth = 2;

// Uncomment for printing orientation
//rotate([0,-90,0])

difference(){
    
    union(){
        // Main body
        cube([arm_length,arm_width,arm_height]);
        
        // Alignment arm
        translate([-alignment_thickness, -alignment_width, 0])
        cube([alignment_thickness, alignment_width+arm_width, arm_height]);
    }
    
    // Notch for rail clearance
    translate([notch_offset,0,0])
    cube([arm_length,notch_depth,arm_height]);
    
    // Groove for nut
    translate([rail_width/2+m3_clear+wall_thickness,-nut_groove_width/2+dcdt_radius+dcdt_center_offset, nut_groove_off_bottom])
    cube([arm_length,nut_groove_width,nut_groove_height]);
    
    // All thread groove
    translate([rail_width/2+m3_clear+wall_thickness,-rod_groove_width/2+dcdt_radius+dcdt_center_offset,0])
    cube([arm_length, rod_groove_width, rod_groove_depth]);
    
    // Holes for M3 Mounting Screws
    translate([rail_width/2,arm_width,m3_clear+wall_thickness]) 
    rotate([90,0,0])
    cylinder(arm_width,m3_clear,m3_clear);
    
    translate([rail_width/2,arm_width,arm_height-m3_clear-wall_thickness]) 
    rotate([90,0,0])
    cylinder(arm_width,m3_clear,m3_clear);    
}
