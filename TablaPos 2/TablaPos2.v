
module gates();

// declaración de variables

wire O1;
wire O2;
wire O3;
wire O4;
wire O5;		//or necesarios
wire Y;		//and necesario
wire NA;
wire NB;
wire NC;		//not necesarios
reg A, B, C;	// entradas

// declaracion de gates
not GNA (NA, A);		//-A
not GNB (NB, B);		//-B
not GNC (NC, C);		//-C
or GO1 (O1, A,B,C);		 //A+B+C
or GO2 (O2, A,NB,C);		//A-B+C
or GO3 (O3, A,NB,NC);		//A-B-C
or GO3 (O4, NA,B,C);		//-A+B+C
or GO3 (O5, NA,B,NC);		//-A+B-C
and GA1 (Y, O1, O2, O3, O4, O5);	//respuesta


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
      $dumpfile("TablaPos2_tb.vcd"); 
      $dumpvars(0, gates); 
    end
endmodule	//finalizar el módulo