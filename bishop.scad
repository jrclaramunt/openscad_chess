module bishop() {
	$fn=6;
	cylinder(r=0.5, h=0.25);
	translate([0,0,0.25]) cylinder(r1=0.3, r2=0.2, h=1.5);
	translate([0,0,1.75]) cylinder(r1=0.2, r2=0.4, h=0.25);
	translate([0,0,2]) cylinder(r=0.4, h=0.25);
	difference() {
		translate([0,0,2.25]) cylinder(r1=0.4, r2=0.1, h=0.4);
		translate([0.35,0,2.5]) rotate(-45, [0,1,0]) cylinder(r=0.5, h = 0.1);
	}
	translate([0,0,2.65]) cylinder(r1=0.1, r2=0.2, h=0.1);
	translate([0,0,2.75]) cylinder(r1=0.2, r2=0, h=0.2);
}