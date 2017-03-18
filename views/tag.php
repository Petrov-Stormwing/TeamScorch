<?php

if($_GET['id']){

    require_once '../db/connection.php';
    require_once '../controllers/PostContoller.php';
    require_once '../controllers/UserController.php';
    require_once '../models/Tag.php';
    require_once '../models/SearchByTag.php';

//    var_dump($_GET['id']);

    $searchByTag = new \models\SearchByTag($_GET['id'] ,$connection);
    $userController = new UserController($connection);


    if (!empty($_GET['logout'])) {
        $userController->logout();
    }

    if (empty($_SESSION['user'])) {
        $_SESSION['error'] = 'Sorry, but you dont have access to this page or you are not register user';
        header('Location: '. $_SERVER['SERVER_NAME']);
    }

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
    <?php if ($_SESSION['user']['AccessLevel'] == 1): ?>
    <?php endif ?>
    <div class="col-md-12">
        <h3>Posts</h3>

        <?php
        foreach ($searchByTag->getPostsByTag() as $post){
            $href = "href='single-post.php?id=".$post['ID'] . "'";
            echo '<h4><a ' . $href .'>'. $post['Title'] .'</a></h4>';

        }
        ?>


    </div>
</div>
</body>
</html>



