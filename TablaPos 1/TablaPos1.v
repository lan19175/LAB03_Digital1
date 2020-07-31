
module gates();

// declaración de variables

wire O1;
wire O2;
wire O3;		//or necesarios
wire A1;		//and necesario
wire N1;
wire N2;
wire N3;		//not necesarios
reg A, B, C;	// entradas

// declaracion de gates
not GNA (N1, A);		//-A
not GNB (N2, B);		//-B
not GNC (N3, C);		//-C
or GO1 (O1, A,B,N3);		 //A+B-C
or GO2 (O2, A,N2,N3);		//A-B-C
or GO3 (O3, N1,N2,C);		//-A-B+C
and GA1 (A1, O1, O2, O3);	//respuesta


// inicio
initial begin
$display("A B C | Y");
$display("-------");
//declaramos tipo de variable

  $monitor("%b %b %b | %b", A, B, C, A1);

  // Inpunts en 0
  A = 0;
  B = 0;
  C = 0;

  // Declaramos otros cambios en otros tiempo
  #1 C = 1;
  #1 B = 1; C=0;
  #1 C = 1;
  #1 A=1;B=0;C=0;
  #1 C=1;
  #1 B=1;C=0;
  #1 C=1;
  #1 $finish;   // termina la simulación
end


  initial
    begin
      $dumpfile("TablaPos1_tb.vcd"); 
      $dumpvars(0, gates); 
    end
endmodule	//finalizar el módulo