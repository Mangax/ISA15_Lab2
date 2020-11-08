-- Register
-- Creation date: 10/10/2020
-- simple register used to delay the samples from one stage to another one

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg is 
generic(
	Nbit : integer := 32);	-- # of bits

port (
	CLK : IN std_logic;			-- clock
	S_in : IN signed (Nbit-1 downto 0);	-- input sample
	S_out : OUT signed(Nbit-1 downto 0)	-- output sample
	);
end reg;

architecture bhe of reg is 

begin

-- process for synchronous operation
process(CLK)

begin 
	
	
	if (rising_edge(CLK)) then	-- normal operation synchronous with clock
		 
			S_out <= S_in; 
		
	end if; 
end process;

end bhe;  
