module f(

input S1_ack,
input S2_ack,
output reg E_ack,

input E_req,
output reg S1_req,
output reg S2_req

);

c_element c (
  .a(S1_ack),
  .b(S2_ack),
  .c(E_ack)
  );



always @ ( * ) begin
  S1_req = E_req;
  S2_req = E_req;
end

endmodule
