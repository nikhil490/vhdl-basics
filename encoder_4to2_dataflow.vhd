entity encoder_4to2_dataflow is
    port (
        D     : in  STD_LOGIC_VECTOR(3 downto 0);
        Y     : out STD_LOGIC_VECTOR(1 downto 0);
        VALID : out STD_LOGIC
    );
end encoder_4to2_dataflow;

architecture Dataflow of encoder_4to2_dataflow is
begin
    with D select
        Y <= "00" when "0001",
             "01" when "0010",
             "10" when "0100",
             "11" when "1000",
             "00" when others;
    
    -- Valid when exactly one input is active
    with D select
        VALID <= '1' when "0001" | "0010" | "0100" | "1000",
                 '0' when others;
end Dataflow;
