<?php


require_once ($_SERVER['DOCUMENT_ROOT'] . '/TeamScorch/db/connection.php');
require_once ($_SERVER['DOCUMENT_ROOT'] . '/TeamScorch/controllers/UserController.php');





$usercontroller = new UserController($connection);

if (!empty($_GET['logout'])) {
    $usercontroller->logout();
}



if (!empty($_POST['editprofile'])) {
    $usercontroller->editUser($_GET['id'], $_POST['name'], $_POST['email']);
}


$userToEdit = $usercontroller->getUserById($_SESSION['user']['ID']);

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
            <li class="pull-right"><a href="user-profile.php"><?= $_SESSION['user']['Name'] . " " . (($_SESSION['user']['AccessLevel'] == 1) ? '(админ)' : '') ?></a></li>
        </ul>
    </div>
</nav>
    <div class="col-md-6">
        <h2>Edit Profile</h2>
        <form method="post" action="">
            <input type="text" name="name" class="form-control" value="<?= $userToEdit->getName(); ?>" placeholder="Enter new username" required>
            <input type="text" name="email" class="form-control" value="<?= $userToEdit->getEmail(); ?>" placeholder="Enter new Email" required>
            <input type="submit" name="editprofile" class="btn btn-primary" value="Edit my Profile">
        </form>
    <div>
</body>
</html>