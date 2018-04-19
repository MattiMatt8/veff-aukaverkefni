<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Aukaverkefni</title>
	<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
<div class="container">
	<form method="post" action="/uppfaera" accept-charset="ISO-8859-1">
		<input value={{bill[0]}} name="skranum" type="hidden">
		<div class="b b2">
			<h3>Skráningarnúmer</h3>
			<p><input value="{{bill[0]}}" name="skraningarnumer" type="text" required /></p>
		</div>
		<div class="b b2">
			<h3>Tegund</h3>
			<p><input value="{{bill[1]}}" name="tegund" type="text" required /></p>
		</div>
		<div class="b b2">
			<h3>Verksmiðjunúmer</h3>
			<p><input value="{{bill[2]}}" name="verksmidjunumer" type="text" required /></p>
		</div>
		<div class="b b2">
			<h3>Skráningardagur</h3>
			<p><input value="{{bill[3]}}" name="skraningardagur" type="date" required /></p>
		</div>
		<div class="b b2">
			<h3>CO<sub>2</sub> losun</h3>
			<p><input value="{{bill[4]}}" name="co2" type="text" pattern="^[0-9]*$" required /></p>
		</div>
		<div class="b b2">
			<h3>Þyngd</h3>
			<p><input value="{{bill[5]}}" name="þyngd" type="text" pattern="^[0-9]*$" required /></p>
		</div>
		<div class="b b2">
			<h3>Næsta skoðun</h3>
			<p><input value="{{bill[6]}}" name="skodun" type="date" required /></p>
		</div>
		<div class="b b2">
			<h3>Staða</h3>
			<p><input value="{{bill[7]}}" name="stada" type="text" required /></p>
		</div>
		<div class="s2">
			<input value="Uppfæra" type="submit" />
		</div>
	</form>
	<a href="/">Til baka</a>
</body>
</html>