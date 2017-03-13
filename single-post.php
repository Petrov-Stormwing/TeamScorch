<?php
require_once 'db/connection.php';
require_once 'controllers/PostContoller.php';
require 'controllers/UserController.php';


$postcontroller = new PostController($connection);
$userController = new UserController($connection);
$allPosts = $postcontroller->getAllPosts();
$post = $postcontroller->getPostById((int)$_GET['id']);

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
<?php //foreach ($allPosts as $post): ?>
    <h4><?= $post->getTitle() . " - " . $post->getDate(); ?></h4>
    <p><?= $post->getContent(); ?></p>
    <?php if ($_SESSION['user']['AccessLevel'] == 1): ?>
        <form method="post">
            <input type="hidden" name="id" value="<?= $post->getID(); ?>">
            <input type="submit" class="btn btn-warning" name="edit" value="Edit">
            <input type="submit" class="btn btn-danger" name="delete" value="Delete">
        </form>
    <?php endif ?>
    <hr>
<!--    --><?php //break; ?>
<?php //endforeach ?>
    </div>

</body>
