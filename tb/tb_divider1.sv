`timescale 1ns/1ps

module tb_divider1;

parameter N = 16;
parameter NUM_RANDOM_TESTS = 250;

logic clk;
logic rst;
logic start;

logic [N-1:0] dividend;
logic [N-1:0] divisor;

logic [N-1:0] quotient;
logic [N-1:0] remainder;
logic done;

int i;
int pass_count;
int fail_count;


/* DUT */

divider1 #(N) dut (
    .clk(clk),
    .rst(rst),
    .start(start),
    .dividend(dividend),
    .divisor(divisor),
    .quotient(quotient),
    .remainder(remainder),
    .done(done)
);


/* Clock */

always #5 clk = ~clk;


/* Test Task */

task run_test(input [N-1:0] a, input [N-1:0] b);

logic [N-1:0] expected_q;
logic [N-1:0] expected_r;

begin

    expected_q = a / b;
    expected_r = a % b;

    @(posedge clk);
    dividend = a;
    divisor  = b;
    start = 1;

    @(posedge clk);
    start = 0;

    wait(done);

    @(posedge clk);

    if((quotient == expected_q) && (remainder == expected_r)) begin
        $display("PASS : %0d / %0d -> Q=%0d R=%0d", a, b, quotient, remainder);
        pass_count++;
    end
    else begin
        $display("FAIL : %0d / %0d -> Q=%0d R=%0d | Expected Q=%0d R=%0d",
                  a, b, quotient, remainder, expected_q, expected_r);
        fail_count++;
    end

end
endtask


initial begin

    clk = 0;
    rst = 1;
    start = 0;

    pass_count = 0;
    fail_count = 0;

    #20;
    rst = 0;

    /* Directed tests */

    run_test(27,4);
    run_test(20,5);
    run_test(15,2);
    run_test(9,3);

    run_test(0,5);
    run_test(65535,1);
    run_test(65535,65535);


    /* Random tests */

    for(i=0;i<NUM_RANDOM_TESTS;i++) begin

        dividend = $urandom_range(0,65535);
        divisor  = $urandom_range(1,65535);

        run_test(dividend,divisor);

    end


    $display("--------------------------------");
    $display("TOTAL PASSED : %0d", pass_count);
    $display("TOTAL FAILED : %0d", fail_count);
    $display("--------------------------------");

    $finish;

end


initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb_divider1);
end

endmodule
