module pawn() {
	$fn=3;
	cylinder(r=0.5, h=0.25);
	translate([0,0,0.25]) cylinder(r1=0.2, r2=0.4, h=0.5);
	translate([0,0,0.75]) cylinder(r1=0.4, r2=0.2, h=0.5);
	translate([0,0,1.25]) cylinder(r1=0.2, r2=0.4, h=0.25);
	translate([0,0,1.5]) cylinder(r1=0.4, r2=0, h=0.5);
}