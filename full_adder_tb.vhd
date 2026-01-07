library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_tb is
end full_adder_tb;

architecture Behavioral of full_adder_tb is
    component full_adder
        port (
            A    : in  STD_LOGIC;
            B    : in  STD_LOGIC;
            Cin  : in  STD_LOGIC;
            Sum  : out STD_LOGIC;
            Cout : out STD_LOGIC
        );
    end component;

    signal A_tb    : STD_LOGIC := '0';
    signal B_tb    : STD_LOGIC := '0';
    signal Cin_tb  : STD_LOGIC := '0';
    signal Sum_tb  : STD_LOGIC;
    signal Cout_tb : STD_LOGIC;

    constant CLK_PERIOD : time := 10 ns;
    
begin
    UUT: full_adder
        port map (
            A    => A_tb,
            B    => B_tb,
            Cin  => Cin_tb,
            Sum  => Sum_tb,
            Cout => Cout_tb
        );
    
    stim_proc: process
    begin
        -- Header
        report "======================================";
        report "Starting Full Adder Testbench";
        report "======================================";
        
        -- Test Case 1: A=0, B=0, Cin=0
        -- Expected: Sum=0, Cout=0 (0+0+0 = 0)
        A_tb   <= '0';
        B_tb   <= '0';
        Cin_tb <= '0';
        wait for CLK_PERIOD;
        assert (Sum_tb = '0' and Cout_tb = '0')
            report "Test Case 1 FAILED: A=0, B=0, Cin=0 => Sum=" & 
                   std_logic'image(Sum_tb) & ", Cout=" & 
                   std_logic'image(Cout_tb)
            severity error;
        report "Test Case 1 PASSED: A=0, B=0, Cin=0 => Sum=0, Cout=0";
        
        -- Test Case 2: A=0, B=0, Cin=1
        -- Expected: Sum=1, Cout=0 (0+0+1 = 1)
        A_tb   <= '0';
        B_tb   <= '0';
        Cin_tb <= '1';
        wait for CLK_PERIOD;
        assert (Sum_tb = '1' and Cout_tb = '0')
            report "Test Case 2 FAILED: A=0, B=0, Cin=1 => Sum=" & 
                   std_logic'image(Sum_tb) & ", Cout=" & 
                   std_logic'image(Cout_tb)
            severity error;
        report "Test Case 2 PASSED: A=0, B=0, Cin=1 => Sum=1, Cout=0";
        
        -- Test Case 3: A=0, B=1, Cin=0
        -- Expected: Sum=1, Cout=0 (0+1+0 = 1)
        A_tb   <= '0';
        B_tb   <= '1';
        Cin_tb <= '0';
        wait for CLK_PERIOD;
        assert (Sum_tb = '1' and Cout_tb = '0')
            report "Test Case 3 FAILED: A=0, B=1, Cin=0 => Sum=" & 
                   std_logic'image(Sum_tb) & ", Cout=" & 
                   std_logic'image(Cout_tb)
            severity error;
        report "Test Case 3 PASSED: A=0, B=1, Cin=0 => Sum=1, Cout=0";
        
        -- Test Case 4: A=0, B=1, Cin=1
        -- Expected: Sum=0, Cout=1 (0+1+1 = 2 = 10 binary)
        A_tb   <= '0';
        B_tb   <= '1';
        Cin_tb <= '1';
        wait for CLK_PERIOD;
        assert (Sum_tb = '0' and Cout_tb = '1')
            report "Test Case 4 FAILED: A=0, B=1, Cin=1 => Sum=" & 
                   std_logic'image(Sum_tb) & ", Cout=" & 
                   std_logic'image(Cout_tb)
            severity error;
        report "Test Case 4 PASSED: A=0, B=1, Cin=1 => Sum=0, Cout=1";
        
        -- Test Case 5: A=1, B=0, Cin=0
        -- Expected: Sum=1, Cout=0 (1+0+0 = 1)
        A_tb   <= '1';
        B_tb   <= '0';
        Cin_tb <= '0';
        wait for CLK_PERIOD;
        assert (Sum_tb = '1' and Cout_tb = '0')
            report "Test Case 5 FAILED: A=1, B=0, Cin=0 => Sum=" & 
                   std_logic'image(Sum_tb) & ", Cout=" & 
                   std_logic'image(Cout_tb)
            severity error;
        report "Test Case 5 PASSED: A=1, B=0, Cin=0 => Sum=1, Cout=0";
        
        -- Test Case 6: A=1, B=0, Cin=1
        -- Expected: Sum=0, Cout=1 (1+0+1 = 2 = 10 binary)
        A_tb   <= '1';
        B_tb   <= '0';
        Cin_tb <= '1';
        wait for CLK_PERIOD;
        assert (Sum_tb = '0' and Cout_tb = '1')
            report "Test Case 6 FAILED: A=1, B=0, Cin=1 => Sum=" & 
                   std_logic'image(Sum_tb) & ", Cout=" & 
                   std_logic'image(Cout_tb)
            severity error;
        report "Test Case 6 PASSED: A=1, B=0, Cin=1 => Sum=0, Cout=1";
        
        -- Test Case 7: A=1, B=1, Cin=0
        -- Expected: Sum=0, Cout=1 (1+1+0 = 2 = 10 binary)
        A_tb   <= '1';
        B_tb   <= '1';
        Cin_tb <= '0';
        wait for CLK_PERIOD;
        assert (Sum_tb = '0' and Cout_tb = '1')
            report "Test Case 7 FAILED: A=1, B=1, Cin=0 => Sum=" & 
                   std_logic'image(Sum_tb) & ", Cout=" & 
                   std_logic'image(Cout_tb)
            severity error;
        report "Test Case 7 PASSED: A=1, B=1, Cin=0 => Sum=0, Cout=1";
        
        -- Test Case 8: A=1, B=1, Cin=1
        -- Expected: Sum=1, Cout=1 (1+1+1 = 3 = 11 binary)
        A_tb   <= '1';
        B_tb   <= '1';
        Cin_tb <= '1';
        wait for CLK_PERIOD;
        assert (Sum_tb = '1' and Cout_tb = '1')
            report "Test Case 8 FAILED: A=1, B=1, Cin=1 => Sum=" & 
                   std_logic'image(Sum_tb) & ", Cout=" & 
                   std_logic'image(Cout_tb)
            severity error;
        report "Test Case 8 PASSED: A=1, B=1, Cin=1 => Sum=1, Cout=1";
        
        -- End of test
        report "======================================";
        report "Full Adder Testbench COMPLETED";
        report "All 8 test cases passed!";
        report "======================================";
        
        wait;
    end process;
    
end Behavioral;
