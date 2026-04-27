//Multidimensonal array

class pkt;
  rand bit [4:0] darray [][];
  
  constraint darray_size{
    darray.size() == 4;
    foreach(darray[i]){
      darray[i].size() == 4};
    foreach(darray[i]){
      foreach(darray[j]){
        darray[i][j] == i+j ;}}}
  
endclass

module tb;
  pkt p1;
  
  initial begin
    p1 = new();
    
    repeat(2) begin
      p1.randomize();
      $display("darray = %p", p1.darray);
    end
  end
endmodule
