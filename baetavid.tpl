<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Aukaverkefni</title>
	<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
<div class="container">
	<form method="post" action="/baetavid" accept-charset="ISO-8859-1">
		<div class="b b2">
			<h3>Skráningarnúmer</h3>
			<p><input name="skraningarnumer" type="text" required autofocus /></p>
		</div>
		<div class="b b2">
			<h3>Tegund</h3>
			<p><input name="tegund" type="text" required /></p>
		</div>
		<div class="b b2">
			<h3>Verksmiðjunúmer</h3>
			<p><input name="verksmidjunumer" type="text" required /></p>
		</div>
		<div class="b b2">
			<h3>Skráningardagur</h3>
			<p><input name="skraningardagur" type="date" required /></p>
		</div>
		<div class="b b2">
			<h3>CO<sub>2</sub> losun</h3>
			<p><input name="co2" type="text" pattern="^[0-9]*$" required /></p>
		</div>
		<div class="b b2">
			<h3>Þyngd</h3>
			<p><input name="þyngd" type="text" pattern="^[0-9]*$" required /></p>
		</div>
		<div class="b b2">
			<h3>Skoðun</h3>
			<p><input name="skodun" type="date" required /></p>
		</div>
		<div class="b b2">
			<h3>Staða</h3>
			<p><input name="stada" type="text" required /></p>
		</div>
		<div class="s2">
			<input value="Bæta við" type="submit" />
		</div>
	</form>
	<a href="/">Til baka</a>
</body>
</html>