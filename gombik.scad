use <ptf/ptf_sphere.scad>;

R0 = 7;
R1 = R0/10;

size = [20, 20];
angle = [180, 360];

rows = [
    for(y = [0:size[1]])
        [for(x = [0:size[0]]) [x+0.5*(y-R0), y]]
];

union()
{
    sphere(R0, $fn=50);
    for(row = rows)
    {
        for(pt = row)
        {
            tpt = ptf_sphere([size[0], size[1]], pt, R0, angle);
            let(z = tpt[2])
            let(s = (z == 0) ? 0.9 : 1/pow(abs(z), 0.3))
            translate(tpt) sphere(r = s*R1, $fn=20);
        }
    };
    translate([0, 0, -20]) cylinder(h=40, r=3, $fn=25);
}