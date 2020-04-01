`ifndef execute
`define execute


module execute(
  input req,

  input stall_in,
  //input flush_in,

  input [6:0] alu_opcode_in,
  input [2:0] alu_funct3,
  input [6:0] alu_funct7,


  input [31:0] rs1_value_in,
  input [31:0] rs2_value_in,
  input [31:0] imm_value_in,
  input [31:0] pc_co_in,
  //
  input  reg [4:0] rd_in,
  output reg rd_write,
  output reg [4:0] rd_out,
  //

  output reg alu_non_zero_out,

  output reg [31:0] result_out
  );

  reg [31:0] rs1_value;
  reg [31:0] rs2_value;


  reg alu_non_zero;
  reg [31:0] alu_result;

  always @ * begin
    if(!stall_in) begin
    rd_write = 1'b0;
    result_out = alu_result;
    rd_out = rd_in;
    alu_non_zero_out <= alu_non_zero;

    end
  end
  alu alu(
    .opcode_in(alu_opcode_in),
    .funct3(alu_funct3),
    .funct7(alu_funct7),

    .rs1_value_in(rs1_value_in),
    .rs2_value_in(rs2_value_in),
    .imm_value_in(imm_value_in),
    .pc_co_in(pc_co_in),

    .result_out(alu_result)
    );

  /*  always @(posedge req) begin
      if(!stall_in) begin
      alu_non_zero_out <= alu_non_zero;

      end
    end*/
endmodule

`endif
