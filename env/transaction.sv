class transaction;
  randc bit [2:0] inputs;   
  	// randc generates cyclic random values.
    // All 8 combinations of the 3-bit input are generated
    // before any combination repeats.
	bit a, b, cin;
  	bit sum, cout;
  
  
  function void post_randomize(); // Automatically called after successful randomization.
      {a, b, cin} = inputs;
      {cout, sum} = {1'b0, a} + {1'b0, b} + cin;
    endfunction
  
    // Creates a separate transaction object and copies
    // all properties to it. This prevents multiple mailbox
    // entries from referencing the same transaction object.
  function transaction copy(); 
    transaction temp = new();

    temp.inputs = this.inputs;
    temp.a = this.a;
    temp.b = this.b;
    temp.cin = this.cin;
    temp.sum = this.sum;
    temp.cout = this.cout;

    return temp;
  endfunction

endclass
