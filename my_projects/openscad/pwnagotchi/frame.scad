$fn=100;

difference(){
   minkowski(){
    cube([78, 72, 14], center=true);
    cylinder(1, center=true);
   }
   cube([76, 70, 20], center=true);
   translate([10,0,2])
    cube([75, 55, 4], center=true);
   translate([22.5,0,6])
    cube([35, 80, 6], center=true);
}
