`ifndef BRANCH
`define BRANCH

//`define BRANCH_OP_NEVER    4'b0000
//`define BRANCH_OP_ZERO     4'b0101
//`define BRANCH_OP_NON_ZERO 4'b1010
//`define BRANCH_OP_ALWAYS   4'b1111

`define BRANCH_PC_SRC_IMM 2'b00
`define BRANCH_PC_SRC_REG 2'b11

module branch_pc_mux (

    input pc_src_in,

    input [31:0] pc_in,
    input [31:0] rs1_value_in,
    input [31:0] imm_value_in,

    output wire [31:0] pc_out
);
    wire [31:0] pc;

    assign pc = (pc_src_in ? rs1_value_in : pc_in) + imm_value_in;
    assign pc_out = {pc[31:2], 2'b00};
endmodule
