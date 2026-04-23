class pkt;
  randc bit [7:0] addr;
  randc bit [7:0] data;
  
  constraint addr_limit{ addr == 8'hB; }
  
endclass

module tb;
  
  pkt p1;
  
  initial begin
    p1 = new();
    p1.randomize();
    $display("addr = %0d", p1.addr);
    $display("data = %0d", p1.data);
  end
  
  
endmodule
