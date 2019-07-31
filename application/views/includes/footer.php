<div class="row">
	<div class="col-lg-12">
		<div class="footer">
			<p> <?php
						foreach ($this->systemsetting as  $value) {
							if($value->SystemName=='SystemName'){
								echo $value->SystemValue;
							}
							
						}
				
				?></p>
		</div>
	</div>
</div>
