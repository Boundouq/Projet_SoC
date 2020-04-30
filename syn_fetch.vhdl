
library IEEE;

use IEEE.std_logic_1164.all;

package CONV_PACK_fetch is

-- define attributes
attribute ENUM_ENCODING : STRING;

-- define any necessary types
type VHDLOUT_TYPE is array (31 downto 0) of std_logic;
type VHDLOUT_TYPE_2 is array (6 downto 0) of std_logic;

end CONV_PACK_fetch;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_fetch.all;

entity fetch_DW01_inc_0 is

   port( A : in std_logic_vector (31 downto 0);  SUM : out std_logic_vector (31
         downto 0));

end fetch_DW01_inc_0;

architecture SYN_rpl of fetch_DW01_inc_0 is

   component XOR20
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component ADD22
      port( A, B : in std_logic;  CO, S : out std_logic);
   end component;
   
   signal carry_31_port, carry_30_port, carry_29_port, carry_28_port, 
      carry_27_port, carry_26_port, carry_25_port, carry_24_port, carry_23_port
      , carry_22_port, carry_21_port, carry_20_port, carry_19_port, 
      carry_18_port, carry_17_port, carry_16_port, carry_15_port, carry_14_port
      , carry_13_port, carry_12_port, carry_11_port, carry_10_port, 
      carry_9_port, carry_8_port, carry_7_port, carry_6_port, carry_5_port, 
      carry_4_port, carry_3_port, carry_2_port : std_logic;

begin
   
   U1_1_30 : ADD22 port map( A => A(30), B => carry_30_port, CO => 
                           carry_31_port, S => SUM(30));
   U1_1_29 : ADD22 port map( A => A(29), B => carry_29_port, CO => 
                           carry_30_port, S => SUM(29));
   U1_1_28 : ADD22 port map( A => A(28), B => carry_28_port, CO => 
                           carry_29_port, S => SUM(28));
   U1_1_27 : ADD22 port map( A => A(27), B => carry_27_port, CO => 
                           carry_28_port, S => SUM(27));
   U1_1_26 : ADD22 port map( A => A(26), B => carry_26_port, CO => 
                           carry_27_port, S => SUM(26));
   U1_1_25 : ADD22 port map( A => A(25), B => carry_25_port, CO => 
                           carry_26_port, S => SUM(25));
   U1_1_24 : ADD22 port map( A => A(24), B => carry_24_port, CO => 
                           carry_25_port, S => SUM(24));
   U1_1_23 : ADD22 port map( A => A(23), B => carry_23_port, CO => 
                           carry_24_port, S => SUM(23));
   U1_1_22 : ADD22 port map( A => A(22), B => carry_22_port, CO => 
                           carry_23_port, S => SUM(22));
   U1_1_21 : ADD22 port map( A => A(21), B => carry_21_port, CO => 
                           carry_22_port, S => SUM(21));
   U1_1_20 : ADD22 port map( A => A(20), B => carry_20_port, CO => 
                           carry_21_port, S => SUM(20));
   U1_1_19 : ADD22 port map( A => A(19), B => carry_19_port, CO => 
                           carry_20_port, S => SUM(19));
   U1_1_18 : ADD22 port map( A => A(18), B => carry_18_port, CO => 
                           carry_19_port, S => SUM(18));
   U1_1_17 : ADD22 port map( A => A(17), B => carry_17_port, CO => 
                           carry_18_port, S => SUM(17));
   U1_1_16 : ADD22 port map( A => A(16), B => carry_16_port, CO => 
                           carry_17_port, S => SUM(16));
   U1_1_15 : ADD22 port map( A => A(15), B => carry_15_port, CO => 
                           carry_16_port, S => SUM(15));
   U1_1_14 : ADD22 port map( A => A(14), B => carry_14_port, CO => 
                           carry_15_port, S => SUM(14));
   U1_1_13 : ADD22 port map( A => A(13), B => carry_13_port, CO => 
                           carry_14_port, S => SUM(13));
   U1_1_12 : ADD22 port map( A => A(12), B => carry_12_port, CO => 
                           carry_13_port, S => SUM(12));
   U1_1_11 : ADD22 port map( A => A(11), B => carry_11_port, CO => 
                           carry_12_port, S => SUM(11));
   U1_1_10 : ADD22 port map( A => A(10), B => carry_10_port, CO => 
                           carry_11_port, S => SUM(10));
   U1_1_9 : ADD22 port map( A => A(9), B => carry_9_port, CO => carry_10_port, 
                           S => SUM(9));
   U1_1_8 : ADD22 port map( A => A(8), B => carry_8_port, CO => carry_9_port, S
                           => SUM(8));
   U1_1_7 : ADD22 port map( A => A(7), B => carry_7_port, CO => carry_8_port, S
                           => SUM(7));
   U1_1_6 : ADD22 port map( A => A(6), B => carry_6_port, CO => carry_7_port, S
                           => SUM(6));
   U1_1_5 : ADD22 port map( A => A(5), B => carry_5_port, CO => carry_6_port, S
                           => SUM(5));
   U1_1_4 : ADD22 port map( A => A(4), B => carry_4_port, CO => carry_5_port, S
                           => SUM(4));
   U1_1_3 : ADD22 port map( A => A(3), B => carry_3_port, CO => carry_4_port, S
                           => SUM(3));
   U1_1_2 : ADD22 port map( A => A(2), B => carry_2_port, CO => carry_3_port, S
                           => SUM(2));
   U1_1_1 : ADD22 port map( A => A(1), B => A(0), CO => carry_2_port, S => 
                           SUM(1));
   U1 : XOR20 port map( A => carry_31_port, B => A(31), Q => SUM(31));

