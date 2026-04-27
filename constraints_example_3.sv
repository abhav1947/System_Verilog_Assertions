/*
SV constraint where we roll 10 dice and sum of 10 dice must be 20 and atleast 1 die must roll a 4
*/
class pkt;
  
  rand bit [5:0] die [10];
  
  constraint max_die_val{foreach(die[i]){die[i] inside {[1:6]};}}
  constraint die_sum{die.sum() == 20;}
  constraint die_val_4{die.sum() with (int'(item == 4)) == 1;}
endclass
    
module tb;
  pkt p1;
  
  initial begin
    p1 = new();
    repeat(20) begin
    p1.	randomize();
    $display("val = %p", p1.die);
    end
  end
endmodule
