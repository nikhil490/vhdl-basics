entity comparator_n_bit is
    generic (
        N : INTEGER := 8  -- Default width
    );
    port (
        A       : in  STD_LOGIC_VECTOR(N-1 downto 0);
        B       : in  STD_LOGIC_VECTOR(N-1 downto 0);
        A_GT_B  : out STD_LOGIC;
        A_LT_B  : out STD_LOGIC;
        A_EQ_B  : out STD_LOGIC
    );
end comparator_n_bit;

architecture Behavioral of comparator_n_bit is
begin
    compare_proc: process(A, B) is
    begin
        A_GT_B <= '0';
        A_LT_B <= '0';
        A_EQ_B <= '0';
        
        if (A > B) then
            A_GT_B <= '1';
        elsif (A < B) then
            A_LT_B <= '1';
        else
            A_EQ_B <= '1';
        end if;
    end process compare_proc;
end Behavioral;
