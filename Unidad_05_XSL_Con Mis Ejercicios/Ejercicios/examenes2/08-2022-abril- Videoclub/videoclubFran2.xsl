<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8"/>
    
    <xsl:template match="/videoclub">
        <html>
            <head>
                <title>Videoclub</title>
                <xsl:call-template name="css"/>
            </head>
            <body>
                <h1>Superhéroes de Marvel</h1>
                <table border="1" with="90%">
                    <xsl:call-template name="bucleForFila">
                        <xsl:with-param name="i">1</xsl:with-param>
                    </xsl:call-template>
                </table>
                
                <br/>
                <xsl:call-template name="juegoMasCaro"/>
                <br/>
                <xsl:call-template name="peliculaDuracionMinima"/>
            </body>
        </html>
    </xsl:template>
    
    
    <!-- Encontrar el juego más caro -->
    <xsl:template name="juegoMasCaro">
        <xsl:variable name="maxAlquiler">
            <xsl:for-each select="/videoclub/videojuegos/videoJuego">
                <xsl:sort select="@alquilerDiario" data-type="number" order="descending"/>
                <xsl:if test="position() = 1">
                    <xsl:value-of select="@alquilerDiario"/>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>
        <xsl:value-of select="/videoclub/videojuegos/videoJuego[@alquilerDiario = $maxAlquiler]"/>
    </xsl:template>
    
    <!-- Encontrar la película con la duración más corta -->
    <xsl:template name="peliculaDuracionMinima">
        <xsl:variable name="minDuracion">
            <xsl:for-each select="/videoclub/Peliculas/pelicula">
                <xsl:sort select="@duracionEnMinutos" data-type="number" order="ascending"/>
                <xsl:if test="position() = 1">
                    <xsl:value-of select="@duracionEnMinutos"/>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>
        <xsl:value-of select="/videoclub/Peliculas/pelicula[@duracionEnMinutos = $minDuracion]"/>
    </xsl:template>
    
    
    
    <xsl:template name="bucleForFila">
        <xsl:param name="i"/>
        <xsl:if test="$i &lt;= 5">
            <tr>
                <xsl:call-template name="bucleForColumna">
                    <xsl:with-param name="i"><xsl:value-of select="$i"/></xsl:with-param>
                    <xsl:with-param name="j">1</xsl:with-param>
                </xsl:call-template>
            </tr>
            <xsl:call-template name="bucleForFila">
                <xsl:with-param name="i"><xsl:value-of select="$i + 1"/></xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    
    <xsl:template name="bucleForColumna">
        <xsl:param name="i"/>
        <xsl:param name="j"/> 
        <xsl:if test="$j &lt;= 5">
            <xsl:call-template name="celda">
                <xsl:with-param name="x"><xsl:value-of select="$j"/></xsl:with-param>
                <xsl:with-param name="y"><xsl:value-of select="$i"/></xsl:with-param>
            </xsl:call-template>
            <xsl:call-template name="bucleForColumna">
                <xsl:with-param name="i"><xsl:value-of select="$i"/></xsl:with-param>
                <xsl:with-param name="j"><xsl:value-of select="$j + 1"/></xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    
    <xsl:template name="celda">
        <xsl:param name="x"/>
        <xsl:param name="y"/>
        <td>
            <xsl:for-each select="/videoclub/Peliculas/pelicula/coordenadas">
                <xsl:variable name="imgPeli">
                    <xsl:value-of select="../@idimg"/>
                </xsl:variable>
                <xsl:if test="@x = $x and @y = $y">
                    <xsl:attribute name="style">
                        background: #<xsl:value-of select="/videoclub/bancoDeImagenes/color[@identificador = 'peliculas']/."/>;
                    </xsl:attribute>
                    <img src="{/videoclub/bancoDeImagenes/imagen[@identificador = $imgPeli]/.}"></img>
                    <xsl:value-of select="../@titulo"/><br/>
                    Pegi: <xsl:value-of select="../@pegi"/><br/>
                    Alquiler: <xsl:value-of select="../@alquilerDiario"/>
                </xsl:if>
            </xsl:for-each>
            
            
            <xsl:for-each select="/videoclub/videojuegos/videoJuego">
                <xsl:variable name="imgJuego">
                    <xsl:value-of select="idImg/@valor"/>
                </xsl:variable>
                
                <xsl:if test="@x = $x and @y = $y">
                    <xsl:attribute name="style">
                        background: #<xsl:value-of select="/videoclub/bancoDeImagenes/color[@identificador = 'videojuegos']/."/>;
                    </xsl:attribute>
                    <img src="{/videoclub/bancoDeImagenes/imagen[@identificador = $imgJuego]/.}"></img>
                    <xsl:value-of select="."/><br/>
                    Pegi: <xsl:value-of select="@pegi"/><br/>
                    Alquiler: <xsl:value-of select="@alquilerDiario"/>
                </xsl:if>
            </xsl:for-each>
        </td>
    </xsl:template>
    
    
    <xsl:template name="css">
        <style type="text/css">
            th{
            background: blue;
            color: white;
            }
            td{
            width: 50px;
            height: 50px;
            }
            img {
            width: 100px;
            }
            hr {
            border: 1px solid #001; /* Cambia el grosor y el color de la línea */
            margin: 20px 0px; /* Añade espacio arriba y abajo de la línea */
            }
        </style>
    </xsl:template>
    

</xsl:stylesheet>