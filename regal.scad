wall=[489, 353];

module walls() {
    translate([0,0,-2])
        cube([wall[0],wall[1],.1]);
}

module desk1() {
   difference(){
      cube([151,73,65]);
      translate([5, -0.1, -0.1])
        cube([141, 68.1, 65.2]);
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
    translate([wall[0]-12-151,0,3])
        desk1();
    translate([wall[0]-164-120, 0,2])
        desk2();
    translate([wall[0]-164-125-200,0 ,0])
        desk3();
}

module shelf1(offset, depth) {
    material_strength=2.7;
    translate([0, offset, 0])
        cube([wall[0]/3, material_strength, depth]);
}

module shelves() {
    colors=["darkred","green","darkblue"];
    
    depths=[ [39, 39, 38, 38],
             [50, 40, 40, 40],
             [50, 40, 40, 40]];
    low=160;
    heights=[[low, low+30, low+60, low+90],
             [low, low+30, low+70, low+100],
             [low, low+50, low+100, low+150]];
    
    for (col=[0:2])
        color(colors[col])
        translate([wall[0]/3*col, 0, 0])
        for (row=[0:3])
            shelf1(heights[col][row], depths[col][row]);
}

module window_frame() {
    translate([0,0,40])
        cube([3,300,5]);
}

walls();
color("blue")
    translate([6,0,0])
        desks();
shelves();
window_frame();