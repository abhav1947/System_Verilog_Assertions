class pkt;
  rand bit [16:0] addr;
  rand bit [7:0] data;
  
  extern constraint addr_limiter;
endclass

constraint pkt::addr_limiter{addr == 16'hfaaa; };

module tb;
  pkt p1;
  
  initial begin
    p1 = new();
    
    repeat(2) begin
      assert(p1.randomize()) else $display("Randomization Failed");
      $display("addr = %0h", p1.addr);
    end
  end
endmodule
