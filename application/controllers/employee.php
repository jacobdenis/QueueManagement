<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class employee extends My_Controller {
	
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
	public function index(){
		$this->AC->check_module($this->uri->segment(1));
		$this->data['pageTitle']='Employee';
		$this->data['view']='pages/employee';
		$this->load->view('layout',$this->data);
	}
	public function get_employeelist(){
		$sql='select * from employee as a 
		INNER JOIN login as b ON a.EmployeeID=b.EmployeeID 
		INNER JOIN role as c ON b.LoginID=c.LoginID
		INNER JOIN roletype as d ON c.RoleTypeID=d.RoleTypeID';
		$query=$this->db->query($sql);
		echo json_encode($query->result());
	}
	public function get_employee_by_id(){
		$data=$this->input->post('data');
		$sql="SELECT * from employee as a 
		INNER JOIN login as b ON a.EmployeeID=b.EmployeeID 
		INNER JOIN role as c ON b.LoginID=c.LoginID
		INNER JOIN roletype as d ON c.RoleTypeID=d.RoleTypeID WHERE a.EmployeeID=?";
		$query=$this->db->query($sql,array($data));
		echo json_encode($query->result());

	}
	public function add_employee(){
		$data=$this->decode_json($this->input->post('data'));
		$this->db->trans_start();

		$this->db->query("INSERT INTO `employee` (`EmployeeID`, `FirstName`, `MiddleName`, `LastName`, `DateCreated`) VALUES (NULL, ?, ?, ?, CURRENT_TIMESTAMP);",array($data['FirstName'],$data['MiddleName'],$data['LastName']));
			$id=$this->db->insert_id();
		$this->db->query("INSERT INTO `login` (`LoginID`, `Username`, `Password`, `EmployeeID`, `DateCreated`) VALUES (NULL, ?, ?, ?, CURRENT_TIMESTAMP);",array($data['Username'],password_hash($data['Password'], PASSWORD_BCRYPT),$this->db->insert_id()));
		
		$this->db->query("INSERT INTO `role` (`RoleID`, `LoginID`, `RoleTypeID`) VALUES (NULL, ?, ?);",array($this->db->insert_id(),$data['RoleTypeID']));
		$this->db->trans_complete();

		if($this->db->affected_rows() >=0){
			echo json_encode(true); //add your code here
		}else{
			echo json_encode(false); //add your your code here
		}
	}
	public function update_employee(){
		$data=$this->decode_json($this->input->post('data'));
		$this->db->trans_start();
		$this->db->query("UPDATE employee SET FirstName=?,MiddleName=?,LastName=? WHERE EmployeeID=?",array($data['FirstName'],$data['MiddleName'],$data['LastName'],$data['EmployeeID']));
		$this->db->query("UPDATE login SET Username=?,Password=? WHERE LoginID=?",array($data['Username'],password_hash($data['Password'], PASSWORD_BCRYPT),$data['LoginID']));
		
		$this->db->query("UPDATE role SET RoleTypeID=? WHERE LoginID=?",array($data['LoginID'],$data['RoleTypeID']));
		$this->db->trans_complete();

		if($this->db->affected_rows() >=0){
			echo json_encode(true); //add your code here
		}else{
			echo json_encode(false); //add your your code here
		}
	}
	public function get_roletype(){
		$sql='select RoleTypeID as id , RoleType as text from roletype';
		$query=$this->db->query($sql);
		return ($query->result());
	}
	public function get_select(){
		$response['roletype']=$this->get_roletype();
		echo json_encode($response);
	}
	public function delete_employee(){
		$data=$this->decode_json($this->input->post('data'));
		$sql='DELETE From employee WHERE EmployeeID=?';
		$this->db->query($sql,$data);
		if($this->db->affected_rows() >=0){
			echo json_encode(true); //add your code here
		}else{
			echo json_encode(false); //add your your code here
		}
	}
	
}