end SYN_rpl;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_fetch.all;

entity fetch is

   port( req, reset, instr_rvalid_in, gnt_in : in std_logic;  instr_rdata_in : 
         in VHDLOUT_TYPE;  branch_mispredicted_in : in std_logic;  pc_in : in 
         VHDLOUT_TYPE;  instr_req_out : out std_logic;  instr_addr_out : out 
         VHDLOUT_TYPE;  instr_read_out : out std_logic;  instr_out, pc_out : 
         out VHDLOUT_TYPE;  opc : out VHDLOUT_TYPE_2);

end fetch;

architecture SYN_verilog of fetch is

   component LOGIC1
      port( Q : out std_logic);
   end component;
   
   component INV3
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND22
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR21
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component AOI221
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component BUF2
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component DFE1
      port( D, E, C : in std_logic;  Q, QN : out std_logic);
   end component;
   
   component fetch_DW01_inc_0
      port( A : in std_logic_vector (31 downto 0);  SUM : out std_logic_vector 
            (31 downto 0));
   end component;
   
   component DLPQ3
      port( SN, D, GN : in std_logic;  Q : out std_logic);
   end component;
   
   signal next_pc_31_port, next_pc_30_port, next_pc_29_port, next_pc_28_port, 
      next_pc_27_port, next_pc_26_port, next_pc_25_port, next_pc_24_port, 
      next_pc_23_port, next_pc_22_port, next_pc_21_port, next_pc_20_port, 
      next_pc_19_port, next_pc_18_port, next_pc_17_port, next_pc_16_port, 
      next_pc_15_port, next_pc_14_port, next_pc_13_port, next_pc_12_port, 
      next_pc_11_port, next_pc_10_port, next_pc_9_port, next_pc_8_port, 
      next_pc_7_port, next_pc_6_port, next_pc_5_port, next_pc_4_port, 
      next_pc_3_port, next_pc_2_port, next_pc_1_port, next_pc_0_port, N8, N12, 
      N13, N14, N15, N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27
      , N28, N29, N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, 
      N42, N44, N45, N46, N47, N48, N49, N50, N51, N52, N53, N54, N55, N56, N57
      , N58, N59, N60, N61, N62, N63, N64, N65, N66, N67, N68, N69, N70, N71, 
      N72, N73, N74, N75, n1, n102, n103, n104, n105, n106, n107, n108, n109, 
      n110, n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, 
      n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, 
      n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, 
      n146, n147, n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, 
      n158, n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, 
      n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, 
      n182, n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, 
      n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205, 
      n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, 
      n218, n219, n220, n_1001, n_1002, n_1003, n_1004, n_1005, n_1006, n_1007,
      n_1008, n_1009, n_1010, n_1011, n_1012, n_1013, n_1014, n_1015, n_1016, 
      n_1017, n_1018, n_1019, n_1020, n_1021, n_1022, n_1023, n_1024, n_1025, 
      n_1026, n_1027, n_1028, n_1029, n_1030, n_1031, n_1032, n_1033, n_1034, 
      n_1035, n_1036, n_1037, n_1038, n_1039, n_1040, n_1041, n_1042, n_1043, 
      n_1044, n_1045, n_1046, n_1047, n_1048, n_1049, n_1050, n_1051, n_1052, 
      n_1053, n_1054, n_1055, n_1056, n_1057, n_1058, n_1059, n_1060, n_1061, 
      n_1062, n_1063, n_1064, n_1065, n_1066, n_1067, n_1068, n_1069, n_1070, 
      n_1071, n_1072, n_1073, n_1074, n_1075, n_1076, n_1077, n_1078, n_1079, 
      n_1080, n_1081, n_1082, n_1083, n_1084, n_1085, n_1086, n_1087, n_1088, 
      n_1089, n_1090, n_1091, n_1092, n_1093, n_1094, n_1095, n_1096, n_1097, 
      n_1098, n_1099, n_1100, n_1101, n_1102, n_1103, n_1104 : std_logic;

