<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
require 'functions.php';

try {
    $connection = new MysqlPDO('mysql:host=localhost; dbname=TeamScorch; charset=utf8;', 'TeamScorch', 'softuni');
} catch(PDOException $e) {
    echo $e->getMessage();
}

//$connection = new MysqlPDO('mysql:host=localhost; dbname=teamscorch; charset=utf8;', 'TeamScorch', 'softuni');