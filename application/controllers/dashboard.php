<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class dashboard extends My_Controller {
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
		//print_r( $this->AC->get_access_control($this->uri->segment(1)) );
		//$this->AC->check_module($this->uri->segment(1));
		$this->data['pageTitle']='Dashboard';
		$this->data['view']='dashboard/index';
		$this->load->view('layout',$this->data);
	}
	public function get_total_active_patient(){
		$sql="SELECT count(QueueID) as active_total_patient FROM queue WHERE StatusID=1";
		$query=$this->db->query($sql);
		return $query->result();
	}
	public function get_total_active_patient_by_clinic($id){
		$sql="SELECT count(QueueID) as active_total_patient FROM queue WHERE StatusID=1 AND ClinicID=?";
		$query=$this->db->query($sql,array($id));
		return $query->result();
	}
	public function get_queue_dashboard(){
		$response['get_total_active_patient']=$this->get_total_active_patient();
		$response['get_total_active_patient_animal_bite']=$this->get_total_active_patient_by_clinic(1);
		$response['get_total_active_patient_family_med']=$this->get_total_active_patient_by_clinic(2);
		$response['get_total_active_patient_family_plan']=$this->get_total_active_patient_by_clinic(3);
		echo json_encode($response);
	}
	
}
