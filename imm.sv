`ifndef IMM
`define IMM

`define I_type_op 7'b0010011 //I_type operation


module immediat (
    input [6:0] imm_in,

    input [31:0] instr_in,

    output reg [31:0] imm_value_out
);

    wire [31:0] imm_i;

    assign imm_i = instr_in[31:20];

    always @* begin
        case (imm_in)
            `I_type_op:     imm_value_out = imm_i;

        endcase
    end
endmodule

`endif
