class Item extends uvm_sequence_item; // 1) Clase Item hereda atributos de uvm_sequence_item

    `uvm_object_utils(Item) // 2) Registra la clase Item en la fabrica

    rand bit in;
    bit out;


    virtual function string convert2str();
        return $sformatf("in = %0d, out = %0d", in,out);
    endfunction


    function new (string name = "Item");
        super.new(name); // Llama al constructor del padre (uvm_sequence_item) 
    endfunction

    constraint c1 {in dist {0:/20, 1:/80};} // El peso de 0 es de 20, mientras que el peso de 1 es de 80

endclass 