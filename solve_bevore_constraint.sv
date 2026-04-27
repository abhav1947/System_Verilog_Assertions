class pkt;
  
  rand bit [1:0] a;
  rand bit [2:0] b;
  
  constraint a_b_constr{a -> b==3 ;
                        solve a before b;}
endclass

module tb;
  pkt p1;
  
  initial begin
    p1 = new();
    repeat(20) begin
      p1.randomize();
      $display("a = %0d | b = %0d", p1.a, p1.b);
    end
  end
endmodule
