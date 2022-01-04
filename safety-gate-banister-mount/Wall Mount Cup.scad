INNER_DIAMETER = 38.1;
SHELL_WIDTH = 2;
OUTER_DIAMETER = INNER_DIAMETER + SHELL_WIDTH*2;
INNER_HEIGHT = 6.5;
OUTER_HEIGHT = INNER_HEIGHT + SHELL_WIDTH;
SCREW_HOLE_DIAMETER = 2.5;

difference() {
// outer shell
linear_extrude(height=OUTER_HEIGHT)
circle(d=OUTER_DIAMETER, $fn=50);

// inner hole
translate([0, 0, SHELL_WIDTH])
linear_extrude(height=INNER_HEIGHT*1.5)
circle(d=INNER_DIAMETER, $fn=50);
    
// screw hole
translate([0, 0, -SHELL_WIDTH])
linear_extrude(SHELL_WIDTH*3)
circle(d=SCREW_HOLE_DIAMETER, $fn=50);
}
