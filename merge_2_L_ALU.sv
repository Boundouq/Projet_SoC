`define R_type 7'b0110011
`define I_type_ld 7'b0000011  //I_type load

module merge_2_L_ALU(
  input [6:0] opcode,
  input req_1,
  input req_2,
  input ack_in,

  output reg req_out,
  output reg ack_out_1,
  output reg ack_out_2,

);

  reg [1:0] ctl;
  reg a,b;

  always @ ( * ) begin
    case (opcode)
      `I_type_ld:
              ctl = 2'b01;
      `R_type:
              ctl = 3'b10;
      default:ctl = 3'bx;
    endcase


    c_element c_req_1(
      a.(req_1),
      b.(ctl[0]),
      c.(a)
      );

    c_element c_req_2(
      a.(req_2),
      b.(ctl[1]),
      c.(b)
      );

    c_element c_ack_1(
      a.(ack_in),
      b.(a),
      c.(ack_out_1)
      );

    c_element c_ack_2(
      a.(ack_in),
      b.(b),
      c.(ack_out_2)
      );

    req_out = a | b;
  end

endmodule
