<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output method="html" encoding="iso-8859-1"/>

  <xsl:template match="/partidoBaloncesto">
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
        <title><xsl:value-of select="@nombre"/></title>
      <style type="text/css">
          <xsl:call-template name="css"/>
      </style>
    </head>
    <body>
        <div style="width: 1000px; margin: 0 auto;">
           <h1 align="center">Baloncesto: Baloncesto Lucena 2 - Unicaja Baloncesto</h1>
           <table border="1" width="100%">
              <tr>
                 <th>Equipo</th>
                 <th>Jugador</th>
                 <th>Dorsal</th>
                 <th>Apodo</th>
                 <th>Puntos</th>
                 <th>Rebotes</th>
                 <th>Asistencias</th>
              </tr>
              <tr bgcolor="#d8e7ff">
                 <td><img src="recursos/cbcLucena.png"></td>
                 <td>Antonio</td>
                 <td>23</td>
                 <td>Ara�a</td>
                 <td>7</td>
                 <td>4</td>
                 <td>2</td>
              </tr>
              <tr>
                 <td><img src="recursos/cbcLucena.png"></td>
                 <td>Esther</td>
                 <td>51</td>
                 <td>M�quina</td>
                 <td>9</td>
                 <td>6</td>
                 <td>6</td>
              </tr>
              <tr bgcolor="#d8e7ff">
                 <td><img src="recursos/cbcLucena.png"></td>
                 <td>Jaime</td>
                 <td>32</td>
                 <td>Arquero</td>
                 <td>13</td>
                 <td>1</td>
                 <td>7</td>
              </tr>
              <tr>
                 <td><img src="recursos/cbcLucena.png"></td>
                 <td>Juan</td>
                 <td>8</td>
                 <td>SuperJuan</td>
                 <td>14</td>
                 <td>3</td>
                 <td>8</td>
              </tr>
              <tr bgcolor="#d8e7ff">
                 <td><img src="recursos/cbcLucena.png"></td>
                 <td>Tania</td>
                 <td>87</td>
                 <td>WonderWoman</td>
                 <td>18</td>
                 <td>5</td>
                 <td>2</td>
              </tr>
              <tr bgcolor="#d8ffcc">
                 <td><img src="recursos/Unicaja_CB.png"></td>
                 <td>Ainhoa</td>
                 <td>61</td>
                 <td>Cara de ni�a</td>
                 <td>15</td>
                 <td>4</td>
                 <td>3</td>
              </tr>
              <tr>
                 <td><img src="recursos/Unicaja_CB.png"></td>
                 <td>Chicho</td>
                 <td>4</td>
                 <td>Capi</td>
                 <td>14</td>
                 <td>6</td>
                 <td>4</td>
              </tr>
              <tr bgcolor="#d8ffcc">
                 <td><img src="recursos/Unicaja_CB.png"></td>
                 <td>Luis</td>
                 <td>74</td>
                 <td>Ca�onero</td>
                 <td>12</td>
                 <td>4</td>
                 <td>5</td>
              </tr>
              <tr>
                 <td><img src="recursos/Unicaja_CB.png"></td>
                 <td>Mar</td>
                 <td>85</td>
                 <td>Muralla</td>
                 <td>8</td>
                 <td>9</td>
                 <td>3</td>
              </tr>
              <tr bgcolor="#d8ffcc">
                 <td><img src="recursos/Unicaja_CB.png"></td>
                 <td>Silvia</td>
                 <td>17</td>
                 <td>8 brazos</td>
                 <td>8</td>
                 <td>2</td>
                 <td>7</td>
              </tr>
           </table>
           <p></p>
           <p></p>
           <table width="100%" style="background: url('recursos/pista.jpg') no-repeat;" id="tablaCancha">
              <tr>
                 <td></td>
                 <td><img src="recursos/cbcLucena.png">Juan
                 </td>
                 <td></td>
                 <td></td>
                 <td></td>
                 <td></td>
                 <td><img src="recursos/Unicaja_CB.png">Silvia
                 </td>
                 <td></td>
                 <td></td>
                 <td></td>
                 <tr>
                    <td><img src="recursos/cbcLucena.png">Tania
                    </td>
                    <td></td>
                    <td></td>
                    <td><img src="recursos/cbcLucena.png">Antonio
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <tr>
                       <td></td>
                       <td></td>
                       <td></td>
                       <td></td>
                       <td></td>
                       <td><img src="recursos/Unicaja_CB.png">Mar
                       </td>
                       <td></td>
                       <td></td>
                       <td></td>
                       <td><img src="recursos/Unicaja_CB.png">Ainhoa
                       </td>
                       <tr>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td><img src="recursos/cbcLucena.png">Jaime
                          </td>
                          <td></td>
                          <td></td>
                          <td><img src="recursos/Unicaja_CB.png">Luis
                          </td>
                          <td></td>
                          <td></td>
                          <tr>
                             <td></td>
                             <td></td>
                             <td><img src="recursos/cbcLucena.png">Esther
                             </td>
                             <td></td>
                             <td></td>
                             <td></td>
                             <td></td>
                             <td></td>
                             <td><img src="recursos/Unicaja_CB.png">Chicho
                             </td>
                             <td></td>
                          </tr>
                       </tr>
                    </tr>
                 </tr>
              </tr>
           </table>
           <p></p>
           <p></p>
           <table align="center" border="1" width="50%">
              <tr>
                 <th>Tiempo</th>
                 <th>Jugador</th>
                 <th>Apodo</th>
                 <th>Descripcion</th>
                 <th>Icono</th>
              </tr>
              <tr>
                 <td>0:12</td>
                 <td>Jaime</td>
                 <td>Arquero</td>
                 <td>Entrada a canasta y falta personal</td>
                 <td><img src="recursos/canasta.jpg"></td>
              </tr>
              <tr>
                 <td>0:33</td>
                 <td>Ainhoa</td>
                 <td>Cara de ni�a</td>
                 <td>Triple</td>
                 <td><img src="recursos/canasta.jpg"></td>
              </tr>
              <tr>
                 <td>0:58</td>
                 <td>Antonio</td>
                 <td>Ara�a</td>
                 <td>Falta personal</td>
                 <td><img src="recursos/falta.jpg"></td>
              </tr>
              <tr>
                 <td>1:00</td>
                 <td>Chicho</td>
                 <td>Capi</td>
                 <td>Dos tiros libres anotados</td>
                 <td><img src="recursos/canasta.jpg"></td>
              </tr>
              <tr>
                 <td>1:18</td>
                 <td>Mar</td>
                 <td>Muralla</td>
                 <td>Falta personal</td>
                 <td><img src="recursos/falta.jpg"></td>
              </tr>
              <tr>
                 <td>2:20</td>
                 <td>Esther</td>
                 <td>M�quina</td>
                 <td>Triple</td>
                 <td><img src="recursos/canasta.jpg"></td>
              </tr>
              <tr>
                 <td>2:33</td>
                 <td>Juan</td>
                 <td>SuperJuan</td>
                 <td>2 puntos</td>
                 <td><img src="recursos/canasta.jpg"></td>
              </tr>
           </table>
        </div>
     </body>
  </html>
  </xsl:template>

  <xsl:template match="equipo"> 
   <xsl:for-each select="jugador">
    <xsl:sort select="@nombre"/>
        <tr>
            <xsl:if test ="position() mod 2 = 1">
                <xsl:choose>
                    <xsl:when test="../@tipo = 'Local'">
                    </xsl:when>
                </xsl:choose>
        </tr>
   </xsl:for-each>
  </xsl:template>

  <xsl:template name="css">

        body {
        font-family: Arial;
        font-size: 11px;
        }
        
        table img {
            width: 40px;
        }
        
        th {
            background: #1e3356;
            color: #FFFFFF;
        }
        
        #tablaCancha {
            color: #eff4fc;
        }
        
        ol, ul
        {
        margin-top: 10px;
        margin-left: 0px;
        }
        
        #menu li
        {
        margin-left: 0px;
        display: inline;
        list-style-type: none;
        padding: 10px 50px;
        }
        
        .noticia {
        /* border: #000 solid 1px; */
        padding: 10px 5px;
        float: left; 
        width: 338px;
        }
        
        .noticia img {
        width: 338px;
        }
        
        .noticiaDobleAncho {
        /* border: #000 solid 1px; */
        padding: 10px 5px;
        float: left; 
        width: 690px;
        }
        
        .noticiaDobleAncho img {
        width: 690px;
        }
        
        .fechaNoticia {
        color: #A3A34B;
        }
        
        .comentariosNoticia {
        color: #A3A34B;
        padding-left: 20px;
        }
        
        .divPublicidad {
        /* border: #000 solid 1px; */
        padding: 10px 5px;
        float: right; 
        width: 280px;                   
        }
        
        
        .divPublicidad img {
        width: 200px;
        }




  </xsl:template>

</xsl:stylesheet>