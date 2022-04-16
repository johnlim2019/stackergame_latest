/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module matrix_writer_10 (
    input clk,
    input rst,
    input [63:0] row,
    output reg [7:0] outled,
    output reg [7:0] outgnd,
    output reg clkout
  );
  
  
  
  localparam CLOCKSIZE = 3'h7;
  
  wire [7-1:0] M_slowClock_value;
  counter_15 slowClock (
    .clk(clk),
    .rst(rst),
    .value(M_slowClock_value)
  );
  
  wire [1-1:0] M_slowclk_detector_out;
  reg [1-1:0] M_slowclk_detector_in;
  edge_detector_4 slowclk_detector (
    .clk(clk),
    .in(M_slowclk_detector_in),
    .out(M_slowclk_detector_out)
  );
  
  
  localparam ROW0_row_case = 3'd0;
  localparam ROW1_row_case = 3'd1;
  localparam ROW2_row_case = 3'd2;
  localparam ROW3_row_case = 3'd3;
  localparam ROW4_row_case = 3'd4;
  localparam ROW5_row_case = 3'd5;
  localparam ROW6_row_case = 3'd6;
  localparam ROW7_row_case = 3'd7;
  
  reg [2:0] M_row_case_d, M_row_case_q = ROW0_row_case;
  
  always @* begin
    M_row_case_d = M_row_case_q;
    
    outled = 8'hff;
    outgnd = 8'h00;
    clkout = M_slowclk_detector_out;
    M_slowclk_detector_in = M_slowClock_value[6+0-:1];
    
    case (M_row_case_q)
      ROW0_row_case: begin
        outgnd = 8'h7f;
        outled = row[0+0+7-:8];
        if (M_slowclk_detector_out == 1'h1) begin
          M_row_case_d = ROW1_row_case;
        end
      end
      ROW1_row_case: begin
        outgnd = 8'hbf;
        outled = row[8+0+7-:8];
        if (M_slowclk_detector_out == 1'h1) begin
          M_row_case_d = ROW2_row_case;
        end
      end
      ROW2_row_case: begin
        outgnd = 8'hdf;
        outled = row[16+0+7-:8];
        if (M_slowclk_detector_out == 1'h1) begin
          M_row_case_d = ROW3_row_case;
        end
      end
      ROW3_row_case: begin
        outgnd = 8'hef;
        outled = row[24+0+7-:8];
        if (M_slowclk_detector_out == 1'h1) begin
          M_row_case_d = ROW4_row_case;
        end
      end
      ROW4_row_case: begin
        outgnd = 8'hf7;
        outled = row[32+0+7-:8];
        if (M_slowclk_detector_out == 1'h1) begin
          M_row_case_d = ROW5_row_case;
        end
      end
      ROW5_row_case: begin
        outgnd = 8'hfb;
        outled = row[40+0+7-:8];
        if (M_slowclk_detector_out == 1'h1) begin
          M_row_case_d = ROW6_row_case;
        end
      end
      ROW6_row_case: begin
        outgnd = 8'hfd;
        outled = row[48+0+7-:8];
        if (M_slowclk_detector_out == 1'h1) begin
          M_row_case_d = ROW7_row_case;
        end
      end
      ROW7_row_case: begin
        outgnd = 8'hfe;
        outled = row[56+0+7-:8];
        if (M_slowclk_detector_out == 1'h1) begin
          M_row_case_d = ROW0_row_case;
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_row_case_q <= 1'h0;
    end else begin
      M_row_case_q <= M_row_case_d;
    end
  end
  
endmodule