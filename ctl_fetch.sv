module ctl_fetch (
  input req_i,
  input ack_o,

  output reg req_o,
  output reg ack_i
);

  reg s,a,b,c;
  assign s = req_o;
  always @ ( * ) begin
    a = req_i && (!ack_o);
    b = req_i | (!ack_o);
    c = s && b;
    req_o = a | c;
    ack_i = req_o;

  end
endmodule
