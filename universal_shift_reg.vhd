entity universal_shift_reg is
    port (
        CLK     : in  STD_LOGIC;
        RESET   : in  STD_LOGIC;
        MODE    : in  STD_LOGIC_VECTOR(1 downto 0);  -- 00=hold, 01=left, 10=right, 11=load
        SER_L   : in  STD_LOGIC;  -- Serial input for left shift
        SER_R   : in  STD_LOGIC;  -- Serial input for right shift
        PAR_IN  : in  STD_LOGIC_VECTOR(7 downto 0);
        PAR_OUT : out STD_LOGIC_VECTOR(7 downto 0)
    );
end universal_shift_reg;

architecture Behavioral of universal_shift_reg is
    signal shift_reg : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
begin
    shift_proc: process(CLK, RESET) is
    begin
        if (RESET = '1') then
            shift_reg <= (others => '0');
        elsif rising_edge(CLK) then
            case MODE is
                when "00" =>  -- Hold
                    null;  -- Do nothing, retain value
                when "01" =>  -- Shift Left
                    shift_reg <= shift_reg(6 downto 0) & SER_L;
                when "10" =>  -- Shift Right
                    shift_reg <= SER_R & shift_reg(7 downto 1);
                when "11" =>  -- Parallel Load
                    shift_reg <= PAR_IN;
                when others =>
                    null;
            end case;
        end if;
    end process shift_proc;
    
    PAR_OUT <= shift_reg;
end Behavioral;
