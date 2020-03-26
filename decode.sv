`ifndef DECODE
`define DECODE



module decode (

   input req,
   input rs_read,

   input [4:0] rd_in,
   input rd_write_in,

   input [31:0] instr_in,

   input [31:0] rd_value_in,

   output wire [4:0] rs1_unreg_out,
   output wire rs1_read_unreg_out,
   output wire [4:0] rs2_unreg_out,
   output wire rs2_read_unreg_out,

   output reg valid_out,
   output reg [4:0] rs1_out,
   output reg [4:0] rs2_out,
   output reg [2:0] funct3_out,        //needed in ALU
   output reg [6:0] funct7_out,       //needed in ALU
   output reg [6:0] alu_op_out,
   output reg alu_sub_sra_out,
   output reg [2:0] alu_src1_out,
   output reg [2:0] alu_src2_out,
   output reg [4:0] rd_out,
   output reg rd_write_out,
//variable IMM
//bloc immédiat

   output reg [31:0] rs1_value_out,           //needed in ALU
   output reg [31:0] rs2_value_out,          //needed in ALU
   output reg [31:0] imm_value_out          //needed in ALU

);

    wire [4:0] rs2;
    wire [4:0] rs1;
    wire [4:0] rd;

    wire [2:0] funct3;
    wire [6:0] funct7;

    assign rs2 = instr_in[24:20];
    assign rs1 = instr_in[19:15];
    assign rd  = instr_in[11:7];

    assign funct3 = instr_in[14:12];
    assign funct7 = instr_in[31:25];


    assign rs1_unreg_out = rs1;
    assign rs2_unreg_out = rs2;


    regs regs (
        .req(req),
        .rs_read(rs_read),
        .rs1_in(rs1),
        .rs2_in(rs2),
        .rd_in(rd_in),
        .rd_write_in(rd_write_in),

        .rd_value_in(rd_value_in),

        .rs1_value_out(rs1_value_out),
        .rs2_value_out(rs2_value_out)
    );

    reg valid;
    wire rs1_read;
    wire rs2_read;
    reg [6:0] imm;
    reg [6:0] alu_op;
    reg alu_sub_sra;
    reg [2:0] alu_src1;
    reg [2:0] alu_src2;
    reg rd_write;

    assign rs1_read_unreg_out = rs1_read;
    assign rs2_read_unreg_out = rs2_read;


    control_unit control_unit (

        .instr_in(instr_in),


        .valid_out(valid),
        .rs1_read_out(rs1_read),
        .rs2_read_out(rs2_read),
        .imm_out(imm),
        .alu_op_out(alu_op),
        .alu_sub_sra_out(alu_sub_sra),
        .alu_src1_out(alu_src1),
        .alu_src2_out(alu_src2),
        .rd_write_out(rd_write)
    );

    reg [31:0] imm_value;

    immediat immediat (

        .imm_in(imm),

        .instr_in(instr_in),

        .imm_value_out(imm_value)
    );

    always @(req) begin
        if (!rs_read) begin

            valid_out <= valid;
            rs1_out <= rs1;
            rs2_out <= rs2;
            alu_op_out <= alu_op;
            alu_sub_sra_out <= alu_sub_sra;
            alu_src1_out <= alu_src1;
            alu_src2_out <= alu_src2;
            rd_out <= rd;
            rd_write_out <= rd_write;

            imm_value_out <= imm_value;
            funct3_out <= funct3;
            funct7_out <= funct7;


        end
    end
endmodule

`endif