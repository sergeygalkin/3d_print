echo(version=version());

$fn=100;

difference() {
  union() {
    translate([-5, 00, -12])
      minkowski(){
        cube( [42,83,12]); 
        cylinder(1, center=true);
      }    
    translate([0, 25, 0])
      minkowski(){    
        cube( [32,30,30]);
        cylinder(1, center=true);
      } 
  }    
  translate([5, 10, -6])
    minkowski(){
      cube( [22,63,100]);
      cylinder(1, center=true);
    }
  translate([10, 20, -9])
    minkowski(){
      cube( [12,43,100]);
      cylinder(1, center=true);
  }
}