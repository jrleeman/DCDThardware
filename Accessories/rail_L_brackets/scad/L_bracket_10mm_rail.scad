// Resolution
$fn=50;

// Properties
wall_thickness = 1.5 ;
rail_size = 10;
bracket_length = 10;
m3_clear = 3.7/2;

difference(){
    // Bracket
    cube([rail_size, bracket_length, rail_size]);
    
    // Cutout
    translate([wall_thickness,0,wall_thickness])
    cube([rail_size-wall_thickness, bracket_length, rail_size-wall_thickness]);
    
    // Screw holes
    translate([rail_size/2, rail_size/2, 0])
    cylinder(h=2*wall_thickness, r1=m3_clear, r2=m3_clear);
    
    rotate([0,-90,0])
    translate([rail_size/2, rail_size/2, -wall_thickness])
    cylinder(h=wall_thickness*2, r1=m3_clear, r2=m3_clear);
}