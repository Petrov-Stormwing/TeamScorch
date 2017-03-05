<?php 
require 'db/connection.php';
 ?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Welcome to this awesome forum</title>
	<link rel="stylesheet" type="text/css" href="https://bootswatch.com/paper/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="resources/static/css/frontpage.css">
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
			<li><a href="#">Page 1</a></li>
			<li><a href="#">Page 2</a></li>
			<li><a href="#">Page 3</a></li>
		</ul>
	</div>
</nav>
	<div class="col-md-6">
		<h3>Login</h3>
		<form method="post" action="requests/login.php">
			<label for="email">Email:</label>
			<input type="text" name="email" class="form-control" id="email" placeholder="email" required>
			<label for="password">Password:</label>
			<input type="password" name="password" class="form-control" id="password" placeholder="password" required>
			<input type="submit" name="login" class="btn btn-primary">
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
			<input type="submit" name="register" class="btn btn-primary">
		</form>
	</div>
</body>
</html>