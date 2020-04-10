module tbench;

timeunit  1ns;
timeprecision 1ns;

bit req = 1'b0;
bit reset = 1'b1;

logic [31:0] instr_in,instr_out, rd, rs1, rs2, imm, pc, pc_out, instr_addr_out;
logic [2:0] funct3;
logic [6:0] funct7,opcode;
logic [4:0] rd_in,rd_out;
logic br, rs_read, rd_write_in,valid_out,alu_sub_sra_out,rd_write_out,stall_in,alu_non_zero_out,instr_req_out, instr_rvalid_in, gnt_in;
logic req_0, req_1, req_2,req_3;
logic branch_pc_src_out, branch_out, branch_in;
logic [3:0] branch_op_out;

/*ctrl ctrl(
  .reset(reset),

  .req
  );

*/
// read_file
  integer file;
  reg [31:0] inst_mem [8000:0];

  initial begin
       file = $fopen("C:/Users/bound/Desktop/ETUDE/Projet/Projet_Riscy/Projet_SoC/instr.txt", "r");
       if (file == 0) begin
         $display("instr_file handle was NULL");
        // $finish;
       end
  	   $readmemb("C:/Users/bound/Desktop/ETUDE/Projet/Projet_Riscy/Projet_SoC/instr.txt" ,inst_mem);
       $fclose(file); // Close file before finish
  end
  //

instr_ram instr(

  //input req,
  .instr_req_in(instr_req_out),
  .instr_addr_in(instr_addr_out),
  .inst_mem (inst_mem),


  .instr_rvalid_o(instr_rvalid_in),
  .instr_gnt_o(gnt_in),
  .instr_rinstr_o(instr_in)
  );

fetch fetch(
  .req(req),

  .instr_rvalid_in(instr_rvalid_in),
  .gnt_in(gnt_in),
  .instr_rdata_in(instr_in),

  .branch_mispredicted_in(br),


  .instr_req_out(instr_req_out),
  .instr_addr_out(instr_addr_out),
  .instr_read_out(rs_read),
  .instr_out(instr_out),
  .pc_out(pc)
  );




decode deco(
  .req(req),
  .reset(reset)
  .rs_read(!rs_read),
  .rd_in(rd_in),
  .rd_write_in(rd_write_in),
  .instr_in(instr_out),
  .rd_value_in(rd),

  .pc_in_dec(pc),
  .pc_out_dec(pc_out),
  .branch_in(branch_in),

  .valid_out(valid_out),
  .funct3_out(funct3),        //needed in ALU
  .funct7_out(funct7),       //needed in ALU
  .alu_op_out(opcode),
  .alu_sub_sra_out(alu_sub_sra_out),
  .rd_out(rd_out),
  .rd_write_out(rd_write_out),
  .rs1_value_out(rs1),           //needed in ALU
  .rs2_value_out(rs2),          //needed in ALU
  .imm_value_out(imm)          //needed in ALU
  .branch_op_out(branch_op_out),
  .branch_pc_src_out(branch_pc_src_out),
  .branch_out(branch_out)
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
  .pc_co_in(pc_out),

  .rd_in(rd_out),
  .rd_out(rd_in),
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


  always @ (posedge req, negedge reset ) begin
      instr_req_out = 1'b1;
  end

  initial begin
  #25 {reset} = 1'b0; $display("HELLO");
   @(posedge req)
      br = 1'b1 ;@(posedge req) $display ("HELLO");
      br = 1'b0 ;@(posedge req) $display ("HELLO");

      //{reset, br, instr } = 34'b1_1_xxxxxxx_xxxxx_xxxxx_xxx_xxxxx_xxxxxxx; @(posedge req_0) $display ("HELLO");
      //{br, instr } = 33'b0_0000000_00001_00001_000_00001_0010011; @(posedge req) $display ("HELLO"); //R1 + 1 -> R1
      //{br, instr } = 33'b0_0000000_00011_00011_000_00011_0010011; @(posedge req) $display ("HELLO"); //R3 + 3 -> R3
      //{br, instr } = 33'b0_0000000_00100_00100_000_00100_0010011; @(posedge req) $display ("HELLO");
      //{br, instr } = 33'b0_0000000_00001_00001_000_00010_0110011; @(posedge req) $display ("HELLO"); //R1 + R1 -> R2
      //{br, instr } = 33'b0_xxxxxxx_xxxxx_xxxxx_xxx_xxxxx_xxxxxxx; @(posedge req) $display ("HELLO");



      $display ("TESTE PASSED");

  end
endmodule
