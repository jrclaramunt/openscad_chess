function half(measure) = measure/2;

module pawn_body(){
	on_base_offset = section_offset(BASE_HEIGHT);
	half_body = half(PAWN_BODY_HEIGHT);
	half_body_offset = section_offset(BASE_HEIGHT + half_body);	

	translate(on_base_offset) 
		cylinder(r1=PAWN_SMALL_RADIUS, r2=PAWN_BIG_RADIUS, h=half(PAWN_BODY_HEIGHT), $fn=PAWN_REFINEMENT);
	translate(half_body_offset) 
		cylinder(r1=PAWN_BIG_RADIUS, r2=PAWN_SMALL_RADIUS, h=half(PAWN_BODY_HEIGHT), $fn=PAWN_REFINEMENT);
}

module pawn_head(){
	structure_height = BASE_HEIGHT + PAWN_BODY_HEIGHT;
	base_head_height = 0.25;
	top_head_height = 0.5;
	on_body_offset = section_offset(structure_height);
	on_half_head_offset = section_offset(structure_height + base_head_height);

	translate(on_body_offset) 
		cylinder(r1=PAWN_SMALL_RADIUS, r2=PAWN_BIG_RADIUS, h=base_head_height, $fn=PAWN_REFINEMENT);
	translate(on_half_head_offset) 
		cylinder(r1=PAWN_BIG_RADIUS, r2=0, h=top_head_height, $fn=PAWN_REFINEMENT);
}

module pawn() {
	base(PAWN_REFINEMENT);
	pawn_body();
	pawn_head();
}