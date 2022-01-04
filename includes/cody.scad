/*
Helper modules from Cody Sandahl
codysandahl@gmail.com
https://www.codysandahl.com
*/

//##### walls #####

module _translatedCube(loc, width, depth, height) {
  translate(loc) {
    cube([width, depth, height]);
  }
}

module wall(lowerLeft, width=1, depth=1, height=1, upperRight=undef) {
  if (upperRight != undef) {
    _translatedCube(lowerLeft, upperRight[0]-lowerLeft[0], upperRight[1]-lowerLeft[1], height);
  } else {
    _translatedCube(lowerLeft, width, depth, height);
  }
}

module _testWall() {
  wall(lowerLeft=[2, 3, 4], height=2, upperRight=[5, 5, 4]);
  wall(lowerLeft=[-1, -1, 0], width=10, depth=2, height=3.3);
}

//##### rounded boxes #####

module roundedBoxPoints(points, radius, height) {
  hull() {
    for (p = points) {
      translate(p) cylinder(r=radius, h=height);
    }
  }
}

module roundedBox(lowerLeft, width, depth, height, radius) {
  lowerRight = lowerLeft + [width-radius, radius, 0];
  upperLeft = lowerLeft + [radius, depth-radius, 0];
  upperRight = lowerLeft + [width-radius, depth-radius, 0];
  lowerLeft = lowerLeft + [radius, radius, 0];
  roundedBoxPoints([lowerLeft, lowerRight, upperLeft, upperRight], radius, height);
}

module _testRoundedBox() {
  $fn = 32;
  roundedBox(lowerLeft=[1, 2], width=3, depth=4, height=5, radius=1);
}

//##### fillet #####

module filletRA(width, radius) {
  _boxSize = 2*radius;
  _cylinderD = 4*radius;
  // fillet at a right angle
  difference() {
    cube([width, _boxSize, _boxSize]);
    translate([-1, 0, _boxSize]) rotate([0, 90, 0]) cylinder(h=width+2, d=_cylinderD);
  }
}

//##### screws and bolts #####

module countersunkScrewHead(baseDiameter, topDiameter, height, cutoutTop=0, cutoutShaft=0) {
  union() {
    translate([0, 0, -height]) cylinder(h=height, d1=baseDiameter, d2=topDiameter);
    if (cutoutTop > 0) {
      cylinder(h=cutoutTop, d=topDiameter);
    }
    if (cutoutShaft > 0) {
      translate([0, 0, -height-cutoutShaft]) cylinder(h=cutoutShaft, d=baseDiameter);
    }
  }
}

module _testCountersunkScrewHead() {
  $fn = 32;
  countersunkScrewHead(3.95, 9.2, 4.56);
  difference() {
    translate([10, 0, 0]) cube([20, 20, 5]);
    translate([20, 10, 5]) countersunkScrewHead(3.95, 9.2, 4.56, cutoutTop=4, cutoutShaft=5);
  }
}

m2HoleD = 1.75; // determined experimentally for 3d printing

module m2ScrewMount(height, holeHeight, thickness=6, useCube=false) {
  if (useCube) {
    difference() {
      cube([thickness, thickness, height]);
      translate([thickness*0.5, thickness*0.5, height-holeHeight]) cylinder(h=holeHeight+2, d=m2HoleD);
    }
  } else {
    difference() {
      cylinder(h=height, d=thickness);
      translate([0, 0, height-holeHeight]) cylinder(h=holeHeight+2, d=m2HoleD);
    }
  }
}

module _testM2ScrewMount() {
  $fn = 32;
  m2ScrewMount(10, 8);
  translate([10, 0, 2]) m2ScrewMount(4, 2);
  translate([20, 0, 0]) m2ScrewMount(4, 6);
  translate([0, 10, 0]) m2ScrewMount(height=10, holeHeight=8, useCube=true);
}

//##### prism (ramp) #####

module prism(l, w, h){
  polyhedron(
    points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
    faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
  );
}

//##### TESTING #####
//_testWall();
//_testRoundedBox();
//_testCountersunkScrewHead();
//_testM2ScrewMount();
//prism(10, 5, 2);