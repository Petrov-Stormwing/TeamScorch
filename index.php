<?php 
require 'db/connection.php';
 ?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Welcome to this awesome forum</title>
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
	<?php echo $_SESSION['error'] . "<br>"; ?>

	<h1>Welcome to the forum</h1>
	<h3>Please, in order to use it singin or register</h3>

	<div class="col-md-6">
		<h3>Login</h3>
		<form method="post" action="requests/login.php">
			<label for="email">Email:</label>
			<input type="text" name="email" class="form-control" id="email" placeholder="email" required>
			<label for="password">Password:</label>
			<input type="password" name="password" class="form-control" id="password" placeholder="password" required>
			<input type="submit" name="login" class="btn btn-info">
		</form>
	</div>
	<div class="col-md-6">
		<h3>Register</h3>
		<form method="post" action="requests/register.php">
			<label for="name">Name:</label>
			<input type="text" name="name" class="form-control" id="name" placeholder="name" required>
			<label for="email">Email:</label>
			<input type="text" name="email" class="form-control" id="email" placeholder="email" required>
			<label for="password">Password:</label>
			<input type="password" name="password" class="form-control" id="password" placeholder="password" required>
			<input type="submit" name="register" class="btn btn-info">
		</form>
	</div>
</body>
</html>