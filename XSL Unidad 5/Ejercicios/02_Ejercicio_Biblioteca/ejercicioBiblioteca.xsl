<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Tabla de libros</title>
                <style>
                    table {
                    border-collapse: collapse;
                    width: 100%;
                    }
                    th, td {
                    border: 1px solid black;
                    padding: 8px;
                    text-align: left;
                    }
                    th {
                    background-color: #f2f2f2;
                    }
                </style>
            </head>
            <body>
                <h2>Tabla de libros</h2>
                <table>
                    <tr>
                        <th>Título</th>
                        <th>Autor</th>
                        <th>Fecha de Nacimiento</th>
                        <th>Año de Publicación</th>
                    </tr>
                    <xsl:apply-templates select="biblioteca/libro"/>
                </table>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="libro">
        <tr>
            <td><xsl:value-of select="titulo"/></td>
            <td><xsl:value-of select="autor"/></td>
            <td>
                <xsl:choose>
                    <xsl:when test="autor/@fechaNacimiento">
                        <xsl:value-of select="autor/@fechaNacimiento"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>No disponible</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
            <td><xsl:value-of select="fechaPublicacion/@año"/></td>
        </tr>
    </xsl:template>
</xsl:stylesheet>