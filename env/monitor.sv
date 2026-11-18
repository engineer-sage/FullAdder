class monitor;
  	transaction trns_mon;
	coverage cov;

	virtual Adder_ib.MON vif;
  	mailbox #(transaction) mon2scb;
  	bit a, b, cin, sum , cout;
  
  	function new(mailbox #(transaction) mbox, virtual Adder_ib.MON intf, coverage cov);
    	this.mon2scb = mbox;
		this.vif = intf;
		this.cov = cov;
  	endfunction
  
  	task run;
		$display("TIME = %0dns : Monitor Started", $time);
    	repeat(8) begin
			trns_mon = new();
    		@(vif.mon_cb);
			trns_mon.a = vif.mon_cb.a;
			trns_mon.b = vif.mon_cb.b;
			trns_mon.cin = vif.mon_cb.cin;
			trns_mon.sum = vif.mon_cb.sum;
			trns_mon.cout = vif.mon_cb.cout;
			cov.sample(trns_mon);
			mon2scb.put(trns_mon);
    	end
		$display("TIME = %0dns, Monitor ended", $time);
  	endtask
  
endclass
