REFINEMENT = 6;
BASE_HEIGHT = 0.25;
BODY_HEIGHT = 1.5;
SMALL_RADIUS = 0.2;
BIGEST_RADIUS = 0.4;
HEAD_LOWER_PART_HEIGHT = 0.25;
HEAD_HEIGHT = 0.9;

module base(){
	
	radius = 0.5;
	cylinder(r=radius, h=BASE_HEIGHT, $fn=REFINEMENT);
}

module body(){
	
	offset = [0, 0, BASE_HEIGHT];
	big_radius = 0.3;

	translate(offset) 
		cylinder(r1=big_radius, r2=SMALL_RADIUS, h=BODY_HEIGHT, $fn=REFINEMENT);
}

module lower_part() {
	
	z_offset = BASE_HEIGHT + BODY_HEIGHT;
	offset = [0, 0, z_offset];

	translate(offset) 
		cylinder(r1=SMALL_RADIUS, r2=BIGEST_RADIUS, 
				h=HEAD_LOWER_PART_HEIGHT, $fn=REFINEMENT);
}

module middle_part(){
	
	height = 0.25;
	lower_part_height = 0.25;

	z_offset = BASE_HEIGHT + BODY_HEIGHT + HEAD_LOWER_PART_HEIGHT;
	offset = [0, 0, z_offset];

	translate(offset) 
		cylinder(r=BIGEST_RADIUS, h=height, $fn=REFINEMENT);
}

module upper_head(){
	
	middle_head_height = 0.25;
	z_offset = BASE_HEIGHT + BODY_HEIGHT + HEAD_LOWER_PART_HEIGHT + middle_head_height;
	offset = [0, 0, z_offset];
	small_radius = 0.1;	
	height = 0.4;
	
	translate(offset) 
		cylinder(r1=BIGEST_RADIUS, r2=small_radius, h=height, $fn=REFINEMENT);
}

module head_hole(){

	hole_piece_offset = [0.35, 0 ,2.5];
	hole_piece_radius = 0.5;
	hole_piece_height = 0.1;

	right = -45;
	y_axis = [0,1,0];

	translate(hole_piece_offset) 
		rotate(right, y_axis) 
			cylinder(r=hole_piece_radius, h = hole_piece_height, $fn=REFINEMENT);
}

module lower_peak(){
	
	z_offset = BASE_HEIGHT + BODY_HEIGHT + HEAD_HEIGHT;
	offset = [0, 0, z_offset];
	
	smallest_radius = 0.1;
	height = 0.1;
	
	translate(offset) 
		cylinder(r1=smallest_radius, r2=SMALL_RADIUS, h=height, $fn=REFINEMENT);
}

module higher_peak(){
	
	lower_peak_height = 0.1;
	z_offset = BASE_HEIGHT + BODY_HEIGHT + HEAD_HEIGHT + lower_peak_height;
	offset = [0, 0, z_offset];	
	height = 0.2;

	translate(offset) 
		cylinder(r1=SMALL_RADIUS, r2=0, h=height, $fn=REFINEMENT);
}

module peak(){
	
	lower_peak();
	higher_peak();

}

module upper_part(){

	difference() {
		upper_head();
		head_hole();
	}
	peak();
}

module head() {
	
	lower_part();
	middle_part();
	upper_part();

}

module bishop() {
	
	base();
	body();
	head();
}

