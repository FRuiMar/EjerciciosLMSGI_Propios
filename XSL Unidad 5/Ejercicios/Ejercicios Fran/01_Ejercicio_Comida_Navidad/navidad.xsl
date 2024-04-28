<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    
    <xsl:template match="/celebracion">
        <html>
            <head>
                <title><xsl:value-of select="@name"/></title>
                <!-- <xsl:call-template name="css"/> -->
                <style>
                    body{
                        background: red;
                        color: white;
                        }
                </style>
            </head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    
    
    
    
    
    <xsl:template match= "menu">
        <h1>Menú</h1>
        <xsl:for-each select="plato">
            <p>
               <xsl:value-of select="."/>
            </p>
        </xsl:for-each>
    </xsl:template> 
       
    <!--  -->
    
    <!-- Aquí hay un template que llama a otro template, aunque puedes ponerlo todo junto -->
    <xsl:template match="espirituosas">
        <h1>Bebidas</h1>
        <xsl:apply-templates select="bebida"/> 
    </xsl:template>
   
    <!-- Al llamarlo un apply templates.. este es  un template match -->
    <xsl:template match= "bebida">  
      <p>
         <xsl:value-of select="@nombre"/>
      </p>
    </xsl:template>
    
    
   <!-- <xsl:template name="css">
        <style>
            body{
            background: red;
            color: white;
            }
        </style>
    </xsl:template> -->
    
    
</xsl:stylesheet>