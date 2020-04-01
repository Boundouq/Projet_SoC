module ctrl(
  input reset,

  output reg req_0,
  output reg req_1,
  output reg req_2,
  output reg req_3
  );
  logic ack_0;
  logic ack_1;
  logic ack_2;
  logic ack_3;



  always @ ( posedge reset ) begin
         ack_1 = 0;
         req_0 = 1;
         req_1 = 0;
         req_2 = 0;
         req_3 = 0;
  end


 controller ctrl0(
  .req_i(req_0),
  .ack_i1(ack_1),

  .req_i1(req_1),
  .ack_i(ack_0)
  );

  controller ctrl1(
   .req_i(req_1),
   .ack_i1(ack_2),

   .req_i1(req_2),
   .ack_i(ack_1)
   );

   controller ctrl2(
    .req_i(req_2),
    .ack_i1(ack_3),

    .req_i1(req_3),
    .ack_i(ack_2)
    );

    controller ctrl3(
     .req_i(req_3),
     .ack_i1(ack_0),

     .req_i1(req_0),
     .ack_i(ack_3)
     );

endmodule
