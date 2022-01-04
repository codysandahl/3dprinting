include <../includes/cody.scad>

// screw variables

mountWidth = 25;
mountDepth = 25;
mountHeight = 15;
topMountHeight = 9;
wallThickness = 5;
wallHeight = mountHeight + 5;
screwShaftD = 3.95;
screwHeadD = 9.2;
screwCountersunkHeight = 4.56;
screwThreadD = 5;
materialThickness = 3.175; // acrylic between the mounts

// corner mount

module cornerMount(x, y, height) {
  // base with screw holes
  difference() {
    union() {
      cube([x, y/2, height]);
      translate([0, -y/2, 0]) cube([x/2, y/2, height]);
    }
    translate([x/4, y/4, -1]) cylinder(h=height*2, d=screwThreadD);
    translate([x/4, -y/4, height]) countersunkScrewHead(screwThreadD, screwHeadD, screwCountersunkHeight, cutoutTop=4, cutoutShaft=height);
    translate([x*0.75, y/4, height]) countersunkScrewHead(screwThreadD, screwHeadD, screwCountersunkHeight, cutoutTop=4, cutoutShaft=height);
  }
  // supporting exterior walls
  wall(lowerLeft=[-wallThickness, -y/2, 0], width=wallThickness, depth=y+wallThickness, height=wallHeight);
  wall(lowerLeft=[-wallThickness, y/2, 0], width=x+wallThickness, depth=wallThickness, height=wallHeight);
}

// straight mount

module straightMount(x, y, height) {
  // base with screw holes
  difference() {
    cube([x, y, height]);
    translate([x/2, y/2, -1]) cylinder(h=height*2, d=screwThreadD);
    translate([x/4, y/2, height]) countersunkScrewHead(screwThreadD, screwHeadD, screwCountersunkHeight, cutoutTop=4, cutoutShaft=height);
    translate([x*0.75, y/2, height]) countersunkScrewHead(screwThreadD, screwHeadD, screwCountersunkHeight, cutoutTop=4, cutoutShaft=height);
  }
  // supporting exterior walls
  wall(lowerLeft=[0, y, 0], width=x, depth=wallThickness, height=wallHeight);
}

// top mount

module topMount(x, y, height) {
  difference() {
    roundedBox([0, 0], width=x, depth=y, height=height, radius=1);
    translate([x/2, y/2, height]) countersunkScrewHead(screwShaftD, screwHeadD, screwCountersunkHeight, cutoutTop=4, cutoutShaft=height);
  }
}

// middle peg reinforcers

module pegBack(d, height) {
  difference() {
    cylinder(h=height, d=d);
    cylinder(h=height*2, d=screwThreadD);
  }
}

module pegTop(d, height) {
  difference() {
    cylinder(h=height, d=d);
    translate([0, 0, height]) countersunkScrewHead(screwShaftD, screwHeadD, screwCountersunkHeight, cutoutTop=4, cutoutShaft=height);
  }
}

// dump bucket

bucketWidth = 76.2;
bucketDepth = 50.8;
bucketHeight = 50.8;
bucketWallThickness = 3;
module bucket(width=bucketWidth, depth=bucketDepth, height=bucketHeight) {
  _mountH = mountHeight + topMountHeight + materialThickness;
  _bucketZ = mountHeight + materialThickness;
  _bucketY = mountDepth;
  // wood mount with screw holes
  difference() {
    cube([width, mountDepth, _mountH]);
    translate([width*0.3, mountDepth*0.5, _mountH]) countersunkScrewHead(screwThreadD, screwHeadD, screwCountersunkHeight, cutoutTop=4, cutoutShaft=_mountH);
    translate([width*0.7, mountDepth*0.5, _mountH]) countersunkScrewHead(screwThreadD, screwHeadD, screwCountersunkHeight, cutoutTop=4, cutoutShaft=_mountH);
  }
  // bucket
  translate([0, _bucketY, _bucketZ]) {
    // base
    cube([width, depth*0.5, topMountHeight]);
    // left wall
    cube([bucketWallThickness, depth, height]);
    // right wall
    translate([width - bucketWallThickness, 0, 0]) cube([bucketWallThickness, depth, height]);
    // bottom
    cube([width, bucketWallThickness, height]);
  }
  // fillet
  translate([0, _bucketY-2, _mountH]) filletRA(width, 1);
}

// assembly

$fn = 32;
cornerMount(mountWidth*2, mountDepth*2, mountHeight);
translate([mountWidth*2+10, 0, 0]) straightMount(mountWidth*2, mountDepth, mountHeight);
translate([mountWidth*2+10, -mountDepth-10, 0]) topMount(mountWidth, mountDepth, topMountHeight);
translate([0, 100, 0]) bucket();
translate([0, 50, 0]) pegBack(screwThreadD*3, mountHeight);
translate([30, 50, 0]) pegTop(screwThreadD*3, topMountHeight*0.75);
