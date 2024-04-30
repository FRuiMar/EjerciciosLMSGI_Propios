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