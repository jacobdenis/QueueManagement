
<div class="modal fade" id="add_employee_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Employee</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" id="add_employee_form">
							<!-- Information -->
							<div class="form-group">
								<label  class="col-form-label">FirstName:</label>
								<input type="text" name="FirstName" class="form-control" placeholder="FirstName">
							</div>
							<div class="form-group">
								<label  class="col-form-label">MiddleName:</label>
								<input type="text" name="MiddleName" class="form-control" placeholder="MiddleName">
							</div>
							<div class="form-group">
								<label  class="col-form-label">LastName:</label>
								<input type="text" name="LastName" class="form-control" placeholder="LastName">
							</div>
							<!-- Password -->
							<div class="form-group">
								<label  class="col-form-label">Username:</label>
								<input type="text" name="Username" class="form-control" placeholder="Username">
							</div>
							<div class="form-group">
								<label  class="col-form-label">Password:</label>
								<input type="password" name="Password" class="form-control" placeholder="Password">
							</div>
							<!-- Role -->
							<div class="form-group">
								<label  class="col-form-label">RoleType:</label>
								<select name="RoleTypeID" class="js-states form-control roletype-select" ></select>
							</div>
         
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="save_employee" class="btn btn-primary">Save Changes</button>
      </div>
    </div>
  </div>
</div>
