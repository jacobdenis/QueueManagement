
<div class="modal fade" id="add_access_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Patient</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" id="add_access_form" data-parsley-validate >
          <div class="form-group">
			      <label  class="col-form-label">Module:</label>
            <select name="ControllerName" required class="js-states form-control module-select" >
							<option value=""></option>
						</select>
          </div>
          <div class="form-group">
            <label  class="col-form-label">Employee Name:</label>
			    	<select name="LoginID" required class="js-states form-control employee-select" >
							<option value=""></option>
						</select>
          </div>
          <div class="form-group">
            <label  class="col-form-label">Create:</label>
						<select name="Create" required class="js-states form-control clinic-select" >
							<option value=""></option>
              <option value="1">Yes</option>
              <option value="0">No</option>
            </select>
          </div>
					<div class="form-group">
            <label  class="col-form-label">Read:</label>
						<select name="Read" required class="js-states form-control read-select" >
						<option value=""></option>
              <option value="1">Yes</option>
              <option value="0">No</option>
            </select>
          </div>
					<div class="form-group">
            <label  class="col-form-label">Update:</label>
						<select name="Update" required class="js-states form-control update-select" >
							<option value=""></option>
              <option value="1">Yes</option>
              <option value="0">No</option>
            </select>
          </div>
					<div class="form-group">
            <label  class="col-form-label">Delete:</label>
						<select name="Delete"  required class="js-states form-control delete-select" >
							<option value=""></option>
              <option value="1">Yes</option>
              <option value="0">No</option> 
            </select>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="save_access" class="btn btn-primary">Save Changes</button>
      </div>
    </div>
  </div>
</div>
