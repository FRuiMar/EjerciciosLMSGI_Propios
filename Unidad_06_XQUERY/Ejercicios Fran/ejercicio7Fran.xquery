<html>
<head>
  <title>Superheroes</title>
</head>
<body>
{
  for $superheroe in doc('superheroes7.xml')/marvel/superheroe
  return
    <table border="1">
      <tr><th colspan="2">Superhéroe: {data($superheroe/@nombre)}</th></tr>
      <tr><td>Poderes:</td><td>{data($superheroe/@poderes)}</td></tr>
      <tr><td>Amigos:</td><td>{data($superheroe/@amigos)}</td></tr>
      <tr><td>Nivel:</td><td>{data($superheroe/@nivel)}</td></tr>
    </table>
    
}
</body>
</html>