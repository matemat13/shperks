R = 7;

R0 = 10;
s = R/R0;

scale([s,s,s]) import("gombik.stl");
cylinder(r=2, h=20, $fn=20);
translate([0,0,-20]) cylinder(r=1, h=20, $fn=20);