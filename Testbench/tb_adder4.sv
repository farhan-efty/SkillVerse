//====================================================
// Testbench for 4-bit Ripple Carry Adder
//====================================================

`timescale 1ns/1ps

module tb_adder4;

    // Testbench signals
    reg  [3:0] a, b;
    reg        cin;
    wire [3:0] sum;
    wire       cout;

    // Instantiate DUT (Device Under Test)
    adder4 uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    // Test sequence
    initial begin
        // Header
        $display("Time |  A   B   Cin | Sum  Cout");
        $display("-------------------------------");

        // Test cases
        cin = 0;
        a = 4'b0000; b = 4'b0000; #10;
        $display("%4t | %b %b  %b  | %b   %b", $time, a, b, cin, sum, cout);

        a = 4'b0101; b = 4'b0011; cin = 0; #10;
        $display("%4t | %b %b  %b  | %b   %b", $time, a, b, cin, sum, cout);

        a = 4'b1111; b = 4'b0001; cin = 0; #10;
        $display("%4t | %b %b  %b  | %b   %b", $time, a, b, cin, sum, cout);

        a = 4'b1010; b = 4'b0101; cin = 1; #10;
        $display("%4t | %b %b  %b  | %b   %b", $time, a, b, cin, sum, cout);

        a = 4'b1111; b = 4'b1111; cin = 1; #10;
        $display("%4t | %b %b  %b  | %b   %b", $time, a, b, cin, sum, cout);

        $display("-------------------------------");
        $display("Simulation complete!");
        $finish;
    end

endmodule
