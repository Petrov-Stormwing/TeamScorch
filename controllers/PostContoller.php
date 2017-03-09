<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/models/Post.php';

Class PostController
{
	protected $posts = [];
	protected $connection;

	public function __construct(PDO $connection)
	{
		$this->connection = $connection;
	}

    public function getPosts()
    {
        return $this->posts;
    }

    public function addPost(Post $post)
    {
        $this->posts[] = $post;

        return $this;
    }

	public function getPostById($id)
    {
        $post = new Post($this->connection);
        // $postDetails = $this->connection->MSelectOnly('Posts', '*', 'WHERE ID = ' . $id);
        return $post->getPostById($id);
    }

	public function getAllPosts()
	{
		$data = $this->connection->MSelectList('Posts', '*', 'ORDER BY ID DESC');
		foreach ($data as $postData) {
			$postIt = $this->getPostById($postData['ID']);
			$this->addPost($postIt);
		}
		return $this->getPosts();
	}

	public function addPostToDb($title, $content, $authorId)
	{
		$post = new Post($this->connection);

		$addedPost = $post->addPostToDb($title, $content, $authorId);
		
		if (!empty($addedPost)) {
			header('Location: '. '../welcome.php');
		} else {
			throw new Exception("Post was not added!");
		}
	}

	public function editPost($id, $title, $content)
	{
		$post = new Post($this->connection);
		$post->getPostById($id);
		$editedPost = $post->editPost($id, $title, $content);

		if (!empty($editedPost)) {
			header('Location: '. '../welcome.php');
		} else {
			throw new Exception("Post was not edited!");
		}
	}

	public function deletePost(Post $post)
	{
		$deletedPost = $post->deletePost($post->getId());

		if (!empty($deletedPost)) {
			header('Location: '. '../welcome.php');
		} else {
			throw new Exception("Post was not deleted!");
		}
	}


}