module FullAdder(
    Adder_ib.ADDER adder
);

always_comb begin
    adder.sum = adder.a ^ adder.b ^ adder.cin;

    adder.cout = (adder.a & adder.b) |
                 (adder.b & adder.cin) |
                 (adder.a & adder.cin);
end

endmodule
