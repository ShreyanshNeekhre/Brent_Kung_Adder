library ieee ;
use ieee.std_logic_1164.all ;

entity element_xor is 
port (
	a, b: in std_logic;
	c : out std_logic
);
end element_xor;

architecture dflow of element_xor is

begin

c <= a xor b after 100 ps;

end dflow ;