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
            start_item(s_item);
            s_item.randomize();
            `uvm_info("Sequenciador",$sformatf("Se genera nuevo item", s_item.print_transaccion()), UVM_HIGH);
            finish_item(s_item);
        end 
        `uvm_info("Sequenciador",$sformatf("El numero de transacciones es  %0d", trans_num), UVM_LOW);
    endtask
endclass