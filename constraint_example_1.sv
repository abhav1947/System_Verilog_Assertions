/*solun
https://www.youtube.com/watch?v=6G0ya8kANqQ&list=PLr3r0_TpwTW3ucAXBbhVlzkNHGGIefbKV&index=1
*/
class pkt;
  
  rand int darray [];
  
  constraint dar_conc{darray.size() == 10;
                      foreach(darray[i]){
                        darray[i] inside {1, 5, 7}};
                      foreach(darray[i]){
                        if((darray[i] < darray[i+1]) && (i < (darray.size() -1))){
                          darray[i+1] == darray[i];}}}
                          constraint repeat_{ darray.sum() with (int'(item==1)) >= 2;
                                             darray.sum() with (int'(item==5)) >= 2;
                                             darray.sum() with (int'(item==7)) >= 2;
                          						}
                          
endclass
                          
                          
                          module tb;
                            pkt p1;
                            
                            initial begin
                              p1 = new();
                              repeat(10) begin
                              p1.randomize();
                              $display("array = %p", p1.darray);
                              end
                            end
                          endmodule
