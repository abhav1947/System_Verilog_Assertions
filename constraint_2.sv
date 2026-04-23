class pkt;
  randc bit [7:0] addr;
  randc bit [7:0] data;
  
  constraint addr_limit{ addr <= 8'hB;
                       	 addr >= 8'h9;
                        addr[1:0] == 2'b10; }
  
  constraint data_limit{ data <= 8'hf;
                       	 data >= 8'ha;
                        data[1:0] == 2'b11;}
  
endclass

module tb;
  
  pkt p1;
  
  initial begin
    p1 = new();
    repeat(4) begin
      assert(p1.randomize()) else $display("Randomization Failed");
    $display("addr = %0d", p1.addr);
    $display("data = %0d", p1.data);
  end
  end
  
endmodule
