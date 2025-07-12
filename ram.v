module ram (
    input clk,
    input we,            // Write Enable
    input [3:0] addr,    // 4-bit address (16 locations)
    input [7:0] din,     // Data input
    output reg [7:0] dout // Data output
);

    // 16 x 8 RAM
    reg [7:0] mem [15:0];

    always @(posedge clk) begin
        if (we)
            mem[addr] <= din;
        else
            dout <= mem[addr];
    end

endmodule
