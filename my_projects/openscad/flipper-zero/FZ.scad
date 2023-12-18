$fn=100;

base_size_main = [29, 43, 138];
base_size_radio = [18, 53, 138];
thickness = 2;

difference() {
    minkowski(){
     cube( [base_size_main[0] + thickness*2, 
           base_size_main[1] + thickness*2 + 10,
           base_size_main[2] + thickness*2] );
     cylinder(1, center=true);
    }

    translate( [thickness,thickness, thickness])
    cube( [base_size_main[0],
           base_size_main[1],
           base_size_main[2] + 5]
        );

    translate( [thickness + 7,thickness + 7 , -1])
    cube( [base_size_main[0] - 14,
           base_size_main[1] - 14 ,
           base_size_main[2] + 5]
        );

    translate( [thickness + 5.6 ,thickness, thickness + 54])
    cube( [base_size_radio[0],
           base_size_radio[1],
           base_size_radio[2] + 5]
        );
 
    translate( [base_size_main[0] - 3, thickness + 13.5, thickness + 39 ])
    minkowski(){
      cube( [10, 24, 40]);
      sphere([1,1,1]);
    }
    // Long
    for ( i = [1:17]) {
      translate( [-1, 5, i * 8 - 3 ]) 
        rotate( [90, 0, 90 ])
         cylinder(h = 60, r=4, $fn=6);
    }
    for ( i = [1:17]) {
      translate( [-1, base_size_radio[1] - 3, i * 8 - 3 ]) 
        rotate( [90, 0, 90 ])
         cylinder(h = 60, r=4, $fn=6);
    }
    for ( i = [1:17]) {
      translate( [13, base_size_radio[1] + 5 , i * 8  ]) 
        rotate( [90, 0, 0 ])
         cylinder(h = 60, r=4, $fn=6);
    } 
     for ( i = [1:16]) {
      translate( [20, base_size_radio[1] + 5 , i * 8 + 4 ]) 
        rotate( [90, 0, 0 ])
         cylinder(h = 60, r=4, $fn=6);
    }   
    // Bottom 
    bottom_start = 13.5;
    bottom_start_bottom = 0;
    bottom_height = 20;
    bottom_start_x = base_size_radio[0] - thickness - 1;
    count = 4;
    for ( i = [1:count]) {
      translate( [bottom_start_x, bottom_start, bottom_start_bottom + i * 8 + 1 ]) 
        rotate( [90, 0, 90 ])
         cylinder(h = bottom_height, r=4, $fn=6);
    }   
    for ( i = [1:count]) {
      translate( [bottom_start_x, bottom_start + 7, bottom_start_bottom + i * 8 - 3 ]) 
        rotate( [90, 0, 90 ])
         cylinder(h = bottom_height, r=4, $fn=6);
    }  
    for ( i = [1:count]) {
      translate( [bottom_start_x, bottom_start + 7 * 2, bottom_start_bottom + i * 8 + 1 ]) 
        rotate( [90, 0, 90 ])
         cylinder(h = bottom_height, r=4, $fn=6);
    }
    for ( i = [1:count]) {
      translate( [bottom_start_x, bottom_start + 7 * 3, bottom_start_bottom + i * 8 - 3 ]) 
        rotate( [90, 0, 90 ])
         cylinder(h = bottom_height, r=4, $fn=6);
    }
    for ( i = [1:count]) {
      translate( [bottom_start_x, bottom_start + 7 * 4, bottom_start_bottom + i * 8 + 1 ]) 
        rotate( [90, 0, 90 ])
         cylinder(h = bottom_height, r=4, $fn=6);
    }     

    // Top 
    top_start = 13.5;
    top_start_bottom = 88;
    top_count = 5;
    for ( i = [1:top_count]) {
      translate( [bottom_start_x, top_start, top_start_bottom + i * 8 + 1 ]) 
        rotate( [90, 0, 90 ])
         cylinder(h = 60, r=4, $fn=6);
    }   
    for ( i = [1:top_count + 1]) {
      translate( [bottom_start_x, top_start + 7, top_start_bottom + i * 8 - 3 ]) 
        rotate( [90, 0, 90 ])
         cylinder(h = 60, r=4, $fn=6);
    }  
    for ( i = [1:top_count]) {
      translate( [bottom_start_x, top_start + 7 * 2, top_start_bottom + i * 8 + 1 ]) 
        rotate( [90, 0, 90 ])
         cylinder(h = 60, r=4, $fn=6);
    }
    for ( i = [1:top_count + 1]) {
      translate( [bottom_start_x, top_start + 7 * 3, top_start_bottom + i * 8 - 3 ]) 
        rotate( [90, 0, 90 ])
         cylinder(h = 60, r=4, $fn=6);
    }
    for ( i = [1:top_count]) {
      translate( [bottom_start_x, top_start + 7 * 4, top_start_bottom + i * 8 + 1 ]) 
        rotate( [90, 0, 90 ])
         cylinder(h = 60, r=4, $fn=6);
    }    

    // Back
    back_start =  - 1;
    back_count = 17;
    for ( i = [1:back_count]) {
      translate( [back_start, bottom_start, bottom_start_bottom + i * 8 + 1 ])
        rotate( [90, 0, 90 ])
         cylinder(h = bottom_height, r=4, $fn=6);
    }   
    for ( i = [1:back_count]) {
      translate( [back_start, bottom_start + 7, bottom_start_bottom + i * 8 - 3 ])
        rotate( [90, 0, 90 ])
         cylinder(h = bottom_height, r=4, $fn=6);
    }  
    for ( i = [1:back_count]) {
      translate( [back_start, bottom_start + 7 * 2, bottom_start_bottom + i * 8 + 1 ])
        rotate( [90, 0, 90 ])
         cylinder(h = bottom_height, r=4, $fn=6);
    }
    for ( i = [1:back_count]) {
      translate( [back_start, bottom_start + 7 * 3, bottom_start_bottom + i * 8 - 3 ])
        rotate( [90, 0, 90 ])
         cylinder(h = bottom_height, r=4, $fn=6);
    }
    for ( i = [1:back_count]) {
      translate( [back_start, bottom_start + 7 * 4, bottom_start_bottom + i * 8 + 1 ])
        rotate( [90, 0, 90 ])
         cylinder(h = bottom_height, r=4, $fn=6);
    }       
 
    
}