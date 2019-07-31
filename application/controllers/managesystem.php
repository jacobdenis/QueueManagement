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
		$sql="SELECT CONCAT(UCASE(LEFT(c.LastName,1)),SUBSTRING(c.LastName, 2),', ',UCASE(LEFT(c.FirstName,1)),SUBSTRING(c.FirstName, 2)   ) as FullName,a.* 
			FROM accesscontrol as a 
			INNER JOIN login as b ON a.LoginID=b.LoginID 
			INNER JOIN employee as c ON b.EmployeeID=c.EmployeeID
		";
		$query=$this->db->query($sql);
		echo json_encode($query->result());
	}
}
