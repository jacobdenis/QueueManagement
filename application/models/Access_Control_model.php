<?php 

class Access_Control_model extends CI_Model {
	public function get_access_control($module=NULL)
	{
		
		$sql = "SELECT * FROM accesscontrol WHERE loginID=? AND ControllerName=?";
		$query=$this->db->query($sql,array($this->mysession['LoginID'],$module));
		return $query->row_array();

	}
	public function get_role(){
		$sql = "SELECT * From role as a INNER JOIN roletype as b ON a.RoleTypeID=b.RoleTypeID WHERE loginID=?";
		$query=$this->db->query($sql,array($this->mysession['LoginID']));
		return $query->row_array();
	}
	
	public function check_module($module){
		if($data=$this->get_access_control($module)){
			return $data;
		}else{
			show_404();
		}
	}

}
?>
