
   
<div class="modal fade" id="update_system_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Patient</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" id="update_system_form" data-parsley-validate>    
           
          <div class="form-group">
						<label  class="col-form-label">SystemName:</label>
						<input type="text" id="system_name" class="form-control" required placeholder="FirstName">
          </div>
          <div class="form-group">
						<label  class="col-form-label">SystemValue:</label>
						<input type="text" id="system_value" name="SystemValue" required class="form-control" placeholder="SystemValue">
          </div>
          <div class="form-group">
							<input type="text" name="SystemSettingID" id="system_setting_id" required readonly class="form-control hidden" placeholder="SystemSettingID">
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

