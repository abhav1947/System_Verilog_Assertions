class pkt;
  
  randc bit [7:0] addr;
  randc bit [7:0] data;
  
  constraint addr_limiter{addr inside {[2:8]};}
  
endclass

module tb;
  
  pkt p1;
  
  initial begin
    p1 = new();
    
    repeat(5) begin
      assert(p1.randomize() with {addr >= 4;}) else $display("Randomization Failed");
      $display("addr = %0d", p1.addr);
    end
  end
  
endmodule
