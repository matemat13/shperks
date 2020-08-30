use <ptf/ptf_rotate.scad>;
use <util/fibseq.scad>;

N = 50;
s = 10;

shape_pts =
[
    for (i = [0:N])
        let (a = 360/N*i)
            ptf_rotate([s*i/N,0], a),
    for (i = [N:-1:0])
        let (a = 360/N*i)
            ptf_rotate([s*0.5*i/N,0], a)
];


for (i = [0:N])
    color("red") translate(shape_pts[i]) circle(s*0.03*i/N, $fn=20);
for (i = [N+1:2*N])
    color("red") translate(shape_pts[i]) circle(s*0.03*(2*N-i)/N, $fn=20);
polygon(shape_pts);