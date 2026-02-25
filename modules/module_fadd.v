module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//

    wire [15:0] sum1, sum2;
    wire cout1, cout2;

    add16 inst1 ( .a(a[15:0]), .b(b[15:0]), .cin(1'b0), .sum(sum1), .cout(cout1) );
    add16 inst2 ( .a(a[31:16]), .b(b[31:16]), .cin(cout1), .sum(sum2), .cout(cout2) );

    assign sum = { sum2, sum1 };

endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );

// Full adder module here
    wire xor1, and1, and2;

    assign xor1 = a ^ b;
    assign and1 = a & b;
    assign and2 = cin & xor1;
    assign cout = and1 | and2;
    assign sum = xor1 ^ cin;

endmodule
