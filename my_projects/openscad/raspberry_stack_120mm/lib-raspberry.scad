/*
 * Customizable Fan Cover - https://www.thingiverse.com/thing:2802474
 * by Dennis Hofmann - https://www.thingiverse.com/mightynozzle/about
 * created 2018-02-22
 * updated 2018-03-27
 * version v1.2
 *
 * Changelog
 * --------------
 * v1.2:
 *      - better quality of rounded corners and crosshair pattern
 * v1.1:
 *      - added support line option for crosshair and square pattern
 * v1.0:
 *      - final design
 * --------------
 *
 * This work is licensed under the Creative Commons - Attribution - Non-Commercial - ShareAlike license.
 * https://creativecommons.org/licenses/by-nc-sa/3.0/
 */


 // Parameter Section //
//-------------------//

/* [Global Settings] */
$fn=50;
// Choose between presets of known and common fan sizes.
fan_preset = "120"; //[25:25mm,30:30mm,40:40mm,50:50mm,60:60mm,70:70mm,80:80mm,92:92mm,120:120mm,140:140mm,custom:Custom Fan Settings]

// If you want save to save about 40% filament and about 20% printing time, you can choose the reduced frame option.
frame_option = "full"; //[full,reduced]

// Minimum Border Size. I recommend to use two/four/six... times of your line width setting of your slicer. Simplify3D uses 0.48mm line width by default if you are using a 0.4mm nozzle. Cura uses 0.4mm line width.
min_border_size_in_millimeter = 1.92;

// Choose between a grill pattern
grill_pattern = "crosshair"; //[honeycomb,grid,line,triangle,crosshair,square,dot,aperture]

// Set the angle of the pattern around the center of the cover.
grill_pattern_rotation = 0; //[0:5:360]

// Size of the pattern lines. I recommend to use two/four/six... times of your line width setting of your slicer. Simplify3D uses 0.48mm line width by default if you are using a 0.4mm nozzle. Cura uses 0.4mm line width.
line_size_in_millimter = 0.96; //[0.3:0.02:4]

// Space between two lines of your pattern. If you choose aperture pattern, this value set the size of the center octagon.
line_space_in_millimeter = 6; //[1:0.1:50]

// If you need countersunk holes, you can activate it here. Bottom = first layer. Top = last layer. 
screw_hole_chamfer = "top"; //[no,top,bottom,top_and_bottom]

// Activate or deactivate rounded corners. The radius will be automatically calculated.
rounded_corners = "no"; //[yes,no]

// number of straight lines supporting the crosshair or square pattern.
number_of_support_lines = 2;  //[1:1:36]

/* [Custom Fan Settings] */

// Cover size. E.g. 80 for a 80mm Fan
cover_size_in_millimeter = 120;

// E.g. 2.9 for M2.5, 3.3 for M3, 4.4 for M4
screw_hole_diameter_in_millimeter = 4.4;

// 25mm fan: 20 | 30mm fan: 24 | 40mm fan: 32 | 50mm fan: 40 | 60mm fan: 50 | 70mm fan: 61.5 | 80mm fan: 71.5 | 92mm fan: 82.5 | 120mm fan: 105 | 140mm fan: 126 
screw_hole_distance_in_millimeter = 105;

// Height of the outer frame of the cover
cover_height_in_millimeter = 3;

// Height of the pattern inside the cover frame
grill_pattern_height_in_millimeter = 1;

/* [Hidden] */
min_border_size = min_border_size_in_millimeter;
line_size = line_size_in_millimter;
line_space = line_space_in_millimeter;


 // Module Section //
//----------------//

