//====================================================
// 4-bit Ripple Carry Adder (RTL Level)
//====================================================

module adder4 (
    input  [3:0] a,     // 4-bit input A
    input  [3:0] b,     // 4-bit input B
    input        cin,   // Carry input
    output [3:0] sum,   // 4-bit Sum output
    output       cout   // Carry output
);

    // Internal wire to hold carry between bits
    wire [3:0] c;

    // Bit 0
    assign {c[0], sum[0]} = a[0] + b[0] + cin;
    // Bit 1
    assign {c[1], sum[1]} = a[1] + b[1] + c[0];
    // Bit 2
    assign {c[2], sum[2]} = a[2] + b[2] + c[1];
    // Bit 3
    assign {cout, sum[3]} = a[3] + b[3] + c[2];

endmodule
