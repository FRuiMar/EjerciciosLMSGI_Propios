<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    
    <xsl:template match="/cine">
        <html>
            <head>
                <title>Batman vs Superman</title>
                <xsl:call-template name="css"/>
            </head>
            <body>
                <h2><xsl:value-of select="@nombre"/></h2>
                <h3><xsl:value-of select="titulo/@nombre"/></h3>
                <h3><xsl:value-of select="titulo/@estreno"/></h3>
                <img src="{titulo/imagen}"></img>
                <table border="1" align="center" width="90%">
                    <xsl:apply-templates select="sesiones/sesion"/>
                    <xsl:for-each select="sesiones/sesion">
                        <table border="1" with="70%" align="center">
                            <tr>
                                <td align="center" colspan="4">sesión <xsl:value-of select="position()"/>: <xsl:value-of select="@hora"/></td>
                            </tr>
                            <xsl:call-template name="bucleForFila">
                                <xsl:with-param name="i">1</xsl:with-param>
                            </xsl:call-template>
                        </table>
                        <br/>
                    </xsl:for-each>
                </table>     
                <br/>
                
                <xsl:apply-templates select="cartelera"/>
            </body>
        </html>
    </xsl:template>
    
    
    <xsl:template match="sesion">
        
        <tr>
            <xsl:if test="position() mod 2 = 1">
                <xsl:attribute name="style">background: lightblue;</xsl:attribute>
            </xsl:if>
            <td>sesión <xsl:value-of select="position()"/>: <xsl:value-of select="@hora"/></td>
        </tr>
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
        <td align="center">
            
            <!-- aquí no es solo una condicion para pintar una sola cosa
                va a depender del caso, se pintará una u otra en la misma celda
                por lo que NO USAMOS IF.  USAMOS CHOOSE Y WHEN-->
            <xsl:choose>
                <!-- venimos de call template en sesiones/sesion.. foco en sesion, 
                        por eso podemos poner OCUPADO -->
                <xsl:when test="ocupado[@asiento = $x and @fila = $y]">
                    <img width="30px" src="{/cine/imagenes/imagen[@id = 'ocupado']}"/>
                </xsl:when>
                <xsl:otherwise>
                    <img width="30px" src="{/cine/imagenes/imagen[@id = 'libre']}"/>
                </xsl:otherwise>
            </xsl:choose>
        </td>
    </xsl:template>
    
    
    
    
    
    
    <xsl:template match="cartelera">
        <h1>Cartelera</h1>
        <table border="1" align="center" width="80%">
            <xsl:for-each select="pelicula">
                <tr>
                    <xsl:variable name="idImagen">
                        <xsl:value-of select="@id"/>
                    </xsl:variable>
                    <td><img src="{/cine/imagenes/imagen[@id = $idImagen]/.}"></img></td>
                    <td><xsl:value-of select="@nombre"/></td>
                </tr>   
            </xsl:for-each>
                 
        </table>
    </xsl:template>
    
    
    
    <xsl:template name="css">
        <style type="text/css">
            th{
            background: #blue;
            color:#white;
            }
            td{
            width: 50px;
            height: 50px;
            }
            img {
            width: 200px;
            }
        </style>
    </xsl:template>
    
    
</xsl:stylesheet>