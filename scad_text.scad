/*
 * scad_text.scad
 * This library has useful functions for adding 3D text
 * to objects with or without a pedestal (for vertical/sheer text)
 * @author: Suyash Kumar <suyashkumar2003@gmail.com>
 */
len_per_letter=3.3;

module makeText(textIn, depth, pedestal=0){
    
    linear_extrude(height=depth,center = true, convexity = 10, slices = 19, scale = 1.0) text(textIn,halign="center",size=3.5,font="Helvetica:style=Bold");
    if (pedestal){
        makePedestal(textIn, depth);
    }
}
module makePedestal(textIn, depth){
    base_width=len_per_letter*len(textIn); 
    difference(){
        translate([0,-2.5,0]) cube([base_width,5,4], center=true);
        rotate([40,0,0]) translate([0,-2.5,4]) cube([base_width+1,7,4], center=true);
    }
}
module writeText(x, y, z, textIn, depth=4, pedestal=0){
    translate([x,y,z]) rotate([90,0,0]) makeText(textIn, depth,pedestal);
}


//writeText(0,0,0,"SK",4,pedestal=1);