<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class queue extends My_Controller {
	
	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	public function __construct(){
		parent::__construct();
		$this->load->model('Auth_model','Auth');
		$this->load->model('Access_Control_model','AC');
	}//end of __construct
	public function familyplan(){
		//$this->AC->check_module($this->uri->segment(1));
		$this->data['pageTitle']='Queue';
		$this->load->view('livequeue',$this->data);
	}
	public function animalbite(){
		//$this->AC->check_module($this->uri->segment(1));
		$this->data['pageTitle']='Queue';
		$this->load->view('livequeue',$this->data);
	}
	public function familymed(){
		//$this->AC->check_module($this->uri->segment(1));
		$this->data['pageTitle']='Queue';
		$this->load->view('livequeue',$this->data);
	}
	public function queuelive(){
		$response['animal']=$this->animal_bite();
		$response['family_med']=$this->family_med();
		$response['family_plan']=$this->family_plan();
		echo json_encode($response);
	}
	public function animal_bite(){
		$sql="SELECT  a.QueueID,f.Clinic,
		CONCAT(c.LastName,', ', c.FirstName) as PatientName ,
		CONCAT(b.LastName,', ', b.FirstName) as DoctorName,
		e.Status,d.CheckupType, TIME_FORMAT(DateFrom, '%h:%i:%s %p') as DateFrom,TIME_FORMAT(DateTo, '%h:%i:%s %p') as DateTo,a.IsPriority,a.DateCreated 
		FROM queue as a 
				INNER JOIN Employee as b ON  a.EmployeeID=b.EmployeeID
				INNER JOIN Patient as c ON a.PatientID=c.PatientID 
				INNER JOIN checkuptype as d ON a.CheckupTypeID=d.CheckupTypeID
				INNER JOIN status as e ON a.StatusID=e.StatusID
				INNER JOIN clinic as f ON a.ClinicID=f.ClinicID Where a.StatusID IN(1,3) AND a.ClinicID=1  ORDER BY Status, IsPriority desc ,DateCreated
                
                
          
		";
		$query=$this->db->query($sql);
		return $query->result();
	}
	public function family_med(){
		$sql="SELECT  a.QueueID,f.Clinic,
		CONCAT(c.LastName,', ', c.FirstName) as PatientName ,
		CONCAT(b.LastName,', ', b.FirstName) as DoctorName,
		e.Status,d.CheckupType, TIME_FORMAT(DateFrom, '%h:%i:%s %p') as DateFrom,TIME_FORMAT(DateTo, '%h:%i:%s %p') as DateTo,a.IsPriority,a.DateCreated 
		FROM queue as a 
				INNER JOIN Employee as b ON  a.EmployeeID=b.EmployeeID
				INNER JOIN Patient as c ON a.PatientID=c.PatientID 
				INNER JOIN checkuptype as d ON a.CheckupTypeID=d.CheckupTypeID
				INNER JOIN status as e ON a.StatusID=e.StatusID
				INNER JOIN clinic as f ON a.ClinicID=f.ClinicID Where a.StatusID IN(1,3) AND a.ClinicID=2  ORDER BY Status, IsPriority desc ,DateCreated
		";
		$query=$this->db->query($sql);
		return $query->result();
	}
	public function family_plan(){
		$sql="SELECT  a.QueueID,f.Clinic,
		CONCAT(c.LastName,', ', c.FirstName) as PatientName ,
		CONCAT(b.LastName,', ', b.FirstName) as DoctorName,
		e.Status,d.CheckupType, TIME_FORMAT(DateFrom, '%h:%i:%s %p') as DateFrom,TIME_FORMAT(DateTo, '%h:%i:%s %p') as DateTo,a.IsPriority,a.DateCreated 
		FROM queue as a 
				INNER JOIN Employee as b ON  a.EmployeeID=b.EmployeeID
				INNER JOIN Patient as c ON a.PatientID=c.PatientID 
				INNER JOIN checkuptype as d ON a.CheckupTypeID=d.CheckupTypeID
				INNER JOIN status as e ON a.StatusID=e.StatusID
				INNER JOIN clinic as f ON a.ClinicID=f.ClinicID Where a.StatusID IN(1,3) AND a.ClinicID=3  ORDER BY Status, IsPriority desc ,DateCreated
		";
		$query=$this->db->query($sql);
		return $query->result();
	}
}
