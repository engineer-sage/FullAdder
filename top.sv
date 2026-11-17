`include "interface.sv"
`include "program.sv"
`include "FullAdder.sv"

module top;
	bit clk, reset;

	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end

	initial begin
		reset = 0;
		#15; reset = 1;
	end
	

	Adder_ib intf(.clk(clk), .reset(reset));
	test prog(intf);
	FullAdder dut(intf); 

endmodule
