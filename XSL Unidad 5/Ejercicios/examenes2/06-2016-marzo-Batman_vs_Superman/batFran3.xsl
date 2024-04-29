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
                <xsl:apply-templates select="cartelera/pelicula"/> 
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="pelicula">
        <h1><xsl:value-of select="@nombre"/></h1>
        <xsl:variable name="idPeli"><xsl:value-of select="@id"/></xsl:variable>
        <img src="{../../imagenes/imagen[@id = $idPeli]}"></img>
        <hr/>
        <br/>
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