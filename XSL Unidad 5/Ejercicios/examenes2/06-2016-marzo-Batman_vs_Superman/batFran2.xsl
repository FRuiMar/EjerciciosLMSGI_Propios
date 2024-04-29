<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    
    <xsl:template match="/cine">
        <html>
            <head>
                <title>Asientos ocupados</title>
                <xsl:call-template name="css"/>
            </head>
            <body>
                <table border="1" align="center">
                    <xsl:for-each select="sesiones/sesion">
                        <tr> 
                            <xsl:if test="position() mod 2 = 1">
                                <xsl:attribute name="style">background: lightblue</xsl:attribute>
                            </xsl:if>
                            <td> Sesión <xsl:value-of select="position()"/>: <xsl:value-of select="@hora"/>
                                <table border="1" with="70%">
                                    <xsl:call-template name="bucleForFila">
                                        <xsl:with-param name="i">1</xsl:with-param>
                                    </xsl:call-template>
                                </table>
                            </td>
                        </tr>
                    </xsl:for-each> 
                </table>
                
            </body>
        </html>
    </xsl:template>
    
    
    
    
    <xsl:template name="bucleForFila">
        <xsl:param name="i"/>
        <xsl:if test="$i &lt;= 4">
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
        <xsl:if test="$j &lt;= 4">
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
        <td><!-- AQUÍ TERMINA DE HACER LAS CELDAS -->
            <!-- CUANDO ME HACES LA CELDA.. TE PONGO CONDICIONES. -->
            <!-- Si existe ocupado.. [y sus atributos coincidan con x e y] entonces pon tal imagen -->
            <xsl:choose>
                <xsl:when test="ocupado[@fila = $y and @asiento = $x]">
                    <img src="{/cine/imagenes/imagen[@id = 'ocupado']}"></img>
                </xsl:when>
                <xsl:otherwise>
                    <img src="{/cine/imagenes/imagen[@id = 'libre']}"></img>
                </xsl:otherwise>
            </xsl:choose>
            
        </td>
    </xsl:template>
    
    
    
    
    <xsl:template name="css">
        <style type="text/css">
            th{
            background: blue;
            color: white;
            }
            td{
            width: 95px;
            height: 55px;
            }
            tr{
            text-align: center;
            }
            img {
            width: 60px;
            }
        </style>
    </xsl:template>
</xsl:stylesheet>