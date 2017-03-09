<?php

Class Post
{
	protected $id;
	protected $title;
	protected $content;
	protected $authorId;
    protected $date;

	protected $connection;

	public function __construct(PDO $connection)
	{
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
     * Gets the value of author.
     *
     * @return mixed
     */
    public function getAuthor()
    {
        return $this->author;
    }

    /**
     * Sets the value of author.
     *
     * @param mixed $authorId the author
     *
     * @return self
     */
    protected function setAuthor($authorId)
    {
        $this->author = $authorId;

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
     * Gets the value of title.
     *
     * @return mixed
     */
    public function getTitle()
    {
        return $this->title;
    }

    /**
     * Sets the value of title.
     *
     * @param mixed $title the title
     *
     * @return self
     */
    protected function setTitle($title)
    {
        $this->title = $title;

        return $this;
    }

    /**
     * Gets the value of date.
     *
     * @return mixed
     */
    public function getDate()
    {
        return $this->date;
        // return date_format($this->date, 'd-m-Y H:i:s');
    }

    /**
     * Sets the value of date.
     *
     * @param mixed $date the date
     *
     * @return self
     */
    protected function setDate($date)
    {
        $this->date = $date;

        return $this;
    }

    public function getPostById($id)
    {
        $post = $this->connection->MSelectOnly('Posts', '*', 'WHERE ID = ' . $id);
        $this->setId($post['ID']);
        $this->setTitle($post['Title']);
        $this->setContent($post['Content']);
        $this->setAuthor($post['UserID']);
        $this->setDate($post['DateCreated']);
        return $this;
    }

    public function addPostToDb($title, $content, $authorId)
    {
        $date = date('Y-m-d H:i:s');
    	$this->connection->MInsert('Posts', '(Title, Content, UserID, DateCreated) VALUES ("' . $title . '", "' . $content . '", "' . $authorId . '", "' . $date . '")');
    	return $this;
    }

    public function editPost($postId, $title, $content)
    {
        $this->connection->MUpdate('Posts', 'Title = "' . $title . '", Content = "' . $content . '", UserID = "' . $this->getAuthor() . '"', 'WHERE ID = "' . $postId . '"');
        return $this;
    }

    public function deletePost($postId)
    {
        $this->connection->MDelete('Posts', 'WHERE ID = "' . $postId . '"');
        return true;
    }
}