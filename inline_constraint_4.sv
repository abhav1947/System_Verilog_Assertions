// inline constraint with
/*The takeaway here is that constraints provided should not conflict with each other and in-line method of providing constraints does not override but instead is also considered along with the original by the solver.*/
class pkt;
  randc bit [7:0] addr;
  
  constraint addr_limiter{addr <= 8'h4; }
endclass

module tb;
  pkt p1;
  
  initial begin
    p1 = new();
    repeat(3) begin
      assert(p1.randomize with {addr >= 8'h2;}) else $display("FAIL");
      $display("addr = %0h", p1.addr);
    end
  end
  
endmodule
  
  
    
