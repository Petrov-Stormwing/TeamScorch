<?php
require_once 'db/connection.php';
require_once 'controllers/PostContoller.php';
require 'controllers/UserController.php';

$postcontroller = new PostController($connection);
$userController = new UserController($connection);

if (!empty($_GET['logout'])) {
	$userController->logout();
}

if (empty($_SESSION['user'])) {
	$_SESSION['error'] = 'Sorry, but you dont have access to this page or you are not register user';
	header('Location: '. $_SERVER['SERVER_NAME']);
}

if (!empty($_POST['addPost'])) {
	$postcontroller->addPostToDb($_POST['title'], $_POST['blogText'], $_SESSION['user']['ID']);
}

if (!empty($_POST['edit'])) {
	header('Location: '. '../views/edit.php?id=' . $_POST['id']);
}

if (!empty($_POST['delete'])) {
	$postToDelete = $postcontroller->getPostById($_POST['id']);
	$postcontroller->deletePost($postToDelete);
}


$allPosts = $postcontroller->getAllPosts();
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Welcome to this awesome blog</title>
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
			<li class="active"><a href="welcome">Posts</a></li>
			<?php if ($_SESSION['user']['AccessLevel'] == 1): ?>
				<li><a href="users.php">Users</a></li>
			<?php endif ?>
			<li><a href="welcome.php?logout=true">Изход</a></li>
			<li class="pull-right"><a  href="#"><?= $_SESSION['user']['Name'] . " " . (($_SESSION['user']['AccessLevel'] == 1) ? '(админ)' : '') ?></a></li>
		</ul>
	</div>
</nav>
<div class="container">
<?php if ($_SESSION['user']['AccessLevel'] == 1): ?>
	<div class="col-md-12">
		<h3>Add new blog post:</h3>
		<form method="post" action="">
			<input type="text" name="title" class="form-control" placeholder="Enter title of the post" required>
			<textarea name="blogText" class="form-control" required></textarea>
			<input type="submit" name="addPost" class="btn btn-primary" value="Add Post">
		</form>
	</div>
<?php endif ?>
	<div class="col-md-12">
		<h3>Posts</h3>
		<?php foreach ($allPosts as $post): ?>
			<h4><a href="single-post.php?id=<?= $post->getId() ?>"><?= $post->getTitle() . " - " . $post->getDate(); ?></a></h4>
			<p><?= $post->getContent(); ?></p>
			<?php if ($_SESSION['user']['AccessLevel'] == 1): ?>
				<form method="post">
					<input type="hidden" name="id" value="<?= $post->getID(); ?>">
					<input type="submit" class="btn btn-warning" name="edit" value="Edit">
					<input type="submit" class="btn btn-danger" name="delete" value="Delete">
				</form>
			<?php endif ?>
			<hr>
		<?php endforeach ?>
	</div>
</div>
</body>
</html>