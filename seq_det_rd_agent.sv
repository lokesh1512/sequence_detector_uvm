class seq_det_rd_agent extends uvm_agent;
    `uvm_component_utils(seq_det_rd_agent);
    
    seq_det_rd_monitor monh;
    seq_det_rd_cfg r_cfg;
    virtual seq_det_if.MON_MP vif;
  
    extern new(string name = "seq_det_rd_agent", uvm_component parent);
    extern function void build_phase(uvm_phase phase);
    
endclass: seq_det_rd_agent

    function new(string name = "seq_det_rd_agent", uvm_component parent);
        super.new(name, parent);
    endfunction: new

    function void seq_det_rd_agent::build_phase(uvm_phase phase);
        if(!uvm_config_db#(seq_det_rd_cfg)::get(this,"","seq_det_rd_agent",r_cfg))
            `uvm_fatal(get_name(), "message")
            
    
        
    endfunction: build_phase
    