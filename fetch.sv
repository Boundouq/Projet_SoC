`ifndef fetch
`define fetch


module fetch(
input req,
//input stall_in,
//input flush_in,

input instr_rvalid_in,
input gnt_in,
input [31:0] instr_rdata_in,

input branch_mispredicted_in,


output reg instr_req_out,
output reg [31:0] instr_addr_out,
output reg instr_read_out,
output reg [31:0] instr_out,
output reg [31:0] pc_out,
output reg branch_predicted_taken_out
);

reg [31:0] next_pc;
wire [31:0] pc;

assign pc = branch_mispredicted_in ? 32'b0 : next_pc;


reg [31:0] branch_offset;
reg branch_predicted_taken;

//assign branch_offset = 1'b1;


always @ (*) begin
  if (gnt_in) begin
    instr_req_out = 1;
    instr_addr_out = pc;
  end

end

wire [31:0] imm_j;
wire [31:0] imm_b;
wire [6:0] opcode;

assign imm_j = instr_in[31:12];
assign imm_b = {instr_in[31:25], instr_in[11:7];
assign opcode = instr_read_value_in[6:0];

always @* begin
        case (opcode)
            `OPCODE_JAL: begin
                branch_predicted_taken = 1;
                branch_offset = imm_j;
            end
            `OPCODE_BRANCH: begin
                branch_predicted_taken = 1;
                branch_offset = imm_b;
            end
            default: begin
                branch_offset = 1'b1;
            end
        endcase
    end



assign instr_read_out = instr_rvalid_in;


always_ff @ (posedge req) begin
  if (instr_rvalid_in)begin
    instr_out <= instr_rdata_in;
    next_pc <= pc + branch_offset;
    pc_out <= pc;
    branch_predicted_taken_out <= branch_predicted_taken;

  end
end
endmodule

`endif
