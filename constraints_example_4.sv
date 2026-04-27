/*Write a constraint such that in the following code, all the even numbers from dynamic array arr1 must be stored inside the dynamic array
arr2. Assume that arr1 can have any number of elements but not more than 20, and all elements must be greater than 0 and less than 1000*/

class pkt;
  
  rand int arr1 [];
  rand int arr2 [];
  
  function new();
    arr2 = new[0];
  endfunction
  
  constraint arr1_size{arr1.size inside {[0:19]};}
  constraint arr2_size{arr2.size == (arr1.size()/2);}
  constraint arr1_val{foreach(arr1[i]){arr1[i] inside {[1:999]};}}
  constraint arr2_val{foreach(arr2[i]){arr2[i] inside {arr1}; arr2[i]%2 == 0;}}
    constraint arr2_uq{unique{arr2};}
  
endclass
      
      module tb;
        pkt p1;
        
        initial begin
          p1 = new();
          p1.randomize();
          $display("arr1 : %p", p1.arr1);
          $display("arr2 : %p", p1.arr2);
        end
      endmodule
