include <constants.scad>
include <pawn.scad>
include <rook.scad>
include <bishop.scad>
include <knight.scad>
include <queen.scad>
include <king.scad>

SQUARE_WIDTH = 1.5;
SQUARE_DIMENSIONS = [SQUARE_WIDTH, SQUARE_WIDTH, 0.2];
BLACK = [0.5,0.5,0.5];
WHITE = [0.9,0.9,0.9];
BOARD_WIDTH = 12;
BOARD_BEGINING = -5.25;
X_AXIS = [1,0,0];
INCREASE_BY_FIVE = [5,5,5];

function get_center_coef() = half(BOARD_WIDTH) - half(SQUARE_WIDTH);

function positive(value) = abs(value);

function alternate(i, j) = (i+j)%2 == 1;

function move_y_position(n_squares) = BOARD_BEGINING + n_squares*SQUARE_WIDTH;

module create_square(color) {
	color(color) 
		cube(SQUARE_DIMENSIONS ,center=true);	
}

module all() {
	board_begining = -get_center_coef();
	board_end = positive(board_begining);

	square_center_x = half(SQUARE_WIDTH);

	for(i = [board_begining:SQUARE_WIDTH:board_end]) {
		translate([square_center_x, i, 0]) 
			pawn();
	}

	translate([-square_center_x, board_begining, 0]) 
		rook();

	translate([-square_center_x, move_y_position(1), 0]) 
		knight();

	translate([-square_center_x, move_y_position(2), 0]) 
		bishop();

	translate([-square_center_x, move_y_position(3), 0]) 
		queen();

	translate([-square_center_x, move_y_position(4), 0]) 
		king();

	translate([-square_center_x, move_y_position(5), 0]) 
		bishop();

	translate([-square_center_x, move_y_position(6), 0]) 
		knight();

	translate([-square_center_x, move_y_position(7), 0]) 
		rook();

}

module board() {
	number_of_squares = 8 - 1;
	white = [0.8,0.8,0.8];
	black = [0.6,0.6,0.6];
	z_offset = -0.1;
	center_board_coef = get_center_coef();

	for(i = [0:number_of_squares]) {
		for(j = [0:number_of_squares]) {
			translate([-center_board_coef+i*SQUARE_WIDTH, -center_board_coef+j*SQUARE_WIDTH, z_offset])
				if(alternate(i, j)) {
					create_square(WHITE);
				}
				else {
					create_square(BLACK);
				}
		}
	}
}

module white_pieces() {
	x_offset = 3*SQUARE_WIDTH;
	offset = [-x_offset, 0, 0];

	translate(offset)  
		color(WHITE) 
			all();
}

module black_pieces() {
	x_offset = 3*SQUARE_WIDTH;
	offset = [x_offset, 0, 0];

	translate(offset)  
		mirror(X_AXIS) 
			color(BLACK) 
				all();
}

scale(INCREASE_BY_FIVE){
	
	board();
	white_pieces();
	black_pieces();
}