// Estudiantes: -Enmanuel Araya Esquivel. (emanuelarayaesq@gmail.com)
//              -Randall Vargas Chaves. (randallv07@gmail.com)
// Curso: EL-5511 Verificación funcional de circuitos integrados
// Este Script esta estructurado en System Verilog
// Propósito General: Diseño de pruebas en capas para un BUS mesh de datos
// Modulo: Test

//////////////////////////////////////////////////////////////
// Test:genera las limitaciones en los escenarios de prueba//
/////////////////////////////////////////////////////////////

class test #(parameter ROWS = 4, parameter COLUMS = 4, parameter pckg_sz = 40, parameter fifo_depth = 4,parameter drvrs = ROWS*2+2*COLUMS);

//Transacciones
trans_test_gen trans_test_gen_t;

//Mailboxes
test_gen_mb test_gen_mb_t;

function new();
  this.trans_test_gen_t = new();
endfunction 

task run();
  
  // prueba modo 1
  this.trans_test_gen_t = new();
  trans_test_gen_t.tipo_prueba = mode_1;
  test_gen_mb_t.put(trans_test_gen_t);
  $display("TEST: CASO-modo_1",$time);
  #1000
  
  //prueba modo 0
  this.trans_test_gen_t = new();
  trans_test_gen_t.tipo_prueba = mode_0;
  test_gen_mb_t.put(trans_test_gen_t);
  $display("TEST: CASO-modo_0",$time);
  #1000

  
  //prueba uno a todos
  this.trans_test_gen_t = new();
  trans_test_gen_t.tipo_prueba = uno_a_todos;
  test_gen_mb_t.put(trans_test_gen_t);
  $display("TEST: CASO-uno a todos",$time);
  #1000
  
  //prueba todos a uno
  this.trans_test_gen_t = new();
  trans_test_gen_t.tipo_prueba = todos_a_uno;
  test_gen_mb_t.put(trans_test_gen_t);
  $display("TEST: CASO-todos a uno",$time);
  #1000
  
  //prueba retardo
  this.trans_test_gen_t = new();
  trans_test_gen_t.tipo_prueba = retardo_aleat;
  test_gen_mb_t.put(trans_test_gen_t);
  $display("TEST: CASO-retardo_aleatorio",$time);
  #1000
  
     //prueba todo aleatorio
  this.trans_test_gen_t = new();
  trans_test_gen_t.tipo_prueba = todo_aleat;
  test_gen_mb_t.put(trans_test_gen_t);
  $display("TEST: CASO-todo-aleatorio",$time);
  #1000
  
  //prueba dirección invalida
  this.trans_test_gen_t = new();
  trans_test_gen_t.tipo_prueba = no_direccion;
  test_gen_mb_t.put(trans_test_gen_t);
  $display("TEST: CASO-direcciones-invalidas",$time);
  

endtask


endclass
