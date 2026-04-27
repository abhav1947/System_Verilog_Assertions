/*Write a system verilog constraint to generate the follwoing pattern
0 1 0 0 2 0 0 0 3 0 0  0  0  4  0  0  0  0  0  5  0  0  0  0  0  0  6
0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26  

Location where the non zero values are located
1, 4, 8, 13, 19, 26
 3  4  5   6   7

a[0] = 1;
a[1] = a[0] + 3
a[2] = a[1] + 4
a[3] = a[2] + 5
a[4] = a[3] + 6
a[5] = a[4] + 7

generalised 
a[i] = a[i-1] + i + 2

we can take one more array called b and then assign the values there
*/

class pkt;
  
  rand int a [];
  int b [27];
  
  constraint a_cnt{ a.size == 6;
                   a[0] == 1;
                   foreach(a[i]){
                     if(i>0) {
                       a[i] == a[i-1] + i + 2};}}
  
  function void post_randomize();
    foreach(b[i]) begin
      b[i] = 0;
    end
    foreach(a[i]) begin
      b[a[i]] = i+1;
     // $display("b = %p | %0d", b, i);
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
