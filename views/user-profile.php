<?php
require_once '../db/connection.php';
require_once '../controllers/PostContoller.php';
require_once '../controllers/UserController.php';
require_once '../models/User.php';



$userController = new UserController($connection);

if (!empty($_GET['logout'])) {
    $userController->logout();
}



if (!empty($_POST['editprofile'])) {
    header('Location: '. 'user-profile-edit.php?id=' . $_POST['id']);
}


$userLogged = $userController->getUserById($_SESSION['user']['ID']);

//var_dump($userLogged->getId());

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
            <li class="pull-right"><a href="user-profile.php"><?= $userLogged->getName() . " " . (($userLogged->getAccessLevel() == 1) ? '(admin)' : '') ?></a></li>
        </ul>
    </div>
</nav>
    <div class="col-md-6">
        <h2>Profile</h2>
            <table>
                <col width="80">
                <col width="130">
                <tr>
                    <td>User:</td><td><?= $userLogged->getName()  ?></td>
                </tr>
                <tr>
                    <td>Email:</td><td><?= $userLogged->getEmail()  ?></td>
                </tr>
                <tr>
                    <td>Status:</td><td><?= (($userLogged->getAccessLevel() == 1) ? 'admin' : 'reader') ?></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                <td><form method="post">
                        <input type="hidden" name="id" value="<?= $userLogged->getId(); ?>">
                        <input type="submit" class="btn btn-warning" name="editprofile" value="Edit">
                     </form></td>
                </tr>
            </table>
    <div>

</body>
</html>
