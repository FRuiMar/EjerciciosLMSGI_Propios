<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8"/>
    
    <xsl:template match="/gormitis">
        <html>
            <head>
                <title>Gormitis</title>
                <xsl:call-template name="css"/>
            </head>
            <body>
                <h2>Mapa de Gormitis</h2>
                <table border="1" with="90%" align="center" style="background-image: url('{tablero/@url}');">
                    <xsl:call-template name="bucleForFila">
                        <xsl:with-param name="i">0</xsl:with-param>
                    </xsl:call-template>
                </table>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template name="bucleForFila">
        <xsl:param name="i"/>
        <xsl:if test="$i &lt;= 2">
            <tr>
                <xsl:call-template name="bucleForColumna">
                    <xsl:with-param name="i"><xsl:value-of select="$i"/></xsl:with-param>
                    <xsl:with-param name="j">0</xsl:with-param>
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
        <xsl:if test="$j &lt;= 2">
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
            <xsl:for-each select="/gormitis/tablero/gormitiEnMapa">
                <xsl:if test="@x = $x and @y = $y">
                    <xsl:variable name="tribu">
                        <xsl:value-of select="@tribu"/>
                    </xsl:variable>
                    <img src="{/gormitis/gormiti[@tribu = $tribu]/.}"></img>
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
            width: 150px;
            }
            hr {
            border: 1px solid #001; /* Cambia el grosor y el color de la línea */
            margin: 20px 0px; /* Añade espacio arriba y abajo de la línea */
            }
        </style>
    </xsl:template>
    
    
    
</xsl:stylesheet>