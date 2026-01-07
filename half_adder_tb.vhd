library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity half_adder_tb is
end half_adder_tb;

architecture Behavioral of half_adder_tb is
    component half_adder
        port (
            A     : in  STD_LOGIC;
            B     : in  STD_LOGIC;
            Sum   : out STD_LOGIC;
            Carry : out STD_LOGIC
        );
    end component;

    signal A_tb     : STD_LOGIC := '0';
    signal B_tb     : STD_LOGIC := '0';
    signal Sum_tb   : STD_LOGIC;
    signal Carry_tb : STD_LOGIC;

    constant CLK_PERIOD : time := 10 ns;
    
begin
    UUT: half_adder
        port map (
            A     => A_tb,
            B     => B_tb,
            Sum   => Sum_tb,
            Carry => Carry_tb
        );
    
    stim_proc: process
    begin
        -- Header
        report "======================================";
        report "Starting Half Adder Testbench";
        report "======================================";
        
        -- Test Case 1: A=0, B=0
        -- Expected: Sum=0, Carry=0
        A_tb <= '0';
        B_tb <= '0';
        wait for CLK_PERIOD;
        assert (Sum_tb = '0' and Carry_tb = '0')
            report "Test Case 1 FAILED: A=0, B=0 => Sum=" & 
                   std_logic'image(Sum_tb) & ", Carry=" & 
                   std_logic'image(Carry_tb)
            severity error;
        report "Test Case 1 PASSED: A=0, B=0 => Sum=0, Carry=0";
        
        -- Test Case 2: A=0, B=1
        -- Expected: Sum=1, Carry=0
        A_tb <= '0';
        B_tb <= '1';
        wait for CLK_PERIOD;
        assert (Sum_tb = '1' and Carry_tb = '0')
            report "Test Case 2 FAILED: A=0, B=1 => Sum=" & 
                   std_logic'image(Sum_tb) & ", Carry=" & 
                   std_logic'image(Carry_tb)
            severity error;
        report "Test Case 2 PASSED: A=0, B=1 => Sum=1, Carry=0";
        
        -- Test Case 3: A=1, B=0
        -- Expected: Sum=1, Carry=0
        A_tb <= '1';
        B_tb <= '0';
        wait for CLK_PERIOD;
        assert (Sum_tb = '1' and Carry_tb = '0')
            report "Test Case 3 FAILED: A=1, B=0 => Sum=" & 
                   std_logic'image(Sum_tb) & ", Carry=" & 
                   std_logic'image(Carry_tb)
            severity error;
        report "Test Case 3 PASSED: A=1, B=0 => Sum=1, Carry=0";
        
        -- Test Case 4: A=1, B=1
        -- Expected: Sum=0, Carry=1
        A_tb <= '1';
        B_tb <= '1';
        wait for CLK_PERIOD;
        assert (Sum_tb = '0' and Carry_tb = '1')
            report "Test Case 4 FAILED: A=1, B=1 => Sum=" & 
                   std_logic'image(Sum_tb) & ", Carry=" & 
                   std_logic'image(Carry_tb)
            severity error;
        report "Test Case 4 PASSED: A=1, B=1 => Sum=0, Carry=1";
        
        -- End of test
        report "======================================";
        report "Half Adder Testbench COMPLETED";
        report "All test cases passed!";
        report "======================================";
        
        wait;
    end process;
    
end Behavioral;
