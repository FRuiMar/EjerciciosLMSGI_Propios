<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8"/>
    
    <xsl:template match="/juegoTanques">
        <html>
            <head>
               <xsl:call-template name="css"/>
            </head>
            <body>
                <h2>Tabla de Jugadas</h2>
                <table>
                    <tr>
                        <th>Jugada</th>
                        <th colspan="2">Tanque</th>
                        <th>Descripción</th>
                    </tr>
                    <xsl:apply-templates select="jugadasDescritas/jugada"/>
                </table>
            </body>
        </html>
    </xsl:template>
    

    <xsl:template match="jugada">
        <tr>
            <xsl:if test="position() mod 2 = 1">
                <xsl:attribute name="style">background: lightblue;</xsl:attribute>
            </xsl:if>
            <td><xsl:value-of select="position()"/></td>
            <td><xsl:value-of select="@jugador"/></td>
            <td>
                <xsl:call-template name="imagenTanque">
                    <xsl:with-param name="numJugador">
                        <xsl:value-of select="@jugador"/>
                    </xsl:with-param>
                </xsl:call-template>
            </td>
            <td><xsl:value-of select="@desc"/></td>   
        </tr>
    </xsl:template>

    <xsl:template name="imagenTanque">
        <xsl:param name="numJugador"/>
            <img src="{/juegoTanques/tanques/imagenTanque[@jugador = $numJugador]}"></img>
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
    
    
    <xsl:template name="css">
        <title>Tabla de Jugadas de Tanques</title>
        <style type="text/css">
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
            text-align: Center;
            background-color: #6699cc; /* Azul claro */
            color: white;
            }
            .celeste {
            background-color: #ccffff; /* Celeste */
            }
            .blanco {
            background-color: white;
            }
            img {
            width: 70px;
            }
        </style>
    </xsl:template>
    
</xsl:stylesheet>