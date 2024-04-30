<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8"/>

    <xsl:template match="/videoclub">
        <html>
            <head>
                <title>Videoclub</title>
                <xsl:call-template name="css"/>
            </head>
            <body>
                <h2><xsl:value-of select="@nombre"/></h2>
                <table border="1" align="center" width="80%">
                    <tr>
                        <th>Título</th>
                        <th>Pegi</th>
                        <th>Duración/Plataforma</th>
                        <th>Alquiler diario</th>
                    </tr>
                    
                    <xsl:apply-templates select="Peliculas/pelicula">
                        <xsl:sort select="@titulo" order="ascending"/>
                    </xsl:apply-templates>
                    
                    <xsl:apply-templates select="videojuegos/videoJuego">
                        <xsl:sort select="." order="ascending"/>
                    </xsl:apply-templates>
                </table>
                
            </body>
        </html>
    </xsl:template>
    
    
    <xsl:template match="pelicula">
        <tr>
            <xsl:if test="position() mod 2 = 1">
                <xsl:attribute name="style">background: yellow;</xsl:attribute>
            </xsl:if>
            <xsl:if test="position() mod 2 = 0">
                <xsl:attribute name="style">background: lightyellow;</xsl:attribute>
            </xsl:if>
            
            
            <td><xsl:value-of select="@titulo"/></td>
            <td><xsl:value-of select="@pegi"/></td>
            <td><xsl:value-of select="@duracionEnMinutos"/></td>
            <td><xsl:value-of select="@alquilerDiario"/></td>
        </tr>
    </xsl:template>
    
    <xsl:template match="videoJuego">
        <tr>
            <xsl:if test="position() mod 2 = 1">
                <xsl:attribute name="style">background: green;</xsl:attribute>
            </xsl:if>
            <xsl:if test="position() mod 2 = 0">
                <xsl:attribute name="style">background: lightgreen;</xsl:attribute>
            </xsl:if>
            
            <td><xsl:value-of select="."/></td>
            <td><xsl:value-of select="@pegi"/></td>
            <td><xsl:value-of select="@plataforma"/></td>
            <td><xsl:value-of select="@alquilerDiario"/></td>
        </tr>
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
            width: 200px;
            }
            hr {
            border: 1px solid #001; /* Cambia el grosor y el color de la línea */
            margin: 20px 0px; /* Añade espacio arriba y abajo de la línea */
            }
        </style>
    </xsl:template>
    
    
</xsl:stylesheet>