<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    
    <xsl:template match="/gormitis">
        <html>
            <head>
                <title>Lista de Gormitis</title>
                <xsl:call-template name="css"/>
            </head>
            <body>
                <table>
                    <tr>
                        <th></th>
                        <th>Gormiti</th>
                        <th>Tribu</th>
                    </tr>
                    <xsl:call-template name="construirFilas"/>
                </table>
            </body>
        </html>
    </xsl:template>
    
    
    <xsl:template name="construirFilas">
        <xsl:for-each select="gormiti">
            <tr>
                <xsl:if test="position() mod 2 = 1">
                    <xsl:attribute name="style">background: #87adfa;</xsl:attribute>  
                </xsl:if>
                <td><xsl:value-of select="position()"/></td>
                <td><img src="{.}"/></td>
                <td><xsl:value-of select="@tribu"/></td>
            </tr>
        </xsl:for-each>
    </xsl:template>
    
    
    
    
    
    
    
    
    <xsl:template name="css">
        <style type="text/css">
            th {
                background: #090f7d;
                color:#FFFFFF;
            }
            img {
            width: 50px;
            }
        </style>
    </xsl:template>
    
    
    
</xsl:stylesheet>