`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.09.2022 14:13:23
// Design Name: 
// Module Name: Test_bench
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


module Test_bench;
    localparam OPERACION_SIZE = 6;
    localparam BUS_SIZE = 8;   
    localparam ENABLE = 3;
    localparam I_CLK = 1'b0;
    localparam I_EN = 3'b000;
    localparam OPERADOR_1 = 8'h9F; //159  
    localparam OPERADOR_2 = 8'h02; //9 
    localparam I_OPERATION = 6'h0;
    localparam OP_ADD = 6'b100000;
    localparam OP_SUB = 6'b100010;
    localparam OP_AND = 6'b100100;
    localparam OP_OR = 6'b100101;
    localparam OP_XOR = 6'b100110;
    localparam OP_SRA = 6'b000011;
    localparam OP_SRL = 6'b000010;
    localparam OP_NOR = 6'b100111;


    reg i_clk;
    reg[ENABLE - 1 : 0] enables;
    reg[BUS_SIZE - 1 :0] entrada;
    
    
    wire[BUS_SIZE - 1 : 0] salida;
    wire o_carry_bit;
    wire o_zero_bit;

    TP1 test_unit(
            i_clk,
            o_carry_bit,
            o_zero_bit,
            salida,
            entrada,            
            enables 
        );
    initial begin
        i_clk = I_CLK;
        enables = I_EN;  
        entrada = OPERADOR_1; //159, pone la entrada como el primer operador que es FA
        #5
        enables[0] = 1; //carga la entrada en el primer operador
        #5
        enables[0] = 0; //da de baja el enable para el operador 1
        entrada = OPERADOR_2; //9, setea el operador 2
        enables[1] = 1; //carga el operador 2
        #5
        enables[1] = 0;
        entrada = I_OPERATION;
        enables[2] = 1; //carga la operacion que esta en 0
        #5
        enables[2] = 0;

        entrada = OP_ADD;
        enables[2] = 1;
        #2
        enables[2] = 0;
        #10;
        entrada = OP_SUB;
        enables[2] = 1;
        #2
        enables[2] = 0;
        #10;
        entrada = OP_AND;
        enables[2] = 1;
        #2
        enables[2] = 0;
        #10;
        entrada = OP_OR;
        enables[2] = 1;
        #2
        enables[2] = 0;
        #10;
        entrada = OP_XOR;
        enables[2] = 1;
        #2
        enables[2] = 0;
        #10;
        entrada = OP_SRA;
        enables[2] = 1;
        #2
        enables[2] = 0;
        #10;
        entrada = OP_SRL;
        enables[2] = 1;
        #2
        enables[2] = 0;
        #10;
        entrada = OP_NOR;
        enables[2] = 1;
        #2
        enables[2] = 0;
        #10
        $finish;
    end
    
    always begin
        #1
        i_clk = ~i_clk;
    end
endmodule

