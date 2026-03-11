module divider #(parameter N = 16)(
    input clk,
    input rst,
    input start,
    input [N-1:0] dividend,
    input [N-1:0] divisor,

    output reg [N-1:0] quotient,
    output reg [N-1:0] remainder,
    output reg done
);

reg [N-1:0] A;
reg [N-1:0] Q;
reg [N-1:0] M;

reg [4:0] count;   // enough for N=16
reg busy;

/* Shift stage */

wire [N-1:0] A_shift;
assign A_shift = {A[N-2:0], Q[N-1]};

/* N+1 bit subtraction */

wire [N:0] A_ext;
wire [N:0] M_ext;

assign A_ext = {1'b0, A_shift};
assign M_ext = {1'b0, M};

wire [N:0] A_sub;
assign A_sub = A_ext - M_ext;

wire negative;
assign negative = A_sub[N];

/* Next values */

wire [N-1:0] A_next;
wire [N-1:0] Q_next;

assign A_next = negative ? A_shift : A_sub[N-1:0];
assign Q_next = {Q[N-2:0], ~negative};


always @(posedge clk or posedge rst) begin

    if(rst) begin
        A <= 0;
        Q <= 0;
        M <= 0;
        count <= 0;
        busy <= 0;
        done <= 0;
        quotient <= 0;
        remainder <= 0;
    end

    else begin

        if(start && !busy) begin

            done <= 0;

            if(divisor == 0) begin
                quotient <= 0;
                remainder <= dividend;
                done <= 1;
            end

            else if(dividend < divisor) begin
                quotient <= 0;
                remainder <= dividend;
                done <= 1;
            end

            else begin
                A <= 0;
                Q <= dividend;
                M <= divisor;
                count <= N;
                busy <= 1;
            end

        end

        else if(busy) begin

            A <= A_next;
            Q <= Q_next;
            count <= count - 1;

            if(count == 1) begin
                busy <= 0;
                done <= 1;
                quotient <= Q_next;
                remainder <= A_next;
            end

        end

    end

end

endmodule
