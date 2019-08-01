
<div class="row">
	<div class="col-lg-12">
		<div class="card">
			<div class="col-md-12 ">
				<button id="show_add_patient_modal" type="button" class="btn btn-dark btn-flat m-b-10 m-l-5 pull-right"><span class="ti-plus"></span> Patient</button>
			</div>
		
		<table id="patient_list" class="table table-striped table-bordered">
		</table>

		</div>
		<!-- /# card -->
	</div>
	<!-- /# column -->
</div>
<?php $this->load->view('pages/content/addpatient');?>
<?php $this->load->view('pages/content/updatepatient');?>
