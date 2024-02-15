$fn=100;
union(){
    difference(){
        translate([0, 0, 6])
            import("Pwnagotchi_Cover_V3-orig.stl", convexity=3);
        translate([-29, -11, -10])
            cube([33, 21, 50] );
    }
    difference(){
        translate([-31.2, -12.8, -40])
           minkowski(){    
            cube([66.4, 25.5, 40]);
            cylinder(1, center=true);
        }
        translate([-29, -11, -39])
           minkowski(){    
            cube([33, 21, 50]);
            cylinder(1, center=true);
        }        
         
    }
        
}
