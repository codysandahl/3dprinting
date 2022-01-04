use<jerusalem-cross-exported.scad>

union() {
// base cross
resize(newsize=[50,50,4]) jerusalem_cross(4);
// four small crosses
translate([-8.5,8.5,0]) resize(newsize=[10,10,2]) jerusalem_cross(2);
translate([8.5,8.5,0]) resize(newsize=[10,10,2]) jerusalem_cross(2);
translate([-8.5,-8.5,0]) resize(newsize=[10,10,2]) jerusalem_cross(2);
translate([8.5,-8.5,0]) resize(newsize=[10,10,2]) jerusalem_cross(2);
// top cross
resize(newsize=[48,48,6]) jerusalem_cross_top(6);
}
