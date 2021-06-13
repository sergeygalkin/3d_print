module triangle(){
    difference(){
        cube([50,50,55]);
        rotate([0,0,45]) cube([80,80,65]);
    }
}
difference () {
  triangle();
  translate([11,4,0]) scale([0.7,0.7,10]) triangle();
  translate([5,-1,5]) cube([40,50,45]);
  translate([-1,5,5]) cube([55,40,45]);
}

