class generator;
  
  transaction trns;
  mailbox #(transaction) gen2drv;
  mailbox #(transaction) gen2scb;

  function new(mailbox #(transaction) gen2scb, mailbox #(transaction) gen2drv,);
  	this.gen2drv = gen2drv;
	this.gen2scb = gen2scb;
  endfunction
  
  task run;
	$display("Generator started");
    trns = new();
    repeat(8) begin
      if(trns.randomize() == 0) $fatal(1, "Randomization failed");

      gen2drv.put(trns.copy());
	  gen2scb.put(trns.copy());
    end
	$display("Generator Ended");
  endtask
  
endclass
