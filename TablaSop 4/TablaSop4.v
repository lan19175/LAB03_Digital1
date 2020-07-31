
module gates();

// declaración de variables

wire A1;
wire A2;
wire A3;
wire A4;
wire A5;
wire A6;
wire A7;		//AND necesarios
wire Y;		//or necesario
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
and GA1 (A1, NA,NB,NC,ND);	//-A-B-C-D
and GA2 (A2, NA,NB,C,ND);	//-A-BC-D
and GA3 (A3, NA,NB,C,D);	//-A-BCD
and GA4 (A4, NA,B,C,ND);	//-ABC-D
and GA5 (A5, NA,B,C,D);		//-ABCD
and GA6 (A6, A,NB,NC,ND);	//A-B-C-D
and GA7 (A7, A,NB,C,ND);		//A-BC-D
or GO1 (Y, A1, A2, A3, A4, A5, A6, A7);	//respuesta


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
      $dumpfile("TablaSop4_tb.vcd"); 
      $dumpvars(0, gates); 
    end
endmodule	//finalizar el módulo