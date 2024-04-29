<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    
    
    <xsl:template match="/primerDia1DAW">
        <html>
            <head>
                <title>Horario 1º DAW</title>
            </head>
            <body>
                <h2>Horario 1º DAW</h2>
                <table border="1" width="80%" align="center">
                    <xsl:apply-templates select="horario/dia"/>
                </table>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="dia">
        <tr>
            <td><xsl:value-of select="@desc"/></td>
            <xsl:for-each select="hora">
                <xsl:sort select="@orden"></xsl:sort>
                <xsl:call-template name="creaCelda">
                    <xsl:with-param name="materia">
                        <xsl:value-of select="."/>
                    </xsl:with-param>
                    <xsl:with-param name="color">
                        <xsl:choose>
                            <xsl:when test="position() mod 2 = 1">lightblue;</xsl:when>
                            <xsl:otherwise>white;</xsl:otherwise>
                        </xsl:choose>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
        </tr>
    </xsl:template>
    
    <xsl:template name="creaCelda">
        <xsl:param name="materia"/>
        <xsl:param name="color"/>
        <td style="background: {$color};"><xsl:value-of select="$materia"/></td>
    </xsl:template>
    
</xsl:stylesheet>