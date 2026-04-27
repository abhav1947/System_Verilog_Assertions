class pkt;
  
  randc bit [3:0] dyn_arr [];
  randc bit [3:0] queu_arr[$];
  
  
  function new();
    dyn_arr = new[5];
  endfunction
  
  constraint queu_arr_size{queu_arr.size() == 5;}
  
  constraint dyn_arr_2{foreach(dyn_arr[i])
    dyn_arr[i] == i;
                     foreach(queu_arr[i])
                       queu_arr[i] inside {[1:2]};}
  
endclass


module tb;
  pkt p1;
  
  initial begin
    p1 = new();
    repeat(5) begin
      p1.randomize();
      foreach(p1.dyn_arr[i]) begin
        $display("dyn_arr[%0d] = %0d", i, p1.dyn_arr[i]);
      end
      foreach(p1.queu_arr[i]) begin
        $display("queu_arr[%0d] = %0d", i, p1.queu_arr[i]);
      end
    end
  end
endmodule
