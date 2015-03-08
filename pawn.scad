BASE_HEIGHT=0.25;

REFINEMENT=3;

BODY_HEIGHT=1;
SMALL_RADIUS=0.2;
BIG_RADIUS=0.4;

function half(measure) = measure/2;

module base(){
	base_radius = 0.5;
	cylinder(r=base_radius, h=BASE_HEIGHT, $fn=REFINEMENT);
}

function section_offset(z_offset) = [0, 0, z_offset];


module body(){
	on_base_offset = section_offset(BASE_HEIGHT);
	half_body = half(BODY_HEIGHT);
	half_body_offset = section_offset(BASE_HEIGHT + half_body);	

	translate(on_base_offset) 
		cylinder(r1=SMALL_RADIUS, r2=BIG_RADIUS, h=half(BODY_HEIGHT), $fn=REFINEMENT);
	translate(half_body_offset) 
		cylinder(r1=BIG_RADIUS, r2=SMALL_RADIUS, h=half(BODY_HEIGHT), $fn=REFINEMENT);
}

module head(){
	structure_height = BASE_HEIGHT + BODY_HEIGHT;
	base_head_height = 0.25;
	top_head_height = 0.5;
	on_body_offset = section_offset(structure_height);
	on_half_head_offset = section_offset(structure_height + base_head_height);

	translate(on_body_offset) 
		cylinder(r1=SMALL_RADIUS, r2=BIG_RADIUS, h=base_head_height, $fn=REFINEMENT);
	translate(on_half_head_offset) 
		cylinder(r1=BIG_RADIUS, r2=0, h=top_head_height, $fn=REFINEMENT);
}

module pawn() {
	base();
	body();
	head();
}