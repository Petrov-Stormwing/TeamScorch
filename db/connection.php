<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
require 'MysqlPDO.php';

try {
    $connection = new MysqlPDO('mysql:host=localhost; dbname=teamscorch; charset=utf8;', 'root', '');
} catch(PDOException $e) {
    echo $e->getMessage();
}






//$connection = new MysqlPDO('mysql:host=localhost; dbname=teamscorch; charset=utf8;', 'TeamScorch', 'softuni');