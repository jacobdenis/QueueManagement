<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {

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
	}//end of __construct
	public function index()
	{
		$data['data']=$this->Auth->get_system_setting();
		$this->load->view('login.php',$data);
	}
	public function validate_user(){
		$dataString=$this->input->post('data');
		$data = json_decode($dataString);
		$final = json_decode(json_encode($data), True);
		$status=$this->Auth->get_user($final);
		echo json_encode($status);
	}
	public function logout(){
		$this->session->sess_destroy();
		redirect('login','refresh');
	}
}
