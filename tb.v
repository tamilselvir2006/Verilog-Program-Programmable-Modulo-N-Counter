`timescale 1ns/1ps

module tb_programmable_modulo_n_counter;
    reg clk;
    reg reset;
    reg enable;
    reg [7:0] N;
    wire [7:0] count;
    programmable_modulo_n_counter #(
        .WIDTH(8)
    ) DUT (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .N(N),
        .count(count)
    );
    always #5 clk = ~clk;
    initial begin
        $dumpfile("programmable_modulo_n_counter.vcd");
        $dumpvars(0, tb_programmable_modulo_n_counter);
        clk = 0;
        reset = 1;
        enable = 0;
        N = 5;
        #10
        reset = 0;
        enable = 1;
        #60;
        N = 8;
        #80;
        enable = 0;
        #20;
        $finish;
    end
endmodule