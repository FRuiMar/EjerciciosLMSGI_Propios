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
                <h1><xsl:value-of select="@nombreLiga"/> de 
                    <xsl:value-of select="@pais"/>
                </h1>
                <h2>Clasificación <xsl:value-of select="clasificacion/@fecha"/></h2>
                <table border="1" width="80%" align="center">
                    <tr>
                        <th>Imagen</th>
                        <th>Nombre equipo</th>
                        <th>Puntos</th>
                        <th>Partidos Jugados</th>
                        <th>Ganados</th>
                        <th>Perdidos</th>
                        <th>Ganados menos perdidos</th>
                    </tr>
                    <xsl:apply-templates select="clasificacion/equipo">
                        <xsl:sort select="nombre"></xsl:sort>
                    </xsl:apply-templates>
                </table>
                
                <xsl:call-template name="equipoMasPuntos"/>
                    
            </body>
        </html>
    </xsl:template>
    
    
    <xsl:template match="equipo">
        <tr>
           
            <xsl:choose>
                <xsl:when test="position() mod 3 = 1">
                    <xsl:call-template name="colorFila">
                        <xsl:with-param name="color">background: lightblue</xsl:with-param>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="position() mod 3 = 2">
                    <xsl:call-template name="colorFila">
                        <xsl:with-param name="color">background: lightyellow</xsl:with-param>
                    </xsl:call-template>
                </xsl:when>
            </xsl:choose> 
           
            
            
            <xsl:variable name="id">
                <xsl:value-of select="@id"/>
            </xsl:variable>
            <td><img src="{/ligaVoleibol/recursos/imagenes/img[@id = $id]/url}"></img></td>
            <td><xsl:value-of select="nombre"/></td>
            <td><xsl:value-of select="@puntos"/></td>
            <td><xsl:value-of select="@Jugados"/></td>
            <td><xsl:value-of select="@ganados"/></td>
            <td><xsl:value-of select="@perdidos"/></td>
            <td><xsl:value-of select="@ganados - @perdidos"/></td>
        </tr>
        
    </xsl:template>
    
    
    
    
    <xsl:template name="colorFila">
        <xsl:param name="color"/>
        <xsl:attribute name="style"><xsl:value-of select="$color"/></xsl:attribute>
    </xsl:template>
    
    
    
    
    <!-- Encontrar el equipo -->
    <xsl:template name="equipoMasPuntos">
        <xsl:for-each select="/ligaVoleibol/clasificacion/equipo">
            <xsl:sort select="@puntos" order="descending" />
            <xsl:if test="position() = 1">
                <h1>El equipo con más puntos es:  <br/>
                    
                    <xsl:variable name="id">
                        <xsl:value-of select="@id"/>
                    </xsl:variable>
                    <img src="{/ligaVoleibol/recursos/imagenes/img[@id = $id]/url}"></img>
                    
                    "<xsl:value-of select="."/>" - <xsl:value-of select="@puntos"/> puntos

                </h1>
            </xsl:if>
        </xsl:for-each>
        
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
            width: 50px;
            }
            hr {
            border: 1px solid #001; /* Cambia el grosor y el color de la línea */
            margin: 20px 0px; /* Añade espacio arriba y abajo de la línea */
            }
        </style>
    </xsl:template>
    
    
    
</xsl:stylesheet>