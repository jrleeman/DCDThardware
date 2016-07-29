// Resolution
$fn=50;

// Properties
wall_thickness = 1.5 ;
rail_size = 10;
rail_spacing = 20;
bracket_length = 10;
m3_clear = 3.7/2;

difference(){
    // Bracket
    cube([rail_spacing, bracket_length, rail_size]);
    
    // Cutout
    translate([wall_thickness,0,wall_thickness])
    cube([rail_spacing-2*wall_thickness, bracket_length, rail_size-wall_thickness]);
    
    // Screw holes
    translate([rail_spacing/2, bracket_length/2, 0])
    cylinder(h=wall_thickness, r1=m3_clear, r2=m3_clear);
    
    translate([0,bracket_length/2, rail_size/2])
    rotate([0,90,0])
    cylinder(h=rail_spacing, r1=m3_clear, r2=m3_clear);
}