module fan_cover(cover_size, screw_hole_dia, screw_hole_distance, cover_h, grill_pattern_h) {
    corner_size = cover_size - screw_hole_distance;
    corner_r = rounded_corners == "yes" ? corner_size / 2 : 0;
    screw_pos = (cover_size - corner_size) / 2;
    color("DodgerBlue") difference() {
        union() {
            linear_extrude(height = cover_h, convexity = 20) {
                difference() {
                    offset(r=corner_r, $fn = ceil(corner_r * 8)) {
                        offset(r=-corner_r) {
                            square([cover_size, cover_size], center = true);
                        }
                    }
                    if(frame_option == "reduced") {
                        offset(r=corner_r, $fn = ceil(corner_r * 8)) {
                            offset(r=-corner_r) {
                                square([cover_size - min_border_size*2, cover_size - min_border_size*2], center = true);
                            }
                        }
                    }
                    if(frame_option == "full") {
                        circle(d = cover_size - min_border_size * 2, $fn = cover_size);
                    }
                } 
                if(frame_option == "reduced") {
                    for(y = [-1:2:1]) {
                        for(x = [-1:2:1]) {
                            translate([screw_pos * x, screw_pos * y, -2]) {
                                circle(d = corner_size, $fn = ceil(corner_r * 8));
                            }
                        }
                    }
                }
            }
            linear_extrude(height = grill_pattern_h, convexity = 20) {
                intersection() {
                    offset(r=corner_r, $fn = ceil(corner_r * 8)) {
                        offset(r=-corner_r) {
                            square([cover_size, cover_size], center = true);
                        }
                    }
                    rotate(grill_pattern_rotation) {
                        if(grill_pattern == "honeycomb") {
                            honeycomb_pattern(cover_size, line_size, line_space);
                        }
                        if(grill_pattern == "grid") {
                            grid_pattern(cover_size, line_size, line_space);
                        }
                        if(grill_pattern == "line") {
                            line_pattern(cover_size, line_size, line_space);
                        }
                        if(grill_pattern == "triangle") {
                            triangle_pattern(cover_size, line_size, line_space);
                        }
                        if(grill_pattern == "crosshair") {
                            crosshair_pattern(cover_size, line_size, line_space);
                        }
                        if(grill_pattern == "square") {
                            square_pattern(cover_size, line_size, line_space);
                        }
                        if(grill_pattern == "dot") {
                            dot_pattern(cover_size, line_size, line_space);
                        }
                        if(grill_pattern == "aperture") {
                            aperture_pattern(cover_size, line_size, line_space);
                        }
                        
                    }
                }
            }
        }
        for(y = [-1:2:1]) {
            for(x = [-1:2:1]) {
                translate([screw_pos * x, screw_pos * y, -2]) {
                    screw_hole(cover_h, screw_hole_dia);
                }
            }
        }
    }
}

module screw_hole(cover_h, screw_hole_dia) {
    cylinder(h = cover_h + 4, d = screw_hole_dia, $fn = 16);
    if(screw_hole_chamfer == "bottom" || screw_hole_chamfer == "top_and_bottom") {
        translate([0, 0, 3.9 - screw_hole_dia]) {
            cylinder(h = screw_hole_dia, d1 = screw_hole_dia * 2, d2 = screw_hole_dia * 2, $fn = 6);
        }
    }
    if(screw_hole_chamfer == "top" || screw_hole_chamfer == "top_and_bottom") {
        translate([0, 0, cover_h + screw_hole_dia/6]) {
            cylinder(h = screw_hole_dia, d2 = screw_hole_dia * 2, d1 = screw_hole_dia * 2, $fn = 6);
        }
    }
}

module grid_pattern(size, line_size, line_space) {
    num = ceil(size / (line_size + line_space) * 1.42);
    for(x = [floor(-num / 2) : ceil(num / 2)]) {
        translate([x * (line_size + line_space), 0]) {
            square([line_size, num *(line_size + line_space)], center=true);
        }
        rotate(90) {
            translate([x * (line_size + line_space), 0]) {
                square([line_size, num *(line_size + line_space)], center = true);
            }
        }
    }
}

module triangle_pattern(size, line_size, line_space) {
    num = ceil(size / (line_size + line_space) * 1.42);
    for(x = [floor(-num / 2):ceil(num / 2)]) {
        translate([x * (line_size + line_space), 0]) {
            square([line_size, num *(line_size + line_space)], center = true);
        }
        rotate(60) {
            translate([x * (line_size + line_space), 0]) {
                square([line_size, num *(line_size + line_space)], center = true);
            }
        }
        rotate(120) {
            translate([x * (line_size + line_space), 0]) {
                square([line_size, num *(line_size + line_space)], center = true);
            }
        }
    }
}

