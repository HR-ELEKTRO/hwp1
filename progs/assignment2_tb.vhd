library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- The entity of your testbench. No ports declaration in this case.
entity assignment2_tb is
end entity;

architecture testbench of assignment2_tb is
	-- The component declaration should match your entity.
	-- It is very important that the name of the component and the 
    -- ports (remember direction of ports!) match your entity! 
	component seven_segment_decoder is
		port (
			hex_nibble: in std_ulogic_vector(3 downto 0);
			blank: in std_ulogic;
			seven_segment_code: out std_ulogic_vector(6 downto 0)
		);
	end component;
	-- Signal declaration. These signals are used to drive your
    -- inputs and store results (if required).
	signal hex_nibble_tb: std_ulogic_vector(3 downto 0);
	signal blank_tb: std_ulogic;
	signal seven_segment_code_tb: std_ulogic_vector(6 downto 0);
begin
	-- A port map is in this case nothing more than a construction to
	-- connect your entity ports with your signals.
	duv : seven_segment_decoder port map(
		hex_nibble => hex_nibble_tb, blank => blank_tb, seven_segment_code => seven_segment_code_tb
	);

	process
    	type int_array is array(0 to 15) of integer;
		constant expexted_seven_segment_code: int_array := (
       		16#40#, 16#79#, 16#24#, 16#30#, 
			16#19#, 16#12#, 16#02#, 16#78#,
       		16#00#, 16#10#, 16#08#, 16#03#, 
			16#46#, 16#21#, 16#06#, 16#0E#
		);
	begin
		report "Testing entity assignment2.";
		-- Initialize signals.
		hex_nibble_tb <= "0000";

		blank_tb <= '1';
		wait for 10 ns;
		-- Check blank.
		assert seven_segment_code_tb = "1111111"
			report "test failed for blank = 1" severity error; 

		blank_tb <= '0';
		-- Loop through all possible values of switches.
		for i in 0 to 15 loop
			hex_nibble_tb <= std_ulogic_vector(to_unsigned(i, hex_nibble_tb'length));
			wait for 10 ns;
			
			-- Check result.
			assert seven_segment_code_tb = std_ulogic_vector(to_unsigned(
					expexted_seven_segment_code(i), seven_segment_code_tb'length
				))
				report "test failed for i = " & to_string(i)
				severity error; 
		end loop;

		report "Test completed.";
		std.env.stop;
	end process;

end architecture;
