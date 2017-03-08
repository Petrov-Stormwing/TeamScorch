<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/models/Post.php';

Class PostController
{
	protected $connection;

	public function __construct(PDO $connection)
	{
		$this->connection = $connection;
	}

	// public function getPostById($id)
 //    {
 //        return $this->connection->MSelectOnly('Posts', '*', 'WHERE ID = ' . $id);
 //    }

	public function getAllPosts()
	{
		return $this->connection->MSelectList('Posts', '*', 'ORDER BY ID DESC');
	}

	public function addPost()
	{
		$lastId = $this->connection->MSelectOnly('Posts', 'ID', 'ORDER BY ID DESC');
		if (empty($lastId)) {
			$id = 1;
		} else {
			$id = $lastId['ID']++;
		}
		$post = new Post($id, $_POST['title'], $_POST['blogText'], $_SESSION['user']['ID'], $this->connection);

		$addedPost = $post->addPostToDb();
		
		if (!empty($addedPost)) {
			header('Location: '. '../welcome.php');
		} else {
			throw new Exception("Post was not added!");
		}
	}

	public function deletePost(Post $post)
	{
		
	}


}