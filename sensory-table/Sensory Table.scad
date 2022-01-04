// front box board
translate([20, 0, 0]) cube(size=[580, 20, 140]);
// back box board
translate([20, 420, 0]) cube(size=[580, 20, 140]);
// left box board
cube(size=[20, 440, 140]);
// right box board
translate([580, 0, 0]) cube(size=[20, 440, 140]);
// center divider board
translate([300, 20, 70]) cube(size=[20, 400, 70]);
// left support rail
translate([0, 0, -20]) cube(size=[140, 440, 20]);
// center support rail
translate([230, 0, -20]) cube(size=[140, 440, 20]);
// right support rail
translate([460, 0, -20]) cube(size=[140, 440, 20]);
// front left leg
difference() {
translate([0, -20, -360]) cube(size=[140, 20, 500]);
translate([80, -20, -360]) rotate([0, 10, 0]) cube(size=[140, 20, 500]);
}
// front right leg
difference() {
translate([600-140, -20, -360]) cube(size=[140, 20, 500]);
translate([600-80, -20, -360]) rotate([0, -10, 0]) translate([-140, 0, 0]) cube(size=[140, 20, 500]);
// NOTE: to rotate around right edge instead of left, need to translate + rotate and THEN move into position
}
// back left leg
difference() {
translate([0, 440, -360]) cube(size=[140, 20, 500]);
translate([80, 440, -360]) rotate([0, 10, 0]) cube(size=[140, 20, 500]);
}
// back right leg
difference() {
translate([600-140, 440, -360]) cube(size=[140, 20, 500]);
translate([600-80, 440, -360]) rotate([0, -10, 0]) translate([-140, 0, 0]) cube(size=[140, 20, 500]);
// NOTE: to rotate around right edge instead of left, need to translate + rotate and THEN move into position
}
