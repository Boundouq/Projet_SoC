module ctl_fetch (
  input req_i,
  input ack_o,

  output reg req_o,
  output reg ack_i
);

  timeunit  1ns;
  timeprecision 1ns;
  reg s,a,b,c,d;
  assign s = req_o;

  always @ ( * ) begin
    a = req_i && (!ack_o);
    b = req_i | (!ack_o);
    c = s && b;
    d = a | c;
    ack_i = req_o;


  end

  always @ ( * ) begin
  #50
  //if (req_i)      ack_i <= 1;
  if (ack_o)      req_o <= 0;
  //if (!req_i)      ack_i <= 0;
  req_o = d;
  ack_i = d;

  end
endmodule
