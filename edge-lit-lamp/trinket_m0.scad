include <../includes/cody.scad>

// trinket data
trinketSize = [27, 15.3];
trinketPadding = [2, 2];
trinketPadSize = trinketSize + trinketPadding*2;
trinketPadHeight = 2;
trinketPegSize = 2;
trinketPegR = trinketPegSize * 0.5;
trinketPegHeight = 4;
trinketPegUL = [3.75, trinketSize[1]-2];
trinketPegLL = [3.75, 2];
trinketPegUR = [20.25, trinketSize[1]-1.5];
trinketPegLR = [20, 1.7];
trinketPegBaseSize = 4;

// riser to allow i/o access
trinketRiserHeight = 6;
trinketPegHeightTOTAL = trinketPegHeight + trinketRiserHeight;
trinketRiserSize = [23, 6.25, trinketRiserHeight];
trinketRiserLoc = [2, 4.5];

// enclosure data
include <../includes/NopSCAD/core.scad>
include <../includes/NopSCAD/vitamins/pcb.scad>
trinketWallHeight = trinketPegHeightTOTAL + 5;
trinketUSBLoc = [23.65, trinketSize[1]*0.5, trinketRiserHeight+1];

// pad for trinket m0
module trinketPad()
{
translate(trinketPadding * -1)
  cube([trinketPadSize[0], trinketPadSize[1], trinketPadHeight]);
}
  
// riser to keep trinket off the base and allow access to pads underneath
module trinketRiser()
{
  translate(trinketRiserLoc)
    cube(trinketRiserSize);
}

// pegs
module trinketPegBase()
{
  translate([0, 0, trinketRiserHeight*0.5]) cube([trinketPegBaseSize, trinketPegBaseSize, trinketRiserHeight], center=true);
}

module trinketPeg(loc)
{
  translate(loc)
  {
    cylinder(trinketPegHeightTOTAL, r=trinketPegR);
    trinketPegBase();
  }
}

module trinketM2ScrewMount(loc) {
  translate(loc-[trinketPegBaseSize*0.5, trinketPegBaseSize*0.5, 0])
    m2ScrewMount(height=trinketRiserHeight, holeHeight=4, thickness=trinketPegBaseSize, useCube=true);
}

// back wall
module trinketUSBWall()
{
  difference() {
    {  
      translate([trinketSize[0], -trinketPadding[1], 0])
        cube([trinketPadding[0], trinketSize[1]+2*trinketPadding[1], trinketWallHeight]);
    }
    // micro-usb connector
    {
      translate(trinketUSBLoc)
        usb_uA(cutout=true);
    }
  }
}

// assembly
module trinketM0(usbWall=true, pegs=true)
{
  trinketPad();
  trinketRiser();
  if (pegs) {
    trinketPeg(trinketPegUL);
    trinketPeg(trinketPegLL);
    trinketPeg(trinketPegUR);
    trinketPeg(trinketPegLR);
  } else {
    trinketM2ScrewMount(trinketPegUL);
    trinketM2ScrewMount(trinketPegLL);
    trinketM2ScrewMount(trinketPegUR);
    trinketM2ScrewMount(trinketPegLR);
  }
  if (usbWall) {
    trinketUSBWall();
  }
}
//$fn = 32;
//trinketM0(pegs=true);
