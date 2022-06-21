library ieee ;
use ieee.std_logic_1164.all ;
use work.my_pkg.all ;
use ieee.numeric_std.all ;
use std.textio.all ;

entity tb is 

end entity;

architecture behave of tb is

signal a , b : std_logic_vector(31 downto 0) ;
signal cin : std_logic ;
signal s : std_logic_vector(31 downto 0);
signal cout : std_logic;
constant n : integer := 20000 ;
file vectors : text open READ_MODE is "vectors.txt";
constant wait_time : time := 2000 ps ;
begin

adder: assign4 generic map(32) port map(a => a, b =>b, cin => cin, s => s, cout => cout) ;

process 
variable vec_a, vec_b, vec_sum : integer;
variable vec_cin, vec_cout : integer;
variable buff : line ;
variable s_cout: integer ;
begin
while not ENDFILE(vectors) loop
Readline(vectors, buff) ;
if(buff(1) = '#') then
next ;
end if ;
read (buff, vec_a) ;
read (buff, vec_b) ;
read (buff, vec_cin) ;
read (buff, vec_sum) ;
read (buff, vec_cout) ;

a <= std_logic_vector(to_unsigned(vec_a ,32));
b <= std_logic_vector(to_unsigned(vec_b ,32)); 


if(vec_cin = 1) then
 cin <= '1';
else
 cin <= '0' ;
end if ;
wait for wait_time ;

--wait for wait_time ;

if(cout = '1') then
 s_cout := 1;
else
 s_cout := 0 ;
end if ;

assert((vec_sum = to_integer(unsigned(s))) and (s_cout = vec_cout))
report "Incorrect Result "
severity error ;


assert((vec_sum /= to_integer(unsigned(s))) and (s_cout = vec_cout))--and (std_logic_vector(to_unsigned(vec_cout ,1))(0) /= cout))
report "Correct Result  "
severity NOTE ;

end loop ;

wait ;

end process;

end architecture ;