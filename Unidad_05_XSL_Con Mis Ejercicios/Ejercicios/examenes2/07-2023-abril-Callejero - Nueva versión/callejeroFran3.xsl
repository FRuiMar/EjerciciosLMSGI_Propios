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
                <xsl:for-each select="patrocinadores/Patrocinador">
                    <h1>Nombre: <xsl:value-of select="@nombre"/></h1>
                    <h2>Dirección: <xsl:value-of select="direccion"/></h2>
                    <xsl:variable name="imgPatro">
                        <xsl:value-of select="imagen/@id"/>
                    </xsl:variable>
                    <img src="{/callejero/Imagenes/imagen[@id = $imgPatro]/.}"></img>
                    <br/>
                    <hr/>
                    <br/>
                </xsl:for-each>
            </body>
        </html>
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
            hr {
            border: 1px solid #001; /* Cambia el grosor y el color de la línea */
            margin: 20px 0px; /* Añade espacio arriba y abajo de la línea */
            }
        </style>
    </xsl:template>
    
</xsl:stylesheet>