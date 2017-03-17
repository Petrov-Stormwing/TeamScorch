<?php

Interface ITag
{
    public function getId();

    public function getName();

    public function getPostId();

    public function addTagToDb();
}