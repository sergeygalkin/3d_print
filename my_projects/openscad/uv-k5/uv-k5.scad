$fn=10;

minkowski() {
difference() {
cube ([58, 23, 49]);
translate( [(58-27)/2, 0,0])
   cube( [27,4,49]);

translate( [0,0,0])
   cube( [1, 3 ,49]);
translate( [57,0,0])
   cube( [1,3 ,49]); 
    
translate( [(58-19)/2, 3,0])
   cube( [19,4,49]);    
translate( [(58-30)/2, 5,0])
   cube( [30,8,49]);
   
translate( [0,19,0])
   cube( [2, 5 ,49]);
translate( [56,19,0])
   cube( [2,5 ,49]);

   
//translate( [0, 0, 2])
//   cube( [60,27,49]);
}
cylinder(1, center=true);
}

