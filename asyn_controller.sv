module asyn_controller(
  input set,
  input reset,
  input [6:0] opcode,

  output reg req1,
  output reg req2_1,
  output reg req2_2,
  output reg req3,
  output reg req4
  );

  timeunit      1ns;
  timeprecision 1ns;

  reg req_f_in;
  reg req_f_out;
  reg req_f;
  reg ack_f_in;
  reg ack_f_out;

  reg req_d_out;
  reg req_g_out;
  reg req_d;
  reg req_g;
  reg ack_d_in;
  reg ack_g_in;
  reg ack_g;
  reg ack_d;

  reg req_e_out;
  reg ack_e_in;

  reg ack_br_in;
  reg ack_ls_in;
  reg ack_alu_in;

  reg req_br_out;
  reg req_ls_out;
  reg req_alu_out;

  reg ack_s_in;
  reg ack_l_in;
  reg req_s_out;
  reg req_l_out;

  reg ack_gp_in;
  reg req_gp_out;

  reg req_ls_2;
  reg ack_ls_in_2;
  reg req_gp_2;
  reg ack_gp_in_2;

  reg ack_l_in_r;
  reg ack_gp_in_2_r;

  reg ack_alu;
  reg req_alu;

  reg ack_br;
  reg req_br;
  reg ack_br_2;
  reg req_br_2;

  always @ ( posedge set ) begin
    if(!reset) begin
      ack_f_out = 1;
      ack_br_in = 0;
      ack_br = 0;
      ack_s_in = 1;
      ack_alu_in = 0;
      //ack_e_in = 1;
      ack_ls_in_2 = 0;
      ack_l_in = 0;
      ack_alu = 0;
      ack_e_in = 0;

      req_f_in = 0;
      req_f_out = 1;
      req_d_out = 0;
      req_g_out = 0;
      req_ls_2 = 0;
      req_l_out = 1;
      req_ls_2 = 0;
      req_gp_2 = 0;
      req_gp_out = 1;
      req_ls_out = 0;
      //req_alu_out = 1;

      req_alu = 1'b0;
      req_br = 0;
      req_br_2 = 0;

    end
    else begin
      ack_f_out = 1'bx;
      ack_br = 1'bx;
      ack_s_in = 1'bx;
      ack_alu_in = 1'bx;
      ack_e_in = 1'bx;
      ack_ls_in_2 = 1'bx;

      req_f_in = 1'bx;
      req_f_out = 1'bx;
      req_d_out = 1'bx;
      req_g_out = 1'bx;
      req_ls_2 = 1'bx;
      req_l_out = 1'bx;
      req_ls_2 = 1'bx;
      req_gp_2 = 1'bx;
      req_ls_out = 1'bx;

      req_alu = 1'bx;
    end
  end

  always @ ( posedge reset ) begin;
    if(!set) begin
      ack_f_in = 1'bx;
      ack_f_out = 1'bx;
      ack_br = 1'bx;
      ack_s_in = 1'bx;
      ack_alu_in = 1'bx;
      ack_e_in = 1'bx;
      ack_ls_in_2 = 1'bx;

      req_f_in = 1'bx;
      req_f_out = 1'bx;
      req_d_out = 1'bx;
      req_g_out = 1'bx;
      req_ls_2 = 1'bx;
      req_l_out = 1'bx;
      req_ls_2 = 1'bx;
      req_gp_2 = 1'bx;
      req_ls_out = 1'bx;

      req_alu = 1'bx;

    end
  end

  /*initial begin
    ack_f_out = 1;
    ack_br_in = 0;
    ack_s_in = 0;
    ack_alu_in = 1;
    ack_e_in = 1;
    ack_ls_in_2 = 0;

    req_f_in = 0;
    req_f_out = 1;
    req_d_out = 0;
    req_g_out = 0;
    req_ls_2 = 0;
    req_l_out = 1;
    req_ls_2 = 0;
    req_gp_2 = 0;
    req_gp_out = 1;
    req_ls_out = 0;
    //#150
    //req_l = 0;
    //ack_l_in = 1;
  end
*/
  always @ ( * ) begin
      req1   = req_f_out;
      req2_1 = req_d_out;
      req2_2 = req_g_out;
      req3   = req_ls_2;
      req4   = req_gp_2;
  end


  ctl_fetch fetch (
    .req_i(req_f_in),
    .ack_o(ack_f_in),

    .req_o(req_f_out),
    .ack_i(ack_f_out)
    );


  f DEC_GPR_f(
    .S1_ack(ack_d),
    .S2_ack(ack_g),
    .E_ack(ack_f_in),

    .E_req(req_f_out),
    .S1_req(req_d_out),
    .S2_req(req_g_out)
  );

  ctl_dec dec (
    .req_i(req_d_out),
    .ack_o(ack_d_in),

    .req_o(req_d),
    .ack_i(ack_d)
    );

  ctl_dec gpr_r (
    .req_i(req_g_out),
    .ack_o(ack_g_in),

    .req_o(req_g),
    .ack_i(ack_g)
    );

  j DEC_GPR_j(
    .E1_req(req_d),
    .E2_req(req_g),
    .S_req(req_e_out),

    .S_ack(ack_e_in),
    .E1_ack(ack_d_in),
    .E2_ack(ack_g_in)
  );

  split_3 split_3(
    .opcode(opcode),
    .ack_1(ack_br_in),
    .ack_2(ack_ls_in_2),
    .ack_3(ack_alu_in),
    .req_in(req_e_out),

    .ack_out(ack_e_in),
    .req_out_1(req_br_out),
    .req_out_2(req_ls_out),
    .req_out_3(req_alu_out)
  );


  ctl_mem mem (
    .req_i(req_ls_out),
    .ack_o(ack_ls_in),

    .req_o(req_ls_2),
    .ack_i(ack_ls_in_2)
    );

  ctl_trs trs (
    .req_i(req_alu_out),
    .ack_o(ack_alu),

    .req_o(req_alu),
    .ack_i(ack_alu_in)
    );

  ctl_br trs_br (
    .req_i(req_br_out),
    .ack_o(ack_br),

    .req_o(req_br),
    .ack_i(ack_br_in)
    );
  ctl_gpr trs_br_2 (
    .req_i(req_br),
    .ack_o(ack_br_2),

    .req_o(req_br_2),
    .ack_i(ack_br)
    );

  split_2_S_L split_2(
    .opcode(opcode),
    .ack_1(ack_s_in),
    .ack_2(ack_l_in),
    .req_in(req_ls_2),

    .ack_out(ack_ls_in),
    .req_out_1(req_s_out),
    .req_out_2(req_l_out)
  );

  merge_2_L_ALU merge_2(
    .opcode(opcode),
    .req_1(req_ls_out),
    .req_2(req_alu),
    .ack_in(ack_gp_in_2),

    .req_out(req_gp_out),
    .ack_out_1(ack_l_in),
    .ack_out_2(ack_alu)
  );


  ctl_gpr gpr (
    .req_i(req_gp_out),
    .ack_o(ack_gp_in),

    .req_o(req_gp_2),
    .ack_i(ack_gp_in_2)
    );

  merge_3 merge_3(
    .opcode(opcode),
    .req_1(req_br_out),
    .req_2(req_s_out),
    .req_3(req_gp_2),
    .ack_in(ack_f_out),

    .req_out(req_f_in),
    .ack_out_1(ack_br_2),
    .ack_out_2(ack_s_in),
    .ack_out_3(ack_gp_in)
  );

endmodule
