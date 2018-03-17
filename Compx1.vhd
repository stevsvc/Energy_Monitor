library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Compx1 is port (
   
	--Inputs and Outputs being used  
   Input_A	   :  in  std_logic;  
   Input_B	   :  in std_logic;
	Output_G		:  out std_logic;
	Output_E		:  out std_logic;
	Output_L		:  out std_logic
		
); 

end Compx1;

architecture Behavioral of Compx1 is

begin

	--Boolean equations based on truth table
	Output_G <= Input_A AND (NOT Input_B);
	Output_E <= NOT(Input_A XOR Input_B);
	Output_L <= (NOT Input_A) AND Input_B;
	
end architecture Behavioral; 