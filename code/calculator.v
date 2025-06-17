\m5_TLV_version 1d: tl-x.org
\m5
   
   // ============================================
   // Welcome, new visitors! Try the "Learn" menu.
   // ============================================
   
   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
	/* verilator lint_on WIDTH */ //Strict Bit Width checking?
	m4_include_lib(['https://raw.githubusercontent.com/stevehoover/LF-Building-a-RISC-V-CPU-Core/main/lib/calc_viz.tlv'])
\TLV
   $reset = *reset;
   $val1[31:0] = >>1$out;
   $val2[31:0] = {28'b0, $val2_rand[3:0]};
   $sum[31:0] = $val1[31:0] + $val2[31:0];
   $diff[31:0] = $val1[31:0] - $val2[31:0];
   $prod[31:0] = $val1[31:0] * $val2[31:0];
   $quot[31:0] = $va1[31:0] / $val2[31:0];
   
   $out[31:0] = $reset ? 0 : $op[1:0] == 3 ? $quot[31:0] : $op[1:0] == 2 ? $prod[31:0] : $op[1:0] == 1 ? $diff[31:0] : $sum[31:0];
   // Assert these to end simulation (before the cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
   m4+calc_viz()
\SV
   endmodule
