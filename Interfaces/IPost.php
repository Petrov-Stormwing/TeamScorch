<?php

Interface IPost
{
    public function getId();

    public function getAuthor();

    public function getContent();

    public function getTitle();

    public function getDate();

    public function getTags();

    public function addTag($tag);

    public function getPostById($id);

    public function addPostToDb($title, $content, $authorId);

    public function editPost($postId, $title, $content);

    public function deletePost($postId);

    public function getTagsByPostId($postId);
}