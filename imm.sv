`ifndef IMM
`define IMM

`define IMM_I     6'b000000


module immediat (
    input [4:0] imm_in,

    input [31:0] instr_in,

    output reg [31:0] imm_value_out
);

    wire [31:0] imm_i;

    assign imm_i = instr_in[31:20];

    always @* begin
        case (imm_in)
            `IMM_I:     imm_value_out = imm_i;

        endcase
    end
endmodule

`endif
