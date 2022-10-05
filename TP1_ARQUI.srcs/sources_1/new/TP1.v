`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.09.2022 13:05:26
// Design Name: 
// Module Name: TP1
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


module TP1 #(
        parameter OPERACION_SIZE = 6,
        parameter BUS_SIZE = 8
    )
    (
        input clk,
        input [BUS_SIZE - 1 :0] sw,
        input btnL,
        input btnC,
        input btnR,
        output [BUS_SIZE + 1 :0] led
        
    );
    
    localparam OP_ADD = 6'b100000;
    localparam OP_SUB = 6'b100010;
    localparam OP_AND = 6'b100100;
    localparam OP_OR = 6'b100101;
    localparam OP_XOR = 6'b100110;
    localparam OP_SRA = 6'b000011;
    localparam OP_SRL = 6'b000010;
    localparam OP_NOR = 6'b100111;
    
    reg [BUS_SIZE - 1 : 0] operador_1; 
    reg [BUS_SIZE - 1 : 0] operador_2; 
    reg [OPERACION_SIZE - 1 : 0] operacion; 
    reg[BUS_SIZE-1 : 0] resultado;
    
    
    assign led[BUS_SIZE] = resultado[BUS_SIZE]; //carry
    assign led[BUS_SIZE+1] = ~| resultado[BUS_SIZE-1:0]; //zero
    assign led[BUS_SIZE:0] = resultado;
    
        always @(posedge clk)  
    begin
        
        operador_1 = btnR == 1 ? sw : operador_1;
        operador_2 = btnC == 1 ? sw : operador_2;
        operacion = btnL == 1 ? sw : operacion;
        resultado[BUS_SIZE] = 0;
        
        case(operacion)
            OP_ADD:
                resultado = {1'b0, operador_1} + {1'b0, operador_2}; 
                
            OP_SUB:
                resultado = operador_1 - operador_2 ;
            OP_AND: 
                resultado = operador_1 & operador_2;
            OP_OR:
                resultado = operador_1 | operador_2;
            OP_XOR:
                resultado = operador_1 ^ operador_2;
            OP_SRA:
                resultado = operador_1 >>> 1;
            OP_SRL:
                resultado = operador_1 >> 1;
            OP_NOR:
                resultado = ~(operador_1 | operador_2);
            default: resultado = operador_1 & operador_2 ; 
        endcase
    end
endmodule
