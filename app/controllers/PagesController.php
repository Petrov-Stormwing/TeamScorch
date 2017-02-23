<?php 

namespace App\Controllers;

Class PagesController {
	public function home()
	{
		return view('index');
	}
	public function about()
	{
		return view('about');
	}
}