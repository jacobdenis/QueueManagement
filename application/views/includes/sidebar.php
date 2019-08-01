<div class="sidebar sidebar-hide-to-small sidebar-shrink sidebar-gestures">
            <div class="nano">
                <div class="nano-content">
                    <ul>
                        <div class="logo"><a href="<?php echo base_url('index.php/dashboard')?>"><!-- <img src="assets/images/logo.png" alt="" /> --><span>
						
							<?php 
								foreach ($this->systemsetting as  $value) {
									if($value->SystemName=='SystemName'){
										echo $value->SystemValue;
									}
								}
							?>
						</span></a></div>
                        <li class="label">Main</li>
                        <li><a class="sidebar-sub-toggle"><i class="ti-home"></i> Dashboard <span class="sidebar-collapse-icon ti-angle-down"></span></a>
                            <ul>
							<?php 
								//if($data=$this->AC->get_access_control('dashboard')){
								echo '	<li><a href="'. base_url('index.php/dashboard').'">Dashboard</a></li>';
								//}
							?>
                            </ul>
                        </li>
                        <li class="label">Apps</li>
						<?php 
							if($data=$this->AC->get_access_control('receptionist')){
							echo '	<li><a href="'. base_url('index.php/receptionist').'">Queue List</a></li>';
							}
						?>
							<?php
								if($data=$this->AC->get_access_control('patient') || $data=$this->AC->get_access_control('employee')){
									echo '
									 <li><a class="sidebar-sub-toggle"><i class="ti-layout-grid4-alt"></i> ManageUsers <span class="sidebar-collapse-icon ti-angle-down"></span></a>
										<ul>';
										if($data=$this->AC->get_access_control('patient')){
											echo '<li><a href="'.base_url('index.php/patient').'">Patient</a></li>';
										}
										if($data=$this->AC->get_access_control('employee')){
											echo '<li><a href="'.base_url('index.php/employee').'">Employee</a></li>';
										}
									echo'</ul>
									</li> 
									';
								}
									
							?>
					
						<?php
								if($data=$this->AC->get_access_control('managesystem')){
									echo '<li><a class="sidebar-sub-toggle"><i class="ti-layout-grid4-alt"></i> Manage Settings <span class="sidebar-collapse-icon ti-angle-down"></span></a>
										<ul>';
										if($data=$this->AC->get_access_control('managesystem')){
											echo '<li><a href="'.base_url('index.php/managesystem/accesslist').'">Access List</a></li>';
										}
										if($data=$this->AC->get_access_control('managesystem')){
											echo '<li><a href="'.base_url('index.php/managesystem/roletype').'">RoleType</a></li>';
										}
										if($data=$this->AC->get_access_control('managesystem')){
											echo '<li><a href="'.base_url('index.php/managesystem/system').'">System Setting</a></li>';
										}
										if($data=$this->AC->get_access_control('managesystem')){
											echo '<li><a href="'.base_url('index.php/managesystem/status').'">Status</a></li>';
										}
										if($data=$this->AC->get_access_control('managesystem')){
											echo '<li><a href="'.base_url('index.php/managesystem/module').'">Module</a></li>';
										}
									echo'</ul>
									</li> ';
								}
						?>
						 	
						
                        <!-- <li><a href="<?php echo base_url('index.php/login/logout');?>"><i class="ti-close"></i> Logout</a></li> -->
                    </ul>
                </div>
            </div>
        </div>

		