# Verification of 1 bit Full-Adder

A simple 1 bit Full-Adder verification architecture which covers the following:
- coverage 
- randomisation
- assertion 
- interface with clocking blocks
- Full environment architecture(generator, driver, monitor and scoreboard)

## Files
- `FullAdder.sv` - Contains the RTL design.
- `interface.sv` - Contains the signals of the design and testbench.
- `program.sv` - Calls the `env.run()` function.Passes the interface to the environment.
- `top.sv` - Models the clka dn reset signals. Connectes the interafce, design and program block
- `env/generator.sv` - Contains the generator class.
- `env/driver.sv` - Contains the driver class.
- `env/monitor.sv` - Contains the monitor class.
- `env/scoreboard.sv` - Contains the scoreboard class.
- `env/environment.sv` - Contains the flow of the blocks, `pre_test()`, `test()` and `post_test()`.
- `env/coverage.sv` - Contains the functional coverage model/class.
- `env/transaction.sv` - Contains the inputs, expected output to put in the mailbox.

## Steps to Run
1. Install the [verilator](https://github.com/verilator/verilator.git]).
2. ```bash
        git clone https://github.com/sagar-s-v/FullAdder.git
        cd FullAdder
        chmod +x build_svv.sh
        ./build_svv.sh top top.sv
    ```
***RUN IN LINUX OR WSL ENVIRONEMNT***


## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create your feature branch (`git checkout -b <your branch name>`)
3. Commit your changes (`git commit -m '<your message>'`)
4. Push to the branch (`git push origin <your branch name>`)
5. Open a Pull Request
