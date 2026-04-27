/*
Write the constraint to gen
0 1 0 2  0  3  0  4  0  5  0  6  0  7  0  8  0  9  0  1  0  2  0  3  0405  
0 1 2 3  4  5  6  7  8  9  10 11 12 13 14

1,3,5,7,9,11,13,15,17,
19,21,23,25,27.....

*/

class pkt;
  rand int a [];
  int b [28];
  
  constraint a_size{a.size == 14;
                    a[0] == 1;
                    foreach(a[i]) {
                      if((i > 0)) { a[i] == a[i-1] + 2;}
                    }}
             
                      function void post_randomize();
                      foreach(b[i]) begin
                        b[i] = 0;
                      end
                      foreach(a[i]) begin
                        b[a[i]] = i + 1;
                        if(i >= 9) begin
                          b[a[i]] = i-8;
                        end
                      end
                      endfunction
endclass
                      
                      
                      module tb;
                        pkt p1;
                        
                        initial begin
                          p1 = new();
                          
                          p1.randomize();
                          $display("a = %p", p1.a);
                          $display("b = %p", p1.b);
                        end
                      endmodule
