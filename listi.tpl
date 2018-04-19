<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Aukaverkefni</title>
	<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
<div class="container">
	<table>
		<tr>
			<th>Skráningarnúmer</th>
			<th>Verksmiðjunúmer</th>
			<th></th>
		</tr>
		%for x in okutaeki:
		<tr>
			<td>{{x[0]}}</td>
			<td>{{x[2]}}</td>
			<td><a href="/meira/{{x[0]}}">Meira</a></td>
		</tr>
		%end
	</table>
	<a href="/">Til baka</a>
</body>
</html>