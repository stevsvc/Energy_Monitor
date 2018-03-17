library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Compx5 is port (
   
 Input_Avector :  in std_logic_vector (3 downto 0);
 Input_Bvector :  in std_logic_vector (3 downto 0);
 Output_vector :  out std_logic_vector (2 downto 0)
); 

end Compx5;

architecture Behavioral of Compx5 is


  component Compx1 port (
	Input_A	   :  in  std_logic;  
   Input_B	   :  in std_logic;
	Output_G		:  out std_logic;
	Output_E		:  out std_logic;
	Output_L		:  out std_logic
   ); 
   end component;
	
	component Compx4 port (
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
   end component;
	
	signal Input_0	: std_logic;
	signal Input_1 : std_logic;
	signal Input_2 : std_logic;
	signal Input_3 : std_logic;
	signal Input_4	: std_logic;
	signal Input_5 : std_logic;
	signal Input_6 : std_logic;
	signal Input_7 : std_logic;
	signal Input_8	: std_logic;
	signal Input_9 : std_logic;
	signal Input_10 : std_logic;
	signal Input_11 : std_logic;
	
begin

	INST1: Compx1 port map (Input_Avector(3), Input_Bvector(3), Input_0, Input_1, Input_2);
   INST2: Compx1 port map (Input_Avector(2), Input_Bvector(2), Input_3, Input_4, Input_5);
	INST3: Compx1 port map (Input_Avector(1), Input_Bvector(1), Input_6, Input_7, Input_8); 
   INST4: Compx1 port map (Input_Avector(0), Input_Bvector(0), Input_9, Input_10, Input_11);
	INST5: Compx4 port map (Input_0, Input_1, Input_2, Input_3, Input_4, Input_5, Input_6, Input_7, Input_8, Input_9, Input_10, Input_11, output_vector(0), output_vector(1), output_vector(2));
	
 	
	
end architecture Behavioral; 