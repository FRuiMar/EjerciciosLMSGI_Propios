<Ejercicios>

<Ejercicio01>{
for $superheroe in doc('superheroes1-6.xml')/marvel/superheroe
where ends-with($superheroe/@nombre, 'a')
return <superheroe>{ data($superheroe/@nombre) }</superheroe>
} </Ejercicio01>


<Ejercicio02>{
for $superheroe in doc('superheroes1-6.xml')/marvel/superheroe
where contains($superheroe/@poderes, 'fuerza')
return <superheroe>
            <nombre>{ data($superheroe/@nombre) }</nombre>
            <poder> {data($superheroe/@poderes) }</poder>
        </superheroe>
} </Ejercicio02>



<Ejercicio03>{
for $superheroe in doc('superheroes1-6.xml')/marvel/superheroe
where contains($superheroe/@poderes, 'fuerza')and contains($superheroe/@amigos, "Iron Man")
return <superheroe>
            <nombre>{data($superheroe/@nombre) }</nombre>
            <poder> {data($superheroe/@poderes) }</poder>
        </superheroe>
} </Ejercicio03>


<Ejercicio04>{
for $superheroe in doc('superheroes1-6.xml')/marvel/superheroe
where contains((fn:lower-case($superheroe/@poderes)), 'fuerza')and contains((fn:lower-case($superheroe/@amigos)), "iron man")
return <superheroe>
            <nombre>{data($superheroe/@nombre) }</nombre>
            <poder> {data($superheroe/@poderes) }</poder>
        </superheroe>
} </Ejercicio04>

  <!-- el for es un bucle normal, y let lo utilizo para definir variables, 
  solo que al indicarle directamente el nodo la variable irá tomando los 
  valores según se pase por los diferentes nodos-->
  <!-- El mayor problema es que al usar for, la variable obtiene un solo valor cada vez, 
  con lo que al usar el avg, aparece la media de cada uno de los valores por separado, media de 6..  es 6.., media de 8 es 8... etc. 
  pero al pasarle directamente el nodo, se crea una especie de lista, o secuencia de elementos a los cuales al pasarle
  el avg, sí dan la información correcta de la media de todos 8, 7, 6, 6, 6 , 6  media 6.5 -->
<Ejercicio05>La media de todos los poderes es: " { 
let $superheroe := doc('superheroes1-6.xml')/marvel/superheroe
return avg($superheroe/@nivel)
} "</Ejercicio05>


<Ejercicio06>{
<superheroes>{
  for $superheroe in doc('superheroes1-6.xml')/marvel/superheroe
  return
    <superheroe>
      <nombre>{data($superheroe/@nombre)}</nombre>
      <poderes>{data($superheroe/@poderes)}</poderes>
      <amigos>{data($superheroe/@amigos)}</amigos>
      <nivel>{data($superheroe/@nivel)}</nivel>
    </superheroe>
}</superheroes>
} </Ejercicio06>

</Ejercicios>