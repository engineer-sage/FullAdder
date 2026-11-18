class coverage;
  transaction trns;
  covergroup adder_cg;
    
    cp_a: coverpoint trns.a{
      bins zero = {0};
      bins one = {1};
    }
    
    cp_b: coverpoint trns.b{
      bins zero = {0};
      bins one = {1};
    }
    
    cp_cin: coverpoint trns.cin{
      bins zero = {0};
      bins one = {1};
    }
    
    input_combinations : cross cp_a, cp_b, cp_cin;
  endgroup
  
  function new();
    adder_cg = new();
  endfunction
  
  function void sample(transaction t);
    trns = t;
    adder_cg.sample();
  endfunction
  
endclass
    
