<?php
require_once '../db/connection.php';
require_once '../controllers/PostContoller.php';

$postcontroller = new PostController($connection);

if (empty($_SESSION['user'])) {
	$_SESSION['error'] = 'Sorry, but you dont have access to this page or you are not register user';
	header('Location: '. $_SERVER['SERVER_NAME']);
}

$postToEdit = $postcontroller->getPostById($_GET['id']);

if (!empty($_POST['edit'])) {
	$postcontroller->editPost($_GET['id'], $_POST['title'], $_POST['blogText']);
}

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
			<li class="active"><a href="#">Home</a></li>
			<li><a href="#">Page 1</a></li>
			<li><a href="#">Page 2</a></li>
			<li><a href="requests/logout.php">Изход</a></li>
            <?php  //var_dump($_SESSION)  ?>
			<li class="pull-right"><a  href="#"><?= $_SESSION['user']['Name'] . " " . (($_SESSION['user']['AccessLevel'] == 1) ? '(админ)' : '') ?></a></li>
		</ul>
	</div>
</nav>
<div class="container">
<?php if ($_SESSION['user']['AccessLevel'] == 1): ?>
	<div class="col-md-12">
		<h3>Edit blog post:</h3>
		<form method="post" action="">
			<input type="text" name="title" class="form-control" value="<?= $postToEdit->getTitle(); ?>" placeholder="Enter title of the post" required>
			<textarea name="blogText" class="form-control" required><?= $postToEdit->getContent(); ?></textarea>
			<input type="submit" name="edit" class="btn btn-primary" value="Edit Post">
		</form>
	</div>
<?php endif ?>
</div>
</body>
</html>