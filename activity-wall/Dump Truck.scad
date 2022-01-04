include <../includes/cody.scad>
// variables
screwWidth = 5;
spacerThickness = 7;
topThickness = 7;
dumpTruckSize = [40, 30, topThickness];
dumpTruckWallHeight = topThickness + 20;
dumpTruckDumperSize = [30, 24];
dumpTruckDumperThickness = 3;

// dump truck
module dumpTruck() {
  _dumperY = dumpTruckSize[1] - dumpTruckDumperSize[1];
  _wheelR = _dumperY;
  _wheelY = 0;
  _wheelHeight = topThickness+10;
  // base
  cube(dumpTruckSize);
  // cab
  wall(lowerLeft=[dumpTruckSize[0], 0], upperRight=[dumpTruckSize[0]+10, dumpTruckSize[1]*0.5], height=topThickness);
  wall(
    lowerLeft=[dumpTruckDumperSize[0]+dumpTruckDumperThickness, dumpTruckSize[1]*0.5],
    upperRight=[dumpTruckSize[0]-dumpTruckDumperThickness, dumpTruckSize[1]-dumpTruckDumperThickness],
    height=dumpTruckWallHeight-5
  );
  wall(
    lowerLeft=[dumpTruckDumperSize[0]+dumpTruckDumperThickness, dumpTruckDumperThickness],
    upperRight=[dumpTruckSize[0]+10-dumpTruckDumperThickness, dumpTruckSize[1]*0.5 - dumpTruckDumperThickness],
    height=dumpTruckWallHeight-5
  );
  // dumper
  wall(lowerLeft=[0, _dumperY], upperRight=[dumpTruckDumperThickness, dumpTruckDumperSize[0]], height=dumpTruckWallHeight);
  wall(lowerLeft=[0, _dumperY], upperRight=[dumpTruckDumperSize[0], _dumperY+dumpTruckDumperThickness], height=dumpTruckWallHeight);
  wall(lowerLeft=[dumpTruckDumperSize[0]-dumpTruckDumperThickness, _dumperY], upperRight=[dumpTruckDumperSize[0], dumpTruckSize[1]], height=dumpTruckWallHeight);
  // wheels
  translate([_wheelR, _wheelY, 0]) {
    difference() {
      cylinder(_wheelHeight, r=_wheelR);
      translate([0, 0, _wheelHeight-3]) cylinder(4, r=_wheelR-1.5);
    }
  }
  translate([dumpTruckDumperSize[0]-_wheelR, _wheelY, 0]) {
    difference() {
      cylinder(_wheelHeight, r=_wheelR);
      translate([0, 0, _wheelHeight-3]) cylinder(4, r=_wheelR-1.5);
    }
  }
}

// m5 countersunk screw hole
module dumpTruckScrew() {
  // countersunk hole for screw head
  {
    translate([dumpTruckSize[0]*0.5, dumpTruckSize[1]*0.5, topThickness+0.1])
      rotate([0, 90, 0])
      import("../includes/All_Screws_M3_M4_M5/M5_Countersunk_15.stl");
  }
  // hole for screw shaft
  {
    translate([dumpTruckSize[0]*0.5, dumpTruckSize[1]*0.5, -0.25])
    cylinder(topThickness+1, r=screwWidth*0.5);
  }
}

// assembly
$fn = 32;
module activityWallTop()
{
  difference() {
    union() {
      // create the top
      dumpTruck();
    }
    dumpTruckScrew();
  }
}

activityWallTop();