$fn=100;
union(){
    difference(){
        translate([0, 0, 6])
            import("Pwnagotchi_Cover_V3-orig.stl", convexity=3);
        translate([-29, -11, -10])
            cube([26, 21, 50] );
    }
    difference(){
        translate([-31.2, -12.8, -40])
           minkowski(){    
            cube([66.4, 25.5, 40]);
            cylinder(1, center=true);
        }
        translate([-29, -11, -39])
           minkowski(){    
            cube([26, 21, 50]);
            cylinder(1, center=true);
        }
        for ( j = [0 : 2]){
            for ( i = [0 : 2]){ 
                translate([-10*i-6, -10, -10*j-10])
                rotate([90,0,0])
                cylinder(h=90, r=3, $fn=6, center = true);
            }
        }        
    }
    translate([-35.2, -12.8, -40])
       minkowski(){    
       cube([4, 10.5, 40]);
       cylinder(1, center=true);
    }
        
}
