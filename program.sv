`include "env/environment.sv"

program test(Adder_ib intf);
	environment env;

	initial begin
		env = new(intf);
		env.run();
	end
endprogram
