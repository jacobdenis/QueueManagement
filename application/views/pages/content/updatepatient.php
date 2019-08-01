
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
          <div class="form-row">
            <div class="form-group col-md-6">
              <label  class="col-form-label">Phone:</label>
              <input type="text" id="patient_phone" name="Phone" required class="form-control" placeholder="Phone">
            </div>
            <div class="form-group col-md-6">
              <label  class="col-form-label">Address:</label>
              <input type="text" id="patient_address" name="Address" required class="form-control" placeholder="Address">
            </div>
            <div class="form-group col-md-6">
              <label  class="col-form-label">BirthDate:</label>
              <input type="date" id="patient_birthdate" name="BirthDate" required class="form-control" placeholder="BirthDate">
            </div>
            <div class="form-group col-md-6">
              <label  class="col-form-label">Gender:</label>
              <select name="Gender" id="patient_gender"  required class="form-control " >
                <option value=""></option>
                <option value="1">Female</option>
                <option value="0">male</option>
              </select>
            </div>
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
