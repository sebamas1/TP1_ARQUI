`timescale 1ns / 1ps

module Test_bench;
    localparam BUS_SIZE = 8;   
    localparam I_CLK = 1'b0;
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
        
        o_operando_1 = dato_a;
        $display("dato a: %d", dato_a);
        
        #5
         dato_b = $urandom()%256;
        o_operando_2 = dato_b;
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
        
        ///////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////// FIN TEST SUMA /////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////
        
        #10;
        o_operacion = OP_SUB;
        #10;
        
        expected_result = dato_a - dato_b;
        actual_result = salida;
        $display("[RESTA] Resultado Esperado: %d  vs   Resultado Actual: %d", expected_result, actual_result);
        if(!(expected_result == actual_result))
        begin
            $display("Incorrecta el test de la RESTA");
        end else begin
            $display("CORRECTO el test de la RESTA");
        end
        
        ///////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////// FIN TEST RESTA ////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////
        
        #10;
        o_operacion = OP_AND;
        #10
        expected_result = dato_a & dato_b;
        actual_result = salida;
        $display("[AND] Resultado Esperado: %d  vs   Resultado Actual: %d", expected_result, actual_result);
        if(!(expected_result == actual_result))
        begin
            $display("Incorrecto el test del AND");
        end else begin
            $display("CORRECTO el test del AND");
        end
        
        ///////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////// FIN TEST AND //////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////
        
        #10;
        o_operacion = OP_OR;
        #10
        expected_result = dato_a | dato_b;
        actual_result = salida;
        $display("[OR] Resultado Esperado: %d  vs   Resultado Actual: %d", expected_result, actual_result);
        if(!(expected_result == actual_result))
        begin
            $display("Incorrecto el test del OR");
        end else begin
            $display("CORRECTO el test del OR");
        end
        
        ///////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////// FIN TEST OR ///////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////
        
        #10;
        o_operacion = OP_XOR;
        #10
        expected_result = dato_a ^ dato_b;
        actual_result = salida;
        $display("[XOR] Resultado Esperado: %d  vs   Resultado Actual: %d", expected_result, actual_result);
        if(!(expected_result == actual_result))
        begin
            $display("Incorrecto el test de XOR");
        end else begin
            $display("CORRECTO el test del XOR");
        end
        
        ///////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////// FIN TEST XOR //////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////
        
        #10;
        o_operacion = OP_SRA;
        #10
        expected_result = dato_a >>> 1;
        actual_result = salida;
        $display("[SRA] Resultado Esperado: %d  vs   Resultado Actual: %d", expected_result, actual_result);
        if(!(expected_result == actual_result))
        begin
            $display("Incorrecto el test de SRA");
        end else begin
            $display("CORRECTO el test de SRA");
        end
        
        ///////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////// FIN TEST SRA //////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////
        
        #10;
        o_operacion = OP_SRL;
        #10
        expected_result = dato_a >> 1;
        actual_result = salida;
        $display("[SRL] Resultado Esperado: %d  vs   Resultado Actual: %d", expected_result, actual_result);
        if(!(expected_result == actual_result))
        begin
            $display("Incorrecto el test de SRL");
        end else begin
            $display("CORRECTO el test de SRL");
        end
        
        ///////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////// FIN TEST SRL //////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////
        
        #10
        o_operacion = OP_NOR;
        #10
        expected_result = ~(dato_a | dato_b);
        actual_result = salida;
        $display("[NOR] Resultado Esperado: %d  vs   Resultado Actual: %d", expected_result, actual_result);
        if(!(expected_result == actual_result))
        begin
            $display("Incorrecto el test de NOR");
        end else begin
            $display("CORRECTO el test de NOR");
        end
        
        ///////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////// FIN TEST NOR //////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////
        
        $finish;
    end
    
    always begin
        #1
        i_clk = ~i_clk;
    end
endmodule

