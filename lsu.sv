`define I_type_ld 7'b0000011 //I_type load
`define S_type 7'b0100011

module lsu(
  input [6:0] opcode_in,//
  input [2:0] funct3,
  input reg [4:0] rd_in,//
  input mem_valid,//

  input [31:0] data_add_in,//
  input [31:0] mem_wdata_in,//
  //
  input data_gnt_in,
  input data_rvalid,//
  input [31:0] data_rdata_in,//

  output reg [31:0] data_add_o,//
  output reg [31:0] data_wdata_o,//
  output reg [3:0] data_be_o,//
  output data_we_o,//
  output data_req_o,//
  //

  output reg rd_write,//
  output reg [4:0] rd_out,//
  output reg [31:0] mem_data_out//
  );

  assign data_add_o = data_add_in;
  assign rd_out = rd_in;
  assign data_wdata_o = mem_wdata_in;

  real add = data_add_in % 4;

  always @ ( * ) begin
    data_req_o = 0;
    data_we_o = 1'bx;
    rd_write = 1;
    mem_data_out = 31'bx;

    if (mem_valid) begin
      data_req_o = 1;
      case (opcode_in)
        `I_type_ld: begin
          data_we_o = 0;
          if (data_rvalid) begin
                    case (funct3)
                      3'b000:   begin
                                case (add)
                                      0:  mem_data_out = {{24{data_rdata_in[7]}},data_rdata_in[7:0]};
                                      1:  mem_data_out = {{24{data_rdata_in[15]}},data_rdata_in[15:7]};
                                      2:  mem_data_out = {{24{data_rdata_in[23]}},data_rdata_in[23:16]};
                                      3:  mem_data_out = {{24{data_rdata_in[31]}},data_rdata_in[31:24]};
                                endcase
                                end
                      3'b001:   begin
                                case (add)
                                      0:  mem_data_out = {{16{data_rdata_in[15]}},data_rdata_in[15:0]};
                                      2:  mem_data_out = {{16{data_rdata_in[31]}},data_rdata_in[31:16]};
                                endcase
                                end
                      3'b010:   mem_data_out = data_rdata_in;
                      3'b100:   begin
                                case (add)
                                      0:  mem_data_out = {{24{1'b0}},data_rdata_in[7:0]};
                                      1:  mem_data_out = {{24{1'b0}},data_rdata_in[15:7]};
                                      2:  mem_data_out = {{24{1'b0}},data_rdata_in[23:16]};
                                      3:  mem_data_out = {{24{1'b0}},data_rdata_in[31:24]};
                                endcase
                                end
                      3'b101:   begin
                                case (add)
                                      0:  mem_data_out = {{16{1'b0}},data_rdata_in[15:0]};
                                      2:  mem_data_out = {{16{1'b0}},data_rdata_in[31:16]};
                                endcase
                                end
                    endcase
                    red_write = 0;
          end
        end

        `S_type:
          data_we_o = 1;
          case (funct3)
            3'b000:   begin
                      case (add)
                            0:  data_be_o = 4b'1000;
                            1:  data_be_o = 4b'1001;
                            2:  data_be_o = 4b'1010;
                            3:  data_be_o = 4b'1100;
                      endcase
                      end
            3'b001:   begin
                      case (add)
                            0:  data_be_o = 4b'0010;
                            2:  data_be_o = 4b'0011;
                      endcase
                      end
            3'b010:   data_be_o = 4b'0001;
          endcase
      endcase
    end
  end