module line_pattern(size, line_size, line_space) {
    num = ceil(size / (line_size + line_space)*1.42);
    for(x = [floor(-num / 2):ceil(num / 2)]) {
        translate([x * (line_size + line_space), 0]) {
            square([line_size, num *(line_size + line_space)], center=true);
        }
    }
}

module crosshair_pattern(size, line_size, line_space) {
    line = (line_size + line_space) * 2;
    num = ceil(size / line * 1.42);
    for(n = [1:num]) {
        difference() {
            circle(d = n * line + line_size * 2, $fn = ceil(n * line + line_size * 2));
            circle(d = n * line, $fn = ceil(n * line + line_size * 2));
        }
    }
    for(rot=[0:90 / number_of_support_lines * 2:180]) {
        rotate(rot + 45) square([size * 2, line_size], center = true);
    }
}

module square_pattern(size, line_size, line_space) {
    line = (line_size + line_space) * 2;
    num = ceil(size / line * 1.42); 
    for(n = [1:num]) {
        difference() {
            square([n * line + line_size * 2, n * line + line_size * 2], center = true);
            square([n * line, n * line], center = true);
        }
    }
    for(rot=[0:90 / number_of_support_lines * 2:180]) {
        rotate(rot + 45) square([size * 2, line_size], center = true);
    }
}

module honeycomb_pattern(size, line_size, line_space) {
    min_rad = (line_space / 2 * sqrt(3)) / 2 + line_size / 2;
    y_offset = sqrt(min_rad * min_rad * 4 - min_rad * min_rad);
    num_x = ceil(size / min_rad / 2) * 1.42;
    num_y = ceil(size / y_offset) * 1.42;
    difference() {
        square([size * 1.42, size * 1.42], center = true);
        for(y = [floor(-num_y / 2) : ceil(num_y / 2)]) {
            odd = (y % 2 == 0) ? 0 : min_rad;
            for(x = [floor(-num_x / 2) : ceil(num_x / 2)]) {
                translate([x * min_rad * 2 + odd, y * y_offset]) {
                    rotate(30) {
                        circle(d=line_space, $fn=6);
                    }
                }
            }
        }
    }
}

module dot_pattern(size, line_size, line_space) {
    rad = line_space / 2;
    y_offset = sqrt((rad + line_size / 2) * (rad + line_size / 2) * 4 - (rad + line_size / 2) * (rad + line_size / 2));
    num_x = ceil(size / rad / 2) * 1.42;
    num_y = ceil(size / y_offset) * 1.42;
    difference() {
        square([size * 1.42, size * 1.42], center = true);
        for(y = [floor(-num_y / 2) : ceil(num_y / 2)]) {
            odd = (y % 2 == 0) ? 0 : rad + line_size / 2;
            for(x = [floor(-num_x / 2) : ceil(num_x / 2)]) {
                translate([x * (rad + line_size / 2) * 2 + odd, y * y_offset]) {
                    rotate(30) {
                        circle(d=line_space);
                    }
                }
            }
        }
    }
}

module aperture_pattern(size, line_size, line_space) {
    circle(d = line_space, $fn = 8);
    for(rot = [1:2:15]) {
        rotate(360 / 16 * rot) {
            translate([line_space / 2 * cos(360 / 16) - line_size, -line_size]) {
                square([line_size, size]);
            }
        }
    }
}

