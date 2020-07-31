
module gates();

// declaración de variables

wire A1;
wire A2;
wire A3;		
wire A4;		//and necesarios
wire A5;
wire Y; 		//or necesarios
wire NA;
wire NB;
wire NC;		//not necesarios
reg A, B, C;	// entradas

// declaracion de gates
not GNA (NA, A);		//-A
not GNB (NB, B);		//-B
not GNC (NC, C);		//-C
and GA1 (A1, NA, NB, NC);		 //-A-B-C
and GA2 (A2, NA,B,NC);		//-AB-C
and GA3 (A3, A,NB,NC);		//A-B-C
and GA4 (A4, A,NB,C);		//A-BC
and GA5 (A5, A,B,C);		//ABC
or  GO1 (Y, A1, A2, A3, A4, A5);	//respuesta


// inicio
initial begin
$display("A B C | Y");
$display("-------");
//declaramos tipo de variable

  $monitor("%b %b %b | %b", A, B, C, Y);

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
      $dumpfile("TablaSop1_tb.vcd"); 
      $dumpvars(0, gates); 
	  end
endmodule	//finalizar el módulo