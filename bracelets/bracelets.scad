//###### VARIABLES ######
// width (to fit around wide part of wrist)
braceletWidth = 80.0;

// height (to fit around tall part of wrist)
braceletHeight = 60.0;

// size of the band on top (like looking at a watch face)
braceletDepth = 5;

// size of the band around (like the thickness of a watch band)
braceletThickness = 5;

// if true, will create an opening and gripping cylinders on the end
braceletIsOpen = true;
braceletOpening = braceletWidth/2;

// diameter of the gripping cylinders if it's an open shape bracelet
gripSize = 10;

// if true, will create a label tag on top with the width and height displayed for easy reference
showLabel = true; 
labelWidth = 30;
labelHeight = 8;
labelFontSize = 5;

//###### COMMON SIZES ######
/*

++Size++ (Width x Height)

XL (80 x 60)
L (73.5 x 55.13)
M (67 x 50.25)
S (60 x 40)

*/

//###### OVAL (helper module) ######
module oval(w, h, depth, center = false) {
  scale([1, h/w, 1]) cylinder(h=depth, d=w, center=center);
}

//###### BRACELET MAIN SHAPE ######
module bracelet() {
  // main bracelet shape
  difference() {
    // overall bracelet shape
    oval(braceletWidth, braceletHeight, braceletDepth);
    // cut out the middle to create the band
    translate([0,0,-1]) oval(braceletWidth-braceletThickness, braceletHeight-braceletThickness, braceletDepth*2);
    // if the bracelet is an open shape, cut out the opening
    if (braceletIsOpen) {
      rotate([0, 0, 180]) translate([-braceletOpening/2, 0, -1]) 
        cube([braceletOpening, braceletHeight*2, braceletDepth*2]);
    }
  }

  // if the bracelet is an open shape, add the end cylinders
  if (braceletIsOpen) {
    // left grip
    translate([-braceletOpening/2, -braceletHeight/2 + gripSize/2, 0])
      cylinder(h=braceletDepth, d=gripSize);
    // right grip
    translate([braceletOpening/2, -braceletHeight/2 + gripSize/2, 0])
      cylinder(h=braceletDepth, d=gripSize);
  }
}

//###### BRACELET LABEL ######
module braceletLabel() {
  // if a label is requested, create a box on top and place the width and height in text
  if (showLabel) {
    translate([-labelWidth/2, braceletHeight/2 - braceletThickness/2, 0]) {
      difference() {
        // label tag
        cube([labelWidth, labelHeight, braceletDepth]);
        // cut out size text
        translate([labelWidth/2, 2, -1])
          linear_extrude(braceletThickness*2)
            text(str(braceletWidth, "x", braceletHeight), size=labelFontSize, halign="center");
      }
    }
  }
}


//###### OUTPUT ######
$fn=64; // higher number makes a smoother curve

bracelet(); // create the bracelet with the stored parameters
braceletLabel(); // create a label to show the width and height

