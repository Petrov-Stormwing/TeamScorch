<?php
require_once '../db/connection.php';
require_once '../models/Post.php';

if (!empty($_POST['addPost'])) {
	$lastId = $connection->MSelectOnly('Posts', 'ID', 'ORDER BY ID DESC');
	if (empty($lastId)) {
		$id = 1;
	} else {
		$id = $lastId['ID']++;
	}
	$post = new Post($id, $_POST['title'], $_POST['blogText'], $_SESSION['user']['ID'], $connection);

	$addedPost = $post->addPostToDb();
	
	if (!empty($addedPost)) {
		header('Location: '. '../welcome.php');
	} else {
		throw new Exception("Post was not added!");
	}
}