<style>
.select2-container{ width: 100% !important; }
</style>

<script>
	var base_url="<?php echo base_url()?>";
	var url="<?php echo $this->uri->segment(1)?>";
	var url2="<?php echo $this->uri->segment(2)?>";
</script>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Focus Admin: Creative Admin Dashboard</title>
        <link href="<?php echo base_url()?>assets/css/lib/calendar2/pignose.calendar.min.css" rel="stylesheet">
        <link href="<?php echo base_url()?>assets/css/lib/chartist/chartist.min.css" rel="stylesheet">
        <link href="<?php echo base_url()?>assets/css/lib/font-awesome.min.css" rel="stylesheet">
        <link href="<?php echo base_url()?>assets/css/lib/themify-icons.css" rel="stylesheet">
        <link href="<?php echo base_url()?>assets/css/lib/owl.carousel.min.css" rel="stylesheet" />
        <link href="<?php echo base_url()?>assets/css/lib/owl.theme.default.min.css" rel="stylesheet" />
        <link href="<?php echo base_url()?>assets/css/lib/weather-icons.css" rel="stylesheet" />
        <link href="<?php echo base_url()?>assets/css/lib/menubar/sidebar.css" rel="stylesheet">
		<link href="<?php echo base_url()?>assets/css/lib/bootstrap.min.css" rel="stylesheet">
		<!-- SweetAlert -->
		<link href="<?php echo base_url()?>assets/css/lib/sweetalert/sweetalert.css" rel="stylesheet">
		<!-- DataTable Css  -->
		<link href="<?php echo base_url()?>assets/css/lib/datatables/css/dataTables.bootstrap4.min.css" rel="stylesheet">
		<link href="<?php echo base_url()?>assets/css/lib/datatables/css/responsive.bootstrap4.min.css" rel="stylesheet">
		
		
        <link href="<?php echo base_url()?>assets/css/lib/helper.css" rel="stylesheet">
		<link href="<?php echo base_url()?>assets/css/style.css" rel="stylesheet">
		<!-- Select2 -->
		<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/css/select2.min.css" rel="stylesheet" />
		

	
    </head>

    <body>

        <?php $this->load->view('includes/sidebar');?>
        <!-- /# sidebar -->

            <div class="header">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="float-left">
                                <div class="hamburger sidebar-toggle">
                                    <span class="line"></span>
                                    <span class="line"></span>
                                    <span class="line"></span>
                                </div>
                            </div>
                            <div class="float-right">
									<div class="dropdown">
									<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									<?php echo ucfirst($this->EmployeeInformation['LastName']).', '.ucfirst($this->EmployeeInformation['FirstName'])?>
									</button>
									<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
										<a class="dropdown-item" href="<?php echo base_url('index.php/login/logout');?>">Logout</a>
									</div>
									</div>
                           
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        <div class="content-wrap">
            <div class="main">
                <div class="container-fluid">
                    <div class="row">
                        <?php $this->load->view('includes/welcome.php');?>
                        <!-- /# column -->
						<?php $this->load->view('includes/breadcrumb.php');?>
                        <!-- /# column -->
                    </div>
                    <!-- /# row -->
                    <section id="main-content">
							<!-- this is where the body -->
							<?php $this->load->view($view);?>
							<!-- end of body -->
                        <?php $this->load->view('includes/footer.php');?>
                    </section>
                </div>
            </div>
        </div>
       

        <!-- jquery vendor -->
        <script src="<?php echo base_url()?>assets/js/lib/jquery.min.js"></script>
        <script src="<?php echo base_url()?>assets/js/lib/jquery.nanoscroller.min.js"></script>
        <!-- nano scroller -->
        <script src="<?php echo base_url()?>assets/js/lib/menubar/sidebar.js"></script>
		<script src="<?php echo base_url()?>assets/js/lib/preloader/pace.min.js"></script>
		
		<!-- SweetAlert -->
	
		<script src="<?php echo base_url()?>assets/js/lib/sweetalert/sweetalert.min.js"></script>
    	<!-- <script src="<?php echo base_url()?>assets/js/lib/sweetalert/sweetalert.init.js"></script> -->

        <!-- sidebar -->
        <script src="<?php echo base_url()?>assets/js/lib/bootstrap.min.js"> </script>
        <script src="<?php echo base_url()?>assets/js/scripts.js"></script>
		<!-- Parsley -->
		<script src="<?php echo base_url('assets/js/parsley.min.js')?>"></script>
		<!-- DataTable -->
		<script src="<?php echo base_url()?>assets/js/lib/datatables/js/jquery.dataTables.min.js"> </script>	
		<script src="<?php echo base_url()?>assets/js/lib/datatables/js/dataTables.bootstrap4.min.js"> </script>	
		<script src="<?php echo base_url()?>assets/js/lib/datatables/js/dataTables.responsive.min.js"> </script>	
		<script src="<?php echo base_url()?>assets/js/lib/datatables/js/responsive.bootstrap4.min.js"> </script>	



		<script src="<?php echo base_url('assets/js/lib/datatables/js/datatables-init.js?nocache='.date('YYYY-MM-DD H:i:s').'')?>"></script> 
		<!-- Select2 -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/js/select2.min.js"></script>

		<script src="<?php echo base_url('assets/customjs/global.js?nocache='.date('YYYY-MM-DD H:i:s').'')?>"></script>


    </body>

</html>

