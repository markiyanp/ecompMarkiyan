`timescale 1ns / 1ps

//compute p**q, where q=4


module top ( //top level module
	input [3:0]  a,
	input [3:0]  b,
	input 	     c,
	output [3:0] s,
        output 	     c4
);
   wire        [2:0]aux_p;
   wire        [2:0]aux_p1;
   wire        [2:0]aux_g;
   wire        [2:0]aux_g1;
   wire        [2:0]aux_P;
   wire        [2:0]aux_G;
   wire        aux_G3;
   wire        aux_P3;
   wire        aux_c1;
   wire        aux_c2;
   wire        aux_c3;
   
  

     full_adder fa0 (
		   .a(a[0]),
		   .b(b[0]),
		   .c(c),
		   .s(s[0]),
		   .p(aux_p[0]),
		     .g(aux_g[0]));
   
     
   
     full_adder fa1 (
		   .a(a[1]),
		   .b(b[1]),
		   .c(aux_c1),
		   .s(s[1]),
		   .p(aux_p[1]),
		     .g(aux_g[1]));
   
       
     full_adder fa2 (
		   .a(a[2]),
		   .b(b[2]),
		   .c(aux_c2),
		   .s(s[2]),
		   .p(aux_p1[0]),
		     .g(aux_g1[0]));
   
       
     full_adder fa3 (
		   .a(a[3]),
		   .b(b[3]),
		   .c(aux_c3),
		   .s(s[3]),
		   .p(aux_p1[1]),
		     .g(aux_g1[1]));
   

     cla_node cla0 (
		    .p(aux_p),
		    .g(aux_g),
		    .c(c),
		    .P(aux_P[0]),
		    .G(aux_G[0]),
		    .c1(aux_c1));
   
       
    cla_node cla1 (
		    .p(aux_p1),
		    .g(aux_g1),
		    .c(aux_c2),
		    .P(aux_P[1]),
		    .G(aux_G[1]),
		   .c1(aux_c3));
   
      
    cla_node cla2 (
		    .p(aux_P),
		    .g(aux_G),
		    .c(c),
		    .P(aux_P3),
		    .G(aux_G3),
		   .c1(aux_c2));
		   
  		   
      assign c4 = aux_G3 + (aux_P3 & c);
   
    
endmodule
