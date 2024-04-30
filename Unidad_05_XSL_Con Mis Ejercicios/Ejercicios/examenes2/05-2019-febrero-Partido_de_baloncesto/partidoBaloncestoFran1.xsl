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
                <table border="1" align="center" width="80%">
                    <tr>
                        <th>Equipo</th>
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
        <xsl:for-each select="jugador">
            <xsl:sort select="@nombre"/>
            <tr>
                <xsl:choose>
                    <xsl:when test="../@tipo = 'Local'">
                        <xsl:attribute name="style">
                            <xsl:if test="position() mod 2 = 1">background: lightblue;</xsl:if>
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:attribute name="style">
                            <xsl:if test="position() mod 2 = 1">background: lightgreen;</xsl:if>
                        </xsl:attribute>
                    </xsl:otherwise>
                </xsl:choose>
                
                <xsl:call-template name="filaDatos">
                    <xsl:with-param name="imagen">
                        <xsl:value-of select="../@imagen"/>
                    </xsl:with-param>
                </xsl:call-template>
                
                
            </tr>
        </xsl:for-each>
    </xsl:template>
    
    
    <xsl:template name="filaDatos">
        <xsl:param name="imagen"/>
        
        <td><img src="{$imagen}"></img></td>
        <td><xsl:value-of select="@nombre"/></td>
        <td><xsl:value-of select="@dorsal"/></td>
        <td><xsl:value-of select="@apodo"/></td>
        <td><xsl:value-of select="@puntos"/></td>
        <td><xsl:value-of select="@rebotes"/></td>
        <td><xsl:value-of select="@asistencias"/></td>
    </xsl:template>
    
    
    
    
    
    
    
    
    
    <xsl:template name="css">
        <style type="text/css">
            th{
            background: blue;
            color: white;
            text-size: 16;
            }
            img {
            width: 50px;
            }
        </style>
    </xsl:template>
    
    
    
    
    
    
</xsl:stylesheet>