
module fetch_DW01_inc_1 ( A, SUM );
  input [31:0] A;
  output [31:0] SUM;

  wire   [31:2] carry;

  ADD22 U1_1_30 ( .A(A[30]), .B(carry[30]), .CO(carry[31]), .S(SUM[30]) );
  ADD22 U1_1_29 ( .A(A[29]), .B(carry[29]), .CO(carry[30]), .S(SUM[29]) );
  ADD22 U1_1_28 ( .A(A[28]), .B(carry[28]), .CO(carry[29]), .S(SUM[28]) );
  ADD22 U1_1_27 ( .A(A[27]), .B(carry[27]), .CO(carry[28]), .S(SUM[27]) );
  ADD22 U1_1_26 ( .A(A[26]), .B(carry[26]), .CO(carry[27]), .S(SUM[26]) );
  ADD22 U1_1_25 ( .A(A[25]), .B(carry[25]), .CO(carry[26]), .S(SUM[25]) );
  ADD22 U1_1_24 ( .A(A[24]), .B(carry[24]), .CO(carry[25]), .S(SUM[24]) );
  ADD22 U1_1_23 ( .A(A[23]), .B(carry[23]), .CO(carry[24]), .S(SUM[23]) );
  ADD22 U1_1_22 ( .A(A[22]), .B(carry[22]), .CO(carry[23]), .S(SUM[22]) );
  ADD22 U1_1_21 ( .A(A[21]), .B(carry[21]), .CO(carry[22]), .S(SUM[21]) );
  ADD22 U1_1_20 ( .A(A[20]), .B(carry[20]), .CO(carry[21]), .S(SUM[20]) );
  ADD22 U1_1_19 ( .A(A[19]), .B(carry[19]), .CO(carry[20]), .S(SUM[19]) );
  ADD22 U1_1_18 ( .A(A[18]), .B(carry[18]), .CO(carry[19]), .S(SUM[18]) );
  ADD22 U1_1_17 ( .A(A[17]), .B(carry[17]), .CO(carry[18]), .S(SUM[17]) );
  ADD22 U1_1_16 ( .A(A[16]), .B(carry[16]), .CO(carry[17]), .S(SUM[16]) );
  ADD22 U1_1_15 ( .A(A[15]), .B(carry[15]), .CO(carry[16]), .S(SUM[15]) );
  ADD22 U1_1_14 ( .A(A[14]), .B(carry[14]), .CO(carry[15]), .S(SUM[14]) );
  ADD22 U1_1_13 ( .A(A[13]), .B(carry[13]), .CO(carry[14]), .S(SUM[13]) );
  ADD22 U1_1_12 ( .A(A[12]), .B(carry[12]), .CO(carry[13]), .S(SUM[12]) );
  ADD22 U1_1_11 ( .A(A[11]), .B(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  ADD22 U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADD22 U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADD22 U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADD22 U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADD22 U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADD22 U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADD22 U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADD22 U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADD22 U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADD22 U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  XOR20 U1 ( .A(carry[31]), .B(A[31]), .Q(SUM[31]) );
endmodule


module fetch ( req, reset, instr_rvalid_in, gnt_in, instr_rdata_in, 
        branch_mispredicted_in, pc_in, instr_req_out, instr_addr_out, 
        instr_read_out, instr_out, pc_out, opc );
  input [31:0] instr_rdata_in;
  input [31:0] pc_in;
  output [31:0] instr_addr_out;
  output [31:0] instr_out;
  output [31:0] pc_out;
  output [6:0] opc;
  input req, reset, instr_rvalid_in, gnt_in, branch_mispredicted_in;
  output instr_req_out, instr_read_out;
  wire   instr_read_out, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21, N22,
         N23, N24, N25, N26, N27, N28, N29, N30, N31, N32, N33, N34, N35, N36,
         N37, N38, N39, N40, N41, N42, N44, N45, N46, N47, N48, N49, N50, N51,
         N52, N53, N54, N55, N56, N57, N58, N59, N60, N61, N62, N63, N64, N65,
         N66, N67, N68, N69, N70, N71, N72, N73, N74, N75, n1, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202;
  wire   [31:0] next_pc;
  wire   SYNOPSYS_UNCONNECTED__0;
  assign instr_read_out = instr_rvalid_in;

  DLPQ3 instr_req_out_reg ( .SN(n1), .D(n168), .GN(n170), .Q(instr_req_out) );
  DLPQ3 \instr_addr_out_reg[1]  ( .SN(n1), .D(n191), .GN(n170), .Q(
        instr_addr_out[1]) );
  DLPQ3 \instr_addr_out_reg[2]  ( .SN(n1), .D(n180), .GN(n170), .Q(
        instr_addr_out[2]) );
  DLPQ3 \instr_addr_out_reg[3]  ( .SN(n1), .D(n177), .GN(n170), .Q(
        instr_addr_out[3]) );
  DLPQ3 \instr_addr_out_reg[4]  ( .SN(n1), .D(n176), .GN(n170), .Q(
        instr_addr_out[4]) );
  DLPQ3 \instr_addr_out_reg[5]  ( .SN(n1), .D(n175), .GN(n170), .Q(
        instr_addr_out[5]) );
  DLPQ3 \instr_addr_out_reg[6]  ( .SN(n1), .D(n174), .GN(n170), .Q(
        instr_addr_out[6]) );
  DLPQ3 \instr_addr_out_reg[7]  ( .SN(n1), .D(n173), .GN(n170), .Q(
        instr_addr_out[7]) );
  DLPQ3 \instr_addr_out_reg[8]  ( .SN(n1), .D(n172), .GN(n170), .Q(
        instr_addr_out[8]) );
  DLPQ3 \instr_addr_out_reg[9]  ( .SN(n1), .D(n171), .GN(n170), .Q(
        instr_addr_out[9]) );
  DLPQ3 \instr_addr_out_reg[10]  ( .SN(n1), .D(n201), .GN(n170), .Q(
        instr_addr_out[10]) );
  DLPQ3 \instr_addr_out_reg[11]  ( .SN(n1), .D(n200), .GN(n170), .Q(
        instr_addr_out[11]) );
  DLPQ3 \instr_addr_out_reg[12]  ( .SN(n1), .D(n199), .GN(n170), .Q(
        instr_addr_out[12]) );
  DLPQ3 \instr_addr_out_reg[13]  ( .SN(n1), .D(n198), .GN(n170), .Q(
        instr_addr_out[13]) );
  DLPQ3 \instr_addr_out_reg[14]  ( .SN(n1), .D(n197), .GN(n170), .Q(
        instr_addr_out[14]) );
  DLPQ3 \instr_addr_out_reg[15]  ( .SN(n1), .D(n196), .GN(n170), .Q(
        instr_addr_out[15]) );
  DLPQ3 \instr_addr_out_reg[16]  ( .SN(n1), .D(n195), .GN(n170), .Q(
        instr_addr_out[16]) );
  DLPQ3 \instr_addr_out_reg[17]  ( .SN(n1), .D(n194), .GN(n170), .Q(
        instr_addr_out[17]) );
  DLPQ3 \instr_addr_out_reg[18]  ( .SN(n1), .D(n193), .GN(n170), .Q(
        instr_addr_out[18]) );
  DLPQ3 \instr_addr_out_reg[19]  ( .SN(n1), .D(n192), .GN(n170), .Q(
        instr_addr_out[19]) );
  DLPQ3 \instr_addr_out_reg[20]  ( .SN(n1), .D(n190), .GN(n170), .Q(
        instr_addr_out[20]) );
  DLPQ3 \instr_addr_out_reg[21]  ( .SN(n1), .D(n189), .GN(n170), .Q(
        instr_addr_out[21]) );
  DLPQ3 \instr_addr_out_reg[22]  ( .SN(n1), .D(n188), .GN(n170), .Q(
        instr_addr_out[22]) );
  DLPQ3 \instr_addr_out_reg[23]  ( .SN(n1), .D(n187), .GN(n170), .Q(
        instr_addr_out[23]) );
  DLPQ3 \instr_addr_out_reg[24]  ( .SN(n1), .D(n186), .GN(n170), .Q(
        instr_addr_out[24]) );
  DLPQ3 \instr_addr_out_reg[25]  ( .SN(n1), .D(n185), .GN(n170), .Q(
        instr_addr_out[25]) );
  DLPQ3 \instr_addr_out_reg[26]  ( .SN(n1), .D(n184), .GN(n170), .Q(
        instr_addr_out[26]) );
  DLPQ3 \instr_addr_out_reg[27]  ( .SN(n1), .D(n183), .GN(n170), .Q(
        instr_addr_out[27]) );
  DLPQ3 \instr_addr_out_reg[28]  ( .SN(n1), .D(n182), .GN(n170), .Q(
        instr_addr_out[28]) );
  DLPQ3 \instr_addr_out_reg[29]  ( .SN(n1), .D(n181), .GN(n170), .Q(
        instr_addr_out[29]) );
  DLPQ3 \instr_addr_out_reg[30]  ( .SN(n1), .D(n179), .GN(n170), .Q(
        instr_addr_out[30]) );
  DLPQ3 \instr_addr_out_reg[31]  ( .SN(n1), .D(n178), .GN(n170), .Q(
        instr_addr_out[31]) );
  DLPQ3 \instr_addr_out_reg[0]  ( .SN(n1), .D(n202), .GN(n170), .Q(
        instr_addr_out[0]) );
  fetch_DW01_inc_1 add_53 ( .A({n178, n179, n181, n182, n183, n184, n185, n186, 
        n187, n188, n189, n190, n192, n193, n194, n195, n196, n197, n198, n199, 
        n200, n201, n171, n172, n173, n174, n175, n176, n177, n180, n191, n202}), .SUM({N42, N41, N40, N39, N38, N37, N36, N35, N34, N33, N32, N31, N30, N29, 
        N28, N27, N26, N25, N24, N23, N22, N21, N20, N19, N18, N17, N16, N15, 
        N14, N13, N12, SYNOPSYS_UNCONNECTED__0}) );
  DFE1 \next_pc_reg[0]  ( .D(N44), .E(n169), .C(req), .Q(next_pc[0]) );
  DFE1 \next_pc_reg[1]  ( .D(N45), .E(n169), .C(req), .Q(next_pc[1]) );
  DFE1 \next_pc_reg[2]  ( .D(N46), .E(n169), .C(req), .Q(next_pc[2]) );
  DFE1 \next_pc_reg[3]  ( .D(N47), .E(n169), .C(req), .Q(next_pc[3]) );
  DFE1 \next_pc_reg[4]  ( .D(N48), .E(n169), .C(req), .Q(next_pc[4]) );
  DFE1 \next_pc_reg[5]  ( .D(N49), .E(n169), .C(req), .Q(next_pc[5]) );
  DFE1 \next_pc_reg[6]  ( .D(N50), .E(n169), .C(req), .Q(next_pc[6]) );
  DFE1 \next_pc_reg[7]  ( .D(N51), .E(n169), .C(req), .Q(next_pc[7]) );
  DFE1 \next_pc_reg[8]  ( .D(N52), .E(n169), .C(req), .Q(next_pc[8]) );
  DFE1 \next_pc_reg[9]  ( .D(N53), .E(n169), .C(req), .Q(next_pc[9]) );
  DFE1 \next_pc_reg[10]  ( .D(N54), .E(n169), .C(req), .Q(next_pc[10]) );
  DFE1 \next_pc_reg[11]  ( .D(N55), .E(n169), .C(req), .Q(next_pc[11]) );
  DFE1 \next_pc_reg[12]  ( .D(N56), .E(n169), .C(req), .Q(next_pc[12]) );
  DFE1 \next_pc_reg[13]  ( .D(N57), .E(n169), .C(req), .Q(next_pc[13]) );
  DFE1 \next_pc_reg[14]  ( .D(N58), .E(n169), .C(req), .Q(next_pc[14]) );
  DFE1 \next_pc_reg[15]  ( .D(N59), .E(n169), .C(req), .Q(next_pc[15]) );
  DFE1 \next_pc_reg[16]  ( .D(N60), .E(n169), .C(req), .Q(next_pc[16]) );
  DFE1 \next_pc_reg[17]  ( .D(N61), .E(n169), .C(req), .Q(next_pc[17]) );
  DFE1 \next_pc_reg[18]  ( .D(N62), .E(n169), .C(req), .Q(next_pc[18]) );
  DFE1 \next_pc_reg[19]  ( .D(N63), .E(n169), .C(req), .Q(next_pc[19]) );
  DFE1 \next_pc_reg[20]  ( .D(N64), .E(n169), .C(req), .Q(next_pc[20]) );
  DFE1 \next_pc_reg[21]  ( .D(N65), .E(n169), .C(req), .Q(next_pc[21]) );
  DFE1 \next_pc_reg[22]  ( .D(N66), .E(n169), .C(req), .Q(next_pc[22]) );
  DFE1 \next_pc_reg[23]  ( .D(N67), .E(n169), .C(req), .Q(next_pc[23]) );
  DFE1 \next_pc_reg[24]  ( .D(N68), .E(n169), .C(req), .Q(next_pc[24]) );
  DFE1 \next_pc_reg[25]  ( .D(N69), .E(n169), .C(req), .Q(next_pc[25]) );
  DFE1 \next_pc_reg[26]  ( .D(N70), .E(n169), .C(req), .Q(next_pc[26]) );
  DFE1 \next_pc_reg[27]  ( .D(N71), .E(n169), .C(req), .Q(next_pc[27]) );
  DFE1 \next_pc_reg[28]  ( .D(N72), .E(n169), .C(req), .Q(next_pc[28]) );
  DFE1 \next_pc_reg[29]  ( .D(N73), .E(n169), .C(req), .Q(next_pc[29]) );
  DFE1 \next_pc_reg[30]  ( .D(N74), .E(n169), .C(req), .Q(next_pc[30]) );
  DFE1 \next_pc_reg[31]  ( .D(N75), .E(n169), .C(req), .Q(next_pc[31]) );
  DFE1 \instr_out_reg[31]  ( .D(instr_rdata_in[31]), .E(n169), .C(req), .Q(
        instr_out[31]) );
  DFE1 \instr_out_reg[30]  ( .D(instr_rdata_in[30]), .E(n169), .C(req), .Q(
        instr_out[30]) );
  DFE1 \instr_out_reg[29]  ( .D(instr_rdata_in[29]), .E(n169), .C(req), .Q(
        instr_out[29]) );
  DFE1 \instr_out_reg[28]  ( .D(instr_rdata_in[28]), .E(n169), .C(req), .Q(
        instr_out[28]) );
  DFE1 \instr_out_reg[27]  ( .D(instr_rdata_in[27]), .E(n169), .C(req), .Q(
        instr_out[27]) );
  DFE1 \instr_out_reg[26]  ( .D(instr_rdata_in[26]), .E(n169), .C(req), .Q(
        instr_out[26]) );
  DFE1 \instr_out_reg[25]  ( .D(instr_rdata_in[25]), .E(n169), .C(req), .Q(
        instr_out[25]) );
  DFE1 \instr_out_reg[24]  ( .D(instr_rdata_in[24]), .E(n169), .C(req), .Q(
        instr_out[24]) );
  DFE1 \instr_out_reg[23]  ( .D(instr_rdata_in[23]), .E(n169), .C(req), .Q(
        instr_out[23]) );
  DFE1 \instr_out_reg[22]  ( .D(instr_rdata_in[22]), .E(n169), .C(req), .Q(
        instr_out[22]) );
  DFE1 \instr_out_reg[21]  ( .D(instr_rdata_in[21]), .E(n169), .C(req), .Q(
        instr_out[21]) );
  DFE1 \instr_out_reg[20]  ( .D(instr_rdata_in[20]), .E(n169), .C(req), .Q(
        instr_out[20]) );
  DFE1 \instr_out_reg[19]  ( .D(instr_rdata_in[19]), .E(n169), .C(req), .Q(
        instr_out[19]) );
  DFE1 \instr_out_reg[18]  ( .D(instr_rdata_in[18]), .E(n169), .C(req), .Q(
        instr_out[18]) );
  DFE1 \instr_out_reg[17]  ( .D(instr_rdata_in[17]), .E(n169), .C(req), .Q(
        instr_out[17]) );
  DFE1 \instr_out_reg[16]  ( .D(instr_rdata_in[16]), .E(n169), .C(req), .Q(
        instr_out[16]) );
  DFE1 \instr_out_reg[15]  ( .D(instr_rdata_in[15]), .E(n169), .C(req), .Q(
        instr_out[15]) );
  DFE1 \instr_out_reg[14]  ( .D(instr_rdata_in[14]), .E(n169), .C(req), .Q(
        instr_out[14]) );
  DFE1 \instr_out_reg[13]  ( .D(instr_rdata_in[13]), .E(n169), .C(req), .Q(
        instr_out[13]) );
  DFE1 \instr_out_reg[12]  ( .D(instr_rdata_in[12]), .E(n169), .C(req), .Q(
        instr_out[12]) );
  DFE1 \instr_out_reg[11]  ( .D(instr_rdata_in[11]), .E(n169), .C(req), .Q(
        instr_out[11]) );
  DFE1 \instr_out_reg[10]  ( .D(instr_rdata_in[10]), .E(n169), .C(req), .Q(
        instr_out[10]) );
  DFE1 \instr_out_reg[9]  ( .D(instr_rdata_in[9]), .E(n169), .C(req), .Q(
        instr_out[9]) );
  DFE1 \instr_out_reg[8]  ( .D(instr_rdata_in[8]), .E(n169), .C(req), .Q(
        instr_out[8]) );
  DFE1 \instr_out_reg[7]  ( .D(instr_rdata_in[7]), .E(n169), .C(req), .Q(
        instr_out[7]) );
  DFE1 \instr_out_reg[6]  ( .D(instr_rdata_in[6]), .E(n169), .C(req), .Q(
        instr_out[6]) );
  DFE1 \instr_out_reg[5]  ( .D(instr_rdata_in[5]), .E(n169), .C(req), .Q(
        instr_out[5]) );
  DFE1 \instr_out_reg[4]  ( .D(instr_rdata_in[4]), .E(n169), .C(req), .Q(
        instr_out[4]) );
  DFE1 \instr_out_reg[3]  ( .D(instr_rdata_in[3]), .E(n169), .C(req), .Q(
        instr_out[3]) );
  DFE1 \instr_out_reg[2]  ( .D(instr_rdata_in[2]), .E(n169), .C(req), .Q(
        instr_out[2]) );
  DFE1 \instr_out_reg[1]  ( .D(instr_rdata_in[1]), .E(n169), .C(req), .Q(
        instr_out[1]) );
  DFE1 \instr_out_reg[0]  ( .D(instr_rdata_in[0]), .E(n169), .C(req), .Q(
        instr_out[0]) );
  DFE1 \pc_out_reg[31]  ( .D(n178), .E(n169), .C(req), .Q(pc_out[31]) );
  DFE1 \pc_out_reg[30]  ( .D(n179), .E(n169), .C(req), .Q(pc_out[30]) );
  DFE1 \pc_out_reg[29]  ( .D(n181), .E(n169), .C(req), .Q(pc_out[29]) );
  DFE1 \pc_out_reg[28]  ( .D(n182), .E(n169), .C(req), .Q(pc_out[28]) );
  DFE1 \pc_out_reg[27]  ( .D(n183), .E(n169), .C(req), .Q(pc_out[27]) );
  DFE1 \pc_out_reg[26]  ( .D(n184), .E(n169), .C(req), .Q(pc_out[26]) );
  DFE1 \pc_out_reg[25]  ( .D(n185), .E(n169), .C(req), .Q(pc_out[25]) );
  DFE1 \pc_out_reg[24]  ( .D(n186), .E(n169), .C(req), .Q(pc_out[24]) );
  DFE1 \pc_out_reg[23]  ( .D(n187), .E(n169), .C(req), .Q(pc_out[23]) );
  DFE1 \pc_out_reg[22]  ( .D(n188), .E(n169), .C(req), .Q(pc_out[22]) );
  DFE1 \pc_out_reg[21]  ( .D(n189), .E(n169), .C(req), .Q(pc_out[21]) );
  DFE1 \pc_out_reg[20]  ( .D(n190), .E(n169), .C(req), .Q(pc_out[20]) );
  DFE1 \pc_out_reg[19]  ( .D(n192), .E(n169), .C(req), .Q(pc_out[19]) );
  DFE1 \pc_out_reg[18]  ( .D(n193), .E(n169), .C(req), .Q(pc_out[18]) );
  DFE1 \pc_out_reg[17]  ( .D(n194), .E(n169), .C(req), .Q(pc_out[17]) );
  DFE1 \pc_out_reg[16]  ( .D(n195), .E(n169), .C(req), .Q(pc_out[16]) );
  DFE1 \pc_out_reg[15]  ( .D(n196), .E(n169), .C(req), .Q(pc_out[15]) );
  DFE1 \pc_out_reg[14]  ( .D(n197), .E(n169), .C(req), .Q(pc_out[14]) );
  DFE1 \pc_out_reg[13]  ( .D(n198), .E(n169), .C(req), .Q(pc_out[13]) );
  DFE1 \pc_out_reg[12]  ( .D(n199), .E(n169), .C(req), .Q(pc_out[12]) );
  DFE1 \pc_out_reg[11]  ( .D(n200), .E(n169), .C(req), .Q(pc_out[11]) );
  DFE1 \pc_out_reg[10]  ( .D(n201), .E(n169), .C(req), .Q(pc_out[10]) );
  DFE1 \pc_out_reg[9]  ( .D(n171), .E(n169), .C(req), .Q(pc_out[9]) );
  DFE1 \pc_out_reg[8]  ( .D(n172), .E(n169), .C(req), .Q(pc_out[8]) );
  DFE1 \pc_out_reg[7]  ( .D(n173), .E(n169), .C(req), .Q(pc_out[7]) );
  DFE1 \pc_out_reg[6]  ( .D(n174), .E(n169), .C(req), .Q(pc_out[6]) );
  DFE1 \pc_out_reg[5]  ( .D(n175), .E(n169), .C(req), .Q(pc_out[5]) );
  DFE1 \pc_out_reg[4]  ( .D(n176), .E(n169), .C(req), .Q(pc_out[4]) );
  DFE1 \pc_out_reg[3]  ( .D(n177), .E(n169), .C(req), .Q(pc_out[3]) );
  DFE1 \pc_out_reg[2]  ( .D(n180), .E(n169), .C(req), .Q(pc_out[2]) );
  DFE1 \pc_out_reg[1]  ( .D(n191), .E(n169), .C(req), .Q(pc_out[1]) );
  DFE1 \pc_out_reg[0]  ( .D(n202), .E(n169), .C(req), .Q(pc_out[0]) );
  DFE1 \opc_reg[6]  ( .D(instr_rdata_in[6]), .E(instr_read_out), .C(req), .Q(
        opc[6]) );
  DFE1 \opc_reg[5]  ( .D(instr_rdata_in[5]), .E(instr_read_out), .C(req), .Q(
        opc[5]) );
  DFE1 \opc_reg[4]  ( .D(instr_rdata_in[4]), .E(instr_read_out), .C(req), .Q(
        opc[4]) );
  DFE1 \opc_reg[3]  ( .D(instr_rdata_in[3]), .E(instr_read_out), .C(req), .Q(
        opc[3]) );
  DFE1 \opc_reg[2]  ( .D(instr_rdata_in[2]), .E(instr_read_out), .C(req), .Q(
        opc[2]) );
  DFE1 \opc_reg[1]  ( .D(instr_rdata_in[1]), .E(instr_read_out), .C(req), .Q(
        opc[1]) );
  DFE1 \opc_reg[0]  ( .D(instr_rdata_in[0]), .E(instr_read_out), .C(req), .Q(
        opc[0]) );
  NAND26 U170 ( .A(n135), .B(n168), .Q(n169) );
  CLKIN3 U171 ( .A(reset), .Q(n168) );
  NOR22 U172 ( .A(n136), .B(n168), .Q(n170) );
  LOGIC1 U173 ( .Q(n1) );
  CLKIN0 U174 ( .A(instr_read_out), .Q(n135) );
  CLKIN0 U175 ( .A(gnt_in), .Q(n136) );
  MUX21 U176 ( .A(next_pc[9]), .B(pc_in[9]), .S(branch_mispredicted_in), .Q(
        n171) );
  MUX21 U177 ( .A(next_pc[8]), .B(pc_in[8]), .S(branch_mispredicted_in), .Q(
        n172) );
  MUX21 U178 ( .A(next_pc[7]), .B(pc_in[7]), .S(branch_mispredicted_in), .Q(
        n173) );
  MUX21 U179 ( .A(next_pc[6]), .B(pc_in[6]), .S(branch_mispredicted_in), .Q(
        n174) );
  MUX21 U180 ( .A(next_pc[5]), .B(pc_in[5]), .S(branch_mispredicted_in), .Q(
        n175) );
  MUX21 U181 ( .A(next_pc[4]), .B(pc_in[4]), .S(branch_mispredicted_in), .Q(
        n176) );
  MUX21 U182 ( .A(next_pc[3]), .B(pc_in[3]), .S(branch_mispredicted_in), .Q(
        n177) );
  MUX21 U183 ( .A(next_pc[31]), .B(pc_in[31]), .S(branch_mispredicted_in), .Q(
        n178) );
  MUX21 U184 ( .A(next_pc[30]), .B(pc_in[30]), .S(branch_mispredicted_in), .Q(
        n179) );
  MUX21 U185 ( .A(next_pc[2]), .B(pc_in[2]), .S(branch_mispredicted_in), .Q(
        n180) );
  MUX21 U186 ( .A(next_pc[29]), .B(pc_in[29]), .S(branch_mispredicted_in), .Q(
        n181) );
  MUX21 U187 ( .A(next_pc[28]), .B(pc_in[28]), .S(branch_mispredicted_in), .Q(
        n182) );
  MUX21 U188 ( .A(next_pc[27]), .B(pc_in[27]), .S(branch_mispredicted_in), .Q(
        n183) );
  MUX21 U189 ( .A(next_pc[26]), .B(pc_in[26]), .S(branch_mispredicted_in), .Q(
        n184) );
  MUX21 U190 ( .A(next_pc[25]), .B(pc_in[25]), .S(branch_mispredicted_in), .Q(
        n185) );
  MUX21 U191 ( .A(next_pc[24]), .B(pc_in[24]), .S(branch_mispredicted_in), .Q(
        n186) );
  MUX21 U192 ( .A(next_pc[23]), .B(pc_in[23]), .S(branch_mispredicted_in), .Q(
        n187) );
  MUX21 U193 ( .A(next_pc[22]), .B(pc_in[22]), .S(branch_mispredicted_in), .Q(
        n188) );
  MUX21 U194 ( .A(next_pc[21]), .B(pc_in[21]), .S(branch_mispredicted_in), .Q(
        n189) );
  MUX21 U195 ( .A(next_pc[20]), .B(pc_in[20]), .S(branch_mispredicted_in), .Q(
        n190) );
  MUX21 U196 ( .A(next_pc[1]), .B(pc_in[1]), .S(branch_mispredicted_in), .Q(
        n191) );
  MUX21 U197 ( .A(next_pc[19]), .B(pc_in[19]), .S(branch_mispredicted_in), .Q(
        n192) );
  MUX21 U198 ( .A(next_pc[18]), .B(pc_in[18]), .S(branch_mispredicted_in), .Q(
        n193) );
  MUX21 U199 ( .A(next_pc[17]), .B(pc_in[17]), .S(branch_mispredicted_in), .Q(
        n194) );
  MUX21 U200 ( .A(next_pc[16]), .B(pc_in[16]), .S(branch_mispredicted_in), .Q(
        n195) );
  MUX21 U201 ( .A(next_pc[15]), .B(pc_in[15]), .S(branch_mispredicted_in), .Q(
        n196) );
  MUX21 U202 ( .A(next_pc[14]), .B(pc_in[14]), .S(branch_mispredicted_in), .Q(
        n197) );
  MUX21 U203 ( .A(next_pc[13]), .B(pc_in[13]), .S(branch_mispredicted_in), .Q(
        n198) );
  MUX21 U204 ( .A(next_pc[12]), .B(pc_in[12]), .S(branch_mispredicted_in), .Q(
        n199) );
  MUX21 U205 ( .A(next_pc[11]), .B(pc_in[11]), .S(branch_mispredicted_in), .Q(
        n200) );
  MUX21 U206 ( .A(next_pc[10]), .B(pc_in[10]), .S(branch_mispredicted_in), .Q(
        n201) );
  CLKIN0 U207 ( .A(n137), .Q(N75) );
  NAND20 U208 ( .A(n168), .B(N42), .Q(n137) );
  CLKIN0 U209 ( .A(n138), .Q(N74) );
  NAND20 U210 ( .A(n168), .B(N41), .Q(n138) );
  CLKIN0 U211 ( .A(n139), .Q(N73) );
  NAND20 U212 ( .A(n168), .B(N40), .Q(n139) );
  CLKIN0 U213 ( .A(n140), .Q(N72) );
  NAND20 U214 ( .A(n168), .B(N39), .Q(n140) );
  CLKIN0 U215 ( .A(n141), .Q(N71) );
  NAND20 U216 ( .A(n168), .B(N38), .Q(n141) );
  CLKIN0 U217 ( .A(n142), .Q(N70) );
  NAND20 U218 ( .A(n168), .B(N37), .Q(n142) );
  CLKIN0 U219 ( .A(n143), .Q(N69) );
  NAND20 U220 ( .A(n168), .B(N36), .Q(n143) );
  CLKIN0 U221 ( .A(n144), .Q(N68) );
  NAND20 U222 ( .A(n168), .B(N35), .Q(n144) );
  CLKIN0 U223 ( .A(n145), .Q(N67) );
  NAND20 U224 ( .A(n168), .B(N34), .Q(n145) );
  CLKIN0 U225 ( .A(n146), .Q(N66) );
  NAND20 U226 ( .A(n168), .B(N33), .Q(n146) );
  CLKIN0 U227 ( .A(n147), .Q(N65) );
  NAND20 U228 ( .A(n168), .B(N32), .Q(n147) );
  CLKIN0 U229 ( .A(n148), .Q(N64) );
  NAND20 U230 ( .A(n168), .B(N31), .Q(n148) );
  CLKIN0 U231 ( .A(n149), .Q(N63) );
  NAND20 U232 ( .A(n168), .B(N30), .Q(n149) );
  CLKIN0 U233 ( .A(n150), .Q(N62) );
  NAND20 U234 ( .A(n168), .B(N29), .Q(n150) );
  CLKIN0 U235 ( .A(n151), .Q(N61) );
  NAND20 U236 ( .A(n168), .B(N28), .Q(n151) );
  CLKIN0 U237 ( .A(n152), .Q(N60) );
  NAND20 U238 ( .A(n168), .B(N27), .Q(n152) );
  CLKIN0 U239 ( .A(n153), .Q(N59) );
  NAND20 U240 ( .A(n168), .B(N26), .Q(n153) );
  CLKIN0 U241 ( .A(n154), .Q(N58) );
  NAND20 U242 ( .A(n168), .B(N25), .Q(n154) );
  CLKIN0 U243 ( .A(n155), .Q(N57) );
  NAND20 U244 ( .A(n168), .B(N24), .Q(n155) );
  CLKIN0 U245 ( .A(n156), .Q(N56) );
  NAND20 U246 ( .A(n168), .B(N23), .Q(n156) );
  CLKIN0 U247 ( .A(n157), .Q(N55) );
  NAND20 U248 ( .A(n168), .B(N22), .Q(n157) );
  CLKIN0 U249 ( .A(n158), .Q(N54) );
  NAND20 U250 ( .A(n168), .B(N21), .Q(n158) );
  CLKIN0 U251 ( .A(n159), .Q(N53) );
  NAND20 U252 ( .A(n168), .B(N20), .Q(n159) );
  CLKIN0 U253 ( .A(n160), .Q(N52) );
  NAND20 U254 ( .A(n168), .B(N19), .Q(n160) );
  CLKIN0 U255 ( .A(n161), .Q(N51) );
  NAND20 U256 ( .A(n168), .B(N18), .Q(n161) );
  CLKIN0 U257 ( .A(n162), .Q(N50) );
  NAND20 U258 ( .A(n168), .B(N17), .Q(n162) );
  CLKIN0 U259 ( .A(n163), .Q(N49) );
  NAND20 U260 ( .A(n168), .B(N16), .Q(n163) );
  CLKIN0 U261 ( .A(n164), .Q(N48) );
  NAND20 U262 ( .A(n168), .B(N15), .Q(n164) );
  CLKIN0 U263 ( .A(n165), .Q(N47) );
  NAND20 U264 ( .A(n168), .B(N14), .Q(n165) );
  CLKIN0 U265 ( .A(n166), .Q(N46) );
  NAND20 U266 ( .A(n168), .B(N13), .Q(n166) );
  CLKIN0 U267 ( .A(n167), .Q(N45) );
  NAND20 U268 ( .A(n168), .B(N12), .Q(n167) );
  NOR20 U269 ( .A(reset), .B(n202), .Q(N44) );
  MUX21 U270 ( .A(next_pc[0]), .B(pc_in[0]), .S(branch_mispredicted_in), .Q(
        n202) );
endmodule

