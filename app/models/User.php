<?php 

Class User {
	private $id;
	private $name;
	private $email;
	private $accessLevel;

	function __construct($id, $name, $email, $accessLevel)
	{
		$this->id = $id;
		$this->name = $name;
		$this->email = $email;
		$this->accessLevel = $accessLevel;
	}

	public function getId($id)
	{
		return $id;
	}

	public function getName($name)
	{
		return $name;
	}

	public function getEmail($email)
	{
		return $email;
	}

	public function getAccessLevel($accessLevel)
	{
		return $accessLevel;
	}

}