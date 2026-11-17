interface Adder_ib(
	input logic clk,
	input logic reset
);
	logic a, b, cin;
	logic sum, cout;

	clocking drv_cb @(posedge clk);
		output a, b, cin;
	endclocking

	clocking mon_cb @(negedge clk);
		input a, b, cin, sum, cout;
	endclocking

	modport DRV(clocking drv_cb,input reset);
	modport MON(clocking mon_cb);
	modport ADDER(input a, b, cin,
				  output sum, cout);

endinterface
