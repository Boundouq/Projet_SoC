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

  reg req_e_out;
  reg req_e;
  reg ack_e_in;

  reg ack_br_in;
  reg ack_ls_in;
  reg ack_alu_in;

  reg req_br_out;
  reg req_ls_out;
  reg req_alu_out;
  reg req_ls;

  reg ack_s_in;
  reg ack_l_in;
  reg req_s_out;
  reg req_l_out;
  reg req_l;

  reg ack_gp_in;
  reg req_gp_out;

  reg req_gp;
  reg req_r;

  /*always @ ( posedge set ) begin
    if(!reset) begin
      ack_f_in = 0;
      req_f_out = 1;
      req_d_out = 0;
      req_g_out = 0;
      req_ls = 0;
      req_gp = 0;
    end
    else begin
      ack_f_in = 1'bx;
      req_f_out = 1'bx;
      req_d_out = 1'bx;
      req_g_out = 1'bx;
      req_ls = 1'bx;
      req_gp = 1'bx;
    end
  end

  always @ ( posedge reset ) begin
    if(!set) begin
      ack_f_in = 0;
      req_f_out = 0;
      req_d_out = 0;
      req_g_out = 0;
      req_ls = 0;
      req_gp = 0;
    end
  end
*/
  always @ ( * ) begin

      req1 = req_f_out;
      req2_1 = req_d_out;
      req2_2 = req_g_out;
      req3 = req_ls;
      req4 = req_gp;
  end

  initial begin
  ack_f_in = 0;

  req_f_in = 1;
  req_f_out = 1;
  //req_f = 0;
  req_d_out = 0;
  req_g_out = 0;
  //req_d = 0;
  //req_g = 0;
  //req_e_out = 0;
  //req_e = 0;
  //req_br_out = 0;
  //req_ls_out = 0;
  //req_alu_out = 0;
  req_ls = 0;
  //req_s_out = 0;
  //req_l_out = 0;
  //req_l = 0;
  //req_gp_out = 0;
  req_gp = 0;
  //req_r = 0;
  end
  always @ ( * ) begin
    #50 req_r = req_f_in;
  end
  always @ ( * ) begin
    #50 req_f = req_f_out;
    end
  always @ ( * ) begin

    if (req_d_out)begin
    #30 req_d = req_d_out; req_g = req_g_out;
    end
    else begin
    req_d = 0; req_g = 0;
    end
  end
  always @ ( * ) begin
    #20 req_ls = req_ls_out;
  end
  always @ ( * ) begin
  if(req_l_out)
    #30 req_l = req_l_out;
  end
  always @ ( * ) begin
    #20 req_gp = req_gp_out;
  end


  c_element fetch(
    .a(req_r),
    .b(!ack_f_in),
    .c(req_f_out)
    );
  assign ack_f_out = req_f_out;

  f DEC_GPR_f(
    .S1_ack(ack_d_in),
    .S2_ack(ack_g_in),
    .E_ack(ack_f_in),

    .E_req(req_f),
    .S1_req(req_d_out),
    .S2_req(req_g_out)
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
    .ack_2(ack_ls_in),
    .ack_3(ack_alu_in),
    .req_in(req_e_out),

    .ack_out(ack_e_in),
    .req_out_1(req_br_out),
    .req_out_2(req_ls_out),
    .req_out_3(req_alu_out)
  );

  split_2_S_L split_2(
    .opcode(opcode),
    .ack_1(ack_s_in),
    .ack_2(ack_l_in),
    .req_in(req_ls),

    .ack_out(ack_ls_in),
    .req_out_1(req_s_out),
    .req_out_2(req_l_out)
  );

  merge_2_L_ALU merge_2(
    .opcode(opcode),
    .req_1(req_l),
    .req_2(req_alu_out),
    .ack_in(ack_gp_in),

    .req_out(req_gp_out),
    .ack_out_1(ack_l_in),
    .ack_out_2(ack_alu_in)
  );

  merge_3 merge_3(
    .opcode(opcode),
    .req_1(req_br_out),
    .req_2(req_s_out),
    .req_3(req_gp),
    .ack_in(ack_f_out),

    .req_out(req_f_in),
    .ack_out_1(ack_br_in),
    .ack_out_2(ack_s_in),
    .ack_out_3(ack_gp_in)
  );

endmodule