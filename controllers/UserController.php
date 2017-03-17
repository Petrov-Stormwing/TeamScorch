<?php
//require_once 'models/User.php';

require_once(__DIR__. '/../models/User.php');

Class UserController
{
	protected $users = [];

	protected $connection;

	public function __construct($connection)
	{
		$this->connection = $connection;
	}

	public function getUsers()
    {
        return $this->users;
    }

    public function addUser(User $user)
    {
        $this->users[] = $user;

        return $this;
    }

	public function getUserById($id)
    {
        $user = new User($this->connection);
        return $user->getUserById($id);
    }

    public function getAllUsers()
    {
    	$data = $this->connection->MSelectList('Users', '*', 'ORDER BY ID DESC');
		foreach ($data as $userData) {
			$userIt = $this->getUserById($userData['ID']);
			$this->addUser($userIt);
		}
		return $this->getUsers();
    }

	public function addUserToDb($name, $email, $password)
	{
		$user = new User($this->connection);
		$addedUser = $user->addUser($name, $email, $password);
		return $addedUser;
	}

	public function loginUser($email, $password)
	{
		$user = new User($this->connection);
		return $user->login($email, $password);
	}

	public function logout()
    {
    	session_destroy();

		header('Location: ../index.php');
    }

	public function editUser($id, $name, $email)
	{
		$user = new User($this->connection);
		$user->getUserById($id);
		$editedUser = $user->editUser($id, $name, $email);

		if (!empty($editedUser)) {
			header('Location: '. '../views/user-profile.php');
		} else {
			throw new Exception("Post was not edited!");
		}
	}

    public function makeAdmin($userIds)
    {
        $this->connection->MUpdate('Users', 'AccessLevel = 0', 'WHERE ID NOT IN (' . $userIds . ')');
        $this->connection->MUpdate('Users', 'AccessLevel = 1', 'WHERE ID IN (' . $userIds . ')');
        return $this;
    }


}