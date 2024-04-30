<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    
    
    <xsl:template match="/primerDia1DAW">
        <html>
            <head>
                <title>Horario 1º DAW</title>
                <xsl:call-template name="css"></xsl:call-template>
            </head>
            <body>
                <h2>Horario 1º DAW</h2>
                <table border="1" align="center" width="80%">
                    <xsl:apply-templates select="horario/dia"/>
                </table> 
            </body>
        </html>
    </xsl:template>
    
   
   <xsl:template match="dia">
       <tr>

           <th><xsl:value-of select="@desc"/></th>
           <xsl:for-each select="hora">
               <xsl:sort select="@orden" order="ascending"/>
               <xsl:call-template name="creaCelda">
                   <xsl:with-param name="materia">
                       <xsl:value-of select="."/>
                   </xsl:with-param>
               </xsl:call-template>
               
           </xsl:for-each>
           
       </tr>
   </xsl:template>
   
   <xsl:template name="creaCelda">
       <xsl:param name="materia"/>
       <td>
           <xsl:if test="position() mod 2 = 1">
               <xsl:attribute name="style">background: lightgreen</xsl:attribute>
           </xsl:if>
           <xsl:value-of select="$materia"/>
       </td>
   </xsl:template>
    
    
    
    
   <xsl:template name="css">
       <style type="text/css">
           td {
           text-align: center;
           width: 60px;
           height: 60px;
           }
           th {
           text-align: left;
           width: 60px;
           height: 60px;
           background: #4f6d8f;
           font-size: 16px;
           color: white;
           }
           img {
           width: 40px;
           }
       </style>
   </xsl:template>
   
   
   

   
    
</xsl:stylesheet>