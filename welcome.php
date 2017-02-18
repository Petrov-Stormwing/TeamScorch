<?php
require 'db/connection.php';

if (empty($_SESSION['user'])) {
	$_SESSION['error'] = 'Sorry, but you dont have access to this page or you are not register user';
	header('Location: '. $_SERVER['SERVER_NAME']);
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Welcome home</title>
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
	<h1>Welcome to the forum, <?php echo $_SESSION['user']['Name']; ?></h1>
</body>
</html>
<?php 
