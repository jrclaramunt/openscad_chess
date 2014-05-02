include <pawn.scad>
include <rook.scad>
include <bishop.scad>
include <knight.scad>
include <queen.scad>
include <king.scad>

module all() {
	for(i = [-5.25:1.5:5.25]) {
		translate([0.75, i, 0]) pawn();
	}

	translate([-0.75, -5.25, 0]) rook();
	translate([-0.75, -3.75, 0]) knight();
	translate([-0.75, -2.25, 0]) bishop();
	translate([-0.75, -0.75, 0]) queen();
	translate([-0.75, 0.75, 0]) king();
	translate([-0.75, 2.25, 0]) bishop();
	translate([-0.75, 3.75, 0]) knight();
	translate([-0.75, 5.25, 0]) rook();
}

module board() {
	for(i = [0:7]) {
		for(j = [0:7]) {
			translate([-5.25+i*1.5,-5.25+j*1.5,-0.1])
				if((i+j)%2 == 1) color([0.8,0.8,0.8]) cube([1.5, 1.5, 0.2] ,center=true);
				else color([0.6,0.6,0.6]) cube([1.5, 1.5, 0.2] ,center=true);
		}
	}
}

scale([5,5,5]){
	board();
	
	translate([-4.5, 0, 0]) color([0.9,0.9,0.9]) all();
	translate([4.5, 0, 0])  mirror([1,0,0]) color([0.5,0.5,0.5]) all();
}