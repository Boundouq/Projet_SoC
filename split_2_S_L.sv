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
  timeunit  1ns;
  timeprecision 1ns;
  reg req2;
  reg [1:0] ctl;

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
    /*initial begin
    req_out_2 = req2;
    end*/
    always @ ( * ) begin
      #30
      req_out_2 = req2;
    end

    always @ ( * ) begin
      case (opcode)
      `S_type:
          if (req_in)  ctl = 2'b01;
          else        ctl = 2'b00;
        `I_type_ld:
          if (req_in)  ctl = 2'b10;
          else        ctl = 2'b00;
        default:ctl = 2'bx;
      endcase

      ack_out = ack_1 && ack_2;

    end

endmodule
