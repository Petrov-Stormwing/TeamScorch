<?php

require_once $_SERVER['DOCUMENT_ROOT'] . '/Interfaces/IUser.php';

Class User implements IUser
{
	protected $id;
	protected $name;
	protected $email;
	protected $password;
	protected $accessLevel;
	protected $connection;

	public function __construct($connection)
	{
		$this->connection = $connection;
	}

    /**
     * Gets the value of id.
     *
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Sets the value of id.
     *
     * @param mixed $id the id
     *
     * @return self
     */
    protected function setId($id)
    {
        $this->id = $id;

        return $this;
    }

    /**
     * Gets the value of name.
     *
     * @return mixed
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Sets the value of name.
     *
     * @param mixed $name the name
     *
     * @return self
     */
    protected function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Gets the value of password.
     *
     * @return mixed
     */
    public function getPassword()
    {
        return $this->password;
    }

    /**
     * Gets the value of email.
     *
     * @return mixed
     */
    public function getEmail()
    {
        return $this->email;
    }

    /**
     * Sets the value of email.
     *
     * @param mixed $email the email
     *
     * @return self
     */
    protected function setEmail($email)
    {
        $this->email = $email;

        return $this;
    }

    /**
     * Gets the value of accessLevel.
     *
     * @return mixed
     */
    public function getAccessLevel()
    {
        return $this->accessLevel;
    }

    /**
     * Sets the value of accessLevel.
     *
     * @param mixed $accessLevel the access level
     *
     * @return self
     */
    protected function setAccessLevel($accessLevel)
    {
        $this->accessLevel = $accessLevel;

        return $this;
    }

    public function getAllUsers()
    {
    	return $this->connection->MSelectList('Users', '*');
    }

    public function getUserById($id)
    {
        $user = $this->connection->MSelectOnly('Users', '*', 'WHERE ID = ' . $id);
        $this->setId($user['ID']);
        $this->setName($user['Name']);
        $this->setEmail($user['Email']);
        $this->setAccessLevel($user['AccessLevel']);
        return $this;
    }

    public function getUsersByEmail($email)
    {
    	$user = $this->connection->MSelectOnly('Users', '*', 'WHERE Email = "' . $email . '"');
    	return $user;
    }

    public function addUser($name, $email, $password)
    {
    	$findUser = $this->getAllUsers();
    	// if user is the first user registrated, then give him a administrative rights else register user as a regular user
		$this->connection->MInsert('Users', '(Name, Email, Password, AccessLevel) VALUES ("' . $name . '", "' . $email . '", "' . password_hash($password, PASSWORD_DEFAULT) . '", ' . (empty($findUser) ? '1' : '0') . ')');
    	return $this->connection->MSelectOnly('Users', '*', 'ORDER BY ID DESC');
    }

    public function login($email, $password)
    {
    	$selectedUserByEmail = $this->getUsersByEmail($email);
    	if (!empty($selectedUserByEmail) && password_verify($password, $selectedUserByEmail['Password'])) {
    		return $selectedUserByEmail;
    	} else {
    		throw new Exception("No such user in db");
    	}
    }
}