module wall(start, end){
    wallThickness = 15;
    dx = start[0] - end[0];
    dy = start[1] - end[1];
    length = sqrt(pow(dx, 2) + pow(dy, 2));
    angle = atan2(dy, dx) + 90;

    translate([start[0], start[1]])
        rotate([0, 0, angle])
        translate([-wallThickness/2, -wallThickness/2])
        cube([wallThickness, length + wallThickness, 228.6]);
}

color("blue") square([1370, 647]);

// walls
color("white") {
    // outside walls
    wall([0,350], [0, 0]);
    wall([0,647], [1370,647]);
    wall([0,0], [1190,0]);
    wall([1190,0], [1190,358]);
    wall([1370,358], [1370,647]);
    wall([1370,358], [1190,358]);

    // Primary Bedroom
    translate([1370-453, 647-289]){
        width = 289;
        length = 453;
        closet_width = 133;
        closet_depth = 70;
        wall([0, closet_width], [0, width]);
        wall([-closet_depth, 0], [-closet_depth, closet_width]);
        wall([-closet_depth, closet_width], [0, closet_width]);
        wall([0, width], [length, width]);
        wall([length, 0], [length, width]);
        wall([-closet_depth, 0], [length, 0]);
    }

    // Primary Bedroom
    translate([1190-352, 0]){
        width = 241;
        length = 352;
        closet_front_width = 150;
        closet_back_width = 86;
        closet_depth = 65;

        wall([0, width - closet_front_width], [0, 0]);
        wall([-closet_depth, width - closet_back_width], [-closet_depth, width - closet_front_width]);
        wall([-closet_depth, width - closet_back_width], [0, width]);
        wall([-closet_depth, width - closet_front_width], [0, width - closet_front_width]);
        wall([0, width], [length, width]);
        wall([length, 0], [length, width]);
        wall([0, 0], [length, 0]);
    }

    // Bathroom
    translate([1370-453-320, 647-152]){
        width = 152;
        length = 320;
        wall([0, 0], [0, width]);
        wall([length, 0], [length, width]);
        wall([0, width], [length, width]);
        wall([0, 0], [length, 0]);
    }

    // Kitchen
    translate([0, 647-292]) {
        width = 292;
        length = 357;
        window_depth=45;
        window_width=245;
        wall([0, width], [length, width]);
        wall([0, width], [0, window_width]);
        wall([0, window_width], [-window_depth, window_width]);
        wall([-window_depth, 0], [-window_depth, window_width]);
        wall([-window_depth, 0], [10, 0]);
        wall([length, 0], [length, width]);
        wall([length, 0], [length - 75, 0]);
    }

}
