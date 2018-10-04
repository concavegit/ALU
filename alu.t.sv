`include "alu.sv"

module alu_tb();

	reg signed [31:0] a, b;
	wire signed [31:0] res;
	reg [2:0] cmd;
	wire cout, zout, oout;
	reg signed [31:0] testA[199:0], testB[199:0];
	reg signed [2:0] testCmd[199:0];

	ALU dut(res, cout, zout, oout, a, b, cmd);
	integer ii;

	initial begin
		$dumpfile("alu.vcd");
		$dumpvars(0, dut);

		$monitor("t=%d, a=%d, b=%d, cmd=%d, res=%d, cout=%d, zout=%d, oout=%d", $time, a, b, cmd, res, cout, zout, oout);

		// Auto-generated by timing-test-cases.py
		testA[0]=32'd0; testB[0]=32'd0; testCmd[0]=3'd0; 
		testA[1]=32'd0; testB[1]=32'd0; testCmd[1]=3'd1; 
		testA[2]=32'd0; testB[2]=32'd0; testCmd[2]=3'd2; 
		testA[3]=32'd0; testB[3]=32'd0; testCmd[3]=3'd3; 
		testA[4]=32'd0; testB[4]=32'd0; testCmd[4]=3'd4; 
		testA[5]=32'd0; testB[5]=32'd0; testCmd[5]=3'd5; 
		testA[6]=32'd0; testB[6]=32'd0; testCmd[6]=3'd6; 
		testA[7]=32'd0; testB[7]=32'd0; testCmd[7]=3'd7; 
		testA[8]=32'd0; testB[8]=32'd1; testCmd[8]=3'd0; 
		testA[9]=32'd0; testB[9]=32'd1; testCmd[9]=3'd1; 
		testA[10]=32'd0; testB[10]=32'd1; testCmd[10]=3'd2; 
		testA[11]=32'd0; testB[11]=32'd1; testCmd[11]=3'd3; 
		testA[12]=32'd0; testB[12]=32'd1; testCmd[12]=3'd4; 
		testA[13]=32'd0; testB[13]=32'd1; testCmd[13]=3'd5; 
		testA[14]=32'd0; testB[14]=32'd1; testCmd[14]=3'd6; 
		testA[15]=32'd0; testB[15]=32'd1; testCmd[15]=3'd7; 
		testA[16]=32'd0; testB[16]=-32'd1; testCmd[16]=3'd0; 
		testA[17]=32'd0; testB[17]=-32'd1; testCmd[17]=3'd1; 
		testA[18]=32'd0; testB[18]=-32'd1; testCmd[18]=3'd2; 
		testA[19]=32'd0; testB[19]=-32'd1; testCmd[19]=3'd3; 
		testA[20]=32'd0; testB[20]=-32'd1; testCmd[20]=3'd4; 
		testA[21]=32'd0; testB[21]=-32'd1; testCmd[21]=3'd5; 
		testA[22]=32'd0; testB[22]=-32'd1; testCmd[22]=3'd6; 
		testA[23]=32'd0; testB[23]=-32'd1; testCmd[23]=3'd7; 
		testA[24]=32'd0; testB[24]=32'd2147483647; testCmd[24]=3'd0; 
		testA[25]=32'd0; testB[25]=32'd2147483647; testCmd[25]=3'd1; 
		testA[26]=32'd0; testB[26]=32'd2147483647; testCmd[26]=3'd2; 
		testA[27]=32'd0; testB[27]=32'd2147483647; testCmd[27]=3'd3; 
		testA[28]=32'd0; testB[28]=32'd2147483647; testCmd[28]=3'd4; 
		testA[29]=32'd0; testB[29]=32'd2147483647; testCmd[29]=3'd5; 
		testA[30]=32'd0; testB[30]=32'd2147483647; testCmd[30]=3'd6; 
		testA[31]=32'd0; testB[31]=32'd2147483647; testCmd[31]=3'd7; 
		testA[32]=32'd0; testB[32]=-32'd2147483648; testCmd[32]=3'd0; 
		testA[33]=32'd0; testB[33]=-32'd2147483648; testCmd[33]=3'd1; 
		testA[34]=32'd0; testB[34]=-32'd2147483648; testCmd[34]=3'd2; 
		testA[35]=32'd0; testB[35]=-32'd2147483648; testCmd[35]=3'd3; 
		testA[36]=32'd0; testB[36]=-32'd2147483648; testCmd[36]=3'd4; 
		testA[37]=32'd0; testB[37]=-32'd2147483648; testCmd[37]=3'd5; 
		testA[38]=32'd0; testB[38]=-32'd2147483648; testCmd[38]=3'd6; 
		testA[39]=32'd0; testB[39]=-32'd2147483648; testCmd[39]=3'd7; 
		testA[40]=32'd1; testB[40]=32'd0; testCmd[40]=3'd0; 
		testA[41]=32'd1; testB[41]=32'd0; testCmd[41]=3'd1; 
		testA[42]=32'd1; testB[42]=32'd0; testCmd[42]=3'd2; 
		testA[43]=32'd1; testB[43]=32'd0; testCmd[43]=3'd3; 
		testA[44]=32'd1; testB[44]=32'd0; testCmd[44]=3'd4; 
		testA[45]=32'd1; testB[45]=32'd0; testCmd[45]=3'd5; 
		testA[46]=32'd1; testB[46]=32'd0; testCmd[46]=3'd6; 
		testA[47]=32'd1; testB[47]=32'd0; testCmd[47]=3'd7; 
		testA[48]=32'd1; testB[48]=32'd1; testCmd[48]=3'd0; 
		testA[49]=32'd1; testB[49]=32'd1; testCmd[49]=3'd1; 
		testA[50]=32'd1; testB[50]=32'd1; testCmd[50]=3'd2; 
		testA[51]=32'd1; testB[51]=32'd1; testCmd[51]=3'd3; 
		testA[52]=32'd1; testB[52]=32'd1; testCmd[52]=3'd4; 
		testA[53]=32'd1; testB[53]=32'd1; testCmd[53]=3'd5; 
		testA[54]=32'd1; testB[54]=32'd1; testCmd[54]=3'd6; 
		testA[55]=32'd1; testB[55]=32'd1; testCmd[55]=3'd7; 
		testA[56]=32'd1; testB[56]=-32'd1; testCmd[56]=3'd0; 
		testA[57]=32'd1; testB[57]=-32'd1; testCmd[57]=3'd1; 
		testA[58]=32'd1; testB[58]=-32'd1; testCmd[58]=3'd2; 
		testA[59]=32'd1; testB[59]=-32'd1; testCmd[59]=3'd3; 
		testA[60]=32'd1; testB[60]=-32'd1; testCmd[60]=3'd4; 
		testA[61]=32'd1; testB[61]=-32'd1; testCmd[61]=3'd5; 
		testA[62]=32'd1; testB[62]=-32'd1; testCmd[62]=3'd6; 
		testA[63]=32'd1; testB[63]=-32'd1; testCmd[63]=3'd7; 
		testA[64]=32'd1; testB[64]=32'd2147483647; testCmd[64]=3'd0; 
		testA[65]=32'd1; testB[65]=32'd2147483647; testCmd[65]=3'd1; 
		testA[66]=32'd1; testB[66]=32'd2147483647; testCmd[66]=3'd2; 
		testA[67]=32'd1; testB[67]=32'd2147483647; testCmd[67]=3'd3; 
		testA[68]=32'd1; testB[68]=32'd2147483647; testCmd[68]=3'd4; 
		testA[69]=32'd1; testB[69]=32'd2147483647; testCmd[69]=3'd5; 
		testA[70]=32'd1; testB[70]=32'd2147483647; testCmd[70]=3'd6; 
		testA[71]=32'd1; testB[71]=32'd2147483647; testCmd[71]=3'd7; 
		testA[72]=32'd1; testB[72]=-32'd2147483648; testCmd[72]=3'd0; 
		testA[73]=32'd1; testB[73]=-32'd2147483648; testCmd[73]=3'd1; 
		testA[74]=32'd1; testB[74]=-32'd2147483648; testCmd[74]=3'd2; 
		testA[75]=32'd1; testB[75]=-32'd2147483648; testCmd[75]=3'd3; 
		testA[76]=32'd1; testB[76]=-32'd2147483648; testCmd[76]=3'd4; 
		testA[77]=32'd1; testB[77]=-32'd2147483648; testCmd[77]=3'd5; 
		testA[78]=32'd1; testB[78]=-32'd2147483648; testCmd[78]=3'd6; 
		testA[79]=32'd1; testB[79]=-32'd2147483648; testCmd[79]=3'd7; 
		testA[80]=-32'd1; testB[80]=32'd0; testCmd[80]=3'd0; 
		testA[81]=-32'd1; testB[81]=32'd0; testCmd[81]=3'd1; 
		testA[82]=-32'd1; testB[82]=32'd0; testCmd[82]=3'd2; 
		testA[83]=-32'd1; testB[83]=32'd0; testCmd[83]=3'd3; 
		testA[84]=-32'd1; testB[84]=32'd0; testCmd[84]=3'd4; 
		testA[85]=-32'd1; testB[85]=32'd0; testCmd[85]=3'd5; 
		testA[86]=-32'd1; testB[86]=32'd0; testCmd[86]=3'd6; 
		testA[87]=-32'd1; testB[87]=32'd0; testCmd[87]=3'd7; 
		testA[88]=-32'd1; testB[88]=32'd1; testCmd[88]=3'd0; 
		testA[89]=-32'd1; testB[89]=32'd1; testCmd[89]=3'd1; 
		testA[90]=-32'd1; testB[90]=32'd1; testCmd[90]=3'd2; 
		testA[91]=-32'd1; testB[91]=32'd1; testCmd[91]=3'd3; 
		testA[92]=-32'd1; testB[92]=32'd1; testCmd[92]=3'd4; 
		testA[93]=-32'd1; testB[93]=32'd1; testCmd[93]=3'd5; 
		testA[94]=-32'd1; testB[94]=32'd1; testCmd[94]=3'd6; 
		testA[95]=-32'd1; testB[95]=32'd1; testCmd[95]=3'd7; 
		testA[96]=-32'd1; testB[96]=-32'd1; testCmd[96]=3'd0; 
		testA[97]=-32'd1; testB[97]=-32'd1; testCmd[97]=3'd1; 
		testA[98]=-32'd1; testB[98]=-32'd1; testCmd[98]=3'd2; 
		testA[99]=-32'd1; testB[99]=-32'd1; testCmd[99]=3'd3; 
		testA[100]=-32'd1; testB[100]=-32'd1; testCmd[100]=3'd4; 
		testA[101]=-32'd1; testB[101]=-32'd1; testCmd[101]=3'd5; 
		testA[102]=-32'd1; testB[102]=-32'd1; testCmd[102]=3'd6; 
		testA[103]=-32'd1; testB[103]=-32'd1; testCmd[103]=3'd7; 
		testA[104]=-32'd1; testB[104]=32'd2147483647; testCmd[104]=3'd0; 
		testA[105]=-32'd1; testB[105]=32'd2147483647; testCmd[105]=3'd1; 
		testA[106]=-32'd1; testB[106]=32'd2147483647; testCmd[106]=3'd2; 
		testA[107]=-32'd1; testB[107]=32'd2147483647; testCmd[107]=3'd3; 
		testA[108]=-32'd1; testB[108]=32'd2147483647; testCmd[108]=3'd4; 
		testA[109]=-32'd1; testB[109]=32'd2147483647; testCmd[109]=3'd5; 
		testA[110]=-32'd1; testB[110]=32'd2147483647; testCmd[110]=3'd6; 
		testA[111]=-32'd1; testB[111]=32'd2147483647; testCmd[111]=3'd7; 
		testA[112]=-32'd1; testB[112]=-32'd2147483648; testCmd[112]=3'd0; 
		testA[113]=-32'd1; testB[113]=-32'd2147483648; testCmd[113]=3'd1; 
		testA[114]=-32'd1; testB[114]=-32'd2147483648; testCmd[114]=3'd2; 
		testA[115]=-32'd1; testB[115]=-32'd2147483648; testCmd[115]=3'd3; 
		testA[116]=-32'd1; testB[116]=-32'd2147483648; testCmd[116]=3'd4; 
		testA[117]=-32'd1; testB[117]=-32'd2147483648; testCmd[117]=3'd5; 
		testA[118]=-32'd1; testB[118]=-32'd2147483648; testCmd[118]=3'd6; 
		testA[119]=-32'd1; testB[119]=-32'd2147483648; testCmd[119]=3'd7; 
		testA[120]=32'd2147483647; testB[120]=32'd0; testCmd[120]=3'd0; 
		testA[121]=32'd2147483647; testB[121]=32'd0; testCmd[121]=3'd1; 
		testA[122]=32'd2147483647; testB[122]=32'd0; testCmd[122]=3'd2; 
		testA[123]=32'd2147483647; testB[123]=32'd0; testCmd[123]=3'd3; 
		testA[124]=32'd2147483647; testB[124]=32'd0; testCmd[124]=3'd4; 
		testA[125]=32'd2147483647; testB[125]=32'd0; testCmd[125]=3'd5; 
		testA[126]=32'd2147483647; testB[126]=32'd0; testCmd[126]=3'd6; 
		testA[127]=32'd2147483647; testB[127]=32'd0; testCmd[127]=3'd7; 
		testA[128]=32'd2147483647; testB[128]=32'd1; testCmd[128]=3'd0; 
		testA[129]=32'd2147483647; testB[129]=32'd1; testCmd[129]=3'd1; 
		testA[130]=32'd2147483647; testB[130]=32'd1; testCmd[130]=3'd2; 
		testA[131]=32'd2147483647; testB[131]=32'd1; testCmd[131]=3'd3; 
		testA[132]=32'd2147483647; testB[132]=32'd1; testCmd[132]=3'd4; 
		testA[133]=32'd2147483647; testB[133]=32'd1; testCmd[133]=3'd5; 
		testA[134]=32'd2147483647; testB[134]=32'd1; testCmd[134]=3'd6; 
		testA[135]=32'd2147483647; testB[135]=32'd1; testCmd[135]=3'd7; 
		testA[136]=32'd2147483647; testB[136]=-32'd1; testCmd[136]=3'd0; 
		testA[137]=32'd2147483647; testB[137]=-32'd1; testCmd[137]=3'd1; 
		testA[138]=32'd2147483647; testB[138]=-32'd1; testCmd[138]=3'd2; 
		testA[139]=32'd2147483647; testB[139]=-32'd1; testCmd[139]=3'd3; 
		testA[140]=32'd2147483647; testB[140]=-32'd1; testCmd[140]=3'd4; 
		testA[141]=32'd2147483647; testB[141]=-32'd1; testCmd[141]=3'd5; 
		testA[142]=32'd2147483647; testB[142]=-32'd1; testCmd[142]=3'd6; 
		testA[143]=32'd2147483647; testB[143]=-32'd1; testCmd[143]=3'd7; 
		testA[144]=32'd2147483647; testB[144]=32'd2147483647; testCmd[144]=3'd0; 
		testA[145]=32'd2147483647; testB[145]=32'd2147483647; testCmd[145]=3'd1; 
		testA[146]=32'd2147483647; testB[146]=32'd2147483647; testCmd[146]=3'd2; 
		testA[147]=32'd2147483647; testB[147]=32'd2147483647; testCmd[147]=3'd3; 
		testA[148]=32'd2147483647; testB[148]=32'd2147483647; testCmd[148]=3'd4; 
		testA[149]=32'd2147483647; testB[149]=32'd2147483647; testCmd[149]=3'd5; 
		testA[150]=32'd2147483647; testB[150]=32'd2147483647; testCmd[150]=3'd6; 
		testA[151]=32'd2147483647; testB[151]=32'd2147483647; testCmd[151]=3'd7; 
		testA[152]=32'd2147483647; testB[152]=-32'd2147483648; testCmd[152]=3'd0; 
		testA[153]=32'd2147483647; testB[153]=-32'd2147483648; testCmd[153]=3'd1; 
		testA[154]=32'd2147483647; testB[154]=-32'd2147483648; testCmd[154]=3'd2; 
		testA[155]=32'd2147483647; testB[155]=-32'd2147483648; testCmd[155]=3'd3; 
		testA[156]=32'd2147483647; testB[156]=-32'd2147483648; testCmd[156]=3'd4; 
		testA[157]=32'd2147483647; testB[157]=-32'd2147483648; testCmd[157]=3'd5; 
		testA[158]=32'd2147483647; testB[158]=-32'd2147483648; testCmd[158]=3'd6; 
		testA[159]=32'd2147483647; testB[159]=-32'd2147483648; testCmd[159]=3'd7; 
		testA[160]=-32'd2147483648; testB[160]=32'd0; testCmd[160]=3'd0; 
		testA[161]=-32'd2147483648; testB[161]=32'd0; testCmd[161]=3'd1; 
		testA[162]=-32'd2147483648; testB[162]=32'd0; testCmd[162]=3'd2; 
		testA[163]=-32'd2147483648; testB[163]=32'd0; testCmd[163]=3'd3; 
		testA[164]=-32'd2147483648; testB[164]=32'd0; testCmd[164]=3'd4; 
		testA[165]=-32'd2147483648; testB[165]=32'd0; testCmd[165]=3'd5; 
		testA[166]=-32'd2147483648; testB[166]=32'd0; testCmd[166]=3'd6; 
		testA[167]=-32'd2147483648; testB[167]=32'd0; testCmd[167]=3'd7; 
		testA[168]=-32'd2147483648; testB[168]=32'd1; testCmd[168]=3'd0; 
		testA[169]=-32'd2147483648; testB[169]=32'd1; testCmd[169]=3'd1; 
		testA[170]=-32'd2147483648; testB[170]=32'd1; testCmd[170]=3'd2; 
		testA[171]=-32'd2147483648; testB[171]=32'd1; testCmd[171]=3'd3; 
		testA[172]=-32'd2147483648; testB[172]=32'd1; testCmd[172]=3'd4; 
		testA[173]=-32'd2147483648; testB[173]=32'd1; testCmd[173]=3'd5; 
		testA[174]=-32'd2147483648; testB[174]=32'd1; testCmd[174]=3'd6; 
		testA[175]=-32'd2147483648; testB[175]=32'd1; testCmd[175]=3'd7; 
		testA[176]=-32'd2147483648; testB[176]=-32'd1; testCmd[176]=3'd0; 
		testA[177]=-32'd2147483648; testB[177]=-32'd1; testCmd[177]=3'd1; 
		testA[178]=-32'd2147483648; testB[178]=-32'd1; testCmd[178]=3'd2; 
		testA[179]=-32'd2147483648; testB[179]=-32'd1; testCmd[179]=3'd3; 
		testA[180]=-32'd2147483648; testB[180]=-32'd1; testCmd[180]=3'd4; 
		testA[181]=-32'd2147483648; testB[181]=-32'd1; testCmd[181]=3'd5; 
		testA[182]=-32'd2147483648; testB[182]=-32'd1; testCmd[182]=3'd6; 
		testA[183]=-32'd2147483648; testB[183]=-32'd1; testCmd[183]=3'd7; 
		testA[184]=-32'd2147483648; testB[184]=32'd2147483647; testCmd[184]=3'd0; 
		testA[185]=-32'd2147483648; testB[185]=32'd2147483647; testCmd[185]=3'd1; 
		testA[186]=-32'd2147483648; testB[186]=32'd2147483647; testCmd[186]=3'd2; 
		testA[187]=-32'd2147483648; testB[187]=32'd2147483647; testCmd[187]=3'd3; 
		testA[188]=-32'd2147483648; testB[188]=32'd2147483647; testCmd[188]=3'd4; 
		testA[189]=-32'd2147483648; testB[189]=32'd2147483647; testCmd[189]=3'd5; 
		testA[190]=-32'd2147483648; testB[190]=32'd2147483647; testCmd[190]=3'd6; 
		testA[191]=-32'd2147483648; testB[191]=32'd2147483647; testCmd[191]=3'd7; 
		testA[192]=-32'd2147483648; testB[192]=-32'd2147483648; testCmd[192]=3'd0; 
		testA[193]=-32'd2147483648; testB[193]=-32'd2147483648; testCmd[193]=3'd1; 
		testA[194]=-32'd2147483648; testB[194]=-32'd2147483648; testCmd[194]=3'd2; 
		testA[195]=-32'd2147483648; testB[195]=-32'd2147483648; testCmd[195]=3'd3; 
		testA[196]=-32'd2147483648; testB[196]=-32'd2147483648; testCmd[196]=3'd4; 
		testA[197]=-32'd2147483648; testB[197]=-32'd2147483648; testCmd[197]=3'd5; 
		testA[198]=-32'd2147483648; testB[198]=-32'd2147483648; testCmd[198]=3'd6; 
		testA[199]=-32'd2147483648; testB[199]=-32'd2147483648; testCmd[199]=3'd7; 
		// End auto-generated
		
		for (ii = 0; ii < 200; ii = ii+1) begin
			$display("Set...");
			a <= testA[ii];
			b <= testB[ii];
			cmd <= testCmd[ii];
			#5000000; // Delay a very long time so it's clear what outputs correspond to what inputs
			$display("Reset...");
			a <= 32'dx; // Set all to x, so we can tell how long the next would take at its slowest
			b <= 32'dx;
			cmd <= 32'dx;
			#5000000;
		end
		$finish;
	end
endmodule
