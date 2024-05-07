<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    
    
    <xsl:template match="/ligaVoleibol">
        <html>
            <head>
                <title><xsl:value-of select="@nombreLiga"/> de                   
                    <xsl:value-of select="@pais"/></title>
                <xsl:call-template name="css"/>
            </head>
            <body>
                <h1> Mapa de Equipos </h1>
                <table border="1" style="background-image: url('{mapa/@imagen}')">
                    <xsl:call-template name="bucleForFila">
                        <xsl:with-param name="i">1</xsl:with-param>
                    </xsl:call-template>
                </table>

                
            </body>
        </html>
    </xsl:template>
    
    
    
    
    <xsl:template name="bucleForFila">
        <xsl:param name="i"/>
        <xsl:if test="$i &lt;= 10">
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
        <td>
            <!-- ASIGNO COLOR A LA CELDA SI "X" ES PAR O IMPAR -->
            <xsl:attribute name="style">
                <xsl:for-each select="mapa/equipo">
                    <xsl:if test="CoordenadaX[@valor = $x] and coordenadaY [@valor = $y] and ($x mod 2 = 1)">
                        background: #627faa;
                    </xsl:if>
                    <xsl:if test="CoordenadaX[@valor = $x] and coordenadaY [@valor = $y] and ($x mod 2 = 0)">
                        background: #66c07d;
                    </xsl:if>
                </xsl:for-each>
            </xsl:attribute>    
            
            <!-- MUESTRO LA IMAGEN DEL EQUIPO -->
            <xsl:for-each select="mapa/equipo">
                <xsl:if test="CoordenadaX[@valor = $x] and coordenadaY [@valor = $y]">
                    <xsl:variable name="id">
                        <xsl:value-of select="@id"/>
                    </xsl:variable>
                   <img width="40px" src="{/ligaVoleibol/recursos/imagenes/img[@id = $id]/url}"/>
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
            width: 85px;
            height: 50px;
            }
            img {
            width: 50px;
            }
           
        </style>
    </xsl:template>
    
    
    
</xsl:stylesheet>