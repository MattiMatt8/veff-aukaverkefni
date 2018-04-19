<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Aukaverkefni</title>
	<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
<div class="container">
	<form>
		<div class="b b2">
			<h3>Skráningarnúmer</h3>
			<p><input value="{{bill[0]}}" name="skraningarnumer" type="text" readonly /></p>
		</div>
		<div class="b b2">
			<h3>Tegund</h3>
			<p><input value="{{bill[1]}}" name="tegund" type="text" readonly /></p>
		</div>
		<div class="b b2">
			<h3>Verksmiðjunúmer</h3>
			<p><input value="{{bill[2]}}" name="verksmidjunumer" type="text" readonly /></p>
		</div>
		<div class="b b2">
			<h3>Skráningardagur</h3>
			<p><input value="{{skraDags}}" name="skraningardagur" type="text" readonly /></p>
		</div>
		<div class="b b2">
			<h3>CO<sub>2</sub> losun</h3>
			<p><input value="{{bill[4]}}" name="co2" type="text" readonly /></p>
		</div>
		<div class="b b2">
			<h3>Þyngd</h3>
			<p><input value="{{bill[5]}}" name="þyngd" type="text" readonly /></p>
		</div>
		<div class="b b2">
			<h3>Næsta skoðun</h3>
			<p><input value="{{skodunDags}}" name="skodun" type="text" readonly /></p>
		</div>
		<div class="b b2">
			<h3>Staða</h3>
			<p><input value="{{bill[7]}}" name="stada" type="text" readonly /></p>
		</div>
	</form>
	<a href="/">Til baka</a>
</body>
</html>