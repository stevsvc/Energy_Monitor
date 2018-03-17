library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity LogicalStep_Lab3_top is port (
   clkin_50		: in	std_logic;
	pb				: in	std_logic_vector(3 downto 0);
 	sw   			: in  std_logic_vector(7 downto 0); -- The switch inputs
   leds			: out std_logic_vector(7 downto 0);	-- for displaying the switch content
   seg7_data 	: out std_logic_vector(6 downto 0); -- 7-bit outputs to a 7-segment
	seg7_char1  : out	std_logic;							-- seg7 digi selectors
	seg7_char2  : out	std_logic							-- seg7 digi selectors
	
); 
end LogicalStep_Lab3_top;

architecture Energy_Monitor of LogicalStep_Lab3_top is
--
-- Components Used
	
  component Compx5 port (
	Input_Avector :  in std_logic_vector (3 downto 0);
	Input_Bvector :  in std_logic_vector (3 downto 0);
	Output_vector :  out std_logic_vector (2 downto 0)
   );
	end component;
	 
  component SevenSegment port (
   hex   		:  in  std_logic_vector(3 downto 0);   -- The 4 bit data to be displayed
   sevenseg 	:  out std_logic_vector(6 downto 0)    -- 7-bit outputs to a 7-segment
   ); 
   end component;
	
	component segment7_mux port (
		clk				: in  std_logic := '0';
		DIN2				: in  std_logic_vector(6 downto 0);
		DIN1				: in  std_logic_vector(6 downto 0);
		DOUT 				: out std_logic_vector(6 downto 0);
		DIG2				: out std_logic;
		DIG1				: out std_logic
	);
	end component;
-- Create any signals, or temporary variables to be used
	
	signal Output_vector		: std_logic_vector(2 downto 0);
	signal seg7_A		: std_logic_vector(6 downto 0);
	signal seg7_B		: std_logic_vector(6 downto 0);
	signal leds2  : std_logic;
	signal leds0  : std_logic;
-- Here the circuit begins

begin

	--Instantiation of the extra component created allowing code readability
	
	INST1: Compx5 port map(sw(3 downto 0),sw(7 downto 4), Output_vector);
	
	--Logic that causes the leds in the FPGA board to light on or stay off
	
	leds0 <= Output_vector(2) AND not pb(2) AND not pb(1) AND not pb(0);
	leds(0) <= leds0;
	leds(1) <= Output_vector(1);
	leds2 <= Output_vector(0) AND not pb(2) AND not pb(1) AND not pb(0);
	leds(2) <= leds2;
	leds(3) <= leds2 OR  leds0;
	leds(6 downto 4) <= (pb(2 downto 0));
	
	--Instances created to output hexadecimal numbers to digit 2 and 1 respectively
	INST2: SevenSegment port map(sw(3 downto 0), seg7_A);
	INST3: SevenSegment port map(sw(7 downto 4), seg7_B);
	INST4: segment7_mux port map (clkin_50, seg7_B, seg7_A, seg7_data, seg7_char1	, seg7_char2);
 
end Energy_Monitor;

