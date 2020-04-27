`define R_type 7'b0110011
`define I_type_ld 7'b0000011  //I_type load

module merge_2_L_ALU(
  input [6:0] opcode,
  input req_1,
  input req_2,
  input ack_in,

  output reg req_out,
  output reg ack_out_1,
  output reg ack_out_2

);
timeunit  1ns;
timeprecision 1ns;
  reg [1:0] ctl;
  reg a,b;

  initial begin
    a = 0;
    b = 0;
  end
  always @ ( * ) begin
    case (opcode)
      `I_type_ld:
              ctl = 2'b01;
      `R_type:
              ctl = 2'b10;
      default:ctl = 2'bx;
    endcase

  end

  always @ ( * ) begin
    #20
    req_out = a | b;
  end

  initial begin
  #50
    forever
      #100 ack_out_1 = !ack_out_1;
  end

  c_element c_req_1(
    .a(req_1),
    .b(ctl[0]),
    .c(a)
    );

  c_element c_req_2(
    .a(req_2),
    .b(ctl[1]),
    .c(b)
    );

  c_element c_ack_1(
    .a(ack_in),
    .b(!a),
    .c(ack_out_1)
    );

  c_element c_ack_2(
    .a(ack_in),
    .b(!b),
    .c(ack_out_2)
    );
endmodule
