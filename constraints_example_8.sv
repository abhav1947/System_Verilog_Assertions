/*
When randomized "a" should not be same as any of the previous 5 occurance
*/

class pkt;
  
  rand bit [3:0] a;
  bit [3:0] q[$];
  
  constraint a_val{!(a inside {q});}
  
  function void post_randomize();
    q.push_front(a);
    if(q.size > 5) begin
      q.pop_back();
    end
  endfunction
endclass

module tb;
  pkt p1;
  initial begin
    p1 = new();
    repeat(16) begin
      p1.randomize();
      $display("a = %d",p1.a);
      $display("q = %p", p1.q);
    end
  end
endmodule
