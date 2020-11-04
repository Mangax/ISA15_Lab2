library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_textio.all;

library std;
use std.textio.all;

entity data_sink is
  port (	CLK   : in std_logic;
			RST_n : in std_logic;
    		DIN   : in std_logic_vector(31 downto 0));
end data_sink;

architecture beh of data_sink is

begin  -- beh

  process (CLK)
    file res_fp : text open WRITE_MODE is "../data/tb_results.hex";
    variable line_out : line;

	variable counter_latency : natural range 0 to 5 := 0;
   
  begin  -- process
    if RST_n /='1' then
      null;
    elsif CLK'event and CLK = '1' then  -- rising clock edge
		if counter_latency < 5  then
			counter_latency := counter_latency + 1;
		else
	        hwrite(line_out, DIN);
	        writeline(res_fp, line_out);
		end if;
    end if;
  end process;

end beh;
