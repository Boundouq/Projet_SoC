module f(

input S1_ack,
input S2_ack,
output reg E_ack,

input E_req,
output reg S1_req,
output reg S2_req

);

timeunit  1ns;
timeprecision 1ns;
c_element c (
  .a(S1_ack),
  .b(S2_ack),
  .c(E_ack)
  );

//initial begin
  //#50 E_ack = 1;
//end
always @ ( * ) begin
#50
  S1_req = E_req;
  S2_req = E_req;
end

endmodule
