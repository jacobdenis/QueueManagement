
<div class="modal fade" id="update_employee_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Employee</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" id="update_employee_form" data-parsley-validate>
			<!-- Information -->
			<div class="form-group">
				<label  class="col-form-label">FirstName:</label>
				<input type="text" id="employee_firstname" name="FirstName" required class="form-control" placeholder="FirstName">
			</div>
			<div class="form-group">
				<label  class="col-form-label">MiddleName:</label>
				<input type="text" id="employee_middlename" name="MiddleName" class="form-control" placeholder="MiddleName">
			</div>
			<div class="form-group">
				<label  class="col-form-label">LastName:</label>
				<input type="text" id="employee_lastname" name="LastName" required class="form-control" placeholder="LastName">
			</div>
			<!-- Password -->
			<div class="form-group">
				<label  class="col-form-label">Username:</label>
				<input type="text" id="employee_username" name="Username" required class="form-control" placeholder="Username">
			</div>
			<div class="form-group">
				<label  class="col-form-label">Password:</label>
				<input type="password" id="employee_password" name="Password" required class="form-control" placeholder="Password">
			</div>
			<!-- Role -->
			<div class="form-group">
				<label  class="col-form-label">RoleType:</label>
				<select name="RoleTypeID" id="employee_roletypeid"  required class="js-states form-control roletype-select" >
					<option value=""></option>
				</select>
			</div>
			<div class="form-group hidden">
				<label  class="col-form-label">EmployeeID:</label>
				<input type="text" readonly id="employee_ID" name="EmployeeID" required class="form-control" placeholder="EmployeeID">
			</div>
			<div class="form-group hidden">
				<label  class="col-form-label">LoginID:</label>
				<input type="text" readonly id="employee_LoginID" name="LoginID" required class="form-control" placeholder="EmployeeID">
			</div>
         
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="update_employee" class="btn btn-primary">Save Changes</button>
      </div>
    </div>
  </div>
</div>
