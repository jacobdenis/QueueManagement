<style>
.select2-container{ width: 100% !important; }
</style>

<script>
	var base_url="<?php echo base_url()?>";
	var url="<?php echo $this->uri->segment(1)?>";
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
	<div class="container">
	<h1 class="text-center">Welcome to <?php
								foreach ($this->systemsetting as  $value) {
									if($value->SystemName=='SystemName'){
										echo $value->SystemValue;
									}
									
								}
						
						?></h1>
		<div class="row">
			<div class="col-6 col-md-4">
			<h3 >Animal Bite Treatment Center</h3>
				<div id="active_queue_list_animal_bite">
				</div>
			</div>
			<div class="col-6 col-md-4">
			<h3 >Family Medicine</h3>
				<div id="active_queue_list_family_med">
				</div>
			</div>
			<div class="col-6 col-md-4">
			<h3> Family Planning</h3>
				<div id="active_queue_list_family_plan">
				</div>
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

<script>
	(function ($) {  
		function livequeue(){
			$.ajax({
			url:  base_url+'index.php/queue/queuelive',
			dataType: 'json',
			type: 'POST',
			data: ({})
			})      
			.done(function (data) {
				$("#active_queue_list_animal_bite").html('');
				$("#active_queue_list_family_med").html('');
				$("#active_queue_list_family_plan").html('');
				$.each( data.animal, function( key, value ) {
					$("#active_queue_list_animal_bite").append(`
					<div class="card w-75">
						<div class="card-body">
							<h1 >${value.QueueID}</h1>
							<h5 class="media-heading">Patient Name: ${value.PatientName}</h5>
							<h5 class="media-heading">Doctor Name: ${value.DoctorName}</h5>
							<div class="comment-action">
								<div class="badge badge-warning">Pending</div>
								<span class="m-l-10">
							</span>
							</div>
						</div>
					</div>
					`);
				});
				$.each( data.family_med, function( key, value ) {
					$("#active_queue_list_family_med").append(`
					<div class="card w-75">
						<div class="card-body">
							<h1 >${value.QueueID}</h1>
							<h5 class="media-heading">Patient Name: ${value.PatientName}</h5>
							<h5 class="media-heading">Doctor Name: ${value.DoctorName}</h5>
							<div class="comment-action">
								<div class="badge badge-warning">Pending</div>
								<span class="m-l-10">
							</span>
							</div>
						</div>
					</div>
					`);
				});
				$.each( data.family_plan, function( key, value ) {
					$("#active_queue_list_family_plan").append(`

					<div class="card w-75">
						<div class="card-body">
							<h1 >${value.QueueID}</h1>
							<h5 class="media-heading">Patient Name: ${value.PatientName}</h5>
							<h5 class="media-heading">Doctor Name: ${value.DoctorName}</h5>
							<div class="comment-action">
								<div class="badge badge-warning">Pending</div>
								<span class="m-l-10">
							</span>
							</div>
						</div>
					</div>
							
					`);
				});
			})
		}
		setInterval(function(){
			livequeue();
		}, 1000);
		
		
	})(jQuery);
</script>
