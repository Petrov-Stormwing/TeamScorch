<?php 

namespace App\Controllers;

use App\Core\App;

Class UsersController {
	public function index()
	{
		$users = App::get('database')->selectAll('Users');
		return view('users', compact('users'));
	}

	public function store()
	{
		App::get('database')->insert('Users',
			['Name' => $_POST['name'],
			'Email' => $_POST['email'],
			'Password' => $_POST['password'],
			'AccessLevel' => 0
			]);

		return redirect('users');
	}
}