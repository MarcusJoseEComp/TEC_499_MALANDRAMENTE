module tb_banco;
  
reg uc_escrita;
reg [31:0]dado_p_escrita;
reg [4:0]endereco_escrita;
reg clk;
reg rst;
reg [4:0]endereco_leitura_1;
reg [4:0]endereco_leitura_2;
wire [31:0]dado_leitura_1;
wire [31:0]dado_leitura_2;


reg [31:0] registradores [0:31];
  
  banco br(
  .clk(clk),
	.rst(rst),
	.uc_escrita(uc_escrita),
	.dado_p_escrita(dado_p_escrita),
	.endereco_escrita(endereco_escrita),
	.endereco_leitura_1(endereco_leitura_1),
	.endereco_leitura_2(endereco_leitura_2),
	.dado_leitura_1(dado_leitura_1),
	.dado_leitura_2(dado_leitura_2)  
  );
  
  initial begin
  clk = 0;
  rst = 0;
  dado_p_escrita = 10;
  endereco_escrita = 32'd2;
  uc_escrita = 1;
  end
  
  always
  begin
  #100 clk = !clk;
  #100 uc_escrita = 1;
   #100 uc_escrita = 0;  endereco_leitura_1 = 2; endereco_leitura_2 = 0;
  end

endmodule