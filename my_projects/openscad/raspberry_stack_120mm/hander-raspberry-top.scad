include <lib-raspberry.scad>

rotate ([0,180,0]) 
scale ([1.01,1,1.01]) {
  difference () {
    translate ([-20,0,13]) cube([157,160,8]);
    translate ([0,0,13]) cube([120,155,5]);
    translate ([-10,10,17]) cube([135,60,5]);
    translate ([-10,80,17]) cube([135,70,5]);
    hander_bottom ();
    translate ([13,5,17]) cylinder(10,2,2);
    translate ([98,5,17]) cylinder(10,2,2);
    translate ([13,155,17]) cylinder(10,2,2);
    translate ([98,155,17]) cylinder(10,2,2);
  }
}