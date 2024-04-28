<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    
    <xsl:template match="/partidoBaloncesto">
        <html>
            <head>
                <title>Tabla Jugadores Partido</title>
                <xsl:call-template name="css"/>
            </head>
            <body>
                <table border="1" width="100%">
                    <tr>
                        <th>Imagen</th>
                        <th>Nombre</th>
                        <th>Dorsal</th>
                        <th>Apodo</th>
                        <th>Puntos</th>
                        <th>Rebotes</th>
                        <th>Asistencias</th>
                    </tr>
                    <xsl:apply-templates select="equipo"/>
                </table>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="equipo">
            <xsl:call-template name="crearEquipo">
                <xsl:with-param name="ImagenEquipo">
                    <xsl:value-of select="@imagen"/>
                </xsl:with-param>
            </xsl:call-template>
    </xsl:template>
    
    
    
    <xsl:template name="crearEquipo">
        <xsl:param name="ImagenEquipo"/>
        <xsl:for-each select="jugador">
            <xsl:sort select="@nombre" order="ascending"></xsl:sort>
            <tr>
                <xsl:if test="position() mod 2 = 1">
                    <xsl:choose>
                        <xsl:when test="../@tipo = 'Local'">
                          <xsl:attribute name="style">background:lightblue;</xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:attribute name="style">background:lightgreen;</xsl:attribute>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:if>
                <td><img src="{$ImagenEquipo}"></img></td>
                <td><xsl:value-of select="@nombre"/></td>
                <td><xsl:value-of select="@dorsal"/></td>
                <td><xsl:value-of select="@apodo"/></td>
                <td><xsl:value-of select="@puntos"/></td>
                <td><xsl:value-of select="@rebotes"/></td>
                <td><xsl:value-of select="@asistencias"/></td>
        
            </tr>
        </xsl:for-each>
    </xsl:template>
    
    
    
    
    <xsl:template name="css">
        <style type="text/css">
            th{
            background: #blue;
            color:#white;
            }
            img {
            width: 50px;
            }
        </style>
    </xsl:template>
    
    
    
    
    
    
</xsl:stylesheet>