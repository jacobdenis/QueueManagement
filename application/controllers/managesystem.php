<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class managesystem extends My_Controller {
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
	public function accesslist(){
		//print_r( $this->AC->get_access_control($this->uri->segment(1)) );
		//$this->AC->check_module($this->uri->segment(1));
		$this->data['pageTitle']='Accesslist';
		$this->data['view']='pages/accesslist';
		$this->load->view('layout',$this->data);
	}
	public function get_access_list(){
		$sql="SELECT CONCAT(UCASE(LEFT(c.LastName,1)),SUBSTRING(c.LastName, 2),', ',UCASE(LEFT(c.FirstName,1)),SUBSTRING(c.FirstName, 2) ) as FullName,
		a.AccessControlID,a.Create,a.Read,a.Update,a.Delete,d.ControllerName,a.DateCreated 
		FROM accesscontrol as a INNER JOIN login as b ON a.LoginID=b.LoginID INNER JOIN employee as c ON b.EmployeeID=c.EmployeeID 
		INNER JOIN controller as d ON a.ControllerName=d.ControllerID
		";
		$query=$this->db->query($sql);
		echo json_encode($query->result());
	}
	public function delete_accesslist(){
		$data=$this->decode_json($this->input->post('data'));
		$sql="DELETE FROM accesscontrol WHERE AccessControlID=?";
		$query=$this->db->query($sql,array($data));
		if($this->db->affected_rows() >=0){
			echo json_encode(true); //add your code here
		}else{
			echo json_encode(false); //add your your code here
		}
	}
	public function roletype(){
		$this->data['pageTitle']='RoleType';
		$this->data['view']='pages/roletype';
		$this->load->view('layout',$this->data);
	}
	public function get_roletype_list(){
		$sql="SELECT * from roletype";
		$query=$this->db->query($sql);
		echo json_encode($query->result());
		
	}
	public function get_roletype_list_by_id(){
		$data=$this->input->post('data');
		$sql="SELECT * from roletype WHERE RoleTypeID=?";
		$query=$this->db->query($sql,array($data));
		echo json_encode($query->result());
	}
	public function update_roletype_by_id(){
		$data=$this->decode_json($this->input->post('data'));
		//print_r($data);
		$sql='UPDATE roletype SET RoleType=? WHERE RoleTypeID=?';
		$query=$this->db->query($sql,$data);
		if($this->db->affected_rows() >=0){
			echo json_encode(true); //add your code here
		}else{
			echo json_encode(false); //add your your code here
		}
	}
	public function system(){
		$this->data['pageTitle']='System';
		$this->data['view']='pages/system';
		$this->load->view('layout',$this->data);
	}
	public function get_system_list(){
		$sql="SELECT * from systemsetting";
		$query=$this->db->query($sql);
		echo json_encode($query->result());
		
	}
	public function update_system(){
		$data=$this->decode_json($this->input->post('data'));
		//print_r($data);
		$sql='UPDATE systemsetting SET SystemValue=? WHERE SystemSettingID=?';
		$query=$this->db->query($sql,$data);
		if($this->db->affected_rows() >=0){
			echo json_encode(true); //add your code here
		}else{
			echo json_encode(false); //add your your code here
		}
	}
	public function status(){
		$this->data['pageTitle']='Status';
		$this->data['view']='pages/status';
		$this->load->view('layout',$this->data);
	}
	public function get_status_list(){
		$sql="SELECT * from status";
		$query=$this->db->query($sql);
		echo json_encode($query->result());
	}
	public function module(){
		$this->data['pageTitle']='Module';
		$this->data['view']='pages/module';
		$this->load->view('layout',$this->data);
	}
	public function get_module_list(){
		$sql="SELECT * from controller";
		$query=$this->db->query($sql);
		echo json_encode($query->result());
	}
	public function get_controller(){
		$sql="SELECT ControllerID as id , ControllerName as text from controller";
		$query=$this->db->query($sql);
		return $query->result();
		//echo json_encode($query->result());
	}
	public function get_employee(){
		$sql="SELECT CONCAT(UCASE(LEFT(c.LastName,1)),SUBSTRING(c.LastName, 2),', ',UCASE(LEFT(c.FirstName,1)),SUBSTRING(c.FirstName, 2) ) as text, b.LoginID as id from employee as c
			INNER JOIN login as b ON c.EmployeeID=b.EmployeeID
		";
		$query=$this->db->query($sql);
		return $query->result();
	}
	public function get_select(){
		$response['get_module']=$this->get_controller();
		$response['get_employee']=$this->get_employee();
		echo json_encode($response);
	}
	public function add_access(){
		$data=$this->decode_json($this->input->post('data'));
		$this->db->insert('accesscontrol', $data);
		if($this->db->affected_rows() >=0){
			echo json_encode(true); //add your code here
		}else{
			echo json_encode(false); //add your your code here
		}
	}


}
