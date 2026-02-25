module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

    wire [31:0] inv;
    wire [15:0] sumlb, sumhb;
    wire coutlb, couthb;

    always @(*) begin
        case (sub)
            1'b0: inv = b;
            1'b1: inv = ~b;
        endcase
    end 

    add16 lb1 ( .a(a[15:0]), .b(inv[15:0]), .cin(sub), .sum(sumlb), .cout(coutlb) ); 
    add16 hb1 ( .a(a[31:16]), .b(inv[31:16]), .cin(coutlb), .sum(sumhb), .cout(couthb) );

    assign sum = { sumhb, sumlb };

endmodule
