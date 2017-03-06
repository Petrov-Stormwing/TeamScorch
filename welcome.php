<?php
require 'db/connection.php';

if (empty($_SESSION['user'])) {
	$_SESSION['error'] = 'Sorry, but you dont have access to this page or you are not register user';
	header('Location: '. $_SERVER['SERVER_NAME']);
}

$allPosts = $connection->MSelectList('Posts', '*', 'ORDER BY ID DESC');
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
			<li class="active"><a href="#">Home</a></li>
			<li><a href="#">Page 1</a></li>
			<li><a href="#">Page 2</a></li>
			<li><a href="#">Page 3</a></li>
			<li class="pull-right"><a  href="#"><?= $_SESSION['user']['Name'] . " " . (($_SESSION['user']['AccessLevel'] == 1) ? '(админ)' : '') ?></a></li>
		</ul>
	</div>
</nav>
<div class="container">
<?php if ($_SESSION['user']['AccessLevel'] == 1): ?>
	<div class="col-md-12">
		<h3>Add new blog post:</h3>
		<form method="post" action="requests/addPost.php">
			<input type="text" name="title" class="form-control" placeholder="Enter title of the post" required>
			<textarea name="blogText" class="form-control" required></textarea>
			<input type="submit" name="addPost" class="btn btn-primary" value="Add Post">
		</form>
	</div>
<?php endif ?>
	<div class="col-md-12">
		<h3>Posts</h3>
		<?php foreach ($allPosts as $post): ?>
			<h4><?= $post['Title'] ?></h4>
			<p><?= $post['Content'] ?></p>
		<?php endforeach ?>
	</div>
</div>
</body>
</html>