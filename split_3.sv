`define R_type 7'b0110011
`define I_type_op 7'b0010011  //I_type operation
`define I_type_ld 7'b0000011  //I_type load
`define U_type 7'b0110111
`define B_type 7'b1100011
`define J_type 7'b1101111
`define S_type 7'b0100011
`define NOP_type 7'b0000000

module split_3(
  input [6:0] opcode,
  input ack_1,
  input ack_2,
  input ack_3,
  input req_in,

  output reg ack_out,
  output reg req_out_1,
  output reg req_out_2,
  output reg req_out_3

);
  timeunit  1ns;
  timeprecision 1ns;
  reg req2;
  reg req3;
  reg [2:0] ctl;

  c_element c_req_1(
    .a(req_in),
    .b(ctl[0]),
    .c(req_out_1)
    );

  c_element c_req_2(
    .a(req_in),
    .b(ctl[1]),
    .c(req2)
    );

  c_element c_req_3(
    .a(req_in),
    .b(ctl[2]),
    .c(req3)
    );
  always @ ( * ) begin
    #20
    req_out_2 = req2;
  end

  always @ ( * ) begin
    ctl = 3'b0;
    case (opcode)
      `B_type , `J_type:
              ctl = 3'b001;
      `I_type_ld , `S_type:
      if (req_in)  ctl = 3'b010;
      else        ctl = 3'b000;
      `R_type , `NOP_type , `I_type_op:
              ctl = 3'b100;
      default:ctl = 3'bx;
    endcase

    ack_out = ack_1 && ack_2 && ack_3;

  end

endmodule
