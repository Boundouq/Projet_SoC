module tb;

timeunit  1ns;
timeprecision 1ns;

bit reset = 1'b1;
bit set = 1'b0;
reg req1,req2_1,req2_2,req3,req4;
reg [6:0] opcode;


asyn_controller asyn(
  .set(set),
  .reset(reset),
  .opcode(opcode),

  .req1(req1),
  .req2_1(req2_1),
  .req2_2(req2_2),
  .req3(req3),
  .req4(req4)
  );



  initial begin
    $timeformat(-9, 1, "ns", 12);

    //#100 {reset,set,opcode} = 9'b1_0_0000011; $display("HELLO");
    {reset,set,opcode} = 9'b0_1_0000011; $display("HELLO");


    $display ("TESTE PASSED");

    end
endmodule
