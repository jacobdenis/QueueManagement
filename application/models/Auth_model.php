<?php 

class Auth_model extends CI_Model {
	public function get_system_setting()
	{
			$query = $this->db->get('systemsetting');
			return $query->result_array();
	}
	public function get_user($data){
		$query = $this->db->get_where('login', array("Username"=>$data['Username']));
		if($result=$query->row_array()){
			
			if(password_verify($data['Password'],$result['Password'])){
				$this->session->set_userdata('userdata',$result);
				return  true;
			}else{
				return false;
			}
		}else{
			return  false;
		}
			
		

	}

}
?>
