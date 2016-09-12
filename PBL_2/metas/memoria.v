module memoria(endereco,instrucao,dado_escrita,uc_escrita_mem,uc_leitura_mem);

input uc_escrita_mem;
input uc_leitura_mem;
input [31:0] endereco;
input [31:0] dado_escrita;
output reg [31:0] instrucao;


localparam tamanhoMemoria = 1023;
reg [31:0] ROM [0:tamanhoMemoria];

initial begin
  $readmemb("memory.bin", ROM);
end

always @(uc_escrita_mem or uc_leitura_mem)
begin
  
if(uc_leitura_mem && uc_escrita_mem || uc_leitura_mem==0 && uc_escrita_mem==0)
begin
  instrucao = 32'bx;
end
else
  begin
    if(uc_leitura_mem!=1 && uc_escrita_mem)
    begin
		ROM[endereco] = dado_escrita;
		instrucao = 32'bx;
    end
    else
      begin
        if(uc_leitura_mem && uc_escrita_mem !=1)
          begin
	         if (endereco > tamanhoMemoria)
	           begin
		          // $display("memory out of bounds!! Memory size is 1024 bytes.");
		          $finish;
	           end
		        instrucao = {ROM[endereco]};
	       end
      end
end
end
  

endmodule