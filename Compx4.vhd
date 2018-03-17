library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Compx4 is port (

   --Inputs and Outputs being used
	
   Input_3G	   :  in std_logic;  
   Input_3E    :  in std_logic;
   Input_3L	   :  in std_logic;
	Input_2G	   :  in std_logic;
	Input_2E	   :  in std_logic;
	Input_2L	   :  in std_logic;
	Input_1G	   :  in std_logic;
	Input_1E	   :  in std_logic;
	Input_1L	   :  in std_logic;
	Input_0G	   :  in std_logic;
	Input_0E    :  in std_logic;
	Input_0L	   :  in std_logic;
	Output_G    :  out std_logic;
	Output_E    :  out std_logic;
	Output_L    :  out std_logic
); 

end Compx4;

architecture Behavioral of Compx4 is

begin

	--Boolean equations based on truth table
	Output_E <= (Input_3E)AND(Input_2E)AND (Input_1E)AND(Input_0E);
	Output_G <= Input_3G OR (Input_3E AND Input_2G) OR (Input_3E AND Input_2E AND Input_1G) OR  (Input_3E AND Input_2E AND Input_1E AND Input_0G); 
	Output_L <= Input_3L OR (Input_3E AND Input_2L) OR (Input_3E AND Input_2E AND Input_1L) OR (Input_3E AND Input_2E AND Input_1E AND Input_0L);
	
end architecture Behavioral; 