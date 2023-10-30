// mailbox
// Instituto Tecnologico de Costa Rica (www.tec.ac.cr)
// Escuela de Ingeniería Electrónica
// Prof: Ing. Ronny Garcia Ramirez. (rgarcia@tec.ac.cr)
// Estudiantes: -Enmanuel Araya Esquivel. (emanuelarayaesq@gmail.com)
//              -Randall Vargas Chaves. (randallv07@gmail.com)
// Curso: EL-5511 Verificación funcional de circuitos integrados
// Este Script esta estructurado en System Verilog
// Propósito General: Diseño de pruebas en capas para un BUS mesh de datos
// Modulo: Este módulo genera las transacciones y los mailboxes.

///////////////////////////
///////Transacciones///////
///////////////////////////

class Mapeo_colum_fila;
int colum;
int fila;
endclass

class trans_agent_driver #(parameter ROWS = 4, parameter COLUMS = 4, parameter pckg_sz = 40); //Transacciones del agente al driver
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
Mapeo_colum_fila pos_driver[2*ROWS+2*COLUMS];


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

function new (bit [pckg_sz-26:0] dat = 0, bit [3:0] fil = 0, bit [3:0] col = 0, bit mod = 0, int fnt = 0, bit [3:0] dst = 0, bit [7:0] nxt = 0, int tmp = 0, int rtd = 0, int rtd_max = 100, int fnt_aux = 0 );
      this.variabilidad = pckg_sz - 26;
     this.dato = dat;
  this.c_fila = fil;
  this.c_columna = col;
  this.modo = mod;
  this.fuente = fnt;
  this.destino = dst;
  this.Next_jump = nxt;
  this.tiempo = tmp;
    this.retardo = rtd;
    this.retardo_max = rtd_max;
    this.fuente_aux = fnt_aux;
endfunction
endclass

class trans_gen_agent; //Transacción del generador al agente
int cant_transac;
int data_modo;        
int tipo_dato; // Aleatorio o con variabilidad
int tipo_envio; // A quien envia y como
bit [3:0] fila;
bit [3:0] columna;
int destino_aleat;
int fuente_aleat;
int fuente;
int retardo;
int modo_aleat;
int modo_sel;
endclass


class trans_test_gen;
  int tipo_prueba; // Variable que indica el tipo de prueba que va ejecutarse
endclass 


class rand_parameter;
randc int pckg_sz_rand;
rand int fifo_depth;
rand int cant_transac_aleat;

//constrains
constraint size_pckg {pckg_sz_rand >= 25; pckg_sz_rand <= 50;}; 
constraint size_fifo {fifo_depth >= 4; fifo_depth <= 25;}; 
constraint size_cant_transac {cant_transac_aleat >= 1; cant_transac_aleat <= 100;}; 
endclass

class trans_detector_checker #(parameter pckg_sz=40);
int trayec_f;
int trayec_c;
bit [pckg_sz-1:0] data_out;
int tiempo;


function new(int trayec_f, int trayec_c, [pckg_sz-1:0] data_out);
  this.trayec_f = trayec_f;
  this.trayec_c = trayec_c;
  this.data_out = data_out;
  this.tiempo = $time;
endfunction
endclass 

class trans_driver_scoreboard #(parameter pckg_sz = 40);
bit [3:0] filas; 
bit [3:0] colums;
bit [pckg_sz-1:0] paquete; ///
int trayectoria [5][5];
int tiempo_transaccion;


function new(bit [pckg_sz-1:0] info,bit [3:0] fil, bit [3:0] col,int tiempo);
  this.paquete = info;
  this.filas = fil;
  this.colums = col;
  this.tiempo_transaccion = tiempo;
endfunction
endclass

class trans_monitor_checker;
bit [3:0] fila;
bit [3:0] columna;
int pyld;
int receptor;
int tiempo;
int llave;

function new(int rctr);
  this.receptor = rctr;
  this.tiempo = $time;
endfunction

endclass


///////////////////
////Mailboxes//////
///////////////////

typedef mailbox #(trans_agent_driver) agent_driver_mb; // Mailbox Agente - Driver
typedef mailbox #(trans_gen_agent) gen_agent_mb; // Mailbox Generador - Agente
typedef mailbox #(trans_test_gen) test_gen_mb;
typedef mailbox #(trans_detector_checker) detector_checker_mb; 
typedef mailbox #(trans_driver_scoreboard) driver_scoreboard_mb;
typedef mailbox #(trans_driver_scoreboard) scoreboard_checker_mb;
typedef mailbox #(trans_monitor_checker) monitor_checker_mb;

//typedef enum {Variab, aleat} _nemo_ag_dato;
//typedef enum {Normal, Direccion_invalida, Fuente_invalida, send_self} _nemo_ag_modo;
typedef enum {mode_1, mode_0, uno_a_todos, todos_a_uno, retardo_aleat, todo_aleat,Variab, aleat, Normal, fila_columna_1, columna_fila_0, fuente_estatica, retardo_mode, no_direccion, Direccion_invalida, Fuente_invalida, send_self} _nemonicos;
