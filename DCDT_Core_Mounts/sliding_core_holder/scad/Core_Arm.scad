// Resolution
$fn=50;

// DCDT
dcdt_radius = 9.55;
dcdt_center_offset = 2; // How far off center is the DCDT (wall thickness of mount)

// Groove for captive nut
nut_groove_width = 5.7;
nut_groove_height = 2.5;



// m3 hardware
m3_clear = 3.3/2; // Standard Fit
m3_tap = 2.4/2; // Tap drill
nut_driver_clearance = 7/2; // Radius of clearance for m3 nut driver
cap_head_clearance = 3.;
cap_head_depth_clearance = 3.5;

// Arm parameters
arm_length = 40;
wall_thickness = 2;
arm_width = dcdt_radius + dcdt_center_offset + nut_groove_width/2 + wall_thickness;
arm_height = nut_driver_clearance*2*2;

// Groove for threaded rod
rod_groove_width = 3.3; 
rod_groove_depth = arm_height - wall_thickness;


// Uncomment for printing orientation
rotate([0,-90,0])

difference(){
    // Main body
    cube([arm_length,arm_width,arm_height]);
    
    // Groove for nut
    translate([m3_clear+wall_thickness*2,-nut_groove_width/2+dcdt_radius+dcdt_center_offset, arm_height-nut_groove_height-wall_thickness])
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
    
    // cutout for stability
    //cutout_depth = 3;
    //#translate([m3_clear+wall_thickness*2,cutout_depth+wall_thickness,arm_height-wall_thickness])
    //rotate([0,90,-90]) 
    //linear_extrude(cutout_depth) 
    //polygon(points=[[0,0],[0,arm_length-wall_thickness],[arm_height-wall_thickness,0],[0,0]],paths=[[0,1,2,3]]);
    
    
}
