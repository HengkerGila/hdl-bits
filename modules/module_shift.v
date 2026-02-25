module top_module ( input clk, input d, output q );

    wire r, s;

    my_dff inst1 ( .clk(clk), .d(d), .q(r) );
    my_dff inst2 ( .clk(clk), .d(r), .q(s) );
    my_dff inst3 ( .clk(clk), .d(s), .q(q) );

endmodule
