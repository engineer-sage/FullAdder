class driver;
	transaction trns;
 	virtual Adder_ib.DRV vif;
 	mailbox #(transaction) gen2drv;
  
 	function new(mailbox #(transaction) mbox, virtual Adder_ib.DRV intf);
   		this.vif = intf;
   		this.gen2drv = mbox;
   endfunction
 
  	task reset;
    	wait(!vif.reset);
    	$display("TIME = %0t : reset started", $time);
    		vif.drv_cb.a <= 0;
    		vif.drv_cb.b <= 0;
    		vif.drv_cb.cin <= 0;
    	wait(vif.reset);
    	$display("TIME = %0t : reset ended", $time);
  endtask

	task run;
		$display("Driver started");
    	repeat(8) begin
       		gen2drv.get(trns);
       		@(vif.drv_cb);
       		vif.drv_cb.a <= trns.a;
       		vif.drv_cb.b <= trns.b;
       		vif.drv_cb.cin <= trns.cin;
     	end
		$display("Driver Done");
   	endtask
 
endclass
