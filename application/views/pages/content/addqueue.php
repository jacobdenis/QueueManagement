
<div class="modal fade" id="add_queue_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Patient</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" id="add_queue_form">
          <div class="form-group">
						<label  class="col-form-label">Doctor:</label>
            <select name="EmployeeID" class="js-states form-control doctor-select" ></select>
          </div>
          <div class="form-group">
            <label  class="col-form-label">Patient:</label>
						<select name="PatientID" class="js-states form-control patient-select" ></select>
          </div>
          <div class="form-group">
            <label  class="col-form-label">Clinic:</label>
						<select name="ClinicID" class="js-states form-control clinic-select" ></select>
          </div>
					<div class="form-group hidden" >
            <label  class="col-form-label">Status:</label>
						<select name="StatusID" class="js-states form-control status-select" ></select>
          </div>
					<div class="form-group hidden">
            <label  class="col-form-label">CheckupType:</label>
						<select name="CheckupTypeID" class="js-states form-control checkuptype-select" ></select>
          </div>
          <div class="form-group ">
            <label  class="col-form-label">IsPriority:</label>
            <br>
            <input id="priority" type="radio" name="IsPriority" value="1"> Yes<br>
            <input id="notpriority"type="radio" checked name="IsPriority" value="0"> No<br> 
          </div>
          <h3 id="e1">Expected Time:</h3>
          <div class="form-group " id="from1"> 
            <label  class="col-form-label">From:</label>
            <input name="DateFrom" id="DateFrom" type="time"  required class=" form-control" >
          </div>	
          <div class="form-group " id="to1">
            <label   class="col-form-label">To:</label>
            <input name="DateTo" id="DateTo" type="time" required class=" form-control" >
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="save_queue" class="btn btn-primary">Save Changes</button>
      </div>
    </div>
  </div>
</div>
