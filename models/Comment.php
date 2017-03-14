<?php

Class Comment
{
	protected $id;
	protected $content;
	protected $userId;
	protected $postId;
	protected $connection;

	public function __construct($content, $userId, $postId, $connection)
	{
		$this->content = $content;
		$this->userId = $userId;
		$this->postId = $postId;
		$this->connection = $connection;
	}

    /**
     * Gets the value of id.
     *
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Sets the value of id.
     *
     * @param mixed $id the id
     *
     * @return self
     */
    protected function setId($id)
    {
        $this->id = $id;

        return $this;
    }

    /**
     * Gets the value of content.
     *
     * @return mixed
     */
    public function getContent()
    {
        return $this->content;
    }

    /**
     * Sets the value of content.
     *
     * @param mixed $content the content
     *
     * @return self
     */
    protected function setContent($content)
    {
        $this->content = $content;

        return $this;
    }

    /**
     * Gets the value of userId.
     *
     * @return mixed
     */
    public function getUserId()
    {
        return $this->userId;
    }

    /**
     * Sets the value of userId.
     *
     * @param mixed $userId the user id
     *
     * @return self
     */
    protected function setUserId($userId)
    {
        $this->userId = $userId;

        return $this;
    }

    /**
     * Gets the value of postId.
     *
     * @return mixed
     */
    public function getPostId()
    {
        return $this->postId;
    }

    /**
     * Sets the value of postId.
     *
     * @param mixed $postId the post id
     *
     * @return self
     */
    protected function setPostId($postId)
    {
        $this->postId = $postId;

        return $this;
    }

    public function addCommentToDb()
    {
    	$this->connection->MInsert('Comments', '(Content, UserID, PostID) VALUES ("' . $this->getContent() . '", "' . $this->getUserId() . '", "' . $this->getPostId() . '")');
    	return $this;
    }

    public function getCommentById($id)
    {
        $post = $this->connection->MSelectOnly('Posts', '*', 'WHERE ID = ' . $id);
        $this->setId($post['ID']);
        $this->setContent($post['Content']);
        return $this;
    }


    public function deleteComment($id)
    {
        $this->connection->MDelete('Comments', 'WHERE ID = "' . $id . '"');
        return true;
    }
}