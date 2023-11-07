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

    //Otros
    int tiempo;
    int variabilidad;
    rand int retardo;
    int retardo_max;
    int fuente_aux;


    virtual function string print_transaccion(); // Imprime la transacción
        return $sformatf("Fila_d=%0h, Columna_d=%0h, Modo=%0d, Fila_f=%0d, Columna_F=%0d, Pyld=%0d",
        d_fila, d_columna, modo, f_fila, f_columna, dato);
    endfunction


    // *************************************Constraints*************************************

    //Modo
    constraint MODO_1 {modo == 1;};
    constraint MODO_0 {modo == 0;};
    //Fuente
    constraint Existe_fuente {fuente >= 0; fuente < 2*ROWS+2*COLUMS;}; 
    constraint send_self {c_fila != pos_driver[fuente].fila; c_columna != pos_driver[fuente].colum;};
    //Dirección
    constraint Existe_direccion {c_fila <= ROWS+1; c_fila >= 0; c_columna <= COLUMS+1; c_columna >= 0;};
    constraint restric_columna {
    if(c_fila == 0 | c_fila == ROWS+1) 
        c_columna <= COLUMS & c_columna > 0;
    };
    constraint restric_fila {
    if(c_columna == 0 | c_columna == COLUMS+1) 
        c_fila <= ROWS & c_fila > 0;
    };
    constraint direccion_valida_drvs {
    if(c_fila != 0 & c_fila != ROWS+1)
        c_columna == 0 | c_columna == COLUMS+1;
    };
    //Datos
    constraint variabilidad_dato {dato inside {{(pckg_sz-25){2'b10}},{(pckg_sz-25){2'b01}},{(pckg_sz-25){1'b1}},{(pckg_sz-25){1'b0}}};};// Variabilidad maxima

    //Fuente estatica
    constraint Fuente_estatica {fuente == fuente_aux;};

    //Retardo
    constraint retardo_aleat{retardo<=retardo_max;retardo>0;};
    constraint retardo_0{retardo == 0;};

endclass
