wall=[489, 353];

module walls() {
    cube([wall[0],wall[1],.1]);//TODO
}

module desk1() {
   difference(){
      cube([151,73,65]);
      translate([5, -0.1, 0])
        cube([141, 68.1, 65.1]);
   }
}

module desk2() {
    cube([120, 73, 75]);
}

module desk3() {
    union(){
        cube([200, 79, 77]);
        cube([70, 79, 140]);
    }
} 

module desks() {
    translate([wall[0]-12-151,0,0])
        desk1();
    translate([wall[0]-164-120, 0,0])
        desk2();
    translate([wall[0]-164-125-200,0 ,0])
        desk3();
}

module shelf1(offset, depth) {
    translate([0, 150+offset, 0])
        cube([wall[0]/3, 5, depth]);
}

module shelves() {
    colors=["darkred","green","darkblue"];
    for (col=[0:2])
        color(colors[col])
        translate([wall[0]/3*col, 0, 0])
        for (row=[0:3])
            shelf1(row*50, 30);
}

walls();
color("blue")
    desks();
shelves();