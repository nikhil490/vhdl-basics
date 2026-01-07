library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity vending_machine is
    port (
        CLK       : in  STD_LOGIC;
        RESET     : in  STD_LOGIC;
        NICKEL    : in  STD_LOGIC;  -- 5 cents inserted
        DIME      : in  STD_LOGIC;  -- 10 cents inserted
        DISPENSE  : out STD_LOGIC;  -- Dispense product (costs 15 cents)
        CHANGE    : out STD_LOGIC   -- Return change
    );
end vending_machine;

architecture OneHot of vending_machine is
    -- One-hot state encoding
    signal state : STD_LOGIC_VECTOR(3 downto 0);
    
    -- State definitions (one-hot)
    constant S0  : STD_LOGIC_VECTOR(3 downto 0) := "0001";  -- 0 cents
    constant S5  : STD_LOGIC_VECTOR(3 downto 0) := "0010";  -- 5 cents
    constant S10 : STD_LOGIC_VECTOR(3 downto 0) := "0100";  -- 10 cents
    constant S15 : STD_LOGIC_VECTOR(3 downto 0) := "1000";  -- 15+ cents (dispense)
    
begin
    fsm_proc: process(CLK, RESET) is
    begin
        if (RESET = '1') then
            state <= S0;
        elsif rising_edge(CLK) then
            -- Default: stay in current state
            case state is
                when S0 =>
                    if (NICKEL = '1') then
                        state <= S5;
                    elsif (DIME = '1') then
                        state <= S10;
                    end if;
                    
                when S5 =>
                    if (NICKEL = '1') then
                        state <= S10;
                    elsif (DIME = '1') then
                        state <= S15;
                    end if;
                    
                when S10 =>
                    if (NICKEL = '1') then
                        state <= S15;
                    elsif (DIME = '1') then
                        state <= S15;  -- Overpay - will get change
                    end if;
                    
                when S15 =>
                    state <= S0;  -- Auto-return to initial state
                    
                when others =>
                    state <= S0;
            end case;
        end if;
    end process fsm_proc;
    
    -- Output logic (combinational)
    DISPENSE <= state(3);  -- High bit indicates S15
    CHANGE   <= state(3);  -- Could be refined to detect overpayment
end OneHot;
