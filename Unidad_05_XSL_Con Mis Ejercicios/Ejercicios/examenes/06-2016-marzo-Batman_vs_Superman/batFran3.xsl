<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    
    <xsl:template match="/cine">
        <html>
            <head>
                <title>Batman vs Superman</title>
                <xsl:call-template name="css"/>
            </head>
            <body>
                <h2><xsl:value-of select="@nombre"/></h2>
                <h3><xsl:value-of select="titulo/@nombre"/></h3>
                <h3><xsl:value-of select="titulo/@estreno"/></h3>
                <img src="{titulo/imagen}"></img>
                <table border="1" align="center" width="90%">
                    <xsl:apply-templates select="sesiones/sesion"/>
                </table>       
            </body>
        </html>
    </xsl:template>
    
    
    <xsl:template match="sesion">
        
        <tr>
            <xsl:if test="position() mod 2 = 1">
                <xsl:attribute name="style">background: lightblue;</xsl:attribute>
            </xsl:if>
            <td>sesión <xsl:value-of select="position()"/>: <xsl:value-of select="@hora"/></td>
        </tr>
    </xsl:template>
    
    <xsl:template name="css">
        <style type="text/css">
            th{
            background: #blue;
            color:#white;
            }
            td{
            width: 95px;
            height: 55px;
            }
            img {
            width: 400px;
            }
        </style>
    </xsl:template>
</xsl:stylesheet>