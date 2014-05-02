module queen() {
	$fn = 8;
	cylinder(r=0.5, h=0.25);
	translate([0, 0, 0.25]) cylinder(r=0.3, h=2);
	translate([0, 0, 2.25]) cylinder(r1=0.3, r2=0.5, h=0.25);
	difference() {
		translate([0, 0, 2.5]) cylinder(r=0.5, h=0.125);
		translate([0, 0, 2.25]) cylinder(r=0.3, h=0.5);
	}
	difference() {
		translate([0, 0, 2.75]) cylinder(r=0.5, h=0.125);
		translate([0, 0, 2.5]) cylinder(r=0.3, h=0.5);
	}

	for(r = [0:7]) {
		rotate(r*360/8, [0,0,1]) translate([0.4, 0, 2.625]) cylinder(r=0.05, h=0.125);
		rotate(r*360/8, [0,0,1]) translate([0.4, 0, 2.875]) cylinder(r1=0.05, r2=0, h=0.125);
	}

	translate([0, 0, 2.5]) cylinder(r1=0.15, r2=0, h=1);
}
