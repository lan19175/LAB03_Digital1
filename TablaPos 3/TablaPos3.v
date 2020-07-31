
module gates();

// declaración de variables

wire O1;
wire O2;
wire O3;
wire O4;
wire O5;
wire O6;
wire O7;
wire O8;
wire O9;		//or necesarios
wire Y;		//and necesario
wire NA;
wire NB;
wire NC;
wire ND;		//not necesarios
reg A, B, C, D;	// entradas

// declaracion de gates
not GNA (NA, A);		//-A
not GNB (NB, B);		//-B
not GNC (NC, C);		//-C
not GND (ND, D);		//-D
or GO1 (O1, A,NB,C,D);		 //A-B+C+D
or GO2 (O2, A,NB,C,ND);		//A-B+C-D
or GO3 (O3, A,NB,NC,D);		//A-B-C+D
or GO4 (O4, A,NB,NC,ND);	//A-B-C-D
or GO5 (O5, NA,B,C,ND);		//-A+B+C-D
or GO6 (O6, NA,B,NC,ND);	//-A+B-C-D
or GO7 (O7, NA,NB,C,D);		//-A-B+C+D
or GO8 (O8, NA,NB,C,ND);	//-A-B+C-D
or GO9 (O9, NA,NB,NC,ND);	//-A-B-C-D
and GA1 (Y, O1, O2, O3, O4, O5, O6, O7, O8, O9);	//respuesta


// inicio
initial begin
$display("A B C D | Y");
$display("-------");
//declaramos tipo de variable

  $monitor("%b %b %b %b | %b", A, B, C, D, Y);

  // Inpunts en 0
  A = 0;
  B = 0;
  C = 0;
  D = 0;

  // Declaramos otros cambios en otros tiempo
  #1 D=1;
  #1 C=1;D=0;
  #1 D=1;
  #1 B=1;C=0;D=0;
  #1 D=1;
  #1 C=1;D=0;
  #1 D=1;
  #1 A=1;B=0;C=0;D=0;
  #1 D=1;
  #1 C=1;D=0;
  #1 D=1;
  #1 B=1;C=0;D=0;
  #1 D=1;
  #1 C=1;D=0;
  #1 D=1;
  #1 $finish;   // termina la simulación
end


  initial
    begin
      $dumpfile("TablaPos3_tb.vcd"); 
      $dumpvars(0, gates); 
    end
endmodule	//finalizar el módulo