$fn=80;
rotate([180,0,0])
difference () {
  union () {
    linear_extrude(height = 55) scale([1,0.75])circle(d=54);
    minkowski () 
      { 
        translate([0,0,2.5]) cube([29,77,5], center=true);
        cylinder(r=2,h=1);
      }
    translate([0,30,20]) cube([16,16,40], center=true);
    translate([7,30,0]) cylinder(40,8,8);
    translate([-7,30,0]) cylinder(40,8,8);
    translate([0,-30,20]) cube([16,16,40], center=true);
    translate([7,-30,0]) cylinder(40,8,8);
    translate([-7,-30,0]) cylinder(40,8,8);      
  }
  linear_extrude(height = 52) scale([1,0.75])circle(d=48);
  translate([0,15,36]) cube([60,12,60], center=true);
  translate([0,-15,36]) cube([60,12,60], center=true);
}