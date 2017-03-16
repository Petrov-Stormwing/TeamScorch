<?php

interface IUserController
{
    public function getUsers();

    public function addUser(User $user);

    public function getUserById($id);

    public function getAllUsers();

    public function addUserToDb($name, $email, $password);

    public function loginUser($email, $password);

    public function logout();

    public function makeAdmin($userIds);
}
