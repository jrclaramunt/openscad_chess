module king() {
	$fn=10;
	cylinder(r=0.5, h=0.25);
	translate([0,0,0.25]) cylinder(r=0.3, h=2.25);
	translate([0,0,2.5]) cylinder(r1=0.3, r2=0.5, h=0.25);
	difference() {
		translate([0,0,2.75]) cylinder(r=0.5, h=0.1);
		translate([0,0,2.5]) cylinder(r=0.3, h=0.5);
	}
	difference() {
		translate([0,0,3.05]) cylinder(r=0.5, h=0.1);
		translate([0,0,2.75]) cylinder(r=0.3, h=0.5);
	}

	for(r = [0:9]) {
		rotate(r*360/10, [0,0,1]) translate([0, 0, 2.85]) linear_extrude(height=0.2, twist=36) translate([0.4, 0, 0]) circle(0.02);
	}
	for(r = [0:9]) {
		rotate(-r*360/10, [0,0,1]) translate([0, 0, 2.85]) linear_extrude(height=0.2, twist=-36) translate([0.4, 0, 0]) circle(0.02);
	}

	for(r = [0:9]) {
		rotate(r*36, [0,0,1]) translate([0.4, 0, 3.125]) rotate(45, [0,-1,0]) cylinder(r=0.02, h=0.575);
	}

	translate([0,0,2.75]) cylinder(r=0.02, h=0.875);
	translate([0,0,3.675]) sphere(0.1);
}