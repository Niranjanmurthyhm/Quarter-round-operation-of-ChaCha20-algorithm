module chacha_qr( 
                 input wire [31 : 0]  a,
                 input wire [31 : 0]  b,
                 input wire [31 : 0]  c,
                 input wire [31 : 0]  d,

                 output wire [31 : 0] a_prim,
                 output wire [31 : 0] b_prim,
                 output wire [31 : 0] c_prim,
                 output wire [31 : 0] d_prim
                );

  //----------------------------------------------------------------
  // Wires.
  //----------------------------------------------------------------
  
  
      wire [31 : 0] a0;
      wire[31 : 0] a1;
      wire [31 : 0] a2;
      wire [31 : 0] a3;

      wire [31 : 0] b0;
      wire [31 : 0] b1;
      wire [31 : 0] b2;
      wire [31 : 0] b3;

      wire [31 : 0] c0;
      wire [31 : 0] c1;
      wire [31 : 0] c2;
      wire [31 : 0] c3;
      


      wire [31 : 0] d0;
      wire [31 : 0] d1;
      wire [31 : 0] d2;
      wire [31 : 0] d3;
      wire [31:0] a0_, d1_, c0_, b1_;
      
    
     quarter_round q1(a, b, d, 2'd0, a0, d1);
     
     quarter_round q2(c, d1, b, 2'd1, c0, b1);

     //o/ps of the above two qrs are used in the qrs below
    //dff_mod dff1(clk, reset,a0, d1, c0, b1, a0_, d1_, c0_, b1_);
    
     quarter_round q3(a0, b1, d1,2'd2, a1, d3);
     
     quarter_round q4(c0, d3, b1, 2'd3, c1, b3);


  assign a_prim = a1;
  assign b_prim = b3;
  assign c_prim = c1;
  assign d_prim = d3;
    
endmodule // chacha_qr
