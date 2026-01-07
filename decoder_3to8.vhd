entity decoder_3to8 is
    port (
        SEL    : in  STD_LOGIC_VECTOR(2 downto 0);
        EN     : in  STD_LOGIC;
        Y      : out STD_LOGIC_VECTOR(7 downto 0)
    );
end decoder_3to8;

architecture Behavioral of decoder_3to8 is
begin
    decode_proc: process(SEL, EN) is
    begin
        if (EN = '0') then
            Y <= "00000000";  -- All outputs low when disabled
        else
            case SEL is
                when "000" => Y <= "00000001";
                when "001" => Y <= "00000010";
                when "010" => Y <= "00000100";
                when "011" => Y <= "00001000";
                when "100" => Y <= "00010000";
                when "101" => Y <= "00100000";
                when "110" => Y <= "01000000";
                when "111" => Y <= "10000000";
                when others => Y <= "00000000";
            end case;
        end if;
    end process decode_proc;
end Behavioral;
