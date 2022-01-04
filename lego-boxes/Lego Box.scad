//### Max Build Volumes ###

// Prusa Mini = 180x180x180
// Prusa I3 MK3S = 250x210x210
// Creality Ender 3 V2 = 220x220x250

//### Customizer ###

boxWidth = 160;
boxLength = 160;
wallHeight = 50;
wallThickness = 2;
baseHeight = 4;
// Amount to lower the edge so the walls overlap the base
baseRabbet = 2;
// Change this to output base or walls
isBase = false;

//### Base ###

module makeBase() {
  // full base minus rabbet
  linear_extrude(height=(baseHeight-baseRabbet), center=false) {
    square([boxWidth, boxLength], center=false);
  }
  // rest of base, leaving space for walls overlapping rabbet
  translate([wallThickness, wallThickness, 0]) linear_extrude(height=baseHeight, center=false) {
    square([boxWidth-2*wallThickness, boxLength-2*wallThickness], center=false);
  }
}

//### Walls ###

module makeWalls() {
  linear_extrude(height=(wallHeight-baseRabbet), center=false) {
    difference() {
      // full box
      square([boxWidth, boxLength], center=false);
      // inner hole
      translate([wallThickness, wallThickness, 0]) square([boxWidth-2*wallThickness, boxLength-2*wallThickness], center=false);
    }
  }
}

//### Execute ###

if (isBase) {
  makeBase();
} else {
  makeWalls();
}
