REFINEMENT = 4;
BASE_HEIGHT = 0.25;

BODY_HEIGHT = 1.625;

TOP_BIG_RADIUS = 0.45;
LOWER_PART_TOP_HEIGHT = 0.1;

module base(){
	base_radius = 0.5;
	cylinder(r=base_radius, h=BASE_HEIGHT, $fn=REFINEMENT);
}

module body(){
	body_radius = 0.35;
	body_height = 1.625;

	body_offset = [0, 0, BASE_HEIGHT];

	translate(body_offset) 
		cylinder(r=body_radius, h=body_height, $fn=REFINEMENT);
}

module lower_part_top(){

	lower_part_top_offset = [0, 0 , BASE_HEIGHT + BODY_HEIGHT];		
	//lower_part_top_height = 0.1;
	lower_part_top_small_radius = 0.35;

	translate(lower_part_top_offset) 
		cylinder(r1=lower_part_top_small_radius, 
				r2=TOP_BIG_RADIUS, 
				h=LOWER_PART_TOP_HEIGHT, $fn=REFINEMENT);
}

module wall(){
	
	wall_height = 0.5;
	upper_part_z_position = BASE_HEIGHT + BODY_HEIGHT + LOWER_PART_TOP_HEIGHT; //1.975
	
	offset = [0, 0, 1.975];

	translate(offset) 
		cylinder(r=TOP_BIG_RADIUS, h=wall_height, $fn=REFINEMENT);
}

module floor(){
	
	floor_distance = 0.375;
	wall_width = 0.375;
	wall_height = 1;
	floor_z_position = BASE_HEIGHT + BODY_HEIGHT + LOWER_PART_TOP_HEIGHT + floor_distance;
	offset = [0, 0, floor_z_position];	

	translate(offset) 
		cylinder(r=wall_width, h=wall_height, $fn=REFINEMENT);	
}

module upper_part_top(){

	difference() {
		wall();
		floor();
	}
}

module top(){

	lower_part_top();
    upper_part_top();

}

module battlement(offset){
	
	height = 0.2;
	radius = 0.075;

	translate(offset)
		cylinder(r=radius, h=height, $fn=REFINEMENT);
}


module rook() {
	
	base();
	body();
	top();
	
	for (position = [-0.25, 0.25]) 
	{	
		battlement([position, 0, 2.35]);
		battlement([0, position, 2.35]);
	
	}
}
