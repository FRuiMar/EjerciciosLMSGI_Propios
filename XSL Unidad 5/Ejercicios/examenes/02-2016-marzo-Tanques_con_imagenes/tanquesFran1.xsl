<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8"/>
    
    <xsl:template match="/juegoTanques">
        <html>
            <head>
                <title>Tabla de Jugadas de Tanques</title>
                <style>
                    table {
                    border-collapse: collapse;
                    width: 100%;
                    }
                    td {
                    border: 1px solid black;
                    padding: 8px;
                    text-align: left;
                    }
                    th {
                    text-align: left;
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
                <h2>Tabla de Jugadas</h2>
                <table border="1" width="80%" align="center">
                    <tr>
                        <th>Jugada</th>
                        <th colspan="2">Tanque</th>
                        <th>Descripción Jugada</th>
                    </tr>
                    <xsl:call-template name="filas"/>
                 </table>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template name="filas">
        <xsl:for-each select="jugadasDescritas/jugada">
            <tr>
                <xsl:if test="position() mod 2 = 1">
                    <xsl:attribute name="style">
                        background: lightblue;
                    </xsl:attribute>
                </xsl:if>
                    
                <td><xsl:value-of select="position()"/></td>
                <td><xsl:value-of select="@jugador"/></td>
                <td>
                    <xsl:call-template name="imagenTanque">
                        <xsl:with-param name="jugador"><xsl:value-of select="@jugador"/></xsl:with-param>
                    </xsl:call-template>
                </td>
                <td><xsl:value-of select="@desc"/></td>
            </tr>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="imagenTanque">
        <xsl:param name="jugador"/>   
        <img style="width:50px" src="{/juegoTanques/tanques/imagenTanque[@jugador = $jugador]}"></img>
    </xsl:template>
    
    
    <!-- al pasar un parametro, el template que lo recibe lo usa como variable
     per puedes crear variableas directamente con xsl:variable, aquí el ejemplo de lo de antes pero hecho de otra forma-->
    
    <!-- teniendo en cuenta que el foco estaba en jugada -->
    <!-- al pasar el nuevo foco ahora usaremos @jugador dentro de "imagenTanque", mientras que $jugador hace referencia
         a la variable que pasamos antes que estaba dentro de "jugada" -->
    <!-- <td>
         <xsl:variable name="jugador"><xsl:value-of select="@jugador"/></xsl:variable>
         <img style="width:50px" src="{/juegoTanques/tanques/imagenTanque[@jugador = $jugador]}"></img>
         
         </td>-->
    
    
    
    
</xsl:stylesheet>