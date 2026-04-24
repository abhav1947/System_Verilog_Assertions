class pkt;
  rand bit [7:0] min, max, typ;
  
  constraint my_max{max <= 10; max >= 5;}
  constraint my_range {0 < min;
                      	min <= max-4;}
 
endclass

module tb;
  pkt p1;
  
  initial begin
    p1 = new();
    repeat(2) begin
      assert(p1.randomize()) else $display("Randomization Failed");
      $display("min=%0d | max=%0d | typ=%0d",p1.min, p1.max, p1.typ);
    end
  end
endmodule
