-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY testbench IS
  END testbench;

  ARCHITECTURE behavior OF testbench IS 

  -- Component Declaration
 COMPONENT sen
	Port ( 
		INPUT1 : in STD_LOGIC_VECTOR(7 downto 0);
		INPUT2 : in STD_LOGIC_VECTOR(7 downto 0);
		INPUT3 : in STD_LOGIC_VECTOR(7 downto 0);
		INPUT4 : in STD_LOGIC_VECTOR(7 downto 0);
		INPUT5 : in STD_LOGIC_VECTOR(7 downto 0);
		INPUT6 : in STD_LOGIC_VECTOR(7 downto 0);
		INPUT7 : in STD_LOGIC_VECTOR(7 downto 0);
		INPUT8 : in STD_LOGIC_VECTOR(7 downto 0);
		
		OUTPUT1 : out STD_LOGIC_VECTOR(7 downto 0);
		OUTPUT2 : out STD_LOGIC_VECTOR(7 downto 0);
		OUTPUT3 : out STD_LOGIC_VECTOR(7 downto 0);
		OUTPUT4 : out STD_LOGIC_VECTOR(7 downto 0);
		OUTPUT5 : out STD_LOGIC_VECTOR(7 downto 0);
		OUTPUT6 : out STD_LOGIC_VECTOR(7 downto 0);
		OUTPUT7 : out STD_LOGIC_VECTOR(7 downto 0);
		OUTPUT8 : out STD_LOGIC_VECTOR(7 downto 0);
		
		DES : in STD_LOGIC_VECTOR(2 downto 0);
		SRC : in STD_LOGIC_VECTOR(2 downto 0));
 END COMPONENT;
		 
	signal OUTPUT0 : STD_LOGIC_VECTOR(7 downto 0);
	signal OUTPUT1 : STD_LOGIC_VECTOR(7 downto 0);
	signal OUTPUT2 : STD_LOGIC_VECTOR(7 downto 0);
	signal OUTPUT3 : STD_LOGIC_VECTOR(7 downto 0);
	signal OUTPUT4 : STD_LOGIC_VECTOR(7 downto 0);
	signal OUTPUT5 : STD_LOGIC_VECTOR(7 downto 0);
	signal OUTPUT6 : STD_LOGIC_VECTOR(7 downto 0);
	signal OUTPUT7 : STD_LOGIC_VECTOR(7 downto 0);

	signal INPUT0 : STD_LOGIC_VECTOR(7 downto 0) := "00000001";
	signal INPUT1 : STD_LOGIC_VECTOR(7 downto 0) := "00000010";
	signal INPUT2 : STD_LOGIC_VECTOR(7 downto 0) := "00000011";
	signal INPUT3 : STD_LOGIC_VECTOR(7 downto 0) := "00000100";
	signal INPUT4 : STD_LOGIC_VECTOR(7 downto 0) := "00000101";
	signal INPUT5 : STD_LOGIC_VECTOR(7 downto 0) := "00000110";
	signal INPUT6 : STD_LOGIC_VECTOR(7 downto 0) := "00000111";
	signal INPUT7 : STD_LOGIC_VECTOR(7 downto 0) := "00001000";
	
	signal DESTINATION : STD_LOGIC_VECTOR(2 downto 0) := "111";
	signal SOURCE : STD_LOGIC_VECTOR(2 downto 0) := "000";
	
	
  BEGIN

  -- Component Instantiation
          uut: SEN PORT MAP(
						INPUT0,
						INPUT1,
                  INPUT2,
						INPUT3,
						INPUT4,
						INPUT5,
						INPUT6,
						INPUT7,
						
                  OUTPUT0,
                  OUTPUT1,
                  OUTPUT2,
						OUTPUT3,
						OUTPUT4,
						OUTPUT5,
						OUTPUT6,
						OUTPUT7,
						
						DESTINATION,
						SOURCE
          );


  --  Test Bench Statements
     tb : PROCESS
     BEGIN

        wait for 100 ns; -- wait until global set/reset completes
		  
		  SOURCE <= "000";
		  DESTINATION <= "101";
		  
		  wait for 100 ns;
        
		  SOURCE <= "101";
		  DESTINATION <= "011";

		  wait for 100 ns;
        
		  SOURCE <= "110";
		  DESTINATION <= "010";
		  
        wait; -- will wait forever
     END PROCESS tb;
	  
  END;
