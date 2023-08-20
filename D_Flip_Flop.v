module D_Flip_Flop(D, reset, clk, Q, Qb);
  input D, reset, clk; 
  output Q, Qb;        
  reg Q, Qb;  
  
  always @(posedge clk,posedge reset) 
  begin
    if (reset) begin    //active high and asynchronous
      Q<=0;
      Qb<=1;
     end         
    else begin
      Q= D;          
      Qb=~D; 
      end  
  end
endmodule
