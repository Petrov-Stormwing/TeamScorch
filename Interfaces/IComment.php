<?php

Interface IComment
{
    public function getId();

    public function setId($id);

    public function getContent();

    public function getUserId();

    public function getPostId();

    public function addCommentToDb();

    public function getCommentById($id);

    public function deleteComment($id);
}