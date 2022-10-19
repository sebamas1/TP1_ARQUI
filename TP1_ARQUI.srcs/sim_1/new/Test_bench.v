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
    reg[BUS_SIZE - 1 :0] dato_a;
    reg[BUS_SIZE - 1 :0] dato_b;
    reg[BUS_SIZE - 1 :0] o_operando_1;
    reg[BUS_SIZE - 1 :0] o_operando_2;
    reg[5 :0] o_operacion;
    reg[BUS_SIZE - 1 :0] expected_result;
    reg[BUS_SIZE - 1 :0] actual_result;
    
    
    wire[9 : 0] salida;
    wire o_carry_bit;
    wire o_zero_bit;

    Interface test_unit(
            i_clk,
            o_operando_1,
            o_operando_2,
            o_operacion,
            salida
        );
    initial begin
        $display("Resultado del test");
        i_clk = I_CLK;
        dato_a = $urandom(2)%256;
        
        o_operando_1 = dato_a; //159, pone la entrada como el primer operador que es FA
        $display("dato a: %d", dato_a);
        
        #5
         dato_b = $urandom()%256;
        o_operando_2 = dato_b; //9, setea el operador 2
        $display("dato b: %d", dato_b);
        #5
        o_operacion = OP_ADD;
        #10
        expected_result = dato_a + dato_b;
        actual_result = salida;
        $display("[SUMA] Resultado Esperado: %d  vs   Resultado Actual: %d", expected_result, actual_result);

        if(!(expected_result == actual_result))
        begin
            $display("Incorrecta el test de la SUMA");
        end else begin
            $display("CORRECTO el test de la SUMA");
        end
        
        $finish;
    end
    
    always begin
        #1
        i_clk = ~i_clk;
    end
endmodule