begin
   instr_read_out <= instr_rvalid_in;
   
   instr_req_out_reg : DLPQ3 port map( SN => n1, D => n155, GN => n153, Q => 
                           instr_req_out);
   instr_addr_out_reg_1_inst : DLPQ3 port map( SN => n1, D => n209, GN => n153,
                           Q => instr_addr_out(1));
   instr_addr_out_reg_2_inst : DLPQ3 port map( SN => n1, D => n197, GN => n153,
                           Q => instr_addr_out(2));
   instr_addr_out_reg_3_inst : DLPQ3 port map( SN => n1, D => n193, GN => n153,
                           Q => instr_addr_out(3));
   instr_addr_out_reg_4_inst : DLPQ3 port map( SN => n1, D => n191, GN => n153,
                           Q => instr_addr_out(4));
   instr_addr_out_reg_5_inst : DLPQ3 port map( SN => n1, D => n189, GN => n152,
                           Q => instr_addr_out(5));
   instr_addr_out_reg_6_inst : DLPQ3 port map( SN => n1, D => n187, GN => n152,
                           Q => instr_addr_out(6));
   instr_addr_out_reg_7_inst : DLPQ3 port map( SN => n1, D => n185, GN => n152,
                           Q => instr_addr_out(7));
   instr_addr_out_reg_8_inst : DLPQ3 port map( SN => n1, D => n183, GN => n152,
                           Q => instr_addr_out(8));
   instr_addr_out_reg_9_inst : DLPQ3 port map( SN => n1, D => n181, GN => n152,
                           Q => instr_addr_out(9));
   instr_addr_out_reg_10_inst : DLPQ3 port map( SN => n1, D => n219, GN => n152
                           , Q => instr_addr_out(10));
   instr_addr_out_reg_11_inst : DLPQ3 port map( SN => n1, D => n218, GN => n152
                           , Q => instr_addr_out(11));
   instr_addr_out_reg_12_inst : DLPQ3 port map( SN => n1, D => n217, GN => n151
                           , Q => instr_addr_out(12));
   instr_addr_out_reg_13_inst : DLPQ3 port map( SN => n1, D => n216, GN => n151
                           , Q => instr_addr_out(13));
   instr_addr_out_reg_14_inst : DLPQ3 port map( SN => n1, D => n215, GN => n151
                           , Q => instr_addr_out(14));
   instr_addr_out_reg_15_inst : DLPQ3 port map( SN => n1, D => n214, GN => n151
                           , Q => instr_addr_out(15));
   instr_addr_out_reg_16_inst : DLPQ3 port map( SN => n1, D => n213, GN => n151
                           , Q => instr_addr_out(16));
   instr_addr_out_reg_17_inst : DLPQ3 port map( SN => n1, D => n212, GN => n151
                           , Q => instr_addr_out(17));
   instr_addr_out_reg_18_inst : DLPQ3 port map( SN => n1, D => n211, GN => n151
                           , Q => instr_addr_out(18));
   instr_addr_out_reg_19_inst : DLPQ3 port map( SN => n1, D => n210, GN => n150
                           , Q => instr_addr_out(19));
   instr_addr_out_reg_20_inst : DLPQ3 port map( SN => n1, D => n207, GN => n150
                           , Q => instr_addr_out(20));
   instr_addr_out_reg_21_inst : DLPQ3 port map( SN => n1, D => n206, GN => n150
                           , Q => instr_addr_out(21));
   instr_addr_out_reg_22_inst : DLPQ3 port map( SN => n1, D => n205, GN => n150
                           , Q => instr_addr_out(22));
   instr_addr_out_reg_23_inst : DLPQ3 port map( SN => n1, D => n204, GN => n150
                           , Q => instr_addr_out(23));
   instr_addr_out_reg_24_inst : DLPQ3 port map( SN => n1, D => n203, GN => n150
                           , Q => instr_addr_out(24));
   instr_addr_out_reg_25_inst : DLPQ3 port map( SN => n1, D => n202, GN => n150
                           , Q => instr_addr_out(25));
   instr_addr_out_reg_26_inst : DLPQ3 port map( SN => n1, D => n201, GN => n149
                           , Q => instr_addr_out(26));
   instr_addr_out_reg_27_inst : DLPQ3 port map( SN => n1, D => n200, GN => n149
                           , Q => instr_addr_out(27));
   instr_addr_out_reg_28_inst : DLPQ3 port map( SN => n1, D => n199, GN => n149
                           , Q => instr_addr_out(28));
   instr_addr_out_reg_29_inst : DLPQ3 port map( SN => n1, D => n198, GN => n149
                           , Q => instr_addr_out(29));
   instr_addr_out_reg_30_inst : DLPQ3 port map( SN => n1, D => n195, GN => n149
                           , Q => instr_addr_out(30));
   instr_addr_out_reg_31_inst : DLPQ3 port map( SN => n1, D => n194, GN => n149
                           , Q => instr_addr_out(31));
   instr_addr_out_reg_0_inst : DLPQ3 port map( SN => n1, D => n220, GN => n149,
                           Q => instr_addr_out(0));
   add_53 : fetch_DW01_inc_0 port map( A(31) => n194, A(30) => n195, A(29) => 
                           n198, A(28) => n199, A(27) => n200, A(26) => n201, 
                           A(25) => n202, A(24) => n203, A(23) => n204, A(22) 
                           => n205, A(21) => n206, A(20) => n207, A(19) => n210
                           , A(18) => n211, A(17) => n212, A(16) => n213, A(15)
                           => n214, A(14) => n215, A(13) => n216, A(12) => n217
                           , A(11) => n218, A(10) => n219, A(9) => n181, A(8) 
                           => n183, A(7) => n185, A(6) => n187, A(5) => n189, 
                           A(4) => n191, A(3) => n193, A(2) => n197, A(1) => 
                           n209, A(0) => n220, SUM(31) => N42, SUM(30) => N41, 
                           SUM(29) => N40, SUM(28) => N39, SUM(27) => N38, 
                           SUM(26) => N37, SUM(25) => N36, SUM(24) => N35, 
                           SUM(23) => N34, SUM(22) => N33, SUM(21) => N32, 
                           SUM(20) => N31, SUM(19) => N30, SUM(18) => N29, 
                           SUM(17) => N28, SUM(16) => N27, SUM(15) => N26, 
                           SUM(14) => N25, SUM(13) => N24, SUM(12) => N23, 
                           SUM(11) => N22, SUM(10) => N21, SUM(9) => N20, 
                           SUM(8) => N19, SUM(7) => N18, SUM(6) => N17, SUM(5) 
                           => N16, SUM(4) => N15, SUM(3) => N14, SUM(2) => N13,
                           SUM(1) => N12, SUM(0) => n_1001);
   next_pc_reg_31_inst : DFE1 port map( D => N75, E => n139, C => req, Q => 
                           next_pc_31_port, QN => n_1002);
   next_pc_reg_28_inst : DFE1 port map( D => N72, E => n140, C => req, Q => 
                           next_pc_28_port, QN => n_1003);
   next_pc_reg_29_inst : DFE1 port map( D => N73, E => n139, C => req, Q => 
                           next_pc_29_port, QN => n_1004);
   next_pc_reg_30_inst : DFE1 port map( D => N74, E => n139, C => req, Q => 
                           next_pc_30_port, QN => n_1005);
   next_pc_reg_25_inst : DFE1 port map( D => N69, E => n140, C => req, Q => 
                           next_pc_25_port, QN => n_1006);
   next_pc_reg_26_inst : DFE1 port map( D => N70, E => n140, C => req, Q => 
                           next_pc_26_port, QN => n_1007);
   next_pc_reg_27_inst : DFE1 port map( D => N71, E => n140, C => req, Q => 
                           next_pc_27_port, QN => n_1008);
   next_pc_reg_22_inst : DFE1 port map( D => N66, E => n140, C => req, Q => 
                           next_pc_22_port, QN => n_1009);
   next_pc_reg_23_inst : DFE1 port map( D => N67, E => n140, C => req, Q => 
                           next_pc_23_port, QN => n_1010);
   next_pc_reg_24_inst : DFE1 port map( D => N68, E => n140, C => req, Q => 
                           next_pc_24_port, QN => n_1011);
   next_pc_reg_20_inst : DFE1 port map( D => N64, E => n141, C => req, Q => 
                           next_pc_20_port, QN => n_1012);
   next_pc_reg_21_inst : DFE1 port map( D => N65, E => n141, C => req, Q => 
                           next_pc_21_port, QN => n_1013);
   next_pc_reg_17_inst : DFE1 port map( D => N61, E => n141, C => req, Q => 
                           next_pc_17_port, QN => n_1014);
   next_pc_reg_18_inst : DFE1 port map( D => N62, E => n141, C => req, Q => 
                           next_pc_18_port, QN => n_1015);
   next_pc_reg_19_inst : DFE1 port map( D => N63, E => n141, C => req, Q => 
                           next_pc_19_port, QN => n_1016);
   next_pc_reg_14_inst : DFE1 port map( D => N58, E => n142, C => req, Q => 
                           next_pc_14_port, QN => n_1017);
   next_pc_reg_15_inst : DFE1 port map( D => N59, E => n141, C => req, Q => 
                           next_pc_15_port, QN => n_1018);
   next_pc_reg_16_inst : DFE1 port map( D => N60, E => n141, C => req, Q => 
                           next_pc_16_port, QN => n_1019);
   next_pc_reg_11_inst : DFE1 port map( D => N55, E => n142, C => req, Q => 
                           next_pc_11_port, QN => n_1020);
   next_pc_reg_12_inst : DFE1 port map( D => N56, E => n142, C => req, Q => 
                           next_pc_12_port, QN => n_1021);
   next_pc_reg_13_inst : DFE1 port map( D => N57, E => n142, C => req, Q => 
                           next_pc_13_port, QN => n_1022);
   next_pc_reg_8_inst : DFE1 port map( D => N52, E => n142, C => req, Q => 
                           next_pc_8_port, QN => n_1023);
   next_pc_reg_9_inst : DFE1 port map( D => N53, E => n142, C => req, Q => 
                           next_pc_9_port, QN => n_1024);
   next_pc_reg_10_inst : DFE1 port map( D => N54, E => n142, C => req, Q => 
                           next_pc_10_port, QN => n_1025);
   next_pc_reg_6_inst : DFE1 port map( D => N50, E => n143, C => req, Q => 
                           next_pc_6_port, QN => n_1026);
   next_pc_reg_7_inst : DFE1 port map( D => N51, E => n143, C => req, Q => 
                           next_pc_7_port, QN => n_1027);
   next_pc_reg_3_inst : DFE1 port map( D => N47, E => n143, C => req, Q => 
                           next_pc_3_port, QN => n_1028);
   next_pc_reg_4_inst : DFE1 port map( D => N48, E => n143, C => req, Q => 
                           next_pc_4_port, QN => n_1029);
   next_pc_reg_5_inst : DFE1 port map( D => N49, E => n143, C => req, Q => 
                           next_pc_5_port, QN => n_1030);
   next_pc_reg_0_inst : DFE1 port map( D => N44, E => n144, C => req, Q => 
                           next_pc_0_port, QN => n_1031);
   next_pc_reg_1_inst : DFE1 port map( D => N45, E => n143, C => req, Q => 
                           next_pc_1_port, QN => n_1032);
   next_pc_reg_2_inst : DFE1 port map( D => N46, E => n143, C => req, Q => 
                           next_pc_2_port, QN => n_1033);
   pc_out_reg_31_inst : DFE1 port map( D => n194, E => n139, C => req, Q => 
                           pc_out(31), QN => n_1034);
   pc_out_reg_30_inst : DFE1 port map( D => n195, E => n139, C => req, Q => 
                           pc_out(30), QN => n_1035);
   pc_out_reg_29_inst : DFE1 port map( D => n198, E => n139, C => req, Q => 
                           pc_out(29), QN => n_1036);
   pc_out_reg_28_inst : DFE1 port map( D => n199, E => n139, C => req, Q => 
                           pc_out(28), QN => n_1037);
   pc_out_reg_27_inst : DFE1 port map( D => n200, E => n138, C => req, Q => 
                           pc_out(27), QN => n_1038);
   pc_out_reg_26_inst : DFE1 port map( D => n201, E => n138, C => req, Q => 
                           pc_out(26), QN => n_1039);
   pc_out_reg_25_inst : DFE1 port map( D => n202, E => n138, C => req, Q => 
                           pc_out(25), QN => n_1040);
   pc_out_reg_24_inst : DFE1 port map( D => n203, E => n138, C => req, Q => 
                           pc_out(24), QN => n_1041);
   pc_out_reg_23_inst : DFE1 port map( D => n204, E => n138, C => req, Q => 
                           pc_out(23), QN => n_1042);
   pc_out_reg_22_inst : DFE1 port map( D => n205, E => n138, C => req, Q => 
                           pc_out(22), QN => n_1043);
   pc_out_reg_21_inst : DFE1 port map( D => n206, E => n138, C => req, Q => 
                           pc_out(21), QN => n_1044);
   pc_out_reg_20_inst : DFE1 port map( D => n207, E => n137, C => req, Q => 
                           pc_out(20), QN => n_1045);
   pc_out_reg_19_inst : DFE1 port map( D => n210, E => n137, C => req, Q => 
                           pc_out(19), QN => n_1046);
   pc_out_reg_18_inst : DFE1 port map( D => n211, E => n137, C => req, Q => 
                           pc_out(18), QN => n_1047);
   pc_out_reg_17_inst : DFE1 port map( D => n212, E => n137, C => req, Q => 
                           pc_out(17), QN => n_1048);
   pc_out_reg_16_inst : DFE1 port map( D => n213, E => n137, C => req, Q => 
                           pc_out(16), QN => n_1049);
   pc_out_reg_15_inst : DFE1 port map( D => n214, E => n137, C => req, Q => 
                           pc_out(15), QN => n_1050);
   pc_out_reg_14_inst : DFE1 port map( D => n215, E => n137, C => req, Q => 
                           pc_out(14), QN => n_1051);
   pc_out_reg_13_inst : DFE1 port map( D => n216, E => n136, C => req, Q => 
                           pc_out(13), QN => n_1052);
   pc_out_reg_12_inst : DFE1 port map( D => n217, E => n136, C => req, Q => 
                           pc_out(12), QN => n_1053);
   pc_out_reg_11_inst : DFE1 port map( D => n218, E => n136, C => req, Q => 
                           pc_out(11), QN => n_1054);
   pc_out_reg_10_inst : DFE1 port map( D => n219, E => n136, C => req, Q => 
                           pc_out(10), QN => n_1055);
   pc_out_reg_9_inst : DFE1 port map( D => n181, E => n136, C => req, Q => 
                           pc_out(9), QN => n_1056);
   pc_out_reg_8_inst : DFE1 port map( D => n183, E => n136, C => req, Q => 
                           pc_out(8), QN => n_1057);
   pc_out_reg_7_inst : DFE1 port map( D => n185, E => n136, C => req, Q => 
                           pc_out(7), QN => n_1058);
   pc_out_reg_6_inst : DFE1 port map( D => n187, E => n135, C => req, Q => 
                           pc_out(6), QN => n_1059);
   pc_out_reg_5_inst : DFE1 port map( D => n189, E => n135, C => req, Q => 
                           pc_out(5), QN => n_1060);
   pc_out_reg_4_inst : DFE1 port map( D => n191, E => n135, C => req, Q => 
                           pc_out(4), QN => n_1061);
   pc_out_reg_3_inst : DFE1 port map( D => n193, E => n135, C => req, Q => 
                           pc_out(3), QN => n_1062);
   pc_out_reg_2_inst : DFE1 port map( D => n197, E => n135, C => req, Q => 
                           pc_out(2), QN => n_1063);
   pc_out_reg_1_inst : DFE1 port map( D => n209, E => n135, C => req, Q => 
                           pc_out(1), QN => n_1064);
   pc_out_reg_0_inst : DFE1 port map( D => n220, E => n135, C => req, Q => 
                           pc_out(0), QN => n_1065);
   instr_out_reg_31_inst : DFE1 port map( D => instr_rdata_in(31), E => n148, C
                           => req, Q => instr_out(31), QN => n_1066);
   instr_out_reg_30_inst : DFE1 port map( D => instr_rdata_in(30), E => n148, C
                           => req, Q => instr_out(30), QN => n_1067);
   instr_out_reg_29_inst : DFE1 port map( D => instr_rdata_in(29), E => n148, C
                           => req, Q => instr_out(29), QN => n_1068);
   instr_out_reg_28_inst : DFE1 port map( D => instr_rdata_in(28), E => n148, C
                           => req, Q => instr_out(28), QN => n_1069);
   instr_out_reg_27_inst : DFE1 port map( D => instr_rdata_in(27), E => n148, C
                           => req, Q => instr_out(27), QN => n_1070);
   instr_out_reg_26_inst : DFE1 port map( D => instr_rdata_in(26), E => n147, C
                           => req, Q => instr_out(26), QN => n_1071);
   instr_out_reg_25_inst : DFE1 port map( D => instr_rdata_in(25), E => n147, C
                           => req, Q => instr_out(25), QN => n_1072);
   instr_out_reg_24_inst : DFE1 port map( D => instr_rdata_in(24), E => n147, C
                           => req, Q => instr_out(24), QN => n_1073);
   instr_out_reg_23_inst : DFE1 port map( D => instr_rdata_in(23), E => n147, C
                           => req, Q => instr_out(23), QN => n_1074);
   instr_out_reg_22_inst : DFE1 port map( D => instr_rdata_in(22), E => n147, C
                           => req, Q => instr_out(22), QN => n_1075);
   instr_out_reg_21_inst : DFE1 port map( D => instr_rdata_in(21), E => n147, C
                           => req, Q => instr_out(21), QN => n_1076);
   instr_out_reg_20_inst : DFE1 port map( D => instr_rdata_in(20), E => n147, C
                           => req, Q => instr_out(20), QN => n_1077);
   instr_out_reg_19_inst : DFE1 port map( D => instr_rdata_in(19), E => n146, C
                           => req, Q => instr_out(19), QN => n_1078);
   instr_out_reg_18_inst : DFE1 port map( D => instr_rdata_in(18), E => n146, C
                           => req, Q => instr_out(18), QN => n_1079);
   instr_out_reg_17_inst : DFE1 port map( D => instr_rdata_in(17), E => n146, C
                           => req, Q => instr_out(17), QN => n_1080);
   instr_out_reg_16_inst : DFE1 port map( D => instr_rdata_in(16), E => n146, C
                           => req, Q => instr_out(16), QN => n_1081);
   instr_out_reg_15_inst : DFE1 port map( D => instr_rdata_in(15), E => n146, C
                           => req, Q => instr_out(15), QN => n_1082);
   instr_out_reg_14_inst : DFE1 port map( D => instr_rdata_in(14), E => n146, C
                           => req, Q => instr_out(14), QN => n_1083);
   instr_out_reg_13_inst : DFE1 port map( D => instr_rdata_in(13), E => n146, C
                           => req, Q => instr_out(13), QN => n_1084);
   instr_out_reg_12_inst : DFE1 port map( D => instr_rdata_in(12), E => n145, C
                           => req, Q => instr_out(12), QN => n_1085);
   instr_out_reg_11_inst : DFE1 port map( D => instr_rdata_in(11), E => n145, C
                           => req, Q => instr_out(11), QN => n_1086);
   instr_out_reg_10_inst : DFE1 port map( D => instr_rdata_in(10), E => n145, C
                           => req, Q => instr_out(10), QN => n_1087);
   instr_out_reg_9_inst : DFE1 port map( D => instr_rdata_in(9), E => n145, C 
                           => req, Q => instr_out(9), QN => n_1088);
   instr_out_reg_8_inst : DFE1 port map( D => instr_rdata_in(8), E => n145, C 
                           => req, Q => instr_out(8), QN => n_1089);
   instr_out_reg_7_inst : DFE1 port map( D => instr_rdata_in(7), E => n145, C 
                           => req, Q => instr_out(7), QN => n_1090);
   instr_out_reg_6_inst : DFE1 port map( D => instr_rdata_in(6), E => n145, C 
                           => req, Q => instr_out(6), QN => n_1091);
   instr_out_reg_5_inst : DFE1 port map( D => instr_rdata_in(5), E => n144, C 
                           => req, Q => instr_out(5), QN => n_1092);
   instr_out_reg_4_inst : DFE1 port map( D => instr_rdata_in(4), E => n144, C 
                           => req, Q => instr_out(4), QN => n_1093);
   instr_out_reg_3_inst : DFE1 port map( D => instr_rdata_in(3), E => n144, C 
                           => req, Q => instr_out(3), QN => n_1094);
   instr_out_reg_2_inst : DFE1 port map( D => instr_rdata_in(2), E => n144, C 
                           => req, Q => instr_out(2), QN => n_1095);
   instr_out_reg_1_inst : DFE1 port map( D => instr_rdata_in(1), E => n144, C 
                           => req, Q => instr_out(1), QN => n_1096);
   instr_out_reg_0_inst : DFE1 port map( D => instr_rdata_in(0), E => n144, C 
                           => req, Q => instr_out(0), QN => n_1097);
   opc_reg_6_inst : DFE1 port map( D => instr_rdata_in(6), E => instr_rvalid_in
                           , C => req, Q => opc(6), QN => n_1098);
   opc_reg_5_inst : DFE1 port map( D => instr_rdata_in(5), E => instr_rvalid_in
                           , C => req, Q => opc(5), QN => n_1099);
   opc_reg_4_inst : DFE1 port map( D => instr_rdata_in(4), E => instr_rvalid_in
                           , C => req, Q => opc(4), QN => n_1100);
   opc_reg_3_inst : DFE1 port map( D => instr_rdata_in(3), E => instr_rvalid_in
                           , C => req, Q => opc(3), QN => n_1101);
   opc_reg_2_inst : DFE1 port map( D => instr_rdata_in(2), E => instr_rvalid_in
                           , C => req, Q => opc(2), QN => n_1102);
   opc_reg_1_inst : DFE1 port map( D => instr_rdata_in(1), E => instr_rvalid_in
                           , C => req, Q => opc(1), QN => n_1103);
   opc_reg_0_inst : DFE1 port map( D => instr_rdata_in(0), E => instr_rvalid_in
                           , C => req, Q => opc(0), QN => n_1104);
   U170 : NOR21 port map( A => reset, B => n159, Q => N74);
   U171 : INV3 port map( A => N41, Q => n159);
   U172 : NOR21 port map( A => reset, B => n160, Q => N73);
   U173 : INV3 port map( A => N40, Q => n160);
   U174 : NOR21 port map( A => reset, B => n161, Q => N72);
   U175 : INV3 port map( A => N39, Q => n161);
   U176 : NOR21 port map( A => reset, B => n162, Q => N71);
   U177 : INV3 port map( A => N38, Q => n162);
   U178 : NOR21 port map( A => reset, B => n163, Q => N70);
   U179 : INV3 port map( A => N37, Q => n163);
   U180 : NOR21 port map( A => reset, B => n164, Q => N69);
   U181 : INV3 port map( A => N36, Q => n164);
   U182 : NOR21 port map( A => reset, B => n165, Q => N68);
   U183 : INV3 port map( A => N35, Q => n165);
   U184 : NOR21 port map( A => reset, B => n166, Q => N67);
   U185 : INV3 port map( A => N34, Q => n166);
   U186 : NOR21 port map( A => reset, B => n167, Q => N66);
   U187 : INV3 port map( A => N33, Q => n167);
   U188 : NOR21 port map( A => reset, B => n168, Q => N65);
   U189 : INV3 port map( A => N32, Q => n168);
   U190 : NOR21 port map( A => reset, B => n169, Q => N64);
   U191 : INV3 port map( A => N31, Q => n169);
   U192 : NOR21 port map( A => reset, B => n170, Q => N63);
   U193 : INV3 port map( A => N30, Q => n170);
   U194 : NOR21 port map( A => reset, B => n171, Q => N62);
   U195 : INV3 port map( A => N29, Q => n171);
   U196 : NOR21 port map( A => reset, B => n172, Q => N61);
   U197 : INV3 port map( A => N28, Q => n172);
   U198 : NOR21 port map( A => reset, B => n173, Q => N60);
   U199 : INV3 port map( A => N27, Q => n173);
   U200 : NOR21 port map( A => reset, B => n174, Q => N59);
   U201 : INV3 port map( A => N26, Q => n174);
   U202 : NOR21 port map( A => reset, B => n175, Q => N58);
   U203 : INV3 port map( A => N25, Q => n175);
   U204 : NOR21 port map( A => reset, B => n176, Q => N57);
   U205 : INV3 port map( A => N24, Q => n176);
   U206 : NOR21 port map( A => reset, B => n177, Q => N56);
   U207 : INV3 port map( A => N23, Q => n177);
   U208 : NOR21 port map( A => reset, B => n178, Q => N55);
   U209 : INV3 port map( A => N22, Q => n178);
   U210 : NOR21 port map( A => reset, B => n179, Q => N54);
   U211 : INV3 port map( A => N21, Q => n179);
   U212 : NOR21 port map( A => reset, B => n180, Q => N53);
   U213 : INV3 port map( A => N20, Q => n180);
   U214 : NOR21 port map( A => reset, B => n182, Q => N52);
   U215 : INV3 port map( A => N19, Q => n182);
   U216 : NOR21 port map( A => reset, B => n184, Q => N51);
   U217 : INV3 port map( A => N18, Q => n184);
   U218 : NOR21 port map( A => reset, B => n186, Q => N50);
   U219 : INV3 port map( A => N17, Q => n186);
   U220 : NOR21 port map( A => reset, B => n188, Q => N49);
   U221 : INV3 port map( A => N16, Q => n188);
   U222 : NOR21 port map( A => reset, B => n190, Q => N48);
   U223 : INV3 port map( A => N15, Q => n190);
   U224 : NOR21 port map( A => reset, B => n192, Q => N47);
   U225 : INV3 port map( A => N14, Q => n192);
   U226 : NOR21 port map( A => reset, B => n196, Q => N46);
   U227 : INV3 port map( A => N13, Q => n196);
   U228 : NOR21 port map( A => reset, B => n208, Q => N45);
   U229 : INV3 port map( A => N12, Q => n208);
   U230 : NOR21 port map( A => reset, B => n158, Q => N75);
   U231 : INV3 port map( A => N42, Q => n158);
   U232 : NOR21 port map( A => reset, B => n220, Q => N44);
   U233 : BUF2 port map( A => n156, Q => n135);
   U234 : BUF2 port map( A => n156, Q => n136);
   U235 : BUF2 port map( A => n156, Q => n137);
   U236 : BUF2 port map( A => n156, Q => n138);
   U237 : BUF2 port map( A => n156, Q => n139);
   U238 : BUF2 port map( A => n156, Q => n140);
   U239 : BUF2 port map( A => n156, Q => n141);
   U240 : BUF2 port map( A => n156, Q => n142);
   U241 : BUF2 port map( A => n156, Q => n143);
   U242 : BUF2 port map( A => n156, Q => n144);
   U243 : BUF2 port map( A => n156, Q => n145);
   U244 : BUF2 port map( A => n156, Q => n146);
   U245 : BUF2 port map( A => n156, Q => n147);
   U246 : BUF2 port map( A => n157, Q => n149);
   U247 : BUF2 port map( A => n157, Q => n150);
   U248 : BUF2 port map( A => n157, Q => n151);
   U249 : BUF2 port map( A => n157, Q => n152);
   U250 : BUF2 port map( A => n156, Q => n148);
   U251 : BUF2 port map( A => n157, Q => n153);
   U252 : INV3 port map( A => n133, Q => n220);
   U253 : AOI221 port map( A => next_pc_0_port, B => n154, C => pc_in(0), D => 
                           branch_mispredicted_in, Q => n133);
   U254 : INV3 port map( A => n111, Q => n197);
   U255 : AOI221 port map( A => next_pc_2_port, B => n154, C => pc_in(2), D => 
                           branch_mispredicted_in, Q => n111);
   U256 : INV3 port map( A => n122, Q => n209);
   U257 : AOI221 port map( A => next_pc_1_port, B => n154, C => pc_in(1), D => 
                           branch_mispredicted_in, Q => n122);
   U258 : INV3 port map( A => n108, Q => n193);
   U259 : AOI221 port map( A => next_pc_3_port, B => n154, C => pc_in(3), D => 
                           branch_mispredicted_in, Q => n108);
   U260 : INV3 port map( A => n106, Q => n189);
   U261 : AOI221 port map( A => next_pc_5_port, B => n154, C => pc_in(5), D => 
                           branch_mispredicted_in, Q => n106);
   U262 : INV3 port map( A => n107, Q => n191);
   U263 : AOI221 port map( A => next_pc_4_port, B => n154, C => pc_in(4), D => 
                           branch_mispredicted_in, Q => n107);
   U264 : INV3 port map( A => n104, Q => n185);
   U265 : AOI221 port map( A => next_pc_7_port, B => n154, C => pc_in(7), D => 
                           branch_mispredicted_in, Q => n104);
   U266 : INV3 port map( A => n105, Q => n187);
   U267 : AOI221 port map( A => next_pc_6_port, B => n154, C => pc_in(6), D => 
                           branch_mispredicted_in, Q => n105);
   U268 : INV3 port map( A => n132, Q => n219);
   U269 : AOI221 port map( A => next_pc_10_port, B => n154, C => pc_in(10), D 
                           => branch_mispredicted_in, Q => n132);
   U270 : INV3 port map( A => n102, Q => n181);
   U271 : AOI221 port map( A => next_pc_9_port, B => n154, C => pc_in(9), D => 
                           branch_mispredicted_in, Q => n102);
   U272 : INV3 port map( A => n103, Q => n183);
   U273 : AOI221 port map( A => next_pc_8_port, B => n154, C => pc_in(8), D => 
                           branch_mispredicted_in, Q => n103);
   U274 : INV3 port map( A => n129, Q => n216);
   U275 : AOI221 port map( A => next_pc_13_port, B => n154, C => pc_in(13), D 
                           => branch_mispredicted_in, Q => n129);
   U276 : INV3 port map( A => n130, Q => n217);
   U277 : AOI221 port map( A => next_pc_12_port, B => n154, C => pc_in(12), D 
                           => branch_mispredicted_in, Q => n130);
   U278 : INV3 port map( A => n131, Q => n218);
   U279 : AOI221 port map( A => next_pc_11_port, B => n154, C => pc_in(11), D 
                           => branch_mispredicted_in, Q => n131);
   U280 : INV3 port map( A => n126, Q => n213);
   U281 : AOI221 port map( A => next_pc_16_port, B => n154, C => pc_in(16), D 
                           => branch_mispredicted_in, Q => n126);
   U282 : INV3 port map( A => n127, Q => n214);
   U283 : AOI221 port map( A => next_pc_15_port, B => n154, C => pc_in(15), D 
                           => branch_mispredicted_in, Q => n127);
   U284 : INV3 port map( A => n128, Q => n215);
   U285 : AOI221 port map( A => next_pc_14_port, B => n154, C => pc_in(14), D 
                           => branch_mispredicted_in, Q => n128);
   U286 : INV3 port map( A => n123, Q => n210);
   U287 : AOI221 port map( A => next_pc_19_port, B => n154, C => pc_in(19), D 
                           => branch_mispredicted_in, Q => n123);
   U288 : INV3 port map( A => n124, Q => n211);
   U289 : AOI221 port map( A => next_pc_18_port, B => n154, C => pc_in(18), D 
                           => branch_mispredicted_in, Q => n124);
   U290 : INV3 port map( A => n125, Q => n212);
   U291 : AOI221 port map( A => next_pc_17_port, B => n154, C => pc_in(17), D 
                           => branch_mispredicted_in, Q => n125);
   U292 : INV3 port map( A => n120, Q => n206);
   U293 : AOI221 port map( A => next_pc_21_port, B => n154, C => pc_in(21), D 
                           => branch_mispredicted_in, Q => n120);
   U294 : INV3 port map( A => n121, Q => n207);
   U295 : AOI221 port map( A => next_pc_20_port, B => n154, C => pc_in(20), D 
                           => branch_mispredicted_in, Q => n121);
   U296 : INV3 port map( A => n119, Q => n205);
   U297 : AOI221 port map( A => next_pc_22_port, B => n154, C => pc_in(22), D 
                           => branch_mispredicted_in, Q => n119);
   U298 : INV3 port map( A => n117, Q => n203);
   U299 : AOI221 port map( A => next_pc_24_port, B => n154, C => pc_in(24), D 
                           => branch_mispredicted_in, Q => n117);
   U300 : INV3 port map( A => n118, Q => n204);
   U301 : AOI221 port map( A => next_pc_23_port, B => n154, C => pc_in(23), D 
                           => branch_mispredicted_in, Q => n118);
   U302 : INV3 port map( A => n114, Q => n200);
   U303 : AOI221 port map( A => next_pc_27_port, B => n154, C => pc_in(27), D 
                           => branch_mispredicted_in, Q => n114);
   U304 : INV3 port map( A => n115, Q => n201);
   U305 : AOI221 port map( A => next_pc_26_port, B => n154, C => pc_in(26), D 
                           => branch_mispredicted_in, Q => n115);
   U306 : INV3 port map( A => n116, Q => n202);
   U307 : AOI221 port map( A => next_pc_25_port, B => n154, C => pc_in(25), D 
                           => branch_mispredicted_in, Q => n116);
   U308 : INV3 port map( A => n110, Q => n195);
   U309 : AOI221 port map( A => next_pc_30_port, B => n154, C => pc_in(30), D 
                           => branch_mispredicted_in, Q => n110);
   U310 : INV3 port map( A => n112, Q => n198);
   U311 : AOI221 port map( A => next_pc_29_port, B => n154, C => pc_in(29), D 
                           => branch_mispredicted_in, Q => n112);
   U312 : INV3 port map( A => n113, Q => n199);
   U313 : AOI221 port map( A => next_pc_28_port, B => n154, C => pc_in(28), D 
                           => branch_mispredicted_in, Q => n113);
   U314 : INV3 port map( A => n109, Q => n194);
   U315 : AOI221 port map( A => next_pc_31_port, B => n154, C => pc_in(31), D 
                           => branch_mispredicted_in, Q => n109);
   U316 : INV3 port map( A => n134, Q => n156);
   U317 : NOR21 port map( A => instr_rvalid_in, B => reset, Q => n134);
   U318 : INV3 port map( A => branch_mispredicted_in, Q => n154);
   U319 : INV3 port map( A => N8, Q => n157);
   U320 : NAND22 port map( A => gnt_in, B => reset, Q => N8);
   U321 : INV3 port map( A => reset, Q => n155);
   U322 : LOGIC1 port map( Q => n1);

end SYN_verilog;
