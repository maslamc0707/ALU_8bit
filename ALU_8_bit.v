`timescale 1ns / 1ps
module ALU_8_bit(A,B,Opcode,Cout,ALUout);
input [7:0]A,B;
input [2:0]Opcode;
output reg [15:0]ALUout;
output reg Cout;
parameter [2:0] ADD = 3'B000, SUB = 3'B001, MUL = 3'B010, LSHFT = 3'B011, RSHFT = 3'B100, AND = 3'B101, OR = 3'B110, XOR = 3'B111;

reg [15:0] comb;
always @(A,B,Opcode)
begin
case(Opcode)
ADD: begin
ALUout = A + B;
if(ALUout[8]==1'b1)
Cout = 1;
else
Cout = 0;
end
SUB: begin
if(A>B)
ALUout = A - B;
else
ALUout = B - A;
end
MUL: begin
ALUout = A*B;
end
LSHFT: begin
if(A==0)
ALUout = B << 1;
else if (B==0)
ALUout = A << 1;
else begin
comb = {A,B};
ALUout = comb << 1;
end
end
RSHFT: begin
if(A==0)
ALUout = B >> 1;
else if (B==0)
ALUout = A >> 1;
else begin
comb = {A,B};
ALUout = comb >> 1;
end
end
AND: begin
ALUout = A & B;
end
OR: begin
ALUout = A | B;
end
XOR: begin
ALUout = A ^ B;
end
endcase
end
endmodule
