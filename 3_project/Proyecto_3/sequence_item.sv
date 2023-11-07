// Estudiantes: -Enmanuel Araya Esquivel. (emanuelarayaesq@gmail.com)
//              -Randall Vargas Chaves. (randallv07@gmail.com)
// Curso: EL-5511 Verificación funcional de circuitos integrados
// Este Script esta estructurado en System Verilog
// Propósito General: Objetos de datos que deben enviarse al DUT
// Modulo: Sequence_item

////////////////////////////////////////////////////////////////////////////////////
// Sequence Item: En este se realizan las transacciones que seran enviadas al DUT //
////////////////////////////////////////////////////////////////////////////////////

rand bit [pckg_sz-26:0] dato;
randc bit [3:0] c_fila;
randc bit [3:0] c_columna;
rand bit modo;
bit modo_selec;
rand int fuente;
bit [3:0] destino;
bit [7:0] Next_jump;
int tiempo;
int variabilidad;
rand int retardo;
int retardo_max;
int fuente_aux;

class item extends uvm_sequence_item;
    `uvm_object_utils(item); // Registro en la fabrica

    function new(string name = "item"); // Constructor
        super.new(name);
    endfunction

    // Trasacción {Nextjump, d_fila, d_columna, modo, f_fila, f_columna, dato}
    rand bit  [pckg_sz-26:0] dato;  // Payload
    rand bit  [3:0] d_fila;  // Fila de destino
    rand bit  [3:0] d_columna;  // Columna de destino
    rand bit modo; // Modo
    bit  [3:0] f_fila;  // Fila de fuente
    bit  [3:0] f_columna;  // Columna de fuente

    virtual function string print_item_in(); // Prints the input item
        return $sformatf("fp_X=%0h, fp_Y=%0h, r_mode=%0d",
        fp_X,fp_Y,r_mode);
    endfunction

    virtual function string print_item_out(); // Prints the output item
        return $sformatf("fp_X=%0h, fp_Y=%0h, fp_Z=%0h, r_mode=%0d, ovrf=%0b, udrf=%0b",
        fp_X,fp_Y,fp_Z,r_mode,ovrf,udrf);
    endfunction

    // *************************************Constraints*************************************

    // Rounding mode	
    constraint c_rounding {r_mode inside{3'b000,3'b001,3'b010,3'b011,3'b100};}

    // Specific values
    constraint c_specific {
    fp_X inside {32'h00000000,32'h80000000,32'hFFFFFFFF,32'h7FFFFFFF,32'h7FC00000,32'hFFC00000,32'h55555555,32'hAAAAAAAA};
    fp_Y inside {32'h00000000,32'h80000000,32'hFFFFFFFF,32'h7FFFFFFF,32'h7FC00000,32'hFFC00000,32'h55555555,32'hAAAAAAAA};}

    // Constraint for overflow
    constraint c_overflow {fp_X[30:23] + fp_Y[30:23]  >= 382;}

    // Constraint for  underflow
    constraint c_underflow {fp_X[30:23]  + fp_Y[30:23] <= 126;}

    // Constraint for NaN
    constraint c_nan {(&fp_X[30:22])&(~|fp_X[21:0]) | (&fp_Y[30:22])&(~|fp_Y[21:0]);}

    // Constraint between overflow and underflow 
    constraint c_between {fp_X[30:23] + fp_Y[30:23] > 126; fp_X[30:23] + fp_Y[30:23] < 382;}
endclass
