library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity d_ff_enable is
    port (
        CLK : in  STD_LOGIC;
        EN  : in  STD_LOGIC;  -- Clock enable
        D   : in  STD_LOGIC;
        Q   : out STD_LOGIC
    );
end d_ff_enable;

architecture Behavioral of d_ff_enable is
begin
    dff_en_proc: process(CLK) is
    begin
        if (rising_edge(CLK)) then
            if (EN = '1') then
                Q <= D;
            end if;
            -- Note: No else clause means Q retains its value (memory!)
        end if;
    end process dff_en_proc;
end Behavioral;
