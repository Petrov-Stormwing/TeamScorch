<?php require 'partials/head.php'; ?>
	<h1>Users</h1>
	<ul>
		<?php foreach ($users as $user): ?>
			<li>
				<?= $user->Name; ?>
			</li>
		<?php endforeach ?>
	</ul>
<?php require 'partials/footer.php'; ?>