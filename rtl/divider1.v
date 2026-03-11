`timescale 1ns/1ps

module divider1 #(parameter N = 16)
(
    input  wire clk,
    input  wire rst,
    input  wire start,

    input  wire [N-1:0] dividend,
    input  wire [N-1:0] divisor,

    output reg [N-1:0] quotient,
    output reg [N-1:0] remainder,
    output reg done
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        quotient  <= 0;
        remainder <= 0;
        done      <= 0;
    end
    else begin
        done <= 0;

        if (start) begin
            quotient  <= dividend / divisor;
            remainder <= dividend % divisor;
            done      <= 1;
        end
    end
end

endmodule
