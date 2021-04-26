//include <lib-raspberry.scad>
//bed(vent=true);
$fn=50;
translate ([32.5,47,3])
union () {
  translate([-3,-5,0]) difference () {
    cube([55,68,2]);
    //cube([55,91,2]);
    translate([6.5,5,0]) cube([42,59,2]);
    //translate([6.5,62,0]) cube([42,25,2]);
  }
  cylinder(10,1.5,1.25);
  translate([49,0,0]) cylinder(10,1.5,1.25);
  translate([0,58,0]) cylinder(10,1.5,1.25);
  translate([49,58,0]) cylinder(10,1.5,1.25);
  translate([-2,-3.2,-5]) cube([4.4,6.1,5]);
  translate([46,-3.2,-5]) cube([4.4,6.1,5]);
  translate([-2,57,-5]) cube([4.4,5.1,5]);
  translate([46,57,-5]) cube([4.4,5.1,5]);

}