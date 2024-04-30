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
                <div>
                    <h2><xsl:value-of select="@nombre"/></h2>
                    <br/>
                    <h1><xsl:value-of select="titulo/@nombre"/></h1>
                    <h2>Fecha: <xsl:value-of select="titulo/@estreno"/></h2>
                    <img src="{titulo/imagen}"></img>
                </div>
                <br/>
                <br/>
                <table border="1" align="center" width="80%">
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
            <td>Sesión <xsl:value-of select="position()"/>: <xsl:value-of select="@hora"/></td>
        </tr>
    </xsl:template>
    
    
    <xsl:template name="css">
        <style type="text/css">
            th{
            background: #blue;
            color:#white;
            }
            td{
            width: 50px;
            height: 50px;
            }
            img {
            width: 500px;
            }
        </style>
    </xsl:template>
    
    
</xsl:stylesheet>