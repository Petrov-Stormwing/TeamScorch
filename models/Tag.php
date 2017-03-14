<?php

Class Tag
{
	protected $id;
	protected $name;
	protected $postId;
	protected $connection;

	public function __construct($name, $postId, $connection)
	{
		$this->name = $name;
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
     * Gets the value of name.
     *
     * @return mixed
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Sets the value of name.
     *
     * @param mixed $name the name
     *
     * @return self
     */
    protected function setName($name)
    {
        $this->name = $name;

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

    public function addTagToDb()
    {
    	$this->connection->MInsert('Tags', '(Name, PostID) VALUES ("' . $this->getName() . '", "' . $this->getPostId() . '")');
    	return $this;
    }
}