<?php
require_once '../db/connection.php';
require_once '../controllers/UserController.php';

$userController = new UserController($connection);

if (!empty($_GET['logout'])) {
	$userController->logout();
}

if (empty($_SESSION['user']) && $_SESSION['user']['AccessLevel'] != 1) {
	$_SESSION['error'] = 'Sorry, but you dont have access to this page or you are not register user';
	header('Location: '. $_SERVER['SERVER_NAME']);
}

$allUsers = $userController->getAllUsers();
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Welcome to this awesome blog</title>
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
			<li><a href="welcome.php">Posts</a></li>
			<li class="active"><a href="users.php">Users</a></li>
			<li><a href="welcome.php?logout=true">Изход</a></li>
			<li class="pull-right"><a  href="#"><?= $_SESSION['user']['Name'] . " " . (($_SESSION['user']['AccessLevel'] == 1) ? '(админ)' : '') ?></a></li>
		</ul>
	</div>
</nav>
<div class="container">
<?php if ($_SESSION['user']['AccessLevel'] == 1): ?>
	<div class="col-md-12">
		<h3>Users</h3>
		<?php foreach ($allUsers as $user): ?>
			<form method="post">
				<label for="<?= $user->getId(); ?>"><?= $user->getName() ?> is admin? </label>
				<input type="checkbox" name="user-<? $user->getId(); ?>" <?= ($user->getAccessLevel() == 1) ? "checked" : "" ?>>
			</form>
		<?php endforeach ?>
	</div>
<?php endif ?>
</div>
</body>
</html>