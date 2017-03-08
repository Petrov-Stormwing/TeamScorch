<?php

Class Post
{
	protected $id;
	protected $title;
	protected $content;
	protected $authorId;

	protected $connection;

	public function __construct(int $id = 0, string $title = '', string $content = '', int $authorId = 0, PDO $connection)
	{
		$this->id = $id;
		$this->title = $title;
		$this->content = $content;
		$this->author = $authorId;
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

    public static function getPostById($id)
    {
        return self::$connection->MSelectOnlyObject('Posts', '*', 'WHERE ID = ' . $id);
    }

    public function addPostToDb()
    {
    	$this->connection->MInsert('Posts', '(Title, Content, UserID) VALUES ("' . $this->getTitle() . '","' . $this->getContent() . '","' . $this->getAuthor() . '"' . ')');
    	return $this;
    }

    public function editPost($postId, $title, $content)
    {
        $this->connection->MUpdate('Posts', 'Title = "' . $title . '", Content = "' . $content . '", UserID = "' . $getAuthor . '"');
        return $this;
    }

    public function deletePost($postId)
    {
        $this->connection->MDelete('Posts', 'WHERE ID = ' . $postId);
    }
}