class my_sequence extends uvm_sequence;

    `uvm_object_utils(my_sequence)
    function new (string name="my_sequence");
        super.new(name);
    endfunction

    //`uvm_declare_p_sequencer() Debe agregarse?

    rand int trans_num;

    constraint trans_limit {soft trans_num inside {[50:100]};}

    virtual task body();
        for (int i = 0; i < trans_num; i++) begin 
            item s_item = item::type_id::create("s_item");
            //Transacciones validas
            s_item.Existe_fuente.constraint_mode(1);
            s_item.Existe_direccion.constraint_mode(1);
            s_item.send_self.constraint_mode(1);
            //Modo
            s_item.MODO_1.constraint_mode(0);
            s_item.MODO_0.constraint_mode(0);
            //retardo
            s_item.retardo_0.constraint_mode(0);
            s_item.retardo_aleat.constraint_mode(1);
            //fuente estatica
            s_item.Fuente_estatica.constraint_mode(0);
            start_item(s_item);
            s_item.randomize();
            `uvm_info("Sequenciador",$sformatf("Se genera nuevo item", s_item.print_transaccion()), UVM_HIGH);
            finish_item(s_item);
        end 
        `uvm_info("Sequenciador",$sformatf("El numero de transacciones es  %0d", trans_num), UVM_LOW);
    endtask
endclass