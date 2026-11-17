class scoreboard;
	transaction expected, actual;
	mailbox #(transaction) mon2scb;
	mailbox #(transaction) gen2scb;

	function new(mailbox #(transaction) mon2scb, mailbox #(transaction) gen2scb);
		this.mon2scb = mon2scb;
		this.gen2scb = gen2scb;
	endfunction

	task run;
		$display("Scoreboard Started");
		repeat(8) begin

    	    mon2scb.get(actual);
        	gen2scb.get(expected);

			if((expected.sum == actual.sum) && (expected.cout == actual.cout)) begin
				$display("a = %0d, b = %0d, cin = %0d -> Test case passed", actual.a, actual.b, actual.cin);
			end
			else begin
				$display("a = %0d, b = %0d, cin = %0d -> Test case failed", actual.a, actual.b, actual.cin);
			end
		end
		$display("Scoreboard Ended");
	endtask

endclass
