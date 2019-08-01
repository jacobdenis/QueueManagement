
   
<div class="modal fade" id="update_roletype_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Patient</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" id="update_roletype_form" data-parsley-validate>    
          <div class="form-group">
				<label  class="col-form-label">RoleType:</label>
				<input type="text" id="role_type" name="RoleType" required class="form-control" placeholder="RoleType">
          </div>
          <div class="form-group">
				<input type="text" name="RoleTypeID" id="role_type_id" required readonly class="form-control hidden" placeholder="RoleTypeID">
            </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="update_system"  class="btn btn-primary">Save Changes</button>
      </div>
    </div>
  </div>
</div>

