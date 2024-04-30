<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    
    <xsl:template match="/callejero">
        <html>
            <head>
                <title>Callejero</title>
                <xsl:call-template name="css"/>
            </head>
            <body>
                <xsl:call-template name="datosCiudad"/>
                <table border="1" align="center" width="60%">
                    <xsl:apply-templates select="monumentos/monumento"/>
                        
                </table>
            </body>
        </html>
    </xsl:template>
    
    
    <xsl:template match="monumento">
        
        <tr>
            <xsl:choose>
                <xsl:when test="position() mod 3 = 1">
                    <xsl:attribute name="style">background:lightblue;</xsl:attribute>
                </xsl:when>
                <xsl:when test="position() mod 3 = 2">
                    <xsl:attribute name="style">background:lightgreen;</xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="style">background:orange;</xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:variable name="imagenMonumento">
                <xsl:value-of select="@imagen"/>
            </xsl:variable>
            <td rowspan="2"><img src="{/callejero/Imagenes/imagen[@id = $imagenMonumento]/.}"></img></td>
            <td><xsl:value-of select="@nombre"/></td>
        </tr>
        <tr>
            <xsl:choose>
                <xsl:when test="position() mod 3 = 1">
                    <xsl:attribute name="style">background:lightblue;</xsl:attribute>
                </xsl:when>
                <xsl:when test="position() mod 3 = 2">
                    <xsl:attribute name="style">background:lightgreen;</xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="style">background:orange;</xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:variable name="imagenMonumento">
                <xsl:value-of select="@imagen"/>
            </xsl:variable>
            <td>Calle: <br/><xsl:value-of select="@calle"/></td>
        </tr>
    </xsl:template>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    <xsl:template name="datosCiudad">
        <h1>
            Ciudad: <xsl:value-of select="@ciudad"/>
            <br/>
            Barrio: <xsl:value-of select="@barrio"/>
            <br/>
            Provincia: <xsl:value-of select="@provincia"/>
            <br/>
            CP: <xsl:value-of select="@cod_postal"/> 
            <br/>
            <img src="{imagen}"></img> 
        </h1>
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
            width: 200px;
            }
        </style>
    </xsl:template>
    
</xsl:stylesheet>