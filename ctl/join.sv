module j(

input E1_req,
input E2_req,
output reg S_req,

input S_ack,
output reg E1_ack,
output reg E2_ack

);

timeunit  1ns;
timeprecision 1ns;
reg S;
c_element c (
  .a(E1_req),
  .b(E2_req),
  .c(S)
  );

  initial begin
  S_req = S;

  end
  always @ ( * ) begin
  #30
  S_req = S;
  end

always @ ( * ) begin
  E1_ack = S_ack;
  E2_ack = S_ack;
end

endmodule
