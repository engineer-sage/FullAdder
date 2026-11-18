`include "env/transaction.sv"
`include "env/generator.sv"
`include "env/driver.sv"
`include "env/coverage.sv"
`include "env/monitor.sv"
`include "env/scoreboard.sv"

class environment;

	transaction trns;
	generator gen;
	driver drv;
	monitor mon;
	scoreboard scb;
	coverage cov;

	mailbox #(transaction) gen2drv;
	mailbox #(transaction) gen2scb;
	mailbox #(transaction) mon2scb;

	virtual Adder_ib vif;

	function new(virtual Adder_ib vif);
		gen2drv = new();
		gen2scb = new();
		mon2scb = new();
		cov = new();

		gen = new(gen2scb, gen2drv);
		drv = new(gen2drv, vif);
		mon = new(mon2scb, vif, cov);
		scb = new(mon2scb, gen2scb);
	endfunction

	task pre_test;
		drv.reset;
	endtask

	task test;
		fork
			gen.run();
			drv.run();
			mon.run();
			scb.run();
		join
	endtask

	task post_test;
		$display("Test Finished succesfully");
	endtask

	task run;
		pre_test();
		test();
		post_test();

		#20; $finish;
	endtask

endclass
