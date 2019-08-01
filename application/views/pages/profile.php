<div class="row">
              <div class="col-lg-12">
                <div class="card">
                  <div class="card-body">
                    <div class="user-profile">
                      <div class="row">
                        <div class="col-lg-4">
                          <div class="user-photo m-b-30">
                            <img class="img-fluid" src="<?php echo base_url();?>assets/images/userprofile.png" onerror="this.onerror=null;this.src='<?php echo base_url();?>assets/images/userprofile.png';">
                          </div>
                        </div>
                        <div class="col-lg-8">
                            <div class="user-profile-name">	
                                <?php 
                                 echo ucfirst($this->EmployeeInformation['LastName']).', '.ucfirst($this->EmployeeInformation['FirstName'])
                                ?>
                            </div>
                          <!-- <div class="user-Location"><i class="ti-location-pin"></i> New York, New York</div> -->
                          <div class="user-job-title"><?php echo ucfirst($this->Role['RoleType']) ;    ?></div>
                          <div class="custom-tab user-profile-tab">
                            <ul class="nav nav-tabs" role="tablist">
                              <li role="presentation" class="active"><a href="#1" aria-controls="1" role="tab" data-toggle="tab">About</a></li>
                            </ul>
                            <div class="tab-content">
                              <div role="tabpanel" class="tab-pane active" id="1">
                                <div class="contact-information">
                                  <h4>Contact information</h4>
                                  <div class="phone-content">
                                    <span class="contact-title">Phone:</span>
                                    <span class="phone-number"><?= $this->EmployeeInformation['Phone']?></span>
                                  </div>
                                  <div class="address-content">
                                    <span class="contact-title">Address:</span>
                                    <span class="mail-address"><?= $this->EmployeeInformation['Address']?></span>
                                  </div>
                                  <div class="email-content">
                                    <span class="contact-title">Email:</span>
                                    <span class="contact-email"><?= $this->EmployeeInformation['Email']?></span>
                                  </div>
                                </div>
                                <div class="basic-information">
                                  <h4>Basic information</h4>
                                  <div class="birthday-content">
                                    <span class="contact-title">BirthDate:</span>
                                    <span class="birth-date"> </span>
                                  </div>
                                  <div class="gender-content">
                                    <span class="contact-title">Age:</span>
                                    <span class="age"></span>
                                  </div>
                                  <div class="gender-content">
                                    <span class="contact-title">Gender:</span>
                                    <span class="gender"><?=( ($this->EmployeeInformation['Gender']==0) ? "Male":"Female" )?></span>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <script >
            $(document).ready(function(){
                var age = moment().diff('<?php echo $this->EmployeeInformation['BirthDate'];?>', 'years',false);
                var birthdate =moment('<?php echo $this->EmployeeInformation['BirthDate'];?>').format('LL'); 
                $(".age").text(age);
                $(".birth-date").text(birthdate)
            })
            
            </script>