BASE_HEIGHT = 4;
BASE_RADIUS = 10;

AXLE_HOLE_RADIUS = 1.45;
AXLE_HOLE_HEIGHT = 10;
AXLE_HEIGHT = 30;

WING_LENGTH = 25;
WING_WIDTH = 10;

NUM_OF_WINGS = 2;

module wing() {
    translate([0,WING_WIDTH/-2,0]) cube([WING_LENGTH,WING_WIDTH,BASE_HEIGHT]);
    translate([WING_LENGTH,0,0]) cylinder(r=WING_WIDTH/2, h=BASE_HEIGHT);
}

translate([0,0,BASE_HEIGHT]) difference() {
    cylinder(r=AXLE_HOLE_RADIUS*2, h=AXLE_HEIGHT, $fn=16);
    translate([0,0,AXLE_HEIGHT-AXLE_HOLE_HEIGHT])
        cylinder(r=AXLE_HOLE_RADIUS, h=AXLE_HOLE_HEIGHT, $fn=16);
}
cylinder(r=BASE_RADIUS, h=BASE_HEIGHT, $fn=32);
translate([0,0,BASE_HEIGHT])
    cylinder(r1=BASE_RADIUS*.7, r2=BASE_RADIUS*.25, h=BASE_RADIUS*.7, $fn=32);

if (NUM_OF_WINGS > 0) {
    wing_rotation = 360 / NUM_OF_WINGS;
    for(n = [1:NUM_OF_WINGS]) {
        rotate([0,0,wing_rotation*n]) wing();
    }
}