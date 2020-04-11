`ifndef BRANCH
`define BRANCH


`define BRANCH_PC_SRC_IMM 1'b0
`define BRANCH_PC_SRC_REG 1'b1

module branch_pc (

    input pc_src_in,
    input opcode,
    input [31:0] pc_in,
    input funct3,
    input [31:0] rs1_value_in,
    input [31:0] rs2_value_in,
    input [31:0] imm_value_in,

    output wire [31:0] pc_out,
);
    wire [31:0] pc;
    reg branch;


    case(funct3) begin:

    000: branch = (rs1_value_in == rs2_value_in) ? 1 : 0;      //beq
    001: branch = (rs1_value_in != rs2_value_in) ? 1 : 0;      //bne
    100: branch = (rs1_value_in < rs2_value_in) ? 1 : 0;       //blt
    101: branch = (rs1_value_in >= rs2_value_in) ? 1 : 0;      //bge
    110: branch = (rs1_value_in < rs2_value_in) ? 1 : 0;       //bltu
    111: branch = (rs1_value_in >= rs2_value_in) ? 1 : 0;      //bgeu

    end

    if (branch == 1 || opcode == 7'b1101111) assign pc = (pc_src_in ? rs1_value_in : pc_in) + imm_value_in;

    always @(*) begin
    pc_out = pc;
    end


endmodule

`endif
