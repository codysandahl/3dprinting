include <../includes/cody.scad>

// neopixel strip data
neoSize = [50, 10];
neoPadding = [2, 2];
neoPadSize = neoSize + neoPadding*2;
neoPadHeight = 2;
neoPegSize = 2;
neoPegR = neoPegSize * 0.5;
neoPegHeight = 4;
neoPegUL = [12.4, neoSize[1]-2.15];
neoPegUR = [37.8, neoSize[1]-2.15];

// riser to allow i/o access
neoRiserHeight = 6;
neoM2HoleHeight = neoRiserHeight-2;
neoPegHeightTOTAL = neoPegHeight + neoRiserHeight;
neoRiserSize = [33, 10, neoRiserHeight];
neoRiserLoc = [8.5, 0];
neoWallHeight = neoPegHeightTOTAL;
neoWallThickness = 1;

// pad for neopixel strip
module neoPad()
{
translate(neoPadding * -1)
  cube([neoPadSize[0], neoPadSize[1], neoPadHeight]);
}
  
// riser to keep neo off the base and allow access to pads underneath
module neoRiser(holes=false)
{
  if (holes) {
    difference() {
      translate(neoRiserLoc) cube(neoRiserSize);
      translate(neoPegUL+[0, 0, neoRiserHeight-neoM2HoleHeight]) cylinder(h=neoM2HoleHeight+2, d=m2HoleD);
      translate(neoPegUR+[0, 0, neoRiserHeight-neoM2HoleHeight]) cylinder(h=neoM2HoleHeight+2, d=m2HoleD);
    }
  } else {
    translate(neoRiserLoc) cube(neoRiserSize);
  }
}

// pegs
module neoPeg(loc)
{
  translate(loc)
  {
    cylinder(neoPegHeightTOTAL, r=neoPegR);
  }
}

// assembly
module neopixel_strip(walls=4, pegs=true, wallHeight=neoWallHeight)
{
  if (wallHeight <=0) {
    wallHeight = neoWallHeight;
  }
  neoPad();
  neoRiser(!pegs);
  if (pegs) {
    neoPeg(neoPegUL);
    neoPeg(neoPegUR);
  }
  if (walls > 0) {
    // bottom
    wall(lowerLeft=-neoPadding, width=neoPadSize[0], depth=neoWallThickness, height=wallHeight);
    // top
    wall(lowerLeft=[-neoPadding[0], neoSize[1]+neoPadding[1]-neoWallThickness], width=neoPadSize[0], depth=neoWallThickness, height=wallHeight);
    if (walls > 2) {
      // left
      wall(lowerLeft=-neoPadding, width=neoWallThickness, depth=neoPadSize[1], height=wallHeight);
      // right
      wall(lowerLeft=[neoSize[0]+neoPadding[0]-neoWallThickness, -neoPadding[1]], width=neoWallThickness, depth=neoPadSize[1], height=wallHeight);
    }
  }
}
//$fn = 32;
//neopixel_strip(walls=2, pegs=false);
