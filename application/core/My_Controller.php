<?php
	class My_Controller extends CI_Controller
	{
		public $UAC;
		public $Role;
		public $EmployeeInformation;
		public $mysession;
		public $systemSetting;
		function __construct()
		{
			parent::__construct();
			$this->mysession=$this->session->userdata('userdata');
			$this->load->model('Access_Control_model','AC');
			$this->UAC=$this->AC->get_access_control($this->uri->segment(1));
			$this->Role=$this->AC->get_role();
			$this->EmployeeInformation=$this->db->query("SELECT * From employee WHERE EmployeeID=?",array($this->mysession['EmployeeID']))->row_array();
			$this->systemsetting=$this->db->get('systemsetting')->result();
			if(empty($this->session->userdata('userdata'))){
				redirect('login/logout','refresh');
			}
		
			
		}
	
		public function decode_json($json){
			$dataString=$this->input->post('data');
			$data = json_decode($dataString);
			$final = json_decode(json_encode($data), True);
			return $final;
		}
		
	}
?>

