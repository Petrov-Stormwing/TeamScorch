<?php
require '../db/connection.php';

if (!empty($_POST['login'])) {
	$user = $connection->MSelectOnly('Users', '*', 'WHERE Email = "' . $_POST['email'] . '" AND Password = "' . $_POST['password'] . '"');

	$_SESSION['user'] = $user;

	header('Location: '. '../welcome.php');
}