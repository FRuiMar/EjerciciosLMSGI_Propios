<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="iso-8859-1"/>

    <xsl:template match="/">
        <!-- /   es lo mismo que poner la raiz /biblicoteca -->
        <html>
            <head>
                <title>Tabla de Libros</title>
                <!-- <xsl:call-template name="css"/> -->
                <style>
                    table {
                        border-collapse: collapse;
                        width: 100%;
                    }
                    th,
                    td {
                        border: 1px solid black;
                        padding: 8px;
                        text-align: left;
                    }
                    th {
                        background-color: #f2f2f2;
                    }</style>
            </head>
            <body>
                <table>
                    <tr>
                        <td>Título</td>
                        <td>Autor</td>
                        <td>Fecha de Nacimiento</td>
                        <td>Año de Publicación</td>
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
                <xsl:value-of select="."/>
            </td>
            <td><xsl:value-of select="fechaPublicacion/@año"/></td>
        </tr>
    
    
    </xsl:template>







    <!-- <xsl:template name="css">
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
    </xsl:template> -->


</xsl:stylesheet>