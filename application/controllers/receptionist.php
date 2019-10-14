<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class receptionist extends My_Controller {

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
        $this->load->model('Access_Control_model','AC');
    }//end of __construct
    public function index(){
		$a=$this->AC->check_module($this->uri->segment(1));
		$this->data['pageTitle']='Queue';
		$this->data['view']='pages/queue';
		$this->load->view('layout',$this->data);
	}
	public function get_queuelist(){
		$sql="SELECT a.DateCreated, a.QueueID,f.Clinic,a.IsPriority,a.DateFrom,a.DateTo,
		CONCAT(c.LastName,', ', c.FirstName) as PatientName ,
		CONCAT(b.LastName,', ', b.FirstName) as DoctorName,
		e.Status,d.CheckupType,a.DateCreated
		FROM queue as a 
				INNER JOIN Employee as b ON  a.EmployeeID=b.EmployeeID
				INNER JOIN Patient as c ON a.PatientID=c.PatientID 
				INNER JOIN checkuptype as d ON a.CheckupTypeID=d.CheckupTypeID
				INNER JOIN status as e ON a.StatusID=e.StatusID
				INNER JOIN clinic as f ON a.ClinicID=f.ClinicID ORDER BY Status, IsPriority desc ,DateCreated
		";
		$query=$this->db->query($sql);
		echo json_encode($query->result());
	}
	// public function get_doctors(){
	// 	$sql="SELECT EmployeeID as id, CONCAT(UCASE(LastName),',',UCASE(FirstName)) as text from Employee WHERE  FirstName=? ";
	// 	$query=$this->db->query($sql ,array($this->input->post('q')));
	// 	echo json_encode($query->result());
	// }
	public function get_doctors(){
		$sql="SELECT EmployeeID as id, CONCAT(UCASE(LEFT(LastName,1)),SUBSTRING(LastName, 2),', ',UCASE(LEFT(FirstName,1)),SUBSTRING(FirstName, 2)   ) as text from Employee  ";
		$query=$this->db->query($sql ,array($this->input->post('q')));
		return $query->result();
		//echo json_encode($query->result());
	}
	public function get_patient(){
		$sql="SELECT PatientID as id, CONCAT(UCASE(LEFT(LastName,1)),SUBSTRING(LastName, 2),', ',UCASE(LEFT(FirstName,1)),SUBSTRING(FirstName, 2)   ) as text from Patient  ";
		$query=$this->db->query($sql );
		return $query->result();
		//echo json_encode($query->result());
	}
	public function get_status(){
		$sql="SELECT StatusID as id, Status as text from Status  ";
		$query=$this->db->query($sql );
		return $query->result();
		//echo json_encode($query->result());
	}
	public function get_checkuptype(){
		$sql="SELECT CheckupTypeID as id, CheckupType as text from checkuptype  ";
		$query=$this->db->query($sql );
		return $query->result();
		//echo json_encode($query->result());
	}
	public function get_clinic(){
		$sql="SELECT ClinicID as id, Clinic as text from clinic  ";
		$query=$this->db->query($sql );
		return $query->result();
	}
	public function get_select(){
		$response['get_doctors']=$this->get_doctors();
		$response['get_patient']=$this->get_patient();
		$response['get_status']=$this->get_status();
		$response['get_checkuptype']=$this->get_checkuptype();
		$response['get_clinic']=$this->get_clinic();
		echo json_encode($response);
	}
	public function add_queue(){
		$data=$this->decode_json($this->input->post('data'));
		$sql="select * from queue where statusid IN(1,3) ";
		$result=$this->db->query($sql)->result();
		if(empty($result)){
			$data['StatusID']=3;
			$data['queuenumber']=1;
		}else{
			$partialqueuenumber=$this->db->query('SELECT * FROM queue.queue where statusID in (3,1) and CLINICID =? ORDER BY QUEUEID Desc limit 1',array($data['ClinicID']))->row_array()['queuenumber'];
			$data['queuenumber']=$partialqueuenumber+1;
			$data['StatusID']=1;

		}
		if($data['IsPriority']){
				$this->db->trans_start();
					$data['DateFrom']=NULL;
					$data['DateTo']=NULL;
					$this->db->insert('queue', $data);
					$sql="SELECT QUEUEID from queue where StatusID=1 AND IsPriority=0 AND ClinicID=?";
					$result=$this->db->query($sql,array($data['ClinicID']))->result();
					foreach ($result as $value) {
						$sql="UPDATE queue set DateFrom =DateFrom + INTERVAL 10 MINUTE ,DateTo=DateTo  + INTERVAL 10 MINUTE   WHERE QueueID IN (?)";
						$query=$this->db->query($sql,array($value->QUEUEID	));
					}
				$this->db->trans_complete();
		}else{
			$this->db->insert('queue', $data);
		}
		
		if($this->db->affected_rows() >=0){
			echo json_encode(true); //add your code here
		}else{
			echo json_encode(false); //add your your code here
		}
	}
	public function delete_queue(){
		$data=$this->decode_json($this->input->post('data'));
		$sql='DELETE FROM `queue` WHERE QueueID=?';
		$this->db->query($sql,$data);
		if($this->db->affected_rows() >=0){
			echo json_encode(true); //add your code here
		}else{
			echo json_encode(false); //add your your code here
		}
	}
	public function update_queue(){
		$data=$this->decode_json($this->input->post('data'));
		//print_r($data);
		$sql="UPDATE queue SET StatusID=?	 WHERE QueueID=?";
		$query=$this->db->query($sql,$data);
		if($this->db->affected_rows() >=0){
			echo json_encode(true); //add your code here
		}else{
			echo json_encode(false); //add your your code here
		}
	}

	

}
