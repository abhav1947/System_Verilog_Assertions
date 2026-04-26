class pkt;
  
  randc bit [3:0] r1;
  randc bit [3:0] r2;
  
  constraint c1{if(r1 == 2) {
  					r2 == 2;}
    else {
      if(r1 == 4) {
      	r2 == 4;}
      else{
        if(r1 == 3) {
        r2 == 3;}
      }}	
    }
          
endclass
          
module tb;
  pkt p1;
  
  initial begin
    p1 = new();
    repeat(20) begin
      p1.randomize();
      $display("r1 = %0d | r2 = %0d", p1.r1, p1.r2);
    end
  end
endmodule
