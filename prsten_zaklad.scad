use <ptf/ptf_rotate.scad>;
$fn=20;

R = 10;

Ro = R+2.5;
R1 = 0.5;
R2 = 0.8;

union()
{
    rotate_extrude(angle=360, $fn=100)
    {
        translate([R+1.25,0])
        offset(r=1)
        square([0.5, 4], center=true);
    }


    for(row = [-1, 1])
    {
        for(i = [0:19])
        {
            tpt = ptf_rotate([Ro, 0, row], a = 360/20*i);
            translate(tpt) sphere(r = R1, $fn=20);
        }
    };

    for(i = [0:19])
    {
        tpt = ptf_rotate([Ro, 0, 0], a = 360/20*(i+0.5));
        translate(tpt) sphere(r = R2, $fn=20);
    }

    translate([Ro+1.5, 0, -2]) cylinder(r=1.5, h=15);
    translate([Ro+1, 0, 0]) cube([4, 3, 6], center=true);
}