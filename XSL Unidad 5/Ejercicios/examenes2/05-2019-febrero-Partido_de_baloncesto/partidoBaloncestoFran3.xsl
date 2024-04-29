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
                <h1>Histórico de Jugadas</h1>
                <table border="1" align="center" width="80%">
                    <tr>
                        <th>Nombre</th>
                        <th>Alias</th>
                        <th>Tiempo</th>
                        <th>Tipo</th>
                        <th>Descripción</th>
                    </tr>
                    <xsl:for-each select="historico/entrada">
                        <tr>
                            <td><xsl:value-of select="@jugador"/></td>
                            <td>
                                <xsl:variable name="nombreJugador"><xsl:value-of select="@jugador"/></xsl:variable>                               
                                <xsl:value-of select="/partidoBaloncesto/equipo/jugador[@nombre = $nombreJugador]/@apodo"/>
                            </td>
                            <td><xsl:value-of select="@tiempo"/></td>
                            <td>
                                <xsl:variable name="tipo"><xsl:value-of select="@tipo"/></xsl:variable>
                                <img src="{../imagen[@tipo = $tipo]}"></img>
                            </td>
                            <td><xsl:value-of select="."/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
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
            img {
            height: 65px;
            }
        </style>
    </xsl:template>
    
    
</xsl:stylesheet>