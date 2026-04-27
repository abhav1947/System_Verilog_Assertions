// Pattern to generate
// 1, 22, 3, 44, 5, 66, 7, 88, 7, 66, 5, 44, 3, 22, 1
class pkt;
  
  rand  int a [];
  
  function new();
    a = new[15];
  endfunction
  
  
  // method-1
  constraint a_size{foreach(a[i]){
    if((i < 8)) {
      if(i%2 == 0) {
        a[i] == i+1;
      } else {
        a[i] == ((i+1)*11);
      }
        } else {
          if(i%2 == 0) {
            a[i] == a.size - i ;
          } else {
            a[i] == (a.size - i)*11;
          }
        }
  				}
  				}
            
   // method-2
            constraint a_size_2{foreach(a[i]){ if((i%2 == 0) && i <8){ a[i] == i+1;} else if((i%2 == 1) && i<8){a[i] == (i+1)*11;}else {
              a[i] == a[14-i];}
            					}
            				}
endclass
          

module tb;
  
  pkt p1;
  
  initial begin
    p1 = new();
    p1.randomize();
    foreach(p1.a[i]) begin
      $display("a[%0d] = %0d", i, p1.a[i]);
    end
  end
endmodule
