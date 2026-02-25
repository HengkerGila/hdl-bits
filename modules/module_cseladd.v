module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire coutlb, couthb1, couthb2;
    wire [15:0] sumlb, sumhb1, sumhb2, mux16b;

    add16 lb1 ( .a(a[15:0]), .b(b[15:0]), .cin(1'b0), .sum(sumlb), .cout(coutlb) );
    add16 hb1 ( .a(a[31:16]), .b(b[31:16]), .cin(1'b0), .sum(sumhb1), .cout(couthb1) );
    add16 hb2 ( .a(a[31:16]), .b(b[31:16]), .cin(1'b1), .sum(sumhb2), .cout(couthb2) );

    always @(*) begin
        case (coutlb)
            1'b0: mux16b = sumhb1;
            1'b1: mux16b = sumhb2;
        endcase
    end

    assign sum = { mux16b, sumlb };

endmodule
