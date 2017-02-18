<?php
session_start();
require 'functions.php';

$connection = new MysqlPDO('mysql:host=localhost;dbname=TeamScorch;charset=utf8;', 'TeamScorch', 'softuni');