class seq_det_test extends uvm_test;
	`uvm_component_utils(seq_det_test);
	
	seq_det_env_cfg e_cfg;
	seq_det_wr_cfg w_cfg[];
	seq_det_rd_cfg r_cfg[];
	seq_det_env envh;
	
	int no_of_duts=1;
	bit has_wagt=1;
	bit has_ragt=1;
	bit has_sb=1;
	
	extern function new( string name="seq_det_test",uvm_component parent);
	extern function void build_phase(uvm_phase phase);
endclass

	function seq_det_test::new(string name="seq_det_test", uvm_component parent);
		super.new(name,parent);
	endfunction
	
	function seq_det_test::build_phase(uvm_phase phase);
		e_cfg=seq_det_env_cfg::type_id::create("e_cfg");

		if(has_wagt)
		begin
			w_cfg=new[no_of_duts];
			e_cfg.w_cfg=new[no_of_duts];
			foreach(w_cfg[i])
			begin
				if(!uvm_config_db#(virtual seq_det_if)::get(this,"",$sformatf("vif_%0d",i),w_cfg[i].vif))
					`uvm_fatal("CONFIG ERROR","Unable to get the config. Have you set it?");
				w_cfg.is_active=UVM_ACTIVE;
				e_cfg.w_cfg=w_cfg;
			end
		end
		if(has_ragt)
		begin
			r_cfg=new[no_of_duts];
			e_cfg.r_cfg=new[no_of_duts];
			foreach(r_cfg[i])
			begin
				if(!uvm_config_db#(virtual seq_det_if)::get(this,"",$sformatf("vif_%0d",i),r_cfg[i].vif))
					`uvm_fatal("CONFIG ERROR","Unable to get the config. Have you set it?");
				e_cfg.r_cfg=r_cfg;
			end
		end
		e_cfg.no_of_duts=no_of_duts;
		e_cfg.has_ragt=has_ragt;
		e_cfg.has_wagt=has_wagt;
		e_cfg.has_sb=has_sb;
		uvm_config_db#(seq_det_env_cfg)::set(this,"*","seq_det_env_cfg",e_cfg);
		envh=seq_det_env::type_id::create("envh",this);
		super.build_phase(phase);
	endfunction	