R = 4;
$fn = 30;

module core()
{
    rotate([90,0,0])
    {
        sphere(R);
        cylinder(r=1, h=20);
    }
};

module zipties()
{
    translate([5,3,0])
    cube([2,2,20], center=true);
    
    translate([-5,3,0])
    cube([2,2,20], center=true);
    
    translate([5,-13,0])
    cube([2,2,20], center=true);
    
    translate([-5,-13,0])
    cube([2,2,20], center=true);
};

difference()
{
    translate([0,-5,2.5]) cube([10, 20, 5], center=true);
    core();
    zipties();
};

translate([15,0,0]) rotate([0,180,0])
difference()
{
    translate([0,-5,-2.5]) cube([10, 20, 5], center=true);
    core();
    zipties();
};

%zipties();
%core();