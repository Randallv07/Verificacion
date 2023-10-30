class my_driver extends uvm_driver;

    `uvm_component_utils (my_driver)

    function new (string name = "my_driver", uvm_component parent = null);
        super.new (name, parent);
    endfunction

endclass