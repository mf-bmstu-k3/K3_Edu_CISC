module Decoder_Hex (
	input wire [3:0] in,
	output wire[6:0] hex
);

assign hex = ~(
	in == 4'h0 ? 7'b0111111 :
	in == 4'h1 ? 7'b0000110 :
	in == 4'h2 ? 7'b1011011 :
	in == 4'h3 ? 7'b1001111 :
	in == 4'h4 ? 7'b1100110 :
	in == 4'h5 ? 7'b1101101 :
	in == 4'h6 ? 7'b1111101 :
	in == 4'h7 ? 7'b0000111 :
	in == 4'h8 ? 7'b1111111 :
	in == 4'h9 ? 7'b1101111 :
	in == 4'hA ? 7'b1110111 :
	in == 4'hB ? 7'b1111100 :
	in == 4'hC ? 7'b0111001 :
	in == 4'hD ? 7'b1011110 :
	in == 4'hE ? 7'b1111001 :
                7'b1110001);

endmodule
