// relative path to an SVG file that can be extruded
svg_file = "Bracelet Size XL.svg";

// height to extrude
height = 5;

// resolution to import the STL (higher = more accurate/smooth)
dpi = 96;

// extrude the imported STL
linear_extrude(height=height, center=false)
  import(file=svg_file, center=true, dpi=dpi);
