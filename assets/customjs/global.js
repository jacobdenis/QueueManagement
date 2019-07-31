
(function ($) {
    //"use strict";
	$(document).on('click',"#show_add_queue_modal",function(){
		$.ajax({
			url:  base_url+'index.php/receptionist/get_select',
			dataType: 'json',
			type: 'POST',
			data: ({})
		})      
		.done(function (data) {
			$('.doctor-select').select2({
				dropdownParent: $("#add_queue_modal"),
				placeholder: 'Select Doctor',
				data:data.get_doctors
			});
			$('.patient-select').select2({
				dropdownParent: $("#add_queue_modal"),
				placeholder: 'Select Patient',
				data:data.get_patient
			});
			$('.status-select').select2({
				dropdownParent: $("#add_queue_modal"),
				placeholder: 'Select Status',
				data:data.get_status
			});
			$('.checkuptype-select').select2({
				dropdownParent: $("#add_queue_modal"),
				placeholder: 'Select CheckupType',
				data:data.get_checkuptype
			});
			$('.clinic-select').select2({
				dropdownParent: $("#add_queue_modal"),
				placeholder: 'Select Clinic',
				data:data.get_clinic
			});
		
		})
		
		$("#add_queue_modal").modal('show');
	});
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
			$(".parsley-required").addClass('btn-danger');
			return false;
		}
	}
	function updatedata(formdata,table,controller){
		if(data=getformvaluesassociative(formdata)){
			associativedata = JSON.stringify( data );
			swal({
				title: "Are you sure to save it ?",
				text: "This data will be saved",
				type: "warning",
				showCancelButton: true,
				confirmButtonColor: "#DD6B55",
				confirmButtonText: "Yes, save it !!",
				cancelButtonText: "No, cancel it !!",
				closeOnConfirm: false,
				closeOnCancel: false
			},
			function(isConfirm){
				if (isConfirm) {
					
					$.ajax({
						url: base_url+'index.php/'+controller,
						dataType: 'json',
						type: 'POST',          
						data: ({data:associativedata})
					})
					.done(function (data) { 
						swal("Success !!", "Data has been save", "success");
						table.ajax.reload();
					})
				}
				else {
					swal("Cancelled !!", "Data cancelled", "error");
				}
			});
			
		}
	}
	function deletedata(data,table,controller){
		
		associativedata = JSON.stringify( data );
		swal({
			title: "Are you sure to delete it ?",
			text: "This data will be deleted",
			type: "warning",
			showCancelButton: true,
			confirmButtonColor: "#DD6B55",
			confirmButtonText: "Yes, delete it !!",
			cancelButtonText: "No, cancel it !!",
			closeOnConfirm: false,
			closeOnCancel: false
		},
		function(isConfirm){
			if (isConfirm) {
				
				$.ajax({
					url: base_url+'index.php/'+controller,
					dataType: 'json',
					type: 'POST',          
					data: ({data:associativedata})
				})
				.done(function (data) { 
					swal("Success !!", "Data has been deleted", "success");
					table.ajax.reload();
				})
			}
			else {
				swal("Cancelled !!", "Data cancelled", "error");
			}
		});
		
	}
	function pushupdate(data,table,controller){
		associativedata = JSON.stringify( data );
		swal({
			title: "Are you sure you want to update it ?",
			text: "This data will be updated",
			type: "warning",
			showCancelButton: true,
			confirmButtonColor: "#DD6B55",
			confirmButtonText: "Yes, update it !!",
			cancelButtonText: "No, cancel it !!",
			closeOnConfirm: false,
			closeOnCancel: false
		},
		function(isConfirm){
			if (isConfirm) {
				
				$.ajax({
					url: base_url+'index.php/'+controller,
					dataType: 'json',
					type: 'POST',          
					data: ({data:associativedata})
				})
				.done(function (data) { 
					swal("Success !!", "Data has been updated", "success");
					table.ajax.reload();
				})
			}
			else {
				swal("Cancelled !!", "Data cancelled", "error");
			}
		});
		
	}
	
	if(url=="receptionist"){
		var queuelist=$("#queuelist").DataTable({
			ajax: {
				url: base_url+'index.php/receptionist/get_queuelist',
				dataType: 'json',
				type: 'POST',
				data: ({}),
				dataSrc:'',
			},
			columns: [ 
				{ "title":"PatientName",	"data": "PatientName"	},
				{ "title":"DoctorName",	"data": "DoctorName"	},
				{ "title":"Clinic" , "data":"Clinic"},
				{ "title":"Status",	"data": "Status"	},
				{ "title":"CheckupType",	"data": "CheckupType"	},
				{ "title":"Queue",	"data": "QueueID"	},
				{ "title":"Action","data":null,
					render:function(data){
							if(data.Status=="Pending"){
								return `	
								
								<button type="button"  data-id="${data.QueueID}"  class="btn btn-danger btn-sm btn-flat m-b-10 m-l-5 delete_queue"><span class="ti-trash"></span></button>
							
								<button type="button"  data-id="${data.QueueID}"  class="btn btn-warning btn-sm btn-flat m-b-10 m-l-5 update_queue"><span class="ti-check"></span></button>
								`;
							}else{
								return `
								<button type="button"  data-id="${data.QueueID}"  class="btn btn-danger btn-sm btn-flat m-b-10 m-l-5 delete_queue"><span class="ti-trash"></span></button>
							`;
							}

							
						
					}
				}
	
			],
			responsive:true
		});
		$(document).on('click',"#save_queue",function(){

			if(data=getformvaluesassociative("#add_queue_form")){
				associativedata = JSON.stringify( data );
				swal({
					title: "Are you sure to delete ?",
					text: "You will not be able to recover this imaginary file !!",
					type: "warning",
					showCancelButton: true,
					confirmButtonColor: "#DD6B55",
					confirmButtonText: "Yes, delete it !!",
					cancelButtonText: "No, cancel it !!",
					closeOnConfirm: false,
					closeOnCancel: false
				},
				function(isConfirm){
					if (isConfirm) {
						
						$.ajax({
							url: base_url+'index.php/receptionist/add_queue',
							dataType: 'json',
							type: 'POST',          
							data: ({data:associativedata})
						})
						.done(function (data) { 
							swal("Success !!", "Data has been save", "success");
							queuelist.ajax.reload();
						})
					}
					else {
						swal("Cancelled !!", "Data cancelled", "error");
					}
				});
				
			}
			
		});
		$(document).on('click',".delete_queue",function(){
			data={
				"QueueID":$(this).data('id'),
			}
			deletedata(data,queuelist,'receptionist/delete_queue');
		});
		$(document).on('click',".update_queue",function(){
			data={
				"StatusID":2,
				"QueueID":$(this).data('id')
				
			}
			pushupdate(data,queuelist,'receptionist/update_queue');
		});
	}
	if(url=="patient"){
		var patientlist=$("#patient_list").DataTable({
			ajax: {
				url: base_url+'index.php/patient/get_patientlist',
				dataType: 'json',
				type: 'POST',
				data: ({}),
				dataSrc:'',
			},
			columns: [ 
				{ "title":"FirstName",	"data": "FirstName"	},
				{ "title":"MiddleName",	"data": "MiddleName"	},
				{ "title":"LastName",	"data": "LastName"	},
				{ "title":"DateCreated",	"data": "DateCreated"	},
				{ "title":"Action","data":null,
				render:function(data){
					return `
						<button type="button" data-id=${data.PatientID} class="delete_patient btn  btn-danger btn-sm btn-flat m-b-10 m-l-5"><span class="ti-trash"></span></button>
						<button type="button" class="show_update_patient_modal btn  btn-warning btn-sm btn-flat m-b-10 m-l-5"><span class="ti-pencil"></span></button>
					`;
					}
				}
	
			],
			responsive:true

		});
		$(document).on('click',"#show_add_patient_modal",function(){
			$("#add_patient_modal").modal('show');
		});
		$(document).on('click',"#save_patient",function(){
			updatedata("#add_patient_form",patientlist,'patient/add_patient');
		});
		$(document).on('click',".delete_patient",function(){
			data={
				"PatientID":$(this).data('id'),
			}
			deletedata(data,patientlist,'patient/delete_patient');
		});
	}
	if(url=="employee"){
		var employee_list=$("#employee_list").DataTable({
			ajax: {
				url: base_url+'index.php/employee/get_employeelist',
				dataType: 'json',
				type: 'POST',
				data: ({}),
				dataSrc:'',
			},
			columns: [ 
				{ "title":"FirstName",	"data": "FirstName"	},
				{ "title":"MiddleName",	"data": "MiddleName"	},
				{ "title":"LastName",	"data": "LastName"	},
				{ "title":"Username",	"data": "Username"	},
				{ "title":"MiddleName",	"data": "MiddleName"	},
				{ "title":"RoleType",	"data": "RoleType"	},
				{ "title":"DateCreated",	"data": "DateCreated"	},
				{ "title":"Action","data":null,
				render:function(data){
					return `
					<button type="button"  data-id="${data.EmployeeID}"  class="btn btn-danger btn-sm btn-flat m-b-10 m-l-5 delete_employee"><span class="ti-trash"></span></button>
					<button type="button" class="btn  btn-warning btn-sm btn-flat m-b-10 m-l-5"><span class="ti-pencil"></span></button>
					`;
					}
				}
	
			],
			responsive:true
		});
		$(document).on('click',"#show_add_employee_modal",function(){
			$.ajax({
				url:  base_url+'index.php/employee/get_select',
				dataType: 'json',
				type: 'POST',
				data: ({})
			})      
			.done(function (data) {
				$('.roletype-select').select2({
					dropdownParent: $("#add_employee_modal"),
					placeholder: 'Select Doctor',
					data:data.roletype
				});
			})
			
			$("#add_employee_modal").modal('show');
		});
		$(document).on('click',"#save_employee",function(){
			updatedata("#add_employee_form",employee_list,'employee/add_employee');
		});
		$(document).on('click',".delete_employee",function(){
			data={
				"EmployeeID":$(this).data('id'),
			}
			deletedata(data,employee_list,'employee/delete_employee');
		});
	}
	if(url2=="accesslist"){
		var employee_list=$("#access_list").DataTable({
			ajax: {
				url: base_url+'index.php/managesystem/get_access_list',
				dataType: 'json',
				type: 'POST',
				data: ({}),
				dataSrc:'',
			},
			columns: [ 
				{ "title":"FullName",	"data": "FullName"	},
				{ "title":"Module",	"data": "ControllerName"	},
				{ "title":"Create",	"data": "Create"	},
				{ "title":"Read",	"data": "Read"	},
				{ "title":"Update",	"data": "Update"	},
				{ "title":"Delete",	"data": "Delete"	},
				{ "title":"DateCreated",	"data": "DateCreated"	},
				{ "title":"Action","data":null,
				render:function(data){
					return `
					<button type="button"  data-id="${data.EmployeeID}"  class="btn btn-danger btn-sm btn-flat m-b-10 m-l-5 delete_employee"><span class="ti-trash"></span></button>
					<button type="button" class="btn  btn-warning btn-sm btn-flat m-b-10 m-l-5"><span class="ti-pencil"></span></button>
					`;
					}
				}
	
			],
			responsive:true
		});
	}
})(jQuery);





























	// $(".js-data-example-ajax").select2({
	// 	ajax: {
	// 	  url:  base_url+'index.php/receptionist/get_doctors',
	// 	  dataType: 'json',
	// 	  type:"POST",
	// 	  delay: 250,
	// 	  data: function (params) {
	// 		return {
	// 		  q: params.term, // search term
	// 		};
	// 	  },
	// 	  processResults: function (data) {
	// 		return {
	// 		  results: data
	// 		};
	// 	  },
	// 	},
	// 	placeholder: 'Search for a repository',
	//   });
