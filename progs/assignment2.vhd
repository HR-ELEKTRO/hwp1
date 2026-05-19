library ieee;
use ieee.std_logic_1164.all;

-- The top-level entity of your design.
-- The signal names should match the names used in the 
-- pin assigments in pin_assignments.qsf.
-- After importing pin_assigments.qsf you can use the 
-- Assignment Editor to find these names. 
entity assignment2 is
	port (
		SW: in  std_ulogic_vector(9 downto 0);
		LEDR: out std_ulogic_vector(9 downto 0);
		HEX0: out std_ulogic_vector(6 downto 0)
	);
end entity;

architecture structural of assignment2 is
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
begin
	-- Instantiate the seven_segment_decoder here.
	-- Connect SW3 downto SW0 with inputs hex_nibble of the seven_segment_decoder;
	-- connect SW9 with input blank of the seven_segment_decoder;
	-- connect HEX0 with outputs seven_segment_code of the seven_segment_decoder.
	-- INSERT YOUR CODE HERE

	-- Connect the LEDR outputs to the SW inputs
	-- INSERT YOUR CODE HERE
end architecture;
