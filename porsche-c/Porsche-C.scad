totalWidth = 44.45; // 1 3/4"
totalHeight = 19.05; // 3/4"
lineThickness = 4.76; // 3/16"
lineHeight = 4.76; // 3/16"
roundness = 1;

module chamferedRect(size=[10,10,10], roundness=1, resolution=20) {
    $fn = resolution;
    x = size[0];
    y = size[1];
    z = size[2];
    hull() {
    translate([roundness, roundness, 0]) {
        cylinder(r=roundness, h=1);
        translate([0, 0, z-roundness]) sphere(roundness);
    }
    translate([x-roundness, roundness, 0]) {
        cylinder(r=roundness, h=1);
        translate([0, 0, z-roundness]) sphere(roundness);
    }
    translate([x-roundness, y-roundness, 0]) {
        cylinder(r=roundness, h=1);
        translate([0, 0, z-roundness]) sphere(roundness);
    }
    translate([roundness, y-roundness, 0]) {
        cylinder(r=roundness, h=1);
        translate([0, 0, z-roundness]) sphere(roundness);
    }
    }
}

union() {
// bottom of c
chamferedRect([totalWidth, lineThickness, lineHeight], roundness=roundness);
// top of c
translate([0, totalHeight-lineThickness, 0])
    chamferedRect(size=[totalWidth, lineThickness, lineHeight], roundness=roundness);
// left of c
chamferedRect(size=[lineThickness, totalHeight,lineHeight], roundness=roundness);
}
