class scoreboard;
	transaction expected, actual;
	mailbox #(transaction) mon2scb;
	mailbox #(transaction) gen2scb;

	int matched, mismatched, no_trans;

	function new(mailbox #(transaction) mon2scb, mailbox #(transaction) gen2scb);
		this.mon2scb = mon2scb;
		this.gen2scb = gen2scb;
	endfunction

	task run;
		$display("TIME = %0dns : Scoreboard Started", $time);
		repeat(8) begin

    	    mon2scb.get(actual);
        	gen2scb.get(expected);

			assert({expected.sum == actual.sum && expected.cout == actual.cout})
    		$display("ASSERTION PASSED");
    	   	else $error("""
						ASSERTION FAILED:
        				INPUTS   : [a = %0d, b = %0d, cin = %0d]
        				EXPECTED : [sum = %0d, cout = %0d]
        				ACTUAL   : [sum = %0d, cout = %0d]""", 
						actual.a, actual.b, actual.cin,
						expected.sum,expected.cout,actual.sum,actual.cout);
			no_trans++;
		end
		$display("TIME = %0dns : Scoreboard Ended", $time);
	endtask

endclass
