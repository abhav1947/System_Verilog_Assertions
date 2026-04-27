/*generate pattern
0102030405*/
class pkt;
  randc bit [3:0] a [10];
  
  constraint a_constr{foreach(a[i]){
    if(i%2 == 0){
      a[i] == 0;}
    else{
      if(i==1){
        a[i]==1;}
      else{
        a[i] ==  i - a[i-2];}}}}
  
    							function void _disp();
    $display("a = %p",a);                            
    							endfunction
endclass
    
    module tb;
      pkt p1;
      
      initial begin
        p1 = new();
        p1.randomize();
        p1._disp();
      end
    endmodule
