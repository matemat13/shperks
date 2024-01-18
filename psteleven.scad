use <ptf/ptf_rotate.scad>;
use <cross_sections.scad>;
use <ring_extrude.scad>;
use <shape_pie.scad>;

$fn=300;

D_inner = 17.2;
D = 17.2;
R = D/2;
N = 3;

R0 = 44;
a = 5;
cut = 5.5;
Ra = R0+a;
Rs = 2*(a+2*N);
s = R/R0;
echo("thickness of the ring is ", 2*s*a, "mm");

N2 = 15;
shape_pts = [
    for(i = [0:2])
        let(c = ptf_rotate([a, 0], 360/N*i))
        let(start_a = -360/N + 360/N*i)
        let(range_a = 240)
        for(j = [0:N2-1])
            c +
            ptf_rotate([a, 0], start_a+range_a/N2*j)
];

//for(pt = shape_pts)
//    translate(pt) circle(r=1);
//!polygon(shape_pts);

scale([s, s, s])
{
    intersection()
    {
        ring_extrude(shape_pts, radius = Ra, twist = 3*360);
        /* translate([0,0,-25]) cylinder(h=50,r=R0+1); */
        rotate_extrude(convexity = 10, $fn = 100)
        {
          r = 1.8*a;
          translate([R0-a+r+cut, 0])
          circle(r = r, $fn = 100);
        }
    }
}
