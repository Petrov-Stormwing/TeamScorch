<?php require 'partials/head.php' ?>
	<h1>My Blog</h1>

	<div class="col-md-6">
		<h3>Login /не работи все още/</h3>
		<form method="post" action="users">
			<label for="email">Email:</label>
			<input type="text" name="email" class="form-control" id="email" placeholder="email" required>
			<label for="password">Password:</label>
			<input type="password" name="password" class="form-control" id="password" placeholder="password" required>
			<input type="submit" name="login" class="btn btn-info">
		</form>
	</div>
	<div class="col-md-6">
		<h3>Register</h3>
		<form method="post" action="users">
			<label for="name">Name:</label>
			<input type="text" name="name" class="form-control" id="name" placeholder="name" required>
			<label for="email">Email:</label>
			<input type="text" name="email" class="form-control" id="email" placeholder="email" required>
			<label for="password">Password:</label>
			<input type="password" name="password" class="form-control" id="password" placeholder="password" required>
			<input type="submit" name="register" class="btn btn-info">
		</form>
	</div>
<?php require 'partials/footer.php' ?>