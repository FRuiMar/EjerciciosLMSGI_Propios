<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    
    <xsl:template match="/callejero">
        <html>
            <head>
                <title>Callejero</title>
                <xsl:call-template name="css"/>
            </head>
            <body>
                <table border="1" with="90%" style="background-image: url('{imagen}')">
                    <xsl:call-template name="bucleForFila">
                        <xsl:with-param name="i">1</xsl:with-param>
                    </xsl:call-template>
                </table>/>
            </body>
        </html>
    </xsl:template>

    
    <xsl:template name="bucleForFila">
        <xsl:param name="i"/>
        <xsl:if test="$i &lt;= 6">
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
        <xsl:if test="$j &lt;= 6">
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
            <xsl:for-each select="/callejero/monumentos/monumento">
                <xsl:variable name="imagenMonumento">
                    <xsl:value-of select="@imagen"/>
                </xsl:variable>
                <xsl:if test="coordX/. = $y and coordY/. = $x">
                    <img src="{/callejero/Imagenes/imagen[@id = $imagenMonumento]/.}"></img>
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
            width: 80px;
            height: 80px;
            }
            img {
            width: 70px;
            }
        </style>
    </xsl:template>
    
</xsl:stylesheet>