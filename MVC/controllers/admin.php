<?php
class Admin extends Controller{
	protected function register(){
		$viewmodel = new AdminModel();
		$this->returnView($viewmodel->register(), true);
	}

	protected function login(){
		$viewmodel = new AdminModel();
		$this->returnView($viewmodel->login(), true);
	}

	protected function logout(){
		unset($_SESSION['is_logged_in']);
		unset($_SESSION['admin_data']);
		session_destroy();
		// Redirect
		header('Location: '.ROOT_URL);
	}
}