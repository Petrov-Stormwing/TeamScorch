<?php
require 'db/connection.php';
require 'controllers/UserController.php';

$userController = new UserController($connection);

if (!empty($_POST['register'])) {
	$addedUser = $userController->addUserToDb($_POST['name'], $_POST['email'], $_POST['password']);
	$_SESSION['user'] = $addedUser;

	if (!empty($addedUser)) {
		header('Location: '. 'views/welcome.php');
	} else {
		throw new Exception("User was not added!");
	}
}
if (!empty($_POST['login'])) {
	$loggedInUser = $userController->loginUser($_POST['email'], $_POST['password']);

	$_SESSION['user'] = $loggedInUser;

	if (!empty($loggedInUser)) {
		header('Location: '. 'views/welcome.php');
	} else {
		throw new Exception("User was not added!");
	}
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Welcome to this awesome forum</title>
	<link rel="stylesheet" type="text/css" href="https://bootswatch.com/paper/bootstrap.min.css">
</head>
<body>
<?php echo !empty($_SESSION['error']) ? $_SESSION['error'] . "<br>" : ""; ?>
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Blog</a>
		</div>
		<ul class="nav navbar-nav">
			<li class="active"><a href="#">Home</a></li>
		</ul>
	</div>
</nav>
	<div class="col-md-6">
		<h3>Login</h3>
		<form method="post">
			<label for="email">Email:</label>
			<input type="text" name="email" class="form-control" id="email" placeholder="email" required>
			<label for="password">Password:</label>
			<input type="password" name="password" class="form-control" id="password" placeholder="password" required>
			<input type="submit" name="login" class="btn btn-primary">
		</form>
	</div>
	<div class="col-md-6">
		<h3>Register</h3>
		<form method="post">
			<label for="name">Name:</label>
			<input type="text" name="name" class="form-control" id="name" placeholder="name" required>
			<label for="email">Email:</label>
			<input type="text" name="email" class="form-control" id="email" placeholder="email" required>
			<label for="password">Password:</label>
			<input type="password" name="password" class="form-control" id="password" placeholder="password" required>
			<input type="submit" name="register" class="btn btn-primary">
		</form>
	</div>
</body>
</html>