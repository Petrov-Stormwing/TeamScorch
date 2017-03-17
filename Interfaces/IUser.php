<?php

Interface IUser
{
    public function getId();

    public function getName();

    public function getPassword();

    public function getEmail();

    public function getAccessLevel();

    public function getAllUsers();

    public function getUserById($id);

    public function getUsersByEmail($email);

    public function addUser($name, $email, $password);

    public function login($email, $password);

    public function editUser($id, $name, $email);
}