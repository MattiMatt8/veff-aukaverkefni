<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Aukaverkefni</title>
	<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
<div class="container">
	<h2>Bíla safn</h2>
	<form method="post" action="/leita">
		<div class="box">
			<input placeholder="Skráningarnúmer" name="skraningarnumer" type="text" required />
			<input value="Leita" type="submit" />
		</div>
	</form>
	<form method="post" action="/breyta">
		<div class="box">
			<input placeholder="Skráningarnúmer" name="skraningarnumer" type="text" required />
			<input value="Breyta" type="submit" />
		</div>
	</form>
	<form method="post" action="/eyda">
		<div class="box">
			<input placeholder="Skráningarnúmer" name="skraningarnumer" type="text" required />
			<input value="Eyða" type="submit" />
		</div>
	</form>
	<a href="/baetavid">Bæta við nýju ökutæki</a>
	<a href="/listi">Öll ökutæki</a>
</body>
</html>