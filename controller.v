`ifndef controller
`define controller

module controller(
  input req_i,
  input ack_i1,

  input reset,
  input set,

  output reg req_i1,
  output reg ack_i
  );

  always @* begin

    if (!reset)                     req_i1 = 0;
    if (set)                        req_i1 = 1;
    if (req_i == !ack_i1 == 0)      req_i1 = 0;
    if (req_i == !ack_i1 == 1)      req_i1 = 1;

    ack_i = req_i1;

  end

endmodule

`endif
