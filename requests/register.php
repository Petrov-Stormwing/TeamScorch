<?php
require '../db/connection.php';

if (!empty($_POST['register'])) {
	$connection->MInsert('Users', '(Name, Email, Password) VALUES ("' . $_POST['name'] . '", "' . $_POST['email'] . '", "' . $_POST['password'] . '")');
	$user = $connection->MSelectOnly('Users', '*', 'ORDER BY ID DESC');
	echo "<pre>";
	print_r($user);
	echo "</pre>";

	$_SESSION['user'] = $user;

	header('Location: '. '../welcome.php');
}