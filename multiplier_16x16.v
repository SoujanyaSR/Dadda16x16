`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2021 00:29:13
// Design Name: 
// Module Name: multiplier_16x16
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module multiplier_16x16(

        input    pp [15:0][15:0],

        output [31:0] to_FA [1:0]
        
    );
    //requires 195 FA;
    //requies 15 HA
    
    //#of full adder sum & carry to be captured
    //195 - 27 = 168 reg required for each as last set o/p will be directly connected to the o/p
    reg fs[167:0];
    reg fc[167:0];
    
    //15-1 = 14 reg required
    reg hs[13:0];
    reg hc[13:0];
    
    
    
  /////////////////////////////// RS1 16 -> 13 /////////////////////////////////
  // Adders: FA = 8; HA = 4
  
  fa fa0  (.A(pp[00][14]), .B(pp[01][13]), .Ci(pp[02][12]), .S(fs[0]), .Co(fc[0]));
  fa fa1  (.A(pp[00][15]), .B(pp[01][14]), .Ci(pp[02][13]), .S(fs[1]), .Co(fc[1]));
  fa fa2  (.A(pp[03][12]), .B(pp[04][11]), .Ci(pp[05][10]), .S(fs[2]), .Co(fc[2]));
  fa fa3  (.A(pp[01][15]), .B(pp[02][14]), .Ci(pp[03][13]), .S(fs[3]), .Co(fc[3]));
  fa fa4  (.A(pp[04][12]), .B(pp[05][11]), .Ci(pp[06][10]), .S(fs[4]), .Co(fc[4]));
  fa fa5  (.A(pp[02][15]), .B(pp[03][14]), .Ci(pp[04][13]), .S(fs[5]), .Co(fc[5]));
  fa fa6  (.A(pp[05][12]), .B(pp[06][11]), .Ci(pp[07][10]), .S(fs[6]), .Co(fc[6]));
  fa fa7  (.A(pp[03][15]), .B(pp[04][14]), .Ci(pp[05][13]), .S(fs[7]), .Co(fc[7]));

  
  ha ha0  (.A(pp[00][13]), .B(pp[01][12]), .S(hs[0]), .C(hc[0]));
  ha ha1  (.A(pp[03][11]), .B(pp[04][10]), .S(hs[1]), .C(hc[1]));
  ha ha2  (.A(pp[06][09]), .B(pp[07][08]), .S(hs[2]), .C(hc[2]));
  ha ha3  (.A(pp[07][09]), .B(pp[08][08]), .S(hs[3]), .C(hc[3]));
  
  ////////////////////////////// RS2 16 -> 13 -> 9 /////////////////////////////
  // Adders : FA = 40; HA = 4;
  
  fa fa8  (.A(pp[00][10]), .B(pp[01][09]), .Ci(pp[02][08]), .S(fs[8]), .Co(fc[8]));
  fa fa9  (.A(pp[00][11]), .B(pp[01][10]), .Ci(pp[02][09]), .S(fs[9]), .Co(fc[9]));
  fa fa10 (.A(pp[03][08]), .B(pp[04][07]), .Ci(pp[05][06]), .S(fs[10]), .Co(fc[10]));
  fa fa11 (.A(pp[00][12]), .B(pp[01][11]), .Ci(pp[02][10]), .S(fs[11]), .Co(fc[11]));
  fa fa12 (.A(pp[03][09]), .B(pp[04][08]), .Ci(pp[05][07]), .S(fs[12]), .Co(fc[12]));
  fa fa13 (.A(pp[06][06]), .B(pp[07][05]), .Ci(pp[08][04]), .S(fs[13]), .Co(fc[13]));
  fa fa14 (.A(hs[0]), .B(pp[02][11]), .Ci(pp[03][10]), .S(fs[14]), .Co(fc[14]));
  fa fa15 (.A(pp[04][09]), .B(pp[05][08]), .Ci(pp[06][07]), .S(fs[15]), .Co(fc[15]));
  fa fa16 (.A(pp[07][06]), .B(pp[08][05]), .Ci(pp[09][04]), .S(fs[16]), .Co(fc[16]));
  fa fa17 (.A(pp[10][03]), .B(pp[11][02]), .Ci(pp[12][01]), .S(fs[17]), .Co(fc[17]));
  fa fa18 (.A(hc[0]), .B(fs[0]), .Ci(hs[1]), .S(fs[18]), .Co(fc[18]));
  fa fa19 (.A(pp[05][09]), .B(pp[06][08]), .Ci(pp[07][07]), .S(fs[19]), .Co(fc[19]));
  fa fa20 (.A(pp[08][06]), .B(pp[09][05]), .Ci(pp[10][04]), .S(fs[20]), .Co(fc[20]));
  fa fa21 (.A(pp[11][03]), .B(pp[12][02]), .Ci(pp[13][01]), .S(fs[21]), .Co(fc[21]));
  fa fa22 (.A(fc[0]), .B(hc[1]), .Ci(fs[1]), .S(fs[22]), .Co(fc[22]));
  fa fa23 (.A(fs[2]), .B(hs[2]), .Ci(pp[08][07]), .S(fs[23]), .Co(fc[23]));
  fa fa24 (.A(pp[09][06]), .B(pp[10][05]), .Ci(pp[11][04]), .S(fs[24]), .Co(fc[24]));
  fa fa25 (.A(pp[12][03]), .B(pp[13][02]), .Ci(pp[14][01]), .S(fs[25]), .Co(fc[25]));
  fa fa26 (.A(fc[1]), .B(fc[2]), .Ci(hc[2]), .S(fs[26]), .Co(fc[26]));
  fa fa27 (.A(fs[3]), .B(fs[4]), .Ci(hs[3]), .S(fs[27]), .Co(fc[27]));
  fa fa28 (.A(pp[09][07]), .B(pp[10][06]), .Ci(pp[11][05]), .S(fs[28]), .Co(fc[28]));
  fa fa29 (.A(pp[12][04]), .B(pp[13][03]), .Ci(pp[14][02]), .S(fs[29]), .Co(fc[29]));
  fa fa30 (.A(fc[3]), .B(fc[4]), .Ci(hc[3]), .S(fs[30]), .Co(fc[30]));
  fa fa31 (.A(fs[5]), .B(fs[6]), .Ci(pp[08][09]), .S(fs[31]), .Co(fc[31]));
  fa fa32 (.A(pp[09][08]), .B(pp[10][07]), .Ci(pp[11][06]), .S(fs[32]), .Co(fc[32]));
  fa fa33 (.A(pp[12][05]), .B(pp[13][04]), .Ci(pp[14][03]), .S(fs[33]), .Co(fc[33]));
  fa fa34 (.A(fc[5]), .B(fc[6]), .Ci(fs[7]), .S(fs[34]), .Co(fc[34]));
  fa fa35 (.A(pp[06][12]), .B(pp[07][11]), .Ci(pp[08][10]), .S(fs[35]), .Co(fc[35]));
  fa fa36 (.A(pp[09][09]), .B(pp[10][08]), .Ci(pp[11][07]), .S(fs[36]), .Co(fc[36]));
  fa fa37 (.A(pp[12][06]), .B(pp[13][05]), .Ci(pp[14][04]), .S(fs[37]), .Co(fc[37]));
  fa fa38 (.A(fc[7]), .B(pp[04][15]), .Ci(pp[05][14]), .S(fs[38]), .Co(fc[38]));
  fa fa39 (.A(pp[06][13]), .B(pp[07][12]), .Ci(pp[08][11]), .S(fs[39]), .Co(fc[39]));
  fa fa40 (.A(pp[09][10]), .B(pp[10][09]), .Ci(pp[11][08]), .S(fs[40]), .Co(fc[40]));
  fa fa41 (.A(pp[12][07]), .B(pp[13][06]), .Ci(pp[14][05]), .S(fs[41]), .Co(fc[41]));
  fa fa42 (.A(pp[05][15]), .B(pp[06][14]), .Ci(pp[07][13]), .S(fs[42]), .Co(fc[42]));
  fa fa43 (.A(pp[08][12]), .B(pp[09][11]), .Ci(pp[10][10]), .S(fs[43]), .Co(fc[43]));
  fa fa44 (.A(pp[11][09]), .B(pp[12][08]), .Ci(pp[13][07]), .S(fs[44]), .Co(fc[44]));
  fa fa45 (.A(pp[06][15]), .B(pp[07][14]), .Ci(pp[08][13]), .S(fs[45]), .Co(fc[45]));
  fa fa46 (.A(pp[09][12]), .B(pp[10][11]), .Ci(pp[11][10]), .S(fs[46]), .Co(fc[46]));
  fa fa47 (.A(pp[07][15]), .B(pp[08][14]), .Ci(pp[09][13]), .S(fs[47]), .Co(fc[47]));
  
  
  ha ha4  (.A(pp[00][09]), .B(pp[01][08]), .S(hs[4]), .C(hc[4]));
  ha ha5  (.A(pp[03][07]), .B(pp[04][06]), .S(hs[5]), .C(hc[5]));
  ha ha6  (.A(pp[06][05]), .B(pp[07][04]), .S(hs[6]), .C(hc[6]));
  ha ha7  (.A(pp[09][03]), .B(pp[10][02]), .S(hs[7]), .C(hc[7]));
  
  
  ////////////////////////////// RS3 16 -> 13 -> 9 -> 6/////////////////////////
  // Adders: FA = 51; HA = 3
  fa fa48 (.A(pp[00][07]), .B(pp[01][06]), .Ci(pp[02][05]), .S(fs[48]), .Co(fc[48]));
  fa fa49 (.A(pp[00][08]), .B(pp[01][07]), .Ci(pp[02][06]), .S(fs[49]), .Co(fc[49]));
  fa fa50 (.A(pp[03][05]), .B(pp[04][04]), .Ci(pp[05][03]), .S(fs[50]), .Co(fc[50]));
  fa fa51 (.A(hs[4]), .B(pp[02][07]), .Ci(pp[03][06]), .S(fs[51]), .Co(fc[51]));
  fa fa52 (.A(pp[04][05]), .B(pp[05][04]), .Ci(pp[06][03]), .S(fs[52]), .Co(fc[52]));
  fa fa53 (.A(pp[07][02]), .B(pp[08][01]), .Ci(pp[09][00]), .S(fs[53]), .Co(fc[53]));
  fa fa54 (.A(hc[4]), .B(fs[8]), .Ci(hs[5]), .S(fs[54]), .Co(fc[54]));
  fa fa55 (.A(pp[05][05]), .B(pp[06][04]), .Ci(pp[07][03]), .S(fs[55]), .Co(fc[55]));
  fa fa56 (.A(pp[08][02]), .B(pp[09][01]), .Ci(pp[10][00]), .S(fs[56]), .Co(fc[56]));
  fa fa57 (.A(fc[8]), .B(hc[5]), .Ci(fs[9]), .S(fs[57]), .Co(fc[57]));
  fa fa58 (.A(fs[10]), .B(hs[6]), .Ci(pp[08][03]), .S(fs[58]), .Co(fc[58]));
  fa fa59 (.A(pp[09][02]), .B(pp[10][01]), .Ci(pp[11][00]), .S(fs[59]), .Co(fc[59]));
  fa fa60 (.A(fc[9]), .B(fc[10]), .Ci(hc[6]), .S(fs[60]), .Co(fc[60]));
  fa fa61 (.A(fs[11]), .B(fs[12]), .Ci(fs[13]), .S(fs[61]), .Co(fc[61]));
  fa fa62 (.A(hs[7]), .B(pp[11][01]), .Ci(pp[12][00]), .S(fs[62]), .Co(fc[62]));
  fa fa63 (.A(fc[11]), .B(fc[12]), .Ci(fc[13]), .S(fs[63]), .Co(fc[63]));
  fa fa64 (.A(hc[7]), .B(fs[14]), .Ci(fs[15]), .S(fs[64]), .Co(fc[64]));
  fa fa65 (.A(fs[16]), .B(fs[17]), .Ci(pp[13][00]), .S(fs[65]), .Co(fc[65]));
  fa fa66 (.A(fc[14]), .B(fc[15]), .Ci(fc[16]), .S(fs[66]), .Co(fc[66]));
  fa fa67 (.A(fc[17]), .B(fs[18]), .Ci(fs[19]), .S(fs[67]), .Co(fc[67]));
  fa fa68 (.A(fs[20]), .B(fs[21]), .Ci(pp[14][00]), .S(fs[68]), .Co(fc[68]));
  fa fa69 (.A(fc[18]), .B(fc[19]), .Ci(fc[20]), .S(fs[69]), .Co(fc[69]));
  fa fa70 (.A(fc[21]), .B(fs[22]), .Ci(fs[23]), .S(fs[70]), .Co(fc[70]));
  fa fa71 (.A(fs[24]), .B(fs[25]), .Ci(pp[15][00]), .S(fs[71]), .Co(fc[71]));
  fa fa72 (.A(fc[22]), .B(fc[23]), .Ci(fc[24]), .S(fs[72]), .Co(fc[72]));
  fa fa73 (.A(fc[25]), .B(fs[26]), .Ci(fs[27]), .S(fs[73]), .Co(fc[73]));
  fa fa74 (.A(fs[28]), .B(fs[29]), .Ci(pp[15][01]), .S(fs[74]), .Co(fc[74]));
  fa fa75 (.A(fc[26]), .B(fc[27]), .Ci(fc[28]), .S(fs[75]), .Co(fc[75]));
  fa fa76 (.A(fc[29]), .B(fs[30]), .Ci(fs[31]), .S(fs[76]), .Co(fc[76]));
  fa fa77 (.A(fs[32]), .B(fs[33]), .Ci(pp[15][02]), .S(fs[77]), .Co(fc[77]));
  fa fa78 (.A(fc[30]), .B(fc[31]), .Ci(fc[32]), .S(fs[78]), .Co(fc[78]));
  fa fa79 (.A(fc[33]), .B(fs[34]), .Ci(fs[35]), .S(fs[79]), .Co(fc[79]));
  fa fa80 (.A(fs[36]), .B(fs[37]), .Ci(pp[15][03]), .S(fs[80]), .Co(fc[80]));
  fa fa81 (.A(fc[34]), .B(fc[35]), .Ci(fc[36]), .S(fs[81]), .Co(fc[81]));
  fa fa82 (.A(fc[37]), .B(fs[38]), .Ci(fs[39]), .S(fs[82]), .Co(fc[82]));
  fa fa83 (.A(fs[40]), .B(fs[41]), .Ci(pp[15][04]), .S(fs[83]), .Co(fc[83]));
  fa fa84 (.A(fc[38]), .B(fc[39]), .Ci(fc[40]), .S(fs[84]), .Co(fc[84]));
  fa fa85 (.A(fc[41]), .B(fs[42]), .Ci(fs[43]), .S(fs[85]), .Co(fc[85]));
  fa fa86 (.A(fs[44]), .B(pp[14][06]), .Ci(pp[15][05]), .S(fs[86]), .Co(fc[86]));
  fa fa87 (.A(fc[42]), .B(fc[43]), .Ci(fc[44]), .S(fs[87]), .Co(fc[87]));
  fa fa88 (.A(fs[45]), .B(fs[46]), .Ci(pp[12][09]), .S(fs[88]), .Co(fc[88]));
  fa fa89 (.A(pp[13][08]), .B(pp[14][07]), .Ci(pp[15][06]), .S(fs[89]), .Co(fc[89]));
  fa fa90 (.A(fc[45]), .B(fc[46]), .Ci(fs[47]), .S(fs[90]), .Co(fc[90]));
  fa fa91 (.A(pp[10][12]), .B(pp[11][11]), .Ci(pp[12][10]), .S(fs[91]), .Co(fc[91]));
  fa fa92 (.A(pp[13][09]), .B(pp[14][08]), .Ci(pp[15][07]), .S(fs[92]), .Co(fc[92]));
  fa fa93 (.A(fc[47]), .B(pp[08][15]), .Ci(pp[09][14]), .S(fs[93]), .Co(fc[93]));
  fa fa94 (.A(pp[10][13]), .B(pp[11][12]), .Ci(pp[12][11]), .S(fs[94]), .Co(fc[94]));
  fa fa95 (.A(pp[13][10]), .B(pp[14][09]), .Ci(pp[15][08]), .S(fs[95]), .Co(fc[95]));
  fa fa96 (.A(pp[09][15]), .B(pp[10][14]), .Ci(pp[11][13]), .S(fs[96]), .Co(fc[96]));
  fa fa97 (.A(pp[12][12]), .B(pp[13][11]), .Ci(pp[14][10]), .S(fs[97]), .Co(fc[97]));
  fa fa98 (.A(pp[10][15]), .B(pp[11][14]), .Ci(pp[12][13]), .S(fs[98]), .Co(fc[98]));
  
  
  ha ha8  (.A(pp[00][06]), .B(pp[01][05]), .S(hs[ 8]), .C(hc[8]));
  ha ha9  (.A(pp[03][04]), .B(pp[04][03]), .S(hs[ 9]), .C(hc[9]));
  ha ha10 (.A(pp[06][02]), .B(pp[07][01]), .S(hs[10]), .C(hc[10]));
  
  
  ////////////////////////////// RS4 16 -> 13 -> 9 -> 6 -> 4////////////////////
  //Adders: FA = 44; HA = 2
  
  fa fa99  (.A(pp[00][05]), .B(pp[01][04]), .Ci(pp[02][03]), .S(fs[99]), .Co(fc[99]));
  fa fa100 (.A(hs[8]), .B(pp[02][04]), .Ci(pp[03][03]), .S(fs[100]), .Co(fc[100]));
  fa fa101 (.A(pp[04][02]), .B(pp[05][01]), .Ci(pp[06][00]), .S(fs[101]), .Co(fc[101]));
  fa fa102 (.A(hc[8]), .B(fs[48]), .Ci(hs[9]), .S(fs[102]), .Co(fc[102]));
  fa fa103 (.A(pp[05][02]), .B(pp[06][01]), .Ci(pp[07][00]), .S(fs[103]), .Co(fc[103]));
  fa fa104 (.A(fc[48]), .B(hc[9]), .Ci(fs[49]), .S(fs[104]), .Co(fc[104]));
  fa fa105 (.A(fs[50]), .B(hs[10]), .Ci(pp[08][00]), .S(fs[105]), .Co(fc[105]));
  fa fa106 (.A(fc[49]), .B(fc[50]), .Ci(hc[10]), .S(fs[106]), .Co(fc[106]));
  fa fa107 (.A(fs[51]), .B(fs[52]), .Ci(fs[53]), .S(fs[107]), .Co(fc[107]));
  fa fa108 (.A(fc[51]), .B(fc[52]), .Ci(fc[53]), .S(fs[108]), .Co(fc[108]));
  fa fa109 (.A(fs[54]), .B(fs[55]), .Ci(fs[56]), .S(fs[109]), .Co(fc[109]));
  fa fa110 (.A(fc[54]), .B(fc[55]), .Ci(fc[56]), .S(fs[110]), .Co(fc[110]));
  fa fa111 (.A(fs[57]), .B(fs[58]), .Ci(fs[59]), .S(fs[111]), .Co(fc[111]));
  fa fa112 (.A(fc[57]), .B(fc[58]), .Ci(fc[59]), .S(fs[112]), .Co(fc[112]));
  fa fa113 (.A(fs[60]), .B(fs[61]), .Ci(fs[62]), .S(fs[113]), .Co(fc[113]));
  fa fa114 (.A(fc[60]), .B(fc[61]), .Ci(fc[62]), .S(fs[114]), .Co(fc[114]));
  fa fa115 (.A(fs[63]), .B(fs[64]), .Ci(fs[65]), .S(fs[115]), .Co(fc[115]));
  fa fa116 (.A(fc[63]), .B(fc[64]), .Ci(fc[65]), .S(fs[116]), .Co(fc[116]));
  fa fa117 (.A(fs[66]), .B(fs[67]), .Ci(fs[68]), .S(fs[117]), .Co(fc[117]));
  fa fa118 (.A(fc[66]), .B(fc[67]), .Ci(fc[68]), .S(fs[118]), .Co(fc[118]));
  fa fa119 (.A(fs[69]), .B(fs[70]), .Ci(fs[71]), .S(fs[119]), .Co(fc[119]));
  fa fa120 (.A(fc[69]), .B(fc[70]), .Ci(fc[71]), .S(fs[120]), .Co(fc[120]));
  fa fa121 (.A(fs[72]), .B(fs[73]), .Ci(fs[74]), .S(fs[121]), .Co(fc[121]));
  fa fa122 (.A(fc[72]), .B(fc[73]), .Ci(fc[74]), .S(fs[122]), .Co(fc[122]));
  fa fa123 (.A(fs[75]), .B(fs[76]), .Ci(fs[77]), .S(fs[123]), .Co(fc[123]));
  fa fa124 (.A(fc[75]), .B(fc[76]), .Ci(fc[77]), .S(fs[124]), .Co(fc[124]));
  fa fa125 (.A(fs[78]), .B(fs[79]), .Ci(fs[80]), .S(fs[125]), .Co(fc[125]));
  fa fa126 (.A(fc[78]), .B(fc[79]), .Ci(fc[80]), .S(fs[126]), .Co(fc[126]));
  fa fa127 (.A(fs[81]), .B(fs[82]), .Ci(fs[83]), .S(fs[127]), .Co(fc[127]));
  fa fa128 (.A(fc[81]), .B(fc[82]), .Ci(fc[83]), .S(fs[128]), .Co(fc[128]));
  fa fa129 (.A(fs[84]), .B(fs[85]), .Ci(fs[86]), .S(fs[129]), .Co(fc[129]));
  fa fa130 (.A(fc[84]), .B(fc[85]), .Ci(fc[86]), .S(fs[130]), .Co(fc[130]));
  fa fa131 (.A(fs[87]), .B(fs[88]), .Ci(fs[89]), .S(fs[131]), .Co(fc[131]));
  fa fa132 (.A(fc[87]), .B(fc[88]), .Ci(fc[89]), .S(fs[132]), .Co(fc[132]));
  fa fa133 (.A(fs[90]), .B(fs[91]), .Ci(fs[92]), .S(fs[133]), .Co(fc[133]));
  fa fa134 (.A(fc[90]), .B(fc[91]), .Ci(fc[92]), .S(fs[134]), .Co(fc[134]));
  fa fa135 (.A(fs[93]), .B(fs[94]), .Ci(fs[95]), .S(fs[135]), .Co(fc[135]));
  fa fa136 (.A(fc[93]), .B(fc[94]), .Ci(fc[95]), .S(fs[136]), .Co(fc[136]));
  fa fa137 (.A(fs[96]), .B(fs[97]), .Ci(pp[15][09]), .S(fs[137]), .Co(fc[137]));
  fa fa138 (.A(fc[96]), .B(fc[97]), .Ci(fs[98]), .S(fs[138]), .Co(fc[138]));
  fa fa139 (.A(pp[13][12]), .B(pp[14][11]), .Ci(pp[15][10]), .S(fs[139]), .Co(fc[139]));
  fa fa140 (.A(fc[98]), .B(pp[11][15]), .Ci(pp[12][14]), .S(fs[140]), .Co(fc[140]));
  fa fa141 (.A(pp[13][13]), .B(pp[14][12]), .Ci(pp[15][11]), .S(fs[141]), .Co(fc[141]));
  fa fa142 (.A(pp[12][15]), .B(pp[13][14]), .Ci(pp[14][13]), .S(fs[142]), .Co(fc[142]));
  
  
   ha ha11   (.A(pp[00][04]), .B(pp[01][03]), .S(hs[11]), .C(hc[11]));
   ha ha12   (.A(pp[03][02]), .B(pp[04][01]), .S(hs[12]), .C(hc[12]));
  
  
  ///////////////////////////// RS5 16 -> 13 -> 9 -> 6 -> 4 -> 3////////////////
 
 // Adders: FA = 25; HA = 1
 
 fa fa143 (.A(hs[11]), .B(pp[02][02]), .Ci(pp[03][01]), .S(fs[143]), .Co(fc[143]));
 fa fa144 (.A(hc[11]), .B(fs[99]), .Ci(hs[12]), .S(fs[144]), .Co(fc[144]));
 fa fa145 (.A(fc[99]), .B(hc[12]), .Ci(fs[100]), .S(fs[145]), .Co(fc[145]));
 fa fa146 (.A(fc[100]), .B(fc[101]), .Ci(fs[102]), .S(fs[146]), .Co(fc[146]));
 fa fa147 (.A(fc[102]), .B(fc[103]), .Ci(fs[104]), .S(fs[147]), .Co(fc[147]));
 fa fa148 (.A(fc[104]), .B(fc[105]), .Ci(fs[106]), .S(fs[148]), .Co(fc[148]));
 fa fa149 (.A(fc[106]), .B(fc[107]), .Ci(fs[108]), .S(fs[149]), .Co(fc[149]));
 fa fa150 (.A(fc[108]), .B(fc[109]), .Ci(fs[110]), .S(fs[150]), .Co(fc[150]));
 fa fa151 (.A(fc[110]), .B(fc[111]), .Ci(fs[112]), .S(fs[151]), .Co(fc[151]));
 fa fa152 (.A(fc[112]), .B(fc[113]), .Ci(fs[114]), .S(fs[152]), .Co(fc[152]));
 fa fa153 (.A(fc[114]), .B(fc[115]), .Ci(fs[116]), .S(fs[153]), .Co(fc[153]));
 fa fa154 (.A(fc[116]), .B(fc[117]), .Ci(fs[118]), .S(fs[154]), .Co(fc[154]));
 fa fa155 (.A(fc[118]), .B(fc[119]), .Ci(fs[120]), .S(fs[155]), .Co(fc[155]));
 fa fa156 (.A(fc[120]), .B(fc[121]), .Ci(fs[122]), .S(fs[156]), .Co(fc[156]));
 fa fa157 (.A(fc[122]), .B(fc[123]), .Ci(fs[124]), .S(fs[157]), .Co(fc[157]));
 fa fa158 (.A(fc[124]), .B(fc[125]), .Ci(fs[126]), .S(fs[158]), .Co(fc[158]));
 fa fa159 (.A(fc[126]), .B(fc[127]), .Ci(fs[128]), .S(fs[159]), .Co(fc[159]));
 fa fa160 (.A(fc[128]), .B(fc[129]), .Ci(fs[130]), .S(fs[160]), .Co(fc[160]));
 fa fa161 (.A(fc[130]), .B(fc[131]), .Ci(fs[132]), .S(fs[161]), .Co(fc[161]));
 fa fa162 (.A(fc[132]), .B(fc[133]), .Ci(fs[134]), .S(fs[162]), .Co(fc[162]));
 fa fa163 (.A(fc[134]), .B(fc[135]), .Ci(fs[136]), .S(fs[163]), .Co(fc[163]));
 fa fa164 (.A(fc[136]), .B(fc[137]), .Ci(fs[138]), .S(fs[164]), .Co(fc[164]));
 fa fa165 (.A(fc[138]), .B(fc[139]), .Ci(fs[140]), .S(fs[165]), .Co(fc[165]));
 fa fa166 (.A(fc[140]), .B(fc[141]), .Ci(fs[142]), .S(fs[166]), .Co(fc[166]));
 fa fa167 (.A(fc[142]), .B(pp[13][15]), .Ci(pp[14][14]), .S(fs[167]), .Co(fc[167]));
 
 
 ha ha13  (.A(pp[00][03]), .B(pp[01][02]), .S(hs[13]), .C(hc[13]));
 
 
 
  ///////////////////////////// RS6 16 -> 13 -> 9 -> 6 -> 4 -> 3 -> 2///////////
  // Adders: FA = 27; HA = 1
  
   fa fa168 (.A(hs[13]), .B(pp[02][01]), .Ci(pp[03][00]), .S(to_FA[1][3]), .Co(to_FA[0][4]));
   fa fa169 (.A(hc[13]), .B(fs[143]), .Ci(pp[04][00]), .S(to_FA[1][4]), .Co(to_FA[0][5]));
   fa fa170 (.A(fc[143]), .B(fs[144]), .Ci(pp[05][00]), .S(to_FA[1][5]), .Co(to_FA[0][6]));
   fa fa171 (.A(fc[144]), .B(fs[145]), .Ci(fs[101]), .S(to_FA[1][6]),  .Co(to_FA[0][7]));
   fa fa172 (.A(fc[145]), .B(fs[146]), .Ci(fs[103]), .S(to_FA[1][7]),  .Co(to_FA[0][8]));
   fa fa173 (.A(fc[146]), .B(fs[147]), .Ci(fs[105]), .S(to_FA[1][8]),  .Co(to_FA[0][9]));
   fa fa174 (.A(fc[147]), .B(fs[148]), .Ci(fs[107]), .S(to_FA[1][9]),  .Co(to_FA[0][10]));
   fa fa175 (.A(fc[148]), .B(fs[149]), .Ci(fs[109]), .S(to_FA[1][10]), .Co(to_FA[0][11]));
   fa fa176 (.A(fc[149]), .B(fs[150]), .Ci(fs[111]), .S(to_FA[1][11]), .Co(to_FA[0][12]));
   fa fa177 (.A(fc[150]), .B(fs[151]), .Ci(fs[113]), .S(to_FA[1][12]), .Co(to_FA[0][13]));
   fa fa178 (.A(fc[151]), .B(fs[152]), .Ci(fs[115]), .S(to_FA[1][13]), .Co(to_FA[0][14]));
   fa fa179 (.A(fc[152]), .B(fs[153]), .Ci(fs[117]), .S(to_FA[1][14]), .Co(to_FA[0][15]));
   fa fa180 (.A(fc[153]), .B(fs[154]), .Ci(fs[119]), .S(to_FA[1][15]), .Co(to_FA[0][16]));
   fa fa181 (.A(fc[154]), .B(fs[155]), .Ci(fs[121]), .S(to_FA[1][16]), .Co(to_FA[0][17]));
   fa fa182 (.A(fc[155]), .B(fs[156]), .Ci(fs[123]), .S(to_FA[1][17]), .Co(to_FA[0][18]));
   fa fa183 (.A(fc[156]), .B(fs[157]), .Ci(fs[125]), .S(to_FA[1][18]), .Co(to_FA[0][19]));
   fa fa184 (.A(fc[157]), .B(fs[158]), .Ci(fs[127]), .S(to_FA[1][19]), .Co(to_FA[0][20]));
   fa fa185 (.A(fc[158]), .B(fs[159]), .Ci(fs[129]), .S(to_FA[1][20]), .Co(to_FA[0][21]));
   fa fa186 (.A(fc[159]), .B(fs[160]), .Ci(fs[131]), .S(to_FA[1][21]), .Co(to_FA[0][22]));
   fa fa187 (.A(fc[160]), .B(fs[161]), .Ci(fs[133]), .S(to_FA[1][22]), .Co(to_FA[0][23]));
   fa fa188 (.A(fc[161]), .B(fs[162]), .Ci(fs[135]), .S(to_FA[1][23]), .Co(to_FA[0][24]));
   fa fa189 (.A(fc[162]), .B(fs[163]), .Ci(fs[137]), .S(to_FA[1][24]), .Co(to_FA[0][25]));
   fa fa190 (.A(fc[163]), .B(fs[164]), .Ci(fs[139]), .S(to_FA[1][25]), .Co(to_FA[0][26]));
   fa fa191 (.A(fc[164]), .B(fs[165]), .Ci(fs[141]), .S(to_FA[1][26]), .Co(to_FA[0][27]));
   fa fa192 (.A(fc[165]), .B(fs[166]), .Ci(pp[15][12]), .S(to_FA[1][27]), .Co(to_FA[0][28]));
   fa fa193 (.A(fc[166]), .B(fs[167]), .Ci(pp[15][13]), .S(to_FA[1][28]), .Co(to_FA[0][29]));
   fa fa194 (.A(fc[167]), .B(pp[14][15]), .Ci(pp[15][14]), .S(to_FA[1][29]), .Co(to_FA[0][30]));
   
   ha ha14  (.A(pp[00][02]), .B(pp[01][01]), .S(to_FA[0][2]), .C(to_FA[0][3]));
  
  
  //mapping outputs
  assign to_FA[0][0] = pp[00][00];
  assign to_FA[1][0] = 1'b0;
  
  assign to_FA[0][1] = pp[00][01];
  assign to_FA[1][1] = pp[01][00];
  
  assign to_FA[1][2] = pp[02][00];
  
  assign to_FA[1][30] = pp[15][15]; 
  
  assign to_FA[0][31] = 1'b0;
  assign to_FA[1][31] = 1'b0; 
  
endmodule




 








  






 





 
