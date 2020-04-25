`define I_type_ld 7'b0000011  //I_type load
`define S_type 7'b0100011

module split_2_S_L(
  input [6:0] opcode,
  input ack_1,
  input ack_2,
  input req_in,

  output reg ack_out,
  output reg req_out_1,
  output reg req_out_2

);

  reg [1:0] ctl;

  c_element c_req_1(
    .a(req_in),
    .b(ctl[0]),
    .c(req_out_1)
    );

  c_element c_req_2(
    .a(req_in),
    .b(ctl[1]),
    .c(req_out_2)
    );

  always @ ( * ) begin
    case (opcode)
      `I_type_ld:
              ctl = 2'b10;
      `S_type:
              ctl = 2'b01;
      default:ctl = 3'bx;
    endcase

    ack_out = ack_1 && ack_2;

  end

endmodule
