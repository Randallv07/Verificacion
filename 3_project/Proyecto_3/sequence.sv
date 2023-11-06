class secuencia extends uvm_sequence;

    `uvm_object_utils(my_sequence)
    function new (string name="secuencia");
        super.new(name);
    endfunction

    //`uvm_declare_p_sequencer() Debe agregarse?

    rand int trans_num;

    constraint terminal_limit {trans_num {[50:100]};}
    virtual task body();
        for (int i =0; i < trans_num; i++) begin 
            Item s_item = Item::type_id::create("s_item");
            start_item(s_item);
            s_item.randomize();
        `uvm_info("Sequenciador",$formatf("Se genera nuevo item", s_item.convert2str()), UVM_HIGH);
        finish_item(s_item);
        end
        `uvm_info("Sequenciador",$formatf("Se termina de generar  %0d item", num), UVM_LOW);
    endtask
endclass