module triangle(){
    difference(){
        cube([5,5,160]);
        rotate([0,0,45]) cube([50,50,160]);
    }
}
module bed (vent) {
    difference () {
        cube([113.5,147,4]);
        //
        translate ([4,4,3]) cube([105.5,139,3]);
        translate ([4,4,2]) cube([105.5,47,3]);
        translate ([4,63,2]) cube([105.5,36,3]);
        translate ([4,112,2]) cube([105.5,31,3]);
        //
        translate ([11.75,-1,0]) cube([90,10,120]);
        translate ([11.75,137,0]) cube([90,10,120]);
        if (vent) {
            for ( i = [ 2 : 6 ]){
                for ( j = [ 2 : 3 ]) {
                    translate ([i * 13,j * 12,-5]) rotate([40,0,0]) scale([1.5,1,1]) cube([6, 6, 20]);
                }
            }          
            for ( i = [ 1 : 7 ]){
                for ( j = [ 4 : 9 ]) {
                    translate ([i * 13,j * 12,-5]) rotate([40,0,0]) scale([1.5,1,1]) cube([6, 6, 20]);
                }
            }
            for ( i = [ 2 : 6 ]){
                for ( j = [ 12:13 ]) {
                    translate ([i * 13,j * 10,-5]) rotate([40,0,0]) scale([1.5,1,1]) cube([6, 6, 20]);
                }
            }              
        }
        
//        translate ([30,40,0]) cylinder(20, screw, screw);
//        translate ([90,40,0]) cylinder(20, screw, screw);
//        translate ([30,138,0]) cylinder(20, screw, screw);
//        translate ([90,138,0]) cylinder(20, screw, screw);
//        if (out) {
//            translate ([-2,-2,0]) cube([15,22,15]);
//            translate ([105,-2,0]) cube([15,22,15]);
//        } 
    }
    translate([-3,18,2]) rotate([0,90,0]) cylinder(3,1.9,1.9);
    translate([113.5,18,2]) rotate([0,90,0]) cylinder(3,1.9,1.9);
    translate([-3,18+110,2]) rotate([0,90,0]) cylinder(3,1.9,1.9);
    translate([113.5,18+110,2]) rotate([0,90,0]) cylinder(3,1.9,1.9);
     
}

module hander_top_1 () {
   difference () {
    cube([124.5,10,5]);
//    translate ([20,5,-1]) cylinder(15,2,2);
//    translate ([100,5,-1]) cylinder(15,2,2);
   }
}

module hander_top_2 () {
   difference () {
    cube([10,160,5]);
//    translate ([5,20, -1]) cylinder(15,2,2);
//    translate ([5,93, -1]) cylinder(15,2,2);
   }
   translate([-5,0,5]) rotate([-90,0,0]) triangle();
}

module hander_leg () {
  cube ([5.5,7.5,13]);
}


module hander_bottom () {
    //top
    difference () {
      union() {
        translate([-5.5,-1.4,13]) hander_top_1 ();
        translate([-5.5,124,13]) hander_top_1 ();
        translate([-9.5,-1.4,13])   hander_top_2 ();
        translate([125,158.5,13]) rotate ([0,0,180]) hander_top_2 ();
        
        translate([-8.4,14.1,0]) hander_leg ();
        translate([-3,18,2]) rotate([0,90,0]) cylinder(3,1.9,1.9);
        
        translate([117.6,14.1,0]) hander_leg ();
        translate([114.6,18,2]) rotate([0,90,0]) cylinder(3,1.9,1.9);
        

        translate([-8.4,14.1+110,0]) hander_leg ();
        translate([-3,18+110,2]) rotate([0,90,0]) cylinder(3,1.9,1.9);
        
        translate([117.6,14.1+110,0]) hander_leg ();
        translate([114.6,18+110,2]) rotate([0,90,0]) cylinder(3,1.9,1.9);
      }
      translate([5,-5,17]) cube([105,170,10]);
    }
    
}

module side (bottom) {
  union () {
    difference () {
      cube([2.3,160,120]);
      // vent
      for (i = [ 2 : 6 ]) {
        translate([-1, i * 20, 11]) cube([7,10,100]);
      }
      for (i = [ 1 : 11 ]) {
        if ( bottom && ( i == 3 || i == 9 )) {
          translate ([-1,30, i*10]) rotate([0,90,0]) cylinder(4,4.5,4.5);
          translate ([-1,140, i*10]) rotate([0,90,0]) cylinder(4,4.5,4.5);
        } else {
          translate ([-1,30, i*10]) rotate([0,90,0]) cylinder(4,2,2);
          translate ([-1,140, i*10]) rotate([0,90,0]) cylinder(4,2,2);          
        }
      }
    }
  }
}
//bed(vent=true);
//hander_bottom();
