module part3(
    input clk,              // Clock signal
    input reset,            // Reset signal
    input signed [31:0] A, ja,  // 32-bit real, imaginary input 1
    input signed [31:0] B, jb,  // 32-bit real, imaginary input 2
    output signed [63:0] REAL, IMAGINARY  // 64-bit real, imaginary output (in-phase)
);

// Internal wires to hold intermediate results
reg signed [63:0] p0_r, p0_i, p1_r, p1_i, p2_r, p2_i, p3_r, p3_i;
reg signed [63:0] p4_r, p4_i, p5_r, p5_i, p6_r, p6_i, p7_r, p7_i;
reg signed [63:0] p8_r, p8_i, p9_r, p9_i, p10_r, p10_i, p11_r, p11_i;
reg signed [63:0] p12_r, p12_i, p13_r, p13_i, p14_r, p14_i, p15_r, p15_i;

// DSP blocks for real and imaginary multiplication
dsp_block_2 dsp0 (.a(A), .b(B), .p(p0_r), .clk(clk), .reset(reset));
dsp_block_2 dsp1 (.a(ja), .b(jb), .p(p0_i), .clk(clk), .reset(reset));
dsp_block_2 dsp2 (.a(A), .b(B), .p(p1_r), .clk(clk), .reset(reset));
dsp_block_2 dsp3 (.a(ja), .b(jb), .p(p1_i), .clk(clk), .reset(reset));
dsp_block_2 dsp4 (.a(A), .b(B), .p(p2_r), .clk(clk), .reset(reset));
dsp_block_2 dsp5 (.a(ja), .b(jb), .p(p2_i), .clk(clk), .reset(reset));
dsp_block_2 dsp6 (.a(A), .b(B), .p(p3_r), .clk(clk), .reset(reset));
dsp_block_2 dsp7 (.a(ja), .b(jb), .p(p3_i), .clk(clk), .reset(reset));
dsp_block_2 dsp8 (.a(A), .b(B), .p(p3_r), .clk(clk), .reset(reset));
dsp_block_2 dsp9 (.a(ja), .b(jb), .p(p4_i), .clk(clk), .reset(reset));
dsp_block_2 dsp10 (.a(A), .b(B), .p(p5_r), .clk(clk), .reset(reset));
dsp_block_2 dsp11 (.a(ja), .b(jb), .p(p5_i), .clk(clk), .reset(reset));
dsp_block_2 dsp12 (.a(A), .b(B), .p(p6_r), .clk(clk), .reset(reset));
dsp_block_2 dsp13 (.a(ja), .b(jb), .p(p6_i), .clk(clk), .reset(reset));
dsp_block_2 dsp14 (.a(A), .b(B), .p(p7_r), .clk(clk), .reset(reset));
dsp_block_2 dsp15 (.a(ja), .b(jb), .p(p7_i), .clk(clk), .reset(reset));
dsp_block_2 dsp16 (.a(A), .b(B), .p(p8_r), .clk(clk), .reset(reset));
dsp_block_2 dsp17 (.a(ja), .b(jb), .p(p8_i), .clk(clk), .reset(reset));
dsp_block_2 dsp18 (.a(A), .b(B), .p(p9_r), .clk(clk), .reset(reset));
dsp_block_2 dsp19 (.a(ja), .b(jb), .p(p9_i), .clk(clk), .reset(reset));
dsp_block_2 dsp20 (.a(A), .b(B), .p(p10_r), .clk(clk), .reset(reset));
dsp_block_2 dsp21 (.a(ja), .b(jb), .p(p10_i), .clk(clk), .reset(reset));
dsp_block_2 dsp22 (.a(A), .b(B), .p(p11_r), .clk(clk), .reset(reset));
dsp_block_2 dsp23 (.a(ja), .b(jb), .p(p11_i), .clk(clk), .reset(reset));
dsp_block_2 dsp24 (.a(A), .b(B), .p(p12_r), .clk(clk), .reset(reset));
dsp_block_2 dsp25 (.a(ja), .b(jb), .p(p12_i), .clk(clk), .reset(reset));
dsp_block_2 dsp26 (.a(A), .b(B), .p(p13_r), .clk(clk), .reset(reset));
dsp_block_2 dsp27 (.a(ja), .b(jb), .p(p13_i), .clk(clk), .reset(reset));
dsp_block_2 dsp28 (.a(A), .b(B), .p(p14_r), .clk(clk), .reset(reset));
dsp_block_2 dsp29 (.a(ja), .b(jb), .p(p14_i), .clk(clk), .reset(reset));
dsp_block_2 dsp30 (.a(A), .b(B), .p(p15_r), .clk(clk), .reset(reset));
dsp_block_2 dsp31 (.a(ja), .b(jb), .p(p15_i), .clk(clk), .reset(reset));

//Pipeline registers
reg signed [63:0] q0_r, q0_i, q1_r, q1_i, q2_r, q2_i, q3_r, q3_i;
reg signed [63:0] q4_r, q4_i, q5_r, q5_i, q6_r, q6_i, q7_r, q7_i;
// Combine intermediate results to produce final output
assign y_r = p0_r - p0_i;
assign y_i = p1_r + p1_i;
assign y_r = y_r + p2_r - p2_i;
assign y_i = y_i + p3_r + p3_i;



endmodule
