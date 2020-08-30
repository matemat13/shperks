include <rotate_p.scad>;
include <cross_sections.scad>;
include <polysections.scad>;
include <ring_extrude.scad>;


$fa=1;
$fs=1;
$fn=500;

D = 22;
R = D/2;

R0 = 44;
a = 10;
Ra = R0+a;
Rs = 2*(a-1);
shape_pts = [
    [a, -a],
    [a, a],
    [-a, a],
    [-a, -a]
];
s = R/R0;
echo("thickness of the ring is ", 2*s*a, "mm");


scale([s, s, s])
{
    %translate([R0+a, 0, 0]) rotate([90,0,0]) polygon(shape_pts);
    //translate([0,0,50])
    difference()
    {
        ring_extrude(shape_pts, radius = Ra, twist = 3*360);
        difference()
        {
            translate([0, 0, -25]) cylinder(r1 = Ra, r2 = Ra, h = 50);
            rotate_extrude(convexity = 10, $fn = 100)
            {
                translate([R0+1.1*Rs, 0, 0])
                circle(r = Rs, $fn = 100);
            }
        }
    }
}