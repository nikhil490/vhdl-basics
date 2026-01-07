library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
    port (
        A    : in  STD_LOGIC;
        B    : in  STD_LOGIC;
        Cin  : in  STD_LOGIC;
        Sum  : out STD_LOGIC;
        Cout : out STD_LOGIC
    );
end full_adder;

architecture Behavioral of full_adder is
begin
    -- Sum is XOR of all three inputs
    Sum  <= A xor B xor Cin;
    -- Carry out is 1 if at least two inputs are 1
    Cout <= (A and B) or (B and Cin) or (A and Cin);
end Behavioral;
