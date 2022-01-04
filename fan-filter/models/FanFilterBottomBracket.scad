yWidth = 12;
union() {
// bottom
cube([20, yWidth, 5]);
// side brace
translate([15, 0, 0]) cube([5, yWidth, 32]);
// top
translate([15, 0, 27]) cube([25, yWidth, 5]);
}
