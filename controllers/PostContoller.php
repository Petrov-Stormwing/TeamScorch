<?php
//require_once $_SERVER['DOCUMENT_ROOT'] . '/models/Post.php';
//require_once $_SERVER['DOCUMENT_ROOT'] . '/models/Tag.php';
//require_once $_SERVER['DOCUMENT_ROOT'] . '/models/Comment.php';

require_once(__DIR__. '/../models/Post.php');
require_once(__DIR__. '/../models/Tag.php');
require_once(__DIR__. '/../models/Comment.php');
require_once(__DIR__. '/../Interfaces/IPostController.php');



Class PostController implements IPostController
{
	protected $posts = [];
	protected $comments = [];
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

    public function getComments()
    {
        return $this->comments;
    }

    public function addComment(Comment $comment)
    {
        $this->comments[] = $comment;

        return $this;
    }


	public function getPostById($id)
    {
        $post = new Post($this->connection);
        return $post->getPostById($id);
    }

//    public function getCommentById($id)
//    {
//        $comment = new Comment($this->connection);
//        return $comment->getCommentById($id);
//    }

	public function getAllPosts()
	{
		$data = $this->connection->MSelectList('Posts', '*', 'WHERE Deleted != 1 ORDER BY ID DESC');
		foreach ($data as $postData) {
			$postIt = $this->getPostById($postData['ID']);
			$this->addPost($postIt);
		}
		return $this->getPosts();
	}

	public function addPostToDb($title, $content, $authorId, $tags)
	{
		$post = new Post($this->connection);
		$addedPostId = $post->addPostToDb($title, $content, $authorId);
		
		foreach ($tags as $tag) {
			$tag = new Tag(trim($tag), $addedPostId, $this->connection);
			$tag->addTagToDb();
		}

		if (!empty($addedPostId)) {
			header('Location: '. '../views/welcome.php');
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
			header('Location: '. '../views/welcome.php');
		} else {
			throw new Exception("Post was not edited!");
		}
	}

	public function deletePost(Post $post)
	{
		$deletedPost = $post->deletePost($post->getId());

		if (!empty($deletedPost)) {
			header('Location: '. '../views/welcome.php');
		} else {
			throw new Exception("Post was not deleted!");
		}
	}

	public function getCommentsByPostId(Post $post)
	{
		$data = $this->connection->MSelectList(
			'Comments AS C',
			'C.ID, C.Content, U.Name',
			'JOIN Users AS U ON U.ID = C.UserID
			WHERE C.PostID = "' . $post->getId() . '" AND C.Deleted != 1
			ORDER BY ID DESC'
		);

		return $data;
	}

    public function getCommentById($id)
    {
        $commentFromDb = $this->connection->MSelectOnly('Comments', '*', 'WHERE ID = ' . $id);
        $comment = new Comment($commentFromDb['Content'], $commentFromDb['UserID'], $commentFromDb['PostID'], $this->connection);
        $comment->setId($commentFromDb['ID']);
        return $comment;
    }

    public function deleteComment(Comment $postComment, $postID)
    {
        $deleteComment = $postComment->deleteComment($postComment->getId());

        if (!empty($deleteComment)) {
            header('Location: '. '../views/single-post.php?id=' . $postID);
        } else {
            throw new Exception("Comment was not deleted!");
        }
    }
}