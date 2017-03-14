<?php
require_once '../db/connection.php';
require_once '../controllers/PostContoller.php';
require_once '../controllers/UserController.php';
require_once '../models/Comment.php';

$postcontroller = new PostController($connection);
$userController = new UserController($connection);
$allPosts = $postcontroller->getAllPosts();
$post = $postcontroller->getPostById((int)$_GET['id']);


if (!empty($_GET['logout'])) {
    $userController->logout();
}

if (empty($_SESSION['user'])) {
    $_SESSION['error'] = 'Sorry, but you dont have access to this page or you are not register user';
    header('Location: '. $_SERVER['SERVER_NAME']);
}

if (!empty($_POST['edit'])) {
    header('Location: '. 'edit.php?id=' . $_POST['id']);
}

if (!empty($_POST['delete'])) {
    $commentToDelete = $postcontroller->getPostById($_POST['id']);
    $postcontroller->deletePost($commentToDelete);
}
if (!empty($_POST['addComment'])) {
    $comment = new Comment($_POST['comment'], $_SESSION['user']['ID'], $post->getId(), $connection);
    $comment->addCommentToDb();
}

if (!empty($_POST['deleteComment'])) {
    $commentToDelete = $postcontroller->getCommentById($_POST['id']);
    $postcontroller->deleteComment($commentToDelete);
}


$allComments = $postcontroller->getCommentsByPostId($post);

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome to this awesome blog</title>
    <link rel="stylesheet" type="text/css" href="https://bootswatch.com/paper/bootstrap.min.css">
</head>
<body>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">Blog</a>
        </div>
        <ul class="nav navbar-nav">
            <li class="active"><a href="welcome.php">Posts</a></li>
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
    Tags:
    <span class="bg-primary">
        <?php echo implode(", ", $post->getTagsByPostId($post->getId())); ?>
    </span>
    <?php if ($_SESSION['user']['AccessLevel'] == 1): ?>
        <form method="post">
            <input type="hidden" name="id" value="<?= $post->getID(); ?>">
            <input type="submit" class="btn btn-warning" name="edit" value="Edit">
            <input type="submit" class="btn btn-danger" name="delete" value="Delete">
        </form>
    <?php endif ?>
    <h5>Comments:</h5>
    <form method="post">
        <input type="hidden" name="id" value="<?= $post->getID(); ?>">
        <label for="comment">Add new comment:</label>
        <textarea name="comment" class="form-control" id="comment" required></textarea>
        <input type="submit" class="btn btn-primary" name="addComment" value="Add Comment">
    </form>
    <hr>
    <?php foreach ($allComments as $comment): ?>
        <h5><?= $comment['Name']; ?> said:</h5>
        <?= $comment['Content']; ?>
        <?php if ($_SESSION['user']['AccessLevel'] == 1): ?>
            <form method="post">
                <input type="hidden" name="id" value="<?= $comment['ID']; ?>">
<!--                <input type="submit" class="btn btn-warning" name="edit" value="Edit">-->
                <input type="submit" class="btn btn-danger" name="deleteComment" value="Delete">
            </form>
        <?php endif ?>
    <?php endforeach ?>

</div>
</body>