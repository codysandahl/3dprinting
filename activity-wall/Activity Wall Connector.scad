boardThickness = 3.175; // 1/8"
thicknessOffset = 2;
screwWidth = 5;
spacerHeight = boardThickness + thicknessOffset;
spacerThickness = 7;
clampSize = [30, 30, 5];
clampCenterTop = [clampSize[0]*0.5, clampSize[1]*0.5, clampSize[2]];
clampCenterBtm = [clampSize[0]*0.5, clampSize[1]*0.5, 0];

difference() {
  union() {
    // create the clamp
    cube(clampSize);
    // create the spacer
    translate(clampCenterTop)
      cylinder(spacerHeight, spacerThickness*0.5, spacerThickness*0.5, $fn=32);
  }
  // hole for screw
  {
    translate(clampCenterBtm-[0, 0, 1])
      cylinder(clampSize[2]+spacerHeight+2, screwWidth*0.5, screwWidth*0.5, $fn=32);
  }
  // hole for nut
  {
    translate(clampCenterBtm+[0, 0, 1.7])
      rotate([90, 0, 0])
      import("../includes/All_Screws_M3_M4_M5/M5_Hex_Nut.stl");
  }
}
  
