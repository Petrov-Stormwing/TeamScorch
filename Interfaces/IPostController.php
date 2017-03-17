<?php

Interface IPostController
{
    public function getPosts();

    public function addPost(Post $post);

    public function getComments();

    public function addComment(Comment $comment);

	public function getPostById($id);

	public function getAllPosts();

	public function addPostToDb($title, $content, $authorId, $tags);

	public function editPost($id, $title, $content);

	public function deletePost(Post $post);

	public function getCommentsByPostId(Post $post);

    public function getCommentById($id);

    public function deleteComment(Comment $postComment, $postID);
}