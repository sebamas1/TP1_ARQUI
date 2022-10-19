`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.10.2022 18:56:48
// Design Name: 
// Module Name: Interface
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Interface
        (
        input i_clk,
        input [7 :0] o_operando_1,
        input [7 :0] o_operando_2,
        input [5 : 0] o_operacion,
        output [9 : 0] salida
        );
        
        	ALU #( .BUS_SIZE(8) ) alu
	(
            .i_operando_1(o_operando_1),
            .i_operando_2(o_operando_2),
            .i_operacion(o_operacion),
            .o_led(salida)
	);
	
	
	
	//assign o_operando_1 = 8'b00000010;
	//assign o_operando_2 = 8'b00000010;
	//assign o_operacion = 6'b100000;
    endmodule
