// Pattern to generate
// 1, 22, 3, 44, 5, 66, 7, 88, 7, 66, 5, 44, 3, 22, 1
class pkt;
  
  rand  int a [];
  
  function new();
    a = new[15];
  endfunction
  
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
