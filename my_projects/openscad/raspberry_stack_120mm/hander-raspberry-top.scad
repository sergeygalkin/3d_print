include <lib-raspberry.scad>

rotate ([0,180,0]) scale ([1.01,1,1.01]) {
  difference () {
    translate ([-20,0,13]) cube([157,168,8]);
    translate ([0,0,13]) cube([120,159,5]);
    translate ([-10,10,17]) cube([135,75,5]);
    translate ([-10,95,17]) cube([135,80,5]);
    translate ([0,1,0]) cube([135,90,5]);
    hander_bottom ();
    translate ([13,5,17]) cylinder(10,2,2);
    translate ([98,5,17]) cylinder(10,2,2);
    translate ([13,163.5,0]) cylinder(40,2,2);
    translate ([98,163.5,0]) cylinder(40,2,2);
  }
  difference () {
    translate ([-20,158.5,13]) cube([157,10,8]);
    translate ([13,163.5,0]) cylinder(40,2,2);
    translate ([98,163.5,0]) cylinder(40,2,2);
  }
  
}