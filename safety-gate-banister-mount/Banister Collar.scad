HEIGHT = 20;
difference(){
    cube([89,89,HEIGHT],center=true);
    cylinder(h=HEIGHT+4,r1=63/2,r2=61/2,$fn=50,center=true);
    cube([1,95,HEIGHT+4],center=true);
}
