<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Tabla de Gormitis</title>
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
                    background-color: #6699cc; /* Azul claro */
                    color: white;
                    }
                    .celeste {
                    background-color: #ccffff; /* Celeste */
                    }
                    .blanco {
                    background-color: white;
                    }
                </style>
            </head>
            <body>
                <h2>Tabla de Gormitis</h2>
                <table>
                    <tr>
                        <th></th>
                        <th>Gormiti</th>
                        <th>Tribu</th>
                    </tr>
                    <xsl:apply-templates select="gormitis/tablero/gormitiEnMapa"/>
                </table>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="gormitiEnMapa">
        <xsl:variable name="tribuUrl" select="/gormitis/gormiti[@tribu=current()/@tribu]"/>
        <xsl:variable name="rowClass">
            <xsl:choose>
                <xsl:when test="position() mod 2 = 0">blanco</xsl:when>
                <xsl:otherwise>celeste</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <tr class="{$rowClass}">
            <td><xsl:value-of select="position()"/></td>
            <td>
                <img src="{$tribuUrl}"/>
            </td>
            <td><xsl:value-of select="@tribu"/></td>
        </tr>
    </xsl:template>
</xsl:stylesheet>