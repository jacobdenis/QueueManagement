
<div class="modal fade" id="update_patient_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Patient</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" id="update_patient_form" data-parsley-validate>
          <div class="form-group">
						<label  class="col-form-label">FirstName:</label>
						<input type="text" id="patient_firstname" name="FirstName" required class="form-control" placeholder="FirstName">
          </div>
          <div class="form-group">
						<label  class="col-form-label">MiddleName:</label>
						<input type="text" id="patient_middlename" name="MiddleName" required class="form-control" placeholder="MiddleName">
          </div>
          <div class="form-group">
						<label  class="col-form-label">LastName:</label>
						<input type="text" id="patient_lastname" name="LastName" required class="form-control" placeholder="LastName">
          </div>
          <div class="form-group ">
						<label  class="col-form-label">PatientID:</label>
						<input type="text" id="patient_ID" name="PatientID" required class="form-control" placeholder="PatientID">
          </div>
         
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="update_patient" class="btn btn-primary">Save Changes</button>
      </div>
    </div>
  </div>
</div>