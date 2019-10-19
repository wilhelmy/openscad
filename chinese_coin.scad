
module thing()
{/*
  $fa = 30;
  difference() {
    sphere(r = 25);
    cylinder(h = 62.5, r1 = 12.5, r2 = 6.25, center = true);
    rotate(90, [ 1, 0, 0 ]) cylinder(h = 62.5,
        r1 = 12.5, r2 = 6.25, center = true);
    rotate(90, [ 0, 1, 0 ]) cylinder(h = 62.5,
        r1 = 12.5, r2 = 6.25, center = true);
  }*/
    difference() {
        sphere(r=25);
        cube(10,center=true);
    }
}


module proj()
{
  linear_extrude(center = true, height = 2) projection(cut = true) thing();
  //% thing();
}

proj();


