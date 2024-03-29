<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class patient extends My_Controller {
	
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
		$this->data['pageTitle']='Patient';
		$this->data['view']='pages/patient';
		$this->load->view('layout',$this->data);
	}
	public function get_patientlist(){
		$sql='SELECT * From patient';
		$query=$this->db->query($sql);
		echo json_encode($query->result());
	}
	public function get_patientlist_by_id(){
		$data=$this->input->post('data');
		$sql='SELECT * From patient WHERE PatientID=?';
		$query=$this->db->query($sql,array($data));
		echo json_encode($query->result());
	}
	public function add_patient(){
		$data=$this->decode_json($this->input->post('data'));
		$this->db->insert('patient', $data);
		if($this->db->affected_rows() >=0){
			echo json_encode(true); //add your code here
		}else{
			echo json_encode(false); //add your your code here
		}
	}
	public function update_patient(){
		$data=$this->decode_json($this->input->post('data'));
		$this->db->update('patient', $data);
		if($this->db->affected_rows() >=0){
			echo json_encode(true); //add your code here
		}else{
			echo json_encode(false); //add your your code here
		}
	}
	public function delete_patient(){
		$data=$this->decode_json($this->input->post('data'));
		$sql='DELETE From patient WHERE PatientID=?';
		$this->db->query($sql,$data);
		if($this->db->affected_rows() >=0){
			echo json_encode(true); //add your code here
		}else{
			echo json_encode(false); //add your your code here
		}
	}

}
