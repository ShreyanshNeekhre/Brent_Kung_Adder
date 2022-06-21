library ieee ;
use ieee.std_logic_1164.all ;

entity element_orand is 
port (
	a, b, c: in std_logic;
	d : out std_logic
);
end element_orand;

architecture dflow of element_orand is

begin

d <= a or ( b and c) after 100 ps ;

end dflow ;