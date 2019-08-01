

	function getformvaluesassociative($dataform){
		$form=$($dataform)
		if($form.parsley().validate()){
			var inputarray={};
			data=$($dataform).serializeArray();
			$.each(data, function(i, field){
				inputarray[field.name]= field.value ;
			});
			return inputarray;
		}else{
			// $(".parsley-required").css('background-color','#red');
			return false;
		}
	}
	$(document).on('click',"#submitlogin",function(){
		if(data=getformvaluesassociative("#loginform")){
			associativedata = JSON.stringify( data );
			$.ajax({
				url: base_url+'index.php/login/validate_user',
				dataType: 'json',
				type: 'POST',          
				data: ({data:associativedata})
			})
			.done(function (data) { 
				if(data==1){
					window.location.href = base_url+"index.php/dashboard";
				}else{
					swal("Failed","No registered user please check you username or password","error");
				}
				
			})
		}
		
	});
	


