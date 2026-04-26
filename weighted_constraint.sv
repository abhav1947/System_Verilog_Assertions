/*A cyclic variable cannot really obey weighted probability in the normal sense, because once a value is used, it should not repeat until the cycle is exhausted.*/
class pkt;
  
  randc bit [3:0] addr;
  
  extern constraint addr_trim;
  
endclass

constraint pkt::addr_trim{addr dist {4:=10,[5:10]:=40};};

module tb;
  
  pkt p1;
  
  initial begin
    p1 = new();
    repeat(5) begin
      assert(p1.randomize()) else $display("Randomization Failed");
      $display("addr = %0d", p1.addr);
    end
  end
endmodule
