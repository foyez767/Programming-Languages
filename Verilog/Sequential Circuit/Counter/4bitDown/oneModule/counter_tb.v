`timescale 1ns/1ps

module counter_tb ();

reg reset;
reg clk;
wire [3:0] q;

counter counter_circuit (reset, clk, q);

always begin 
    clk = ~clk;
    #10;
end

initial begin
        $dumpfile("counter.vcd");
        $dumpvars(0, counter_tb);

        clk <= 0; reset <= 1; 
        #20;
        reset <= 0; 
        #20;
        #20;
        #20;
        #20;

        $finish;
    end

initial begin
        $monitor("clk=%b reset=%b q=%b", clk, reset, q);
    end

endmodule