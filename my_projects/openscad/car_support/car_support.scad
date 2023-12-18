difference() {
 cube( [39, 25, 47]);
 translate( [39/2, -7, 0]) 
   rotate([-5,0,0]) {
     cylinder(h=60, r=18 );
   }
 translate( [0, -25, 0]) 
   rotate([-5,0,0]) {
     cube( [39, 25, 60]);
   }   
 translate( [39/2, 5, 12]) 
   rotate([-95,0,0]) {
     cylinder(h=12, r=7 );
  }   
}

