`define R_type 7'b0110011
`define I_type_op 7'b0010011  //I_type operation
`define I_type_ld 7'b0000011  //I_type load
`define U_type 7'b0110111
`define B_type 7'b1100011
`define J_type 7'b1101111
`define S_type 7'b0100011
`define NOP_type 7'b0000000

module merge_3(
  input [6:0] opcode,
  input req_1,
  input req_2,
  input req_3,
  input ack_in,

  output reg req_out,
  output reg ack_out_1,
  output reg ack_out_2,
  output reg ack_out_3

);
timeunit  1ns;
timeprecision 1ns;
  reg [2:0] ctl;
  reg a,b,c,d;
  initial begin
    a = 0;
    b = 0;
    c = 0;
  end

  always @ ( * ) begin
    case (opcode)
      `B_type , `J_type:
              ctl = 3'b001;
      `S_type:
              ctl = 3'b010;
      `R_type , `NOP_type , `I_type_op , `I_type_ld:
              ctl = 3'b100;
      default:ctl = 3'bx;
    endcase

  end
  always @ ( * ) begin
    req_out = a | b | c;
    if (c == 0 || c == 1) begin
      d = c;
    end
    else begin
      d = 1;
    end
  end

  initial forever begin
    #100 ack_out_3 = !ack_out_3;
  end

  initial forever begin
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

      c_element c_req_3(
        .a(req_3),
        .b(ctl[2]),
        .c(c)
        );

      c_element c_ack_1(
        .a(ack_in),
        .b(!a),
        .c(ack_out_1)
        );

      /*c_element c_ack_2(
        .a(ack_in),
        .b(!b),
        .c(ack_out_2)
        );*/
        always @ ( * ) begin
          ack_out_2 = 1'b1;
        end

      c_element c_ack_3(
        .a(ack_in),
        .b(!d),
        .c(ack_out_3)
        );

endmodule
