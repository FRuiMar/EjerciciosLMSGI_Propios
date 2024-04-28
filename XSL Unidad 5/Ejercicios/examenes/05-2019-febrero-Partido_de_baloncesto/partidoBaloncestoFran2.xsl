<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    
    <xsl:template match="/partidoBaloncesto">
        <html>
            <head>
                <title>Cancha Posición Jugadores</title>
                <xsl:call-template name="css"/>
            </head>
            <body>
                <h1>Posición Jugadores</h1>
                <table border="1" with="90%" align="center" style="background-image: url('{pista}')">
                    <xsl:call-template name="bucleForFila">
                        <xsl:with-param name="i">1</xsl:with-param>
                    </xsl:call-template>
                </table>
            </body>
        </html>
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
        <xsl:if test="$j &lt;= 10">
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
        <td align="center">
            <xsl:for-each select="/partidoBaloncesto/equipo/jugador">
                <!-- revisa cómo se llama la propiedad donde dan la x y la y.. no siempre va a se @x y @y
                en este caso en JUGADOR  se llamaba  posicionX y posiciónY -->
                <xsl:if test="@posicionX = $x and @posicionY = $y">
                    <!-- RECUERDA estamos en jugador -->
                    <xsl:value-of select="@nombre"/>
                    <!-- Y COMO SEGUIMOS EN JUGADOR.. su imagen está 
                        justo en equipo por encima con lo que cada jugador 
                        al subir al nivel  EQUIPO COGE SU IMAGEN 
                        CORREPSONDIENTE LOCAL O VISITANTE-->
                    <img src="{../@imagen}"></img>
                </xsl:if>
            </xsl:for-each>
        </td>
    </xsl:template>
    
    <xsl:template name="css">
        <style type="text/css">
            th{
            background: #blue;
            color:#white;
            }
            td{
            width: 95px;
            height: 55px;
            }
            img {
            width: 50px;
            }
        </style>
    </xsl:template>
    
</xsl:stylesheet>