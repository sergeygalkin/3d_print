include <lib-raspberry.scad>
difference() {
    union () {
        translate ([59,-1,60]) rotate([90, 0, 180]) resize([0,0,10]) fan_cover(cover_size = 120,                    screw_hole_dia = 4.4, screw_hole_distance = 105, cover_h = 4, grill_pattern_h = 1.8);
        translate([-1,0,0])side();
        translate([119,0,0]) mirror([1,0,0]) side();
        translate([-1,0,2.3]) rotate ([0,90,0]) side (bottom = true);
        translate([-1,0,120]) rotate ([0,90,0]) side ();
    }
}
  
