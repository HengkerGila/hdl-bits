module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );

    wire and2in_1, and2in_2, and3in_1, and3in_2, or1, or2;

    assign and3in_1 = p1a & p1b & p1c;
    assign and3in_2 = p1d & p1e & p1f;

    assign and2in_1 = p2a & p2b;
    assign and2in_2 = p2c & p2d;

    assign or1 = and3in_1 | and3in_2;
    assign or2 = and2in_1 | and2in_2;

    assign p1y = or1;
    assign p2y = or2;

endmodule
