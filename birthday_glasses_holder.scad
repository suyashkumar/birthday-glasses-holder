/*
 * birthday_glasses_holder.scad
 * An eye glasses holder design for Parul on her
 * birthday: May 29th, 2017
 */
corner_dia = 8;
glasses_base_width = 28;
glasses_base_height = 30;
glasses_base_length = 50;
cutout_length = 12;
base_width = 60;
base_length = 80;

$fn=50;
module triangularBase(width, height, length, corner_diameter) {
    linear_extrude(height=length)
    hull() {
        translate([-width/2,0,0])circle(d=corner_diameter);
        translate([width/2,0,0])circle(d=corner_diameter);
        translate([0,height,0])circle(d=corner_diameter);
    }
}

module rounded_cube(x, y, z, d) {
    translate([0,-y/4,0])
    linear_extrude(z)
    hull(){
        translate([-x/2,0,0])circle(d=d);
        translate([x/2,0,0])circle(d=d);
        translate([-x/2,y/2,0])circle(d=d);
        translate([x/2,y/2,0])circle(d=d);
    }
}

module glassesHolder(){
    difference() {
        rotate([90,0,0])triangularBase(glasses_base_width, glasses_base_height, glasses_base_length, corner_dia);
        translate([0,-10,glasses_base_height])cube([15,cutout_length,10], center=true);
    }
}

union() {
    glassesHolder();
    difference() {
        translate([0,0,-5])rotate([90,0,0])rounded_cube(base_width, 20, base_length, 5);
        translate([0,-base_length+5,0])rotate([-40,0,0])cube([base_width+40,12,30], center=true);
    }
}
