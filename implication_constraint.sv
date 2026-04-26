// SV gives us two constructs to declare conditional relations - implication and if else
class pkt;
  randc bit [2:0] mode;
  randc bit [3:0] len;
  
  //constraint c_mode{mode==2 -> (len > 10 && len < 12);}
  constraint c_mode{mode inside {[4:6]} -> len == 1;}

 // constraint mode_c{ mode inside {2};}
endclass

module tb;
  pkt p1;
  
  initial begin
    p1 = new();
    
    repeat(30) begin
      p1.randomize();
      $display("mode = %0d, len = %0d", p1.mode, p1.len);
    end
  end
endmodule
