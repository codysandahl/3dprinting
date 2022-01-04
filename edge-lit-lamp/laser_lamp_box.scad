include <../includes/cody.scad>
include <trinket_m0.scad>
include <neopixel_strip.scad>

// data

$fn = 32;
lampWallThickness = 2;
lampPadSize = [110, 35, lampWallThickness];
lampBottomHeight = trinketWallHeight+neoWallHeight+lampWallThickness*3;
lampMidHeight = trinketWallHeight+lampWallThickness;
lampMidSupportThickness = 3*lampWallThickness;
lampTopHeight = neoWallHeight;
lampFitFactor = 0.4; // how much to fudge parts that need to fit together
lightCutout = 3.3;
lightOffset = 1;
_trinketLoc = [
  lampPadSize[0]-trinketSize[0]-trinketPadding[0], 
  (lampPadSize[1]-trinketSize[1]) * 0.5,
  0];
_neopixelLoc = [
  (lampPadSize[0]-neoSize[0])*0.5,
  (lampPadSize[1]-neoSize[1])*0.5 + lightCutout*0.5,
  0];
  
// bottom

module lampBottom() {
  // shell
  cube(lampPadSize);
  cube([lampPadSize[0], lampWallThickness, lampBottomHeight]);
  cube([lampWallThickness, lampPadSize[1], lampBottomHeight]);
  translate([0, lampPadSize[1]-lampWallThickness, 0]) cube([lampPadSize[0], lampWallThickness, lampBottomHeight]);
  difference() {
    translate([lampPadSize[0]-lampWallThickness, 0, 0]) cube([lampWallThickness, lampPadSize[1], lampBottomHeight]);
    translate(_trinketLoc+trinketUSBLoc) usb_uA(cutout=true);
  }
  
  // edge supports for mid level
  wall(lowerLeft=[0, 0, 0], width=lampMidSupportThickness, depth=lampPadSize[1], height=lampMidHeight); // left
  wall(lowerLeft=[lampPadSize[0]-lampMidSupportThickness, 0, 0], width=lampMidSupportThickness, depth=lampMidSupportThickness, height=lampMidHeight); // lower right
  wall(lowerLeft=lampPadSize-[lampMidSupportThickness, lampMidSupportThickness, 0], width=lampMidSupportThickness, depth=lampMidSupportThickness, height=lampMidHeight); // upper right
  
  // middle supports with wire channel
  /*
  difference() {
    union() {          
      wall(lowerLeft=[lampPadSize[0]*0.4, 0, 0], width=lampWallThickness, depth=lampPadSize[1], height=lampMidHeight); // middle support 1
      wall(lowerLeft=[lampPadSize[0]*0.6, 0, 0], width=lampWallThickness, depth=lampPadSize[1], height=lampMidHeight); // middle support 2
    }
    // wire channel
    translate([0, lampPadSize[1]*0.3, 5]) rotate([0, 90, 0]) cylinder(h=lampPadSize[0], d=10);
  }
  */
  // middle m2 screw mounting pegs
  translate([lampPadSize[0]*0.5, lampPadSize[1]-lampWallThickness-6, 0]) m2ScrewMount(height=lampMidHeight, holeHeight=lampMidHeight-2, useCube=true);
  translate([lampPadSize[0]*0.4, lampWallThickness, 0]) m2ScrewMount(height=lampMidHeight, holeHeight=lampMidHeight-2, useCube=true);
  translate([lampPadSize[0]*0.6, lampWallThickness, 0]) m2ScrewMount(height=lampMidHeight, holeHeight=lampMidHeight-2, useCube=true);
  
  // trinket m0
  color("#ff0000") translate(_trinketLoc) trinketM0(usbWall=false, pegs=false);
}

// middle

module lampMiddle() {
  _sideCutout = 24;
  // bottom tray
  difference() {
    translate([lampWallThickness+lampFitFactor, lampWallThickness+lampFitFactor, 0]) cube(lampPadSize-[2*lampWallThickness+2*lampFitFactor, 2*lampWallThickness+2*lampFitFactor, -1]);
    translate([lampMidSupportThickness, lampMidSupportThickness, -0.1]) cube([_sideCutout, lampPadSize[1]-2*lampMidSupportThickness-2*lampFitFactor, lampWallThickness+2]);
    translate([lampPadSize[0]-2*lampWallThickness-_sideCutout, lampWallThickness*2, -0.1]) cube([_sideCutout-lampWallThickness, lampPadSize[1]-4*lampWallThickness, lampWallThickness+2]);
    translate(_neopixelLoc-[2,0,0]) cube([neoSize[0]+4, neoSize[1], 4]);
    // holes for m2 screws
    /*
    translate([lampPadSize[0]*0.4 + 3, lampWallThickness+3, -1]) cylinder(h=lampWallThickness+2, d=m2HoleD*1.5);
    translate([lampPadSize[0]*0.6 + 3, lampWallThickness+3, -1]) cylinder(h=lampWallThickness+2, d=m2HoleD*1.5);
    translate([lampPadSize[0]*0.5 + 3, lampPadSize[1]-lampWallThickness-3, -1]) cylinder(h=lampWallThickness+2, d=m2HoleD*1.5);
    */
  }
  // neopixel strip
  color("#00ff00") translate(_neopixelLoc) neopixel_strip(walls=2, pegs=false, wallHeight=lampBottomHeight-lampMidHeight);
}

// top

module lampTop() {
  difference() {
    union() {
      // fit underneath
      translate([lampWallThickness+lampFitFactor, lampWallThickness+lampFitFactor, 0]) cube(lampPadSize-[2*lampWallThickness+2*lampFitFactor, 2*lampWallThickness+2*lampFitFactor, 0]);
      // top
      translate([0, 0, lampWallThickness]) cube(lampPadSize);
    }
    // hole for lights
    translate(_neopixelLoc-[0, -lightOffset, 0.2]) cube([neoSize[0], lightCutout, 3*lampWallThickness]);
  }
}

// assembly
lampBottom();
translate([0, 0, lampMidHeight]) lampMiddle();
//translate([0, 0, lampBottomHeight-2]) lampTop();
