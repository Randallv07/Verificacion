// Estudiantes: -Enmanuel Araya Esquivel. (emanuelarayaesq@gmail.com)
//              -Randall Vargas Chaves. (randallv07@gmail.com)
// Curso: EL-5511 Verificación funcional de circuitos integrados
// Este Script esta estructurado en System Verilog
// Propósito General: Objetos de datos que deben enviarse al DUT
// Modulo: Sequence_item

class mapeo; // Clase para mapear filas y columna de fuente
  int fila;
  int column;
endclass

////////////////////////////////////////////////////////////////////////////////////
// Sequence Item: En este se realizan las transacciones que seran enviadas al DUT //
////////////////////////////////////////////////////////////////////////////////////

class item extends uvm_sequence_item;
  `uvm_object_utils(item); // Registro en la fabrica

  //Parametros
  parameter int ROWS = 4;
  parameter int COLUMS = 4;
  parameter int pckg_sz = 40;

  function new(string name = "item"); // Constructor
  super.new(name);
  endfunction

  // drvs 
  rand bit  [pckg_sz-26:0] dato;  // Payload
  rand bit modo; // Modo
  bit [7:0] Next_jump = 8'b11111111;
  rand bit  [3:0] d_fila;  // Fila de destino
  rand bit  [3:0] d_columna;  // Columna de destino
  rand int fuente;
  mapeo pos_driver [COLUMS*2+ROWS*2];

  //sequences
  int tiempo;
  int variabilidad;
  rand int retardo;
  int retardo_max=50;
  int fuente_aux=5;

  //mnt
  bit  [pckg_sz-1:0] out;  // Fila de fuente

  //scoreboard
  bit [3:0] f_columna;  // Columna de fuente
  bit [3:0] f_fila;  // Fila de fuente
  int trayectoria [5][5]; // ayuda a guardar el camino de la sequencia
  bit listo = 0; 
  int salto = 0; // cuenta los saltos de la transacción
  bit [pckg_sz-1:0] paquete;  // Columna de fuente




  virtual function string print_transaccion(); // Imprime la transacción que entra
    return $sformatf("Fuente: [%0d][%0d], envia el mensaje: %0h al driver destino [%0d][%0d], en modo %0d", f_fila, f_columna, dato, d_fila, d_columna, modo);
  endfunction

  virtual function string print_salida(); // Imprime la transacción que sale
    return $sformatf("Destino: [%0d][%0d] recibe dato: %0h de drvr fuente [%0d][%0d] en modo %0b", out[pckg_sz-9:pckg_sz-12],out[pckg_sz-13:pckg_sz-16],out[pckg_sz-26:0],out[pckg_sz-18:pckg_sz-21],out[pckg_sz-22:pckg_sz-25],out[pckg_sz-17]);
  endfunction

  // *************************************Constraints*************************************

  //Modo
  constraint MODO_1 {modo == 1;};
  constraint MODO_0 {modo == 0;};
  //Fuente
  constraint Existe_fuente {fuente >= 0; fuente < 2*ROWS+2*COLUMS;}; 
  //constraint send_self {d_fila != f_fila; d_columna != f_columna;};
  //constraint send_self {d_fila != pos_driver[fuente].fila; d_columna != pos_driver[fuente].column;};
  //constraint send_self{d_fila == pos_driver[fuente].fila; d_columna == pos_driver[fuente].column;};
  //constraint misma_fila_columna {d_fila != pos_driver[fuente].fila; d_columna != pos_driver[fuente].column;};
  //Dirección
  constraint Existe_direccion {d_fila <= ROWS+1; d_fila >= 0; d_columna <= COLUMS+1; d_columna >= 0;};
  constraint restric_columna {
    if(d_fila == 0 | d_fila == ROWS+1) 
      d_columna <= COLUMS & d_columna > 0;
  };
  constraint restric_fila {
    if(d_columna == 0 | d_columna == COLUMS+1) 
      d_fila <= ROWS & d_fila > 0;
  };
  constraint direccion_valida_drvs {
    if(d_fila != 0 & d_fila != ROWS+1)
      d_columna == 0 | d_columna == COLUMS+1;
  };
  //Datos
  constraint variabilidad_dato {dato inside {{(pckg_sz-25){2'b10}},{(pckg_sz-25){2'b01}},{(pckg_sz-25){1'b1}},{(pckg_sz-25){1'b0}}};};// Variabilidad maxima

  //Fuente estatica
  constraint Fuente_estatica {fuente == fuente_aux;};

  //Destino estatico
  constraint Destino_estatico {d_fila ==4; d_columna ==5;};

  //Retardo
  constraint retardo_aleat{retardo<=retardo_max;retardo>0;};
  constraint retardo_0{retardo == 0;};
endclass