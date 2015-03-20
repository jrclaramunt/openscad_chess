BASE_HEIGHT=0.25;

PAWN_REFINEMENT=3;
PAWN_BODY_HEIGHT=1;
PAWN_SMALL_RADIUS=0.2;
PAWN_BIG_RADIUS=0.4;

ROOK_REFINEMENT = 4;
ROOK_BODY_HEIGHT = 1.625;
ROOK_TOP_BIG_RADIUS = 0.45;
ROOK_LOWER_PART_TOP_HEIGHT = 0.1;

function section_offset(z_offset) = [0, 0, z_offset];

module base(refinement){
	base_radius = 0.5;
	cylinder(r=base_radius, h=BASE_HEIGHT, $fn=refinement);
}