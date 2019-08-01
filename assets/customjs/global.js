
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
			dom: 'Blfrtip',
        	buttons: [
            {
				extend:'collection',
				text:'Export',
				buttons:[
					'csv',
					'excel',
					'print',
					'pdf'
				],
                exportOptions: {
                    columns: ':visible'
                }
			},
            'colvis'
        ],
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
				{ "title":"Date",	"data": null,
					render:function(data){
						return moment().format('dddd')+' | '+moment(data.DateCreated).format("YYYY-MM-DD");
					}
				},
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
			dom: 'Blfrtip',
        	buttons: [
            {
				extend:'collection',
				text:'Export',
				buttons:[
					'csv',
					'excel',
					'print',
					'pdf'
				],
                exportOptions: {
                    columns: ':visible'
                }
			},
            'colvis'
        ],
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
						<button type="button" data-id=${data.PatientID} class="show_update_patient_modal btn  btn-warning btn-sm btn-flat m-b-10 m-l-5"><span class="ti-pencil"></span></button>
					`;
					}
				}
	
			],
			responsive:true

		});
		$(document).on('click',"#show_add_patient_modal",function(){
			$("#add_patient_modal").modal('show');
		});
		$(document).on('click',".show_update_patient_modal",function(){
			var PatientID=$(this).data('id');
			$("#patient_ID").val(PatientID);
			$.ajax({
				url:  base_url+'index.php/patient/get_patientlist_by_id',
				dataType: 'json',
				type: 'POST',
				data: ({data:PatientID})
			})      
			.done(function (data) {
				$.each( data, function( key, value ) {
					$("#patient_firstname").val(value.FirstName);
					$("#patient_middlename").val(value.MiddleName);
					$("#patient_lastname").val(value.LastName);
				});
			})
			$("#update_patient_modal").modal('show');
		});
		$(document).on('click',"#save_patient",function(){
			updatedata("#add_patient_form",patientlist,'patient/add_patient');
		});
		$(document).on('click',"#update_patient",function(){
			updatedata("#update_patient_form",patientlist,'patient/update_patient');
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
			dom: 'Blfrtip',
        	buttons: [
            {
				extend:'collection',
				text:'Export',
				buttons:[
					'csv',
					'excel',
					'print',
					'pdf'
				],
                exportOptions: {
                    columns: ':visible'
                }
			},
            'colvis'
        ],
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
		var access_list=$("#access_list").DataTable({
			dom: 'Blfrtip',
        	buttons: [
            {
				extend:'collection',
				text:'Export',
				buttons:[
					'csv',
					'excel',
					'print',
					'pdf'
				],
                exportOptions: {
                    columns: ':visible'
                }
			},
            'colvis'
        ],
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
					<button type="button"  data-id="${data.AccessControlID}"  class="btn btn-danger btn-sm btn-flat m-b-10 m-l-5 delete_access_control"><span class="ti-trash"></span></button>
					`;
					}
				}
	
			],
			responsive:true
		});
		$(document).on('click',".delete_access_control",function(){
			data={
				"AccessControlID":$(this).data('id'),
			}
			deletedata(data,access_list,'managesystem/delete_accesslist');
		});
		$(document).on('click',"#show_add_access_modal",function(){
			$.ajax({
				url:  base_url+'index.php/managesystem/get_select',
				dataType: 'json',
				type: 'POST',
				data: ({})
			})      
			.done(function (data) {
				$('.module-select').select2({
					dropdownParent: $("#add_access_modal"),
					placeholder: 'Select Module',
					data:data.get_module
				});
				$('.employee-select').select2({
					dropdownParent: $("#add_access_modal"),
					placeholder: 'Select Employee',
					data:data.get_employee
				});
			})
			
			$("#add_access_modal").modal('show');
		});
		$(document).on('click',"#save_access",function(){
			updatedata("#add_access_form",access_list,'managesystem/add_access');
		});
		
	}
	if(url2=="system"){
		var system_list=$("#system_list").DataTable({
			dom: 'Blfrtip',
        	buttons: [
            {
				extend:'collection',
				text:'Export',
				buttons:[
					'csv',
					'excel',
					'print',
					'pdf'
				],
                exportOptions: {
                    columns: ':visible'
                }
			},
            'colvis'
        ],
			ajax: {
				url: base_url+'index.php/managesystem/get_system_list',
				dataType: 'json',
				type: 'POST',
				data: ({}),
				dataSrc:'',
			},
			columns: [ 
				{ "title":"SystemSettingID",	"data": "SystemSettingID"	},
				{ "title":"SystemName",	"data": "SystemName"	},
				{ "title":"SystemValue",	"data": "SystemValue"	},
				{ "title":"Action","data":null,
				render:function(data){
					return `
						<button type="button"  data-id="${data.SystemSettingID}" id="show_update_system_modal" class="btn  btn-warning btn-sm btn-flat m-b-10 m-l-5"><span class="ti-pencil"></span></button>
					`;
					}
				}
	
			],
			responsive:true
		});
		$(document).on('click',"#show_update_system_modal",function(){
			$("#system_setting_id").val($(this).data('id'));
			$.ajax({
				url:  base_url+'index.php/managesystem/get_system_list',
				dataType: 'json',
				type: 'POST',
				data: ({})
			})      
			.done(function (data) {
				$.each( data, function( key, value ) {
					$("#system_name").val(value.SystemName);
					$("#system_value").val(value.SystemValue);
				});
			})
			$("#update_system_modal").modal('show');
		});
		$(document).on('click',"#update_system",function(){
			updatedata("#update_system_form",system_list,'managesystem/update_system');
		});
		
	}
	if(url2=="roletype"){
		var roletype_list=$("#roletype_list").DataTable({
			dom: 'Blfrtip',
        	buttons: [
            {
				extend:'collection',
				text:'Export',
				buttons:[
					'csv',
					'excel',
					'print',
					'pdf'
				],
                exportOptions: {
                    columns: ':visible'
                }
			},
            'colvis'
        ],
			ajax: {
				url: base_url+'index.php/managesystem/get_roletype_list',
				dataType: 'json',
				type: 'POST',
				data: ({}),
				dataSrc:'',
			},
			columns: [ 
				{ "title":"RoleTypeID",	"data": "RoleTypeID"	},
				{ "title":"RoleType",	"data": "RoleType"	},
				{ "title":"Action","data":null,
				render:function(data){
					return `
					<button type="button" data-id="${data.RoleTypeID}" id="show_update_roletype_modal" class="btn  btn-warning btn-sm btn-flat m-b-10 m-l-5"><span class="ti-pencil"></span></button>
					`;
					}
				}
	
			],
			responsive:true
		});
		$(document).on('click',"#show_update_roletype_modal",function(){
			var RoleTypeID=($(this).data('id'));
			$.ajax({
				url:  base_url+'index.php/managesystem/get_roletype_list_by_id',
				dataType: 'json',
				type: 'POST',
				data: ({data:RoleTypeID})
			})      
			.done(function (data) {
				$.each( data, function( key, value ) {
					$("#role_type").val(value.RoleType);
					$("#role_type_id").val(value.RoleTypeID);
				});
			})
			$("#update_roletype_modal").modal('show');
		});
		$(document).on('click',"#update_system",function(){
			updatedata("#update_roletype_form",roletype_list,'managesystem/update_roletype_by_id');
		});
	}
	if(url2=="status"){
		var status_list=$("#status_list").DataTable({
			dom: 'Blfrtip',
        	buttons: [
            {
				extend:'collection',
				text:'Export',
				buttons:[
					'csv',
					'excel',
					'print',
					'pdf'
				],
                exportOptions: {
                    columns: ':visible'
                }
			},
            'colvis'
        ],
			ajax: {
				url: base_url+'index.php/managesystem/get_status_list',
				dataType: 'json',
				type: 'POST',
				data: ({}),
				dataSrc:'',
			},
			columns: [ 
				{ "title":"StatusID",	"data": "StatusID"	},
				{ "title":"Status",	"data": "Status"	}
			],
			responsive:true
		});
	}
	if(url2=="module"){
		var module_list=$("#module_list").DataTable({
			dom: 'Blfrtip',
        	buttons: [
            {
				extend:'collection',
				text:'Export',
				buttons:[
					'csv',
					'excel',
					'print',
					'pdf'
				],
                exportOptions: {
                    columns: ':visible'
                }
			},
            'colvis'
        ],
			ajax: {
				url: base_url+'index.php/managesystem/get_module_list',
				dataType: 'json',
				type: 'POST',
				data: ({}),
				dataSrc:'',
			},
			columns: [ 
				{ "title":"ControllerID",	"data": "ControllerID"	},
				{ "title":"ControllerName",	"data": "ControllerName"}
			],
			responsive:true
		});
	}
	if(url=="dashboard"){
		
		setInterval(function(){
			dashboard();
		}, 1000);
		
		
	}
function  dashboard(){
	$.ajax({
		url:  base_url+'index.php/dashboard/get_queue_dashboard',
		dataType: 'json',
		type: 'POST',
		data: ({})
	})      
	.done(function (data) {
	//	$.each( data, function( key, value ) {
			$(".totat-patient").text(data.get_total_active_patient[0].active_total_patient);
			$(".animal-bite").text(data.get_total_active_patient_animal_bite[0].active_total_patient);
			$(".family-med").text(data.get_total_active_patient_family_med[0].active_total_patient);
			$(".family-plan").text(data.get_total_active_patient_family_plan[0].active_total_patient);
			
			
		//});
	})
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
