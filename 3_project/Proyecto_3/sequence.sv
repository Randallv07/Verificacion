class my_sequence extends uvm_sequence #(item);

    `uvm_object_utils(my_sequence)
    function new (string name="my_sequence");
        super.new(name);
    endfunction

    //`uvm_declare_p_sequencer() Debe agregarse?

    rand int trans_num;

    //constraint trans_limit {soft trans_num inside {[50:100]};}

    virtual task body();

        repeat(1) begin
            s_item = item::type_id::create("s_item");
            start_item(s_item);
            if (!s_item.randomize())begin
                `uvm_error("Fuck","Falló randomización de las transacciones");
            end
        finish_item(s_item);

        end
    endtask
endclass