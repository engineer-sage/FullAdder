class monitor;
  	transaction trns_mon;
	virtual Adder_ib.MON vif;
  	mailbox #(transaction) mon2scb;
  	bit a, b, cin, sum , cout;
  
  	function new(mailbox #(transaction) mbox, virtual Adder_ib.MON intf);
    	this.mon2scb = mbox;
		this.vif = intf;
  	endfunction
  
  	task run;
		$display("Monitor Started");
    	repeat(8) begin
			trns_mon = new();
    		@(vif.mon_cb);
			trns_mon.a = vif.mon_cb.a;
			trns_mon.b = vif.mon_cb.b;
			trns_mon.cin = vif.mon_cb.cin;
			trns_mon.sum = vif.mon_cb.sum;
			trns_mon.cout = vif.mon_cb.cout;
			mon2scb.put(trns_mon);
    	end
		$display("Monitor ended");
  	endtask
  
endclass
