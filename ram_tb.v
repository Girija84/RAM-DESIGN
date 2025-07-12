`timescale 1ns / 1ps

module ram_tb;

    reg clk;
    reg we;
    reg [3:0] addr;
    reg [7:0] din;
    wire [7:0] dout;

    // Instantiate RAM
    ram uut (
        .clk(clk),
        .we(we),
        .addr(addr),
        .din(din),
        .dout(dout)
    );

    // Clock generator
    always #5 clk = ~clk;

    initial begin
        $display("RAM Testbench Running...");
        $dumpfile("ram.vcd");
        $dumpvars(0, ram_tb);

        clk = 0; we = 0; addr = 0; din = 0;

        // Write values into RAM
        #10 we = 1; addr = 4'd0; din = 8'hAA;  // Write AA at address 0
        #10 addr = 4'd1; din = 8'hBB;          // Write BB at address 1
        #10 addr = 4'd2; din = 8'hCC;          // Write CC at address 2

        // Read values from RAM
        #10 we = 0; addr = 4'd0;               // Read from address 0
        #10 addr = 4'd1;                       // Read from address 1
        #10 addr = 4'd2;                       // Read from address 2

        #10 $finish;
    end

endmodule
