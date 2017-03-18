<?php
/**
 * Created by PhpStorm.
 * User: PcUser
 * Date: 17.3.2017 г.
 * Time: 16:24
 */

namespace models;


use Interfaces\ISearchByTag;

class SearchByTag
{
    protected $id;
    protected $connection;

    public function __construct($id,  $connection)
    {
        $this->id = $id;
        $this->connection = $connection;
    }

    public function getPostsByTag()
    {
        $result = $this->connection->MSelectListByParam('posts', '*' ,"(select PostID from tags where id = ?)", [$this->id]);
        return $result;
    }
}
