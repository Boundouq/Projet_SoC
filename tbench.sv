module tbench;

timeunit  1ns;
timeprecision 1ns;

  bit req = 1'b0;
  bit reset = 1'b1;

logic [31:0] instr, rd, rs1, rs2, imm, pc;
logic [2:0] funct3;
logic [6:0] funct7,opcode;
logic [4:0] rd_in,rs1_unreg_out,rs2_unreg_out,rs1_out,rs2_out,rd_out;
logic rs_read, rd_write_in,rs1_read_unreg_out,rs2_read_unreg_out,valid_out,alu_sub_sra_out,rd_write_out,stall_in,alu_non_zero_out;

decode deco(
  .req(req),
  .rs_read(rs_read),
  .rd_in(rd_out),
  .rd_write_in(rd_write_in),
  .instr_in(instr),
  .rd_value_in(rd),
  .rs1_unreg_out(rs1_unreg_out),
  .rs1_read_unreg_out(rs1_read_unreg_out),
  .rs2_unreg_out(rs2_unreg_out),
  .rs2_read_unreg_out(rs2_read_unreg_out),
  .valid_out(valid_out),
  .rs1_out(rs1_out),
  .rs2_out(rs2_out),
  .funct3_out(funct3),        //needed in ALU
  .funct7_out(funct7),       //needed in ALU
  .alu_op_out(opcode),
  .alu_sub_sra_out(alu_sub_sra_out),
  .alu_src1_out(alu_src1_out),
  .alu_src2_out(alu_src2_out),
  .rd_out(rd_out),
  .rd_write_out(rd_write_out),
  .rs1_value_out(rs1),           //needed in ALU
  .rs2_value_out(rs2),          //needed in ALU
  .imm_value_out(imm)          //needed in ALU

  );

execute exec (
  .req(req),

  .stall_in(~valid_out),


  .alu_opcode_in(opcode),
  .alu_funct3(funct3),
  .alu_funct7(funct7),


  .rs1_value_in(rs1),
  .rs2_value_in(rs2),
  .imm_value_in(imm),
  .pc_co_in(imm),

  .rd_write(rd_write_in),
  .alu_non_zero_out(alu_non_zero_out),

  .result_out(rd)
  );

  initial
	begin
    $timeformat(-9, 1, "ns", 12);
  	end


  `define PERIODE 40

  always
    #(`PERIODE/2) req =~ req;



  always @ (posedge req ) begin
    if(!reset) begin
      rs_read = 1'b0;
    end

  end

  initial begin
   @(posedge req)
      {reset, instr } = 33'b1_xxxxxxx_xxxxx_xxxxx_xxx_xxxxx_xxxxxxx; @(posedge req) $display ("HELLO");
      {reset, instr } = 33'b0_0000000_00001_00001_000_00001_0010011; @(posedge req) $display ("HELLO");
      {reset, instr } = 33'b0_0000000_00001_00001_000_00010_0110011; @(posedge req) $display ("HELLO");

      $display ("TESTE PASSED");

  end
endmodule
