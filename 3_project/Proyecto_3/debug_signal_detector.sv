 	task debug_signal_detector();
     fork

         begin
             forever begin
                 @(posedge testbench.DUT._rw_[1]._clm_[1].rtr._nu_[0].rtr_ntrfs_.pop);
                 trans_detector_checker=new(1,1,testbench.DUT._rw_[1]._clm_[1].rtr._nu_[0].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[1]._clm_[1].rtr._nu_[1].rtr_ntrfs_.pop);
                 trans_detector_checker=new(1,1,testbench.DUT._rw_[1]._clm_[1].rtr._nu_[1].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[1]._clm_[1].rtr._nu_[2].rtr_ntrfs_.pop);
                 trans_detector_checker=new(1,1,testbench.DUT._rw_[1]._clm_[1].rtr._nu_[2].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[1]._clm_[1].rtr._nu_[3].rtr_ntrfs_.pop);
                 trans_detector_checker=new(1,1,testbench.DUT._rw_[1]._clm_[1].rtr._nu_[3].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[1]._clm_[2].rtr._nu_[0].rtr_ntrfs_.pop);
                 trans_detector_checker=new(1,2,testbench.DUT._rw_[1]._clm_[2].rtr._nu_[0].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[1]._clm_[2].rtr._nu_[1].rtr_ntrfs_.pop);
                 trans_detector_checker=new(1,2,testbench.DUT._rw_[1]._clm_[2].rtr._nu_[1].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[1]._clm_[2].rtr._nu_[2].rtr_ntrfs_.pop);
                 trans_detector_checker=new(1,2,testbench.DUT._rw_[1]._clm_[2].rtr._nu_[2].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[1]._clm_[2].rtr._nu_[3].rtr_ntrfs_.pop);
                 trans_detector_checker=new(1,2,testbench.DUT._rw_[1]._clm_[2].rtr._nu_[3].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[1]._clm_[3].rtr._nu_[0].rtr_ntrfs_.pop);
                 trans_detector_checker=new(1,3,testbench.DUT._rw_[1]._clm_[3].rtr._nu_[0].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[1]._clm_[3].rtr._nu_[1].rtr_ntrfs_.pop);
                 trans_detector_checker=new(1,3,testbench.DUT._rw_[1]._clm_[3].rtr._nu_[1].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[1]._clm_[3].rtr._nu_[2].rtr_ntrfs_.pop);
                 trans_detector_checker=new(1,3,testbench.DUT._rw_[1]._clm_[3].rtr._nu_[2].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[1]._clm_[3].rtr._nu_[3].rtr_ntrfs_.pop);
                 trans_detector_checker=new(1,3,testbench.DUT._rw_[1]._clm_[3].rtr._nu_[3].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[1]._clm_[4].rtr._nu_[0].rtr_ntrfs_.pop);
                 trans_detector_checker=new(1,4,testbench.DUT._rw_[1]._clm_[4].rtr._nu_[0].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[1]._clm_[4].rtr._nu_[1].rtr_ntrfs_.pop);
                 trans_detector_checker=new(1,4,testbench.DUT._rw_[1]._clm_[4].rtr._nu_[1].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[1]._clm_[4].rtr._nu_[2].rtr_ntrfs_.pop);
                 trans_detector_checker=new(1,4,testbench.DUT._rw_[1]._clm_[4].rtr._nu_[2].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[1]._clm_[4].rtr._nu_[3].rtr_ntrfs_.pop);
                 trans_detector_checker=new(1,4,testbench.DUT._rw_[1]._clm_[4].rtr._nu_[3].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[2]._clm_[1].rtr._nu_[0].rtr_ntrfs_.pop);
                 trans_detector_checker=new(2,1,testbench.DUT._rw_[2]._clm_[1].rtr._nu_[0].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[2]._clm_[1].rtr._nu_[1].rtr_ntrfs_.pop);
                 trans_detector_checker=new(2,1,testbench.DUT._rw_[2]._clm_[1].rtr._nu_[1].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[2]._clm_[1].rtr._nu_[2].rtr_ntrfs_.pop);
                 trans_detector_checker=new(2,1,testbench.DUT._rw_[2]._clm_[1].rtr._nu_[2].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[2]._clm_[1].rtr._nu_[3].rtr_ntrfs_.pop);
                 trans_detector_checker=new(2,1,testbench.DUT._rw_[2]._clm_[1].rtr._nu_[3].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[2]._clm_[2].rtr._nu_[0].rtr_ntrfs_.pop);
                 trans_detector_checker=new(2,2,testbench.DUT._rw_[2]._clm_[2].rtr._nu_[0].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[2]._clm_[2].rtr._nu_[1].rtr_ntrfs_.pop);
                 trans_detector_checker=new(2,2,testbench.DUT._rw_[2]._clm_[2].rtr._nu_[1].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[2]._clm_[2].rtr._nu_[2].rtr_ntrfs_.pop);
                 trans_detector_checker=new(2,2,testbench.DUT._rw_[2]._clm_[2].rtr._nu_[2].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[2]._clm_[2].rtr._nu_[3].rtr_ntrfs_.pop);
                 trans_detector_checker=new(2,2,testbench.DUT._rw_[2]._clm_[2].rtr._nu_[3].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[2]._clm_[3].rtr._nu_[0].rtr_ntrfs_.pop);
                 trans_detector_checker=new(2,3,testbench.DUT._rw_[2]._clm_[3].rtr._nu_[0].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[2]._clm_[3].rtr._nu_[1].rtr_ntrfs_.pop);
                 trans_detector_checker=new(2,3,testbench.DUT._rw_[2]._clm_[3].rtr._nu_[1].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[2]._clm_[3].rtr._nu_[2].rtr_ntrfs_.pop);
                 trans_detector_checker=new(2,3,testbench.DUT._rw_[2]._clm_[3].rtr._nu_[2].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[2]._clm_[3].rtr._nu_[3].rtr_ntrfs_.pop);
                 trans_detector_checker=new(2,3,testbench.DUT._rw_[2]._clm_[3].rtr._nu_[3].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[2]._clm_[4].rtr._nu_[0].rtr_ntrfs_.pop);
                 trans_detector_checker=new(2,4,testbench.DUT._rw_[2]._clm_[4].rtr._nu_[0].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[2]._clm_[4].rtr._nu_[1].rtr_ntrfs_.pop);
                 trans_detector_checker=new(2,4,testbench.DUT._rw_[2]._clm_[4].rtr._nu_[1].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[2]._clm_[4].rtr._nu_[2].rtr_ntrfs_.pop);
                 trans_detector_checker=new(2,4,testbench.DUT._rw_[2]._clm_[4].rtr._nu_[2].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[2]._clm_[4].rtr._nu_[3].rtr_ntrfs_.pop);
                 trans_detector_checker=new(2,4,testbench.DUT._rw_[2]._clm_[4].rtr._nu_[3].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[3]._clm_[1].rtr._nu_[0].rtr_ntrfs_.pop);
                 trans_detector_checker=new(3,1,testbench.DUT._rw_[3]._clm_[1].rtr._nu_[0].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[3]._clm_[1].rtr._nu_[1].rtr_ntrfs_.pop);
                 trans_detector_checker=new(3,1,testbench.DUT._rw_[3]._clm_[1].rtr._nu_[1].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[3]._clm_[1].rtr._nu_[2].rtr_ntrfs_.pop);
                 trans_detector_checker=new(3,1,testbench.DUT._rw_[3]._clm_[1].rtr._nu_[2].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[3]._clm_[1].rtr._nu_[3].rtr_ntrfs_.pop);
                 trans_detector_checker=new(3,1,testbench.DUT._rw_[3]._clm_[1].rtr._nu_[3].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[3]._clm_[2].rtr._nu_[0].rtr_ntrfs_.pop);
                 trans_detector_checker=new(3,2,testbench.DUT._rw_[3]._clm_[2].rtr._nu_[0].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[3]._clm_[2].rtr._nu_[1].rtr_ntrfs_.pop);
                 trans_detector_checker=new(3,2,testbench.DUT._rw_[3]._clm_[2].rtr._nu_[1].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[3]._clm_[2].rtr._nu_[2].rtr_ntrfs_.pop);
                 trans_detector_checker=new(3,2,testbench.DUT._rw_[3]._clm_[2].rtr._nu_[2].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[3]._clm_[2].rtr._nu_[3].rtr_ntrfs_.pop);
                 trans_detector_checker=new(3,2,testbench.DUT._rw_[3]._clm_[2].rtr._nu_[3].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[3]._clm_[3].rtr._nu_[0].rtr_ntrfs_.pop);
                 trans_detector_checker=new(3,3,testbench.DUT._rw_[3]._clm_[3].rtr._nu_[0].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[3]._clm_[3].rtr._nu_[1].rtr_ntrfs_.pop);
                 trans_detector_checker=new(3,3,testbench.DUT._rw_[3]._clm_[3].rtr._nu_[1].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[3]._clm_[3].rtr._nu_[2].rtr_ntrfs_.pop);
                 trans_detector_checker=new(3,3,testbench.DUT._rw_[3]._clm_[3].rtr._nu_[2].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[3]._clm_[3].rtr._nu_[3].rtr_ntrfs_.pop);
                 trans_detector_checker=new(3,3,testbench.DUT._rw_[3]._clm_[3].rtr._nu_[3].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[3]._clm_[4].rtr._nu_[0].rtr_ntrfs_.pop);
                 trans_detector_checker=new(3,4,testbench.DUT._rw_[3]._clm_[4].rtr._nu_[0].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[3]._clm_[4].rtr._nu_[1].rtr_ntrfs_.pop);
                 trans_detector_checker=new(3,4,testbench.DUT._rw_[3]._clm_[4].rtr._nu_[1].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[3]._clm_[4].rtr._nu_[2].rtr_ntrfs_.pop);
                 trans_detector_checker=new(3,4,testbench.DUT._rw_[3]._clm_[4].rtr._nu_[2].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[3]._clm_[4].rtr._nu_[3].rtr_ntrfs_.pop);
                 trans_detector_checker=new(3,4,testbench.DUT._rw_[3]._clm_[4].rtr._nu_[3].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[4]._clm_[1].rtr._nu_[0].rtr_ntrfs_.pop);
                 trans_detector_checker=new(4,1,testbench.DUT._rw_[4]._clm_[1].rtr._nu_[0].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[4]._clm_[1].rtr._nu_[1].rtr_ntrfs_.pop);
                 trans_detector_checker=new(4,1,testbench.DUT._rw_[4]._clm_[1].rtr._nu_[1].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[4]._clm_[1].rtr._nu_[2].rtr_ntrfs_.pop);
                 trans_detector_checker=new(4,1,testbench.DUT._rw_[4]._clm_[1].rtr._nu_[2].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[4]._clm_[1].rtr._nu_[3].rtr_ntrfs_.pop);
                 trans_detector_checker=new(4,1,testbench.DUT._rw_[4]._clm_[1].rtr._nu_[3].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[4]._clm_[2].rtr._nu_[0].rtr_ntrfs_.pop);
                 trans_detector_checker=new(4,2,testbench.DUT._rw_[4]._clm_[2].rtr._nu_[0].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[4]._clm_[2].rtr._nu_[1].rtr_ntrfs_.pop);
                 trans_detector_checker=new(4,2,testbench.DUT._rw_[4]._clm_[2].rtr._nu_[1].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[4]._clm_[2].rtr._nu_[2].rtr_ntrfs_.pop);
                 trans_detector_checker=new(4,2,testbench.DUT._rw_[4]._clm_[2].rtr._nu_[2].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[4]._clm_[2].rtr._nu_[3].rtr_ntrfs_.pop);
                 trans_detector_checker=new(4,2,testbench.DUT._rw_[4]._clm_[2].rtr._nu_[3].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[4]._clm_[3].rtr._nu_[0].rtr_ntrfs_.pop);
                 trans_detector_checker=new(4,3,testbench.DUT._rw_[4]._clm_[3].rtr._nu_[0].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[4]._clm_[3].rtr._nu_[1].rtr_ntrfs_.pop);
                 trans_detector_checker=new(4,3,testbench.DUT._rw_[4]._clm_[3].rtr._nu_[1].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[4]._clm_[3].rtr._nu_[2].rtr_ntrfs_.pop);
                 trans_detector_checker=new(4,3,testbench.DUT._rw_[4]._clm_[3].rtr._nu_[2].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[4]._clm_[3].rtr._nu_[3].rtr_ntrfs_.pop);
                 trans_detector_checker=new(4,3,testbench.DUT._rw_[4]._clm_[3].rtr._nu_[3].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[4]._clm_[4].rtr._nu_[0].rtr_ntrfs_.pop);
                 trans_detector_checker=new(4,4,testbench.DUT._rw_[4]._clm_[4].rtr._nu_[0].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[4]._clm_[4].rtr._nu_[1].rtr_ntrfs_.pop);
                 trans_detector_checker=new(4,4,testbench.DUT._rw_[4]._clm_[4].rtr._nu_[1].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);
                 // Aquí colocar las acciones que deseas realizar cuando ocurra el flanco de subida
             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[4]._clm_[4].rtr._nu_[2].rtr_ntrfs_.pop);
                 trans_detector_checker=new(4,4,testbench.DUT._rw_[4]._clm_[4].rtr._nu_[2].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end
         begin
             forever begin
                 @(posedge testbench.DUT._rw_[4]._clm_[4].rtr._nu_[3].rtr_ntrfs_.pop);
                 trans_detector_checker=new(4,4,testbench.DUT._rw_[4]._clm_[4].rtr._nu_[3].rtr_ntrfs_.data_out);
                 detector_checker_mb.put(trans_detector_checker);

             end
         end

     join_none
  endtask
    