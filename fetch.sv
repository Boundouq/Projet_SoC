`ifndef fetch
`define fetch

module fetch(
input req,
input reset,
//input stall_in,
//input flush_in,

input instr_rvalid_in,
input gnt_in,
input [31:0] instr_rdata_in,

input branch_mispredicted_in, // si v=1 initialisation pc =0 , v=0 next_pc (bra, bran normal)
input [31:0] pc_in,

output reg instr_req_out,
output reg [31:0] instr_addr_out,
output reg instr_read_out,
output reg [31:0] instr_out,
output reg [31:0] pc_out,
output reg [6:0] opc
);

reg [31:0] next_pc;
wire [31:0] pc;

assign     pc = branch_mispredicted_in ? pc_in : next_pc;

initial begin
  next_pc = 0;
end

always @ (*) begin

  if (!reset) begin
    instr_addr_out = pc;
  end

  else if (!gnt_in) begin
    instr_addr_out = 32'bx;
  end
  if (!reset) begin
    instr_req_out = 1;
  end
  else if (!gnt_in) begin
    instr_req_out = 0;
  end

end

assign instr_read_out = instr_rvalid_in;

always @ (posedge req) begin
  if (instr_rvalid_in)begin
    instr_out <= instr_rdata_in;
    next_pc <= pc + 1'b1;
    pc_out <= pc;
    opc <= instr_rdata_in[6:0];
  end
  if (reset)  begin
    next_pc <= 0;
    instr_out <= 32'bx;
    pc_out <= 32'bx;
  end

end
endmodule

`endif
