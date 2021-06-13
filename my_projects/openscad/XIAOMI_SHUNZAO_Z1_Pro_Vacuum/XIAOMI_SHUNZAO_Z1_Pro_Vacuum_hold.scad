$fn=80;
rotate([180,0,0])
difference () {
  union () {
    linear_extrude(height = 30) scale([1,0.75])circle(d=50);
    minkowski () 
      { 
        translate([0,0,2.5]) cube([29,77,5], center=true);
        cylinder(r=2,h=1);
      }
    translate([0,30,15]) cube([16,16,30], center=true);
    translate([7,30,0]) cylinder(30,8,8);
    translate([-7,30,0]) cylinder(30,8,8);
    translate([0,-30,15]) cube([16,16,30], center=true);
    translate([7,-30,0]) cylinder(30,8,8);
    translate([-7,-30,0]) cylinder(30,8,8);      
  }
  linear_extrude(height = 27) scale([1,0.75])circle(d=48);
}