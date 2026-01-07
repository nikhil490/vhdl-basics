library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity priority_encoder_4to2 is
    port (
        D    : in  STD_LOGIC_VECTOR(3 downto 0);  -- 4 input lines
        Y    : out STD_LOGIC_VECTOR(1 downto 0);  -- 2-bit encoded output
        VALID: out STD_LOGIC                       -- Valid output indicator
    );
end priority_encoder_4to2;

architecture Behavioral of priority_encoder_4to2 is
begin
    -- Priority: D(3) has highest priority, D(0) has lowest
    encode_proc: process(D) is
    begin
        if (D(3) = '1') then
            Y <= "11";
            VALID <= '1';
        elsif (D(2) = '1') then
            Y <= "10";
            VALID <= '1';
        elsif (D(1) = '1') then
            Y <= "01";
            VALID <= '1';
        elsif (D(0) = '1') then
            Y <= "00";
            VALID <= '1';
        else
            Y <= "00";      -- Default output
            VALID <= '0';   -- No valid input
        end if;
    end process encode_proc;
end Behavioral;
