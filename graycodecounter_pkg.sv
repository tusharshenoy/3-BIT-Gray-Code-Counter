package graycodecounter_pkg;

class graycodecounter;

  bit clk;
  bit reset;
  bit [2:0] count;
  bit [2:0] out;

  function new(bit clk1, bit reset1);
    clk = clk1;
    reset = reset1;
  endfunction

  function void performCount(bit reset);
    if (reset) begin
      out = 3'b0;
      count=3'b0;
      end
    else begin
      count <= count + 1; // Increment the counter
      out[2] = count[2];
      out[1] = count[2] ^ count[1];
      out[0] = count[1] ^ count[0];
    end
  endfunction

endclass

endpackage
