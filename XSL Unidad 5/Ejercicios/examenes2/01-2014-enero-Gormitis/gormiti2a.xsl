<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8"/>
    
    <xsl:template match="/gormitis">
        <html>
            <head>
                <title>Gormitis</title>
                <xsl:call-template name="css"/>
            </head>
            <body>
                <h2>Lista de Gormitis</h2>
                <table border="1" align="center" width="80%">
                    <tr>
                        <th colspan="2">Gormiti</th>
                        <th>Tribu</th>
                    </tr>
                    <xsl:apply-templates select="gormiti"/>
                    
                </table>
                
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="gormiti">
        <tr>
            <xsl:if test="position() mod 2 = 1">
                <xsl:attribute name="style">background: lightblue;</xsl:attribute>
            </xsl:if>
            <td><xsl:value-of select="position()"/></td>
            <td><img src="{.}"></img></td>
            <td><xsl:value-of select="@tribu"/></td>
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
            width: 150px;
            }
            hr {
            border: 1px solid #001; /* Cambia el grosor y el color de la línea */
            margin: 20px 0px; /* Añade espacio arriba y abajo de la línea */
            }
        </style>
    </xsl:template>
    
    
    
</xsl:stylesheet>