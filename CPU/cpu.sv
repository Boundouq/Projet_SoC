module cpu(
  input req,
  input reset,
  input instr_rvalid_in,
  input gnt_in,
  input [31:0] instr_rdata_in,
  //
  input data_gnt_in,
  input data_rvalid,
  input [4:0] rd_in_data,
  input [31:0] data_rdata_in,
  //
  output reg instr_req_out,
  output reg [31:0] instr_addr_out,
  output reg [6:0] opc,
  //
  output reg [31:0] data_add_o,
  output reg [31:0] data_wdata_o,
  output reg [3:0] data_be_o,
  output reg data_we_o,
  output reg data_req_o,
  output reg [4:0] rd_out_data
  );


  logic [31:0] instr_out, rd, rs1, rs2, imm, pc, pc_out,branch_pc_out,lsu_out;
  logic [2:0] funct3;
  logic [6:0] funct7,opcode;
  logic [4:0] rd_in,rd_out,rs1_n,rs2_n;
  logic br, rs_read, rd_write_in,valid_out,alu_sub_sra_out,rd_write_out,stall_in,alu_non_zero_out;
  logic branch_pc_src_out, branch_out, branch_in;
  logic [3:0] branch_op_out;
  logic execute_branch_predicted_taken;


  fetch fetch(
    .req(req),
    .reset(reset),

    .instr_rvalid_in(instr_rvalid_in),
    .gnt_in(gnt_in),
    .instr_rdata_in(instr_rdata_in),

    .branch_mispredicted_in(br),
    .pc_in(branch_pc_out),


    .instr_req_out(instr_req_out),
    .instr_addr_out(instr_addr_out),
    .instr_read_out(rs_read),
    .instr_out(instr_out),
    .pc_out(pc),
    .opc(opc)
    );

  decode deco(
    .req_1(req),

    .reset(reset),
    .rs_read(!rs_read),
    .instr_in(instr_out),

    .pc_in_dec(pc),
    .pc_out_dec(pc_out),

    .valid_out(valid_out),
    .funct3_out(funct3),        //needed in ALU
    .funct7_out(funct7),       //needed in ALU
    .alu_op_out(opcode),
    .alu_sub_sra_out(alu_sub_sra_out),
    .rd_out(rd_out),
    .rd_write_out(rd_write_out),
    .imm_value_out(imm),          //needed in ALU
    .rs1(rs1_n),
    .rs2(rs2_n)
    );

  regs regs (
    .req_r(req),
    .req_w(req),
    .rs_read(!rs_read),
    .rs1_in(rs1_n),
    .rs2_in(rs2_n),
    .rd_in(rd_in),
    .rd_write_in(rd_write_in),

    .rd_value_in(rd),
    .rs1_value_out(rs1),
    .rs2_value_out(rs2)
    );

  execute exec (
    .stall_in(valid_out),


    .alu_opcode_in(opcode),
    .alu_funct3(funct3),
    .alu_funct7(funct7),

    .rs1_value_in(rs1),
    .rs2_value_in(rs2),
    .imm_value_in(imm),
    .pc_co_in(pc_out),

    .branch_pc_out(branch_pc_out),
    .branch_mispredicted_out(br),

    .rd_in(rd_out),
    .rd_out(rd_in),
    .rd_write(rd_write_in),
    .alu_non_zero_out(alu_non_zero_out),
    .lsu_out(lsu_out),

    .result_out(rd)
    );

  lsu lsu (
    .opcode_in(opcode),//
    .funct3(funct3),
    .rd_in_lsu(rd_out),//
    .rd_in_data(rd_in_data),//
    .mem_valid(valid_out),//
    .data_add_in(lsu_out),//
    .mem_wdata_in(rs2),//
    //
    .data_gnt_in(data_gnt_in),
    .data_rvalid(data_rvalid),//
    .data_rdata_in(data_rdata_in),//
    .data_add_o(data_add_o),//
    .data_wdata_o(data_wdata_o),//
    .data_be_o(data_be_o),//
    .data_we_o(data_we_o),//
    .data_req_o(data_req_o),//
      //
    .rd_write(rd_write_in),//
    .rd_out_lsu(rd_in),//
    .rd_out_data(rd_data_in),
    .mem_data_out(rd)//
    );

endmodule
