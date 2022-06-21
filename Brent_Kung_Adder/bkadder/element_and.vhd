library ieee ;
use ieee.std_logic_1164.all ;

entity element_and is 
port (
	a, b: in std_logic;
	c : out std_logic
);
end element_and;

architecture dflow of element_and is

begin

c <= a and b after 100 ps;

end dflow ;