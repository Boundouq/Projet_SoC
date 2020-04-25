module c_element(
input a,
input b,
output reg c
);

always @ ( * ) begin
  if (a == 1'b0 && b == 1'b0)  c = 1'b0;
  else if (a == 1'b1 && b == 1'b1)  c = 1'b1;
end
endmodule
