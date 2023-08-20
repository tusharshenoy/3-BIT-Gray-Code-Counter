module testbench;

import graycodecounter_pkg::*;

bit clk, reset;
bit [2:0] Q; // got output of the counter (Structural)
bit [2:0] q; // expected output of the counter (OOP Concept)
graycodecounter graycount = new(clk, reset);

Gray_Code_Counter dut(.clk(clk), .reset(reset), .Q(Q));

initial begin
  clk = 1'b0;
  reset = 1'b1;
  #8 reset = 1'b0;
  #3 $monitor("The Expected and the got output is %b and %b",q,Q);
end

always @(posedge clk, posedge reset) // asynchronous reset
begin
  graycount.performCount(reset);
end

always @(posedge clk, posedge reset) // asynchronous reset
begin
  q = graycount.out;
end

always #5 clk = ~clk;

endmodule
