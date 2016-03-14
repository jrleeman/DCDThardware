// Resolution
$fn=50;

// Sizes of parts
2_56_radius = 0.75;
flag_width = 20;
flag_height = 10;
disc_radius = 7.5;
part_thickness = 1.5;

difference(){
	union(){
		cylinder(part_thickness,disc_radius,disc_radius);
		translate([flag_width/-2,0,0]) cube([flag_width,flag_height,part_thickness]);
	}

	cylinder(part_thickness*2,2_56_radius,2_56_radius);
}