library ieee ;
use ieee.std_logic_1164.all ;


package my_pkg is 

component element_xor is 
port (
	a, b: in std_logic;
	c : out std_logic
);
end component ;

component element_and is 
port (
	a, b: in std_logic;
	c : out std_logic
);
end component ;

component element_orand is 
port (
	a, b, c: in std_logic;
	d : out std_logic
);
end component ;

component assign4 is 
generic ( n : integer := 8);
port (
	a, b: in std_logic_vector((n-1) downto 0);
	cin : in std_logic ;
	s : out std_logic_vector((n-1) downto 0) ;
	cout : out std_logic
);
end component ;

end my_pkg;