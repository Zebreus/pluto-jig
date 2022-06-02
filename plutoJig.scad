insetHeight = 0.8;
height = 8;
botHeight = 8;
watchHeight = 5;

module cutout(){
    circle(d=1.5);
    translate([1.75, 0,0])
    circle(d=1.5);
    translate([4.47, -2.85,0])
    circle(d=1.5);
    translate([-4.43, -19.14,0]){
        circle(d=1.5);
        translate([17.7, 0,0])
        circle(d=1.5);
    }
}

    offsetY=-3.2;
    offsetX=-7.5;
    width= 6;
    innerWidth=23.9;
    innerHeight=16;

module lowBlock() {

    translate([offsetX,offsetY,0]){
        translate([-width,0,0])
        square([innerWidth+width*2,width]);
        translate([-width,-innerHeight-width,0])
        square([innerWidth+width*2,width]);
        translate([-width,-innerHeight,0])
        square([width,innerHeight]);
        translate([innerWidth,-innerHeight,0])
        square([width,innerHeight]);
    }
}

module medBlock() {

    
    insetTop=1.5;
    insetLeft=1.5;
    insetRight=1.5;
    insetBottom=1.5;
    translate([offsetX,offsetY,0]){
        translate([-width,-insetTop,0])
        square([innerWidth+width*2,width+insetTop]);
        translate([-width,-innerHeight-width,0])
        square([innerWidth+width*2,width+insetBottom]);
        translate([-width,-innerHeight,0])
        square([width+insetLeft,innerHeight]);
        translate([innerWidth-insetRight,-innerHeight,0])
        square([width+insetRight,innerHeight]);
    }
}

module holder() {
    translate([offsetX-width,-offsetY,0]){
    difference(){
     cylinder(h=8,r=4);
        union(){
        cylinder(h=8,r=2);
            translate([0,0,6])
            cylinder(h=2,r1=2,r2=4);
        }
    }
}
}



module topPart(){

rotate([180,0,0]){
    
    difference(){
        union(){
            translate([offsetX-width,-offsetY,0]){
            cylinder(h=8,r=4);
            translate([innerWidth+width*2,-innerHeight-width*2,0])
            cylinder(h=8,r=4);
            }
        
    translate([0,0,insetHeight])
    linear_extrude(height = height-insetHeight){
        difference(){
            medBlock();
            cutout();
        }
    }

    linear_extrude(height = insetHeight){
        difference(){
            lowBlock();
            cutout();
        }
    }
}
    translate([offsetX-width,-offsetY,0]){
        cylinder(h=8,r=2);
            translate([0,0,6])
            cylinder(h=2,r1=2,r2=4);
        translate([innerWidth+width*2,-innerHeight-width*2,0]){ cylinder(h=8,r=2);
            translate([0,0,6])
            cylinder(h=2,r1=2,r2=4);}
    }
}
}
}

module botPart(){
rotate([180,0,0])
    difference(){
        union(){
            translate([offsetX-width,-offsetY,0]){
            cylinder(h=botHeight,r1=8,r2=4);
            translate([innerWidth+width*2,-innerHeight-width*2,0])
            cylinder(h=botHeight,r1=8,r2=4);
            rotate(-180+atan((innerWidth+width*2)/(innerHeight+width*2)), [0,0,1])
            translate([-4,0,0])
            cube([8,sqrt((innerWidth+width*2)^2+(innerHeight+width*2)^2),botHeight-watchHeight]);
            }
}
    translate([offsetX-width,-offsetY,0]){
        cylinder(h=8,r=2);
            translate([0,0,0])
            cylinder($fn=6,h=3.5,r=4);
        translate([innerWidth+width*2,-innerHeight-width*2,0]){ cylinder(h=8,r=2);
            translate([0,0,0])
            cylinder($fn=6,h=3.5,r=4);}
    }
}
}


%topPart();
botPart();
$fs = 0.1;