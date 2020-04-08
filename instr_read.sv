module instr_read ();


integer file;
reg [31:0] inst_mem [7999:0];


initial begin
     file = $fopen("C:/Users/bound/Desktop/ETUDE/Projet/Projet_Riscy/Projet_SoC/instr.txt", "r");
     if (file == 0) begin
       $display("instr_file handle was NULL");
      // $finish;
     end
	   $readmemb("C:/Users/bound/Desktop/ETUDE/Projet/Projet_Riscy/Projet_SoC/instr.txt" ,inst_mem);
     $fclose(file); // Close file before finish

end
endmodule
