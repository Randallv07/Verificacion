# Verificación Funcional de circuitos integrados Proyecto 3: Bus Enrutador en UVM 
Pasos para correr el proyecto 

1)Ingresar a la siguiente dirección: \n
/mnt/vol_NFS_rh003/Est_Verif_II2023/RVargas/3_proj/Verificacion/3_project/Proyecto_3

2) Correr el comando: \n 
bash comandos.sh y especificar el nombre de "testbench.sv" cuando se pregunte por la prueba a correr.

3) Correr comando: \n
   ./salida

Para correr los porcentajes de cobertura en Verdi dentro de esa misma dirección:

1) Correr comando para usar las instrucciones: \n 
  source /mnt/vol_NFS_rh003/estudiantes/archivos_config/synopsys_tools.sh;

2) Correr comando para ver archivo log: \n
vcs -Mupdate testbench.sv -o salida1  -full64 -sverilog  -kdb -lca -debug_acc+all -debug_region+cell+encrypt -l log_test +lint=TFIPC-L -cm line+tgl+cond+fsm+branch+assert -ntb_opts uvm-1.2

3)Correr comando para ver activar el analisis de cobertura: \n 
./salida1 -cm line+tgl+cond+fsm+branch+assert

4)Correr comando para abrir gráficas de cobertura de verdi: \n

verdi -cov -covdir salida1.vdb


Hacerlo de esa manera, por alguna razón al intentar correr el bash comandos.sh y luego los comandos para ver la cobertura de toggle no permitía abrir el Verdi.
