module b_tri () {
    linear_extrude(1.9) {
        difference () {
            //polygon([[10,0],[-10,0],[0,30]]);
            translate ([0,1.5,0]) scale ([0.8,0.8,0.8]) polygon([[10,0],[-10,0],[0,30]]);
        }
    }
}


difference(){
    polyhedron(
        points=[ [10,10,0],[10,-10,0],[-10,-10,0],[-10,10,0], // четыре точки , основания пирамиды
                 [0,0,30]  ],                                 // точка вершины
        faces=[ [0,1,4],[1,2,4],[2,3,4],[3,0,4],              // формирование боковых плоскостей 
                    [1,0,3],[2,1,3] ]                         // формирование плоскости основания
    );
    translate([0,0,-5]) polyhedron(
        points=[ [10,10,0],[10,-10,0],[-10,-10,0],[-10,10,0], // четыре точки , основания пирамиды
                 [0,0,30]  ],                                 // точка вершины
        faces=[ [0,1,4],[1,2,4],[2,3,4],[3,0,4],              // формирование боковых плоскостей 
                    [1,0,3],[2,1,3] ]                         // формирование плоскости основания
    );
    translate([0,-8,0]) rotate([71.565,0,0]) b_tri();
    translate([0,10,0.6]) rotate([108.435,0,0]) b_tri();
    translate([8,0,0]) rotate([71.565,0,90]) b_tri();
    translate([-10,0,0.6]) rotate([108.435,0,90]) b_tri(); 
     
}



