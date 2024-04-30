<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8"/>
    
    
    <xsl:template match="/primerDia1DAW">
        <html>
            <head>
                <title>Mapa Clase 1º DAW</title>
                <xsl:call-template name="css"/>
            </head>
            <body>
                <h2>Mapa Clase 1º DAW</h2>
                <table border="1" with="90%">
                    <xsl:call-template name="bucleForFila">
                        <xsl:with-param name="i">1</xsl:with-param>
                    </xsl:call-template>
                </table>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template name="bucleForFila">
        <xsl:param name="i"/>
        <xsl:if test="$i &lt;= 11">
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
        <xsl:if test="$j &lt;= 8">
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
            <xsl:for-each select="/primerDia1DAW/estructuraAula/bloque">
                <xsl:if test="@x = $x and @y = $y">
                    <xsl:variable name="tipoBloque">
                        <xsl:value-of select="@tipo"/>
                    </xsl:variable>
                    <xsl:attribute name="style">background: #<xsl:value-of select="../color[@tipo=$tipoBloque]"/>;</xsl:attribute>
                    <xsl:value-of select="@tipo"/>
                </xsl:if>
            </xsl:for-each>
            
            <xsl:for-each select="/primerDia1DAW/alumnado/alumno">
                <xsl:if test="@x = $x and @y = $y">
                    <xsl:choose>
                        <xsl:when test="@sexo = 'H'">
                            
                            <!-- CUIDADO CON HACER EL ATRIBUTE DENTRO EN VEZ DE FUERA -->
                            <xsl:attribute name="style">background: #2996a7;</xsl:attribute>
   
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:attribute name="style">background: #b86a9e;</xsl:attribute>
                        
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:variable name="sexo"><xsl:value-of select="@sexo"/></xsl:variable>
                    <img src="{../imagen[@sexo = $sexo]}"></img>
                    <xsl:value-of select="."/>
                </xsl:if>
            </xsl:for-each>
        </td>
    </xsl:template>
    

    <xsl:template name="css">
        <style type="text/css">
            td {
            width: 50px;
            height: 50px;
            }
            img {
            width: 40px;
            }
        </style>
    </xsl:template>
    
</xsl:stylesheet>