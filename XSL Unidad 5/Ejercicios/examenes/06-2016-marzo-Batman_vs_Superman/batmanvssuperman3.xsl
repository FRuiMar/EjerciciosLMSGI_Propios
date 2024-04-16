<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output method="html" encoding="iso-8859-1"/>
  <xsl:template match="/cine">
    <html>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
        <title><xsl:value-of select="titulo/@nombre"/></title>
        <style type="text/css">
          <xsl:call-template name="css"/>
        </style></head>
      <body>
        
        <div style="width: 1000px; margin: 0 auto;" align="center">
          
           <xsl:apply-templates select="titulo"></xsl:apply-templates>
          
          <xsl:apply-templates select="sesiones"></xsl:apply-templates>
          
          <xsl:apply-templates select="cartelera"></xsl:apply-templates>
          
   
        </div>
      </body>
    </html>
  </xsl:template>
  
  
  <!-- Template ap-b -->
  
  <xsl:template match="titulo">
    <h1>
      <xsl:value-of select="@nombre"/>
    </h1>
    <img src="{imagen/.}" width="500px"/>
    <h2><xsl:value-of select="@nombre"/></h2>
    <h3><xsl:value-of select="@estreno"/></h3>
    <p></p>
  </xsl:template>  
  
  <xsl:template match="cartelera">
    <h1>Cartelera</h1>
    <xsl:for-each select="pelicula">
      <div class="card">
        <xsl:variable name="titulo"><xsl:value-of select="@id"/></xsl:variable>
        <img src="{/cine/imagenes/imagen[$titulo = @id]}" style="width:5%"/>
          <div class="container">
            <h4><b><xsl:value-of select="@id"/></b></h4>
            <p></p>
          </div>
      </div> 
    </xsl:for-each>
   
  </xsl:template>
  
  
  <xsl:template match="sesiones">
    <table border="1" width="100%">
      <xsl:for-each select="sesion">
        <tr>
          <td align="center">
            <xsl:if test="position() mod 2 = 1">
              <xsl:attribute name="style">background: #dbf7ff;</xsl:attribute>
            </xsl:if>
            Sesión <xsl:value-of select="position()"/>: <xsl:value-of select="@hora"/>
            <!--  <tr> -->
              <table border="1" width="50%" align="center">          
                <xsl:call-template name="asientos"/>  
              </table>
              <!--    </tr> -->
            
            
          </td>
        </tr>  
      </xsl:for-each>
      
    </table>
  </xsl:template>
  
  <xsl:template name="asientos">
    
      <xsl:for-each select=".">
        <xsl:call-template name="bucleForFila">
          <xsl:with-param name="i">1</xsl:with-param>
        </xsl:call-template>  
      </xsl:for-each>
      
  </xsl:template>
  
  <xsl:template name="bucleForFila">
    <xsl:param name="i"/>
    <xsl:if test="$i &lt;= 4">
      <tr>
        <xsl:call-template name="bucleForColumna">
          <xsl:with-param name="i"><xsl:value-of select="$i"/></xsl:with-param>
          <xsl:with-param name="j">1</xsl:with-param>
        </xsl:call-template>
      </tr>
      <xsl:call-template name="bucleForFila">
        <xsl:with-param name="i"><xsl:value-of select="$i + 1"/></xsl:with-param>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  
  
  <xsl:template name="bucleForColumna">
    <xsl:param name="i"/>
    <xsl:param name="j"/> 
    <xsl:if test="$j &lt;= 4">
      <xsl:call-template name="celda">
        <xsl:with-param name="x"><xsl:value-of select="$j"/></xsl:with-param>
        <xsl:with-param name="y"><xsl:value-of select="$i"/></xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="bucleForColumna">
        <xsl:with-param name="i"><xsl:value-of select="$i"/></xsl:with-param>
        <xsl:with-param name="j"><xsl:value-of select="$j + 1"/></xsl:with-param>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  
  
  <xsl:template name="celda">
    <xsl:param name="x"/>
    <xsl:param name="y"/>
    <td align="center">
      <xsl:choose>
        <xsl:when test="ocupado[$x = @asiento and $y = @fila]">
          <img src="{/cine/imagenes/imagen[@id = 'ocupado']}"/>
        </xsl:when>
        <xsl:otherwise>
          <img src="{/cine/imagenes/imagen[@id = 'libre']}"/>
        </xsl:otherwise>
      </xsl:choose>
    </td>
  </xsl:template>
  
  <xsl:template name="css">
    
    body {
    font-family: Arial;
    font-size: 12px;
    }
    
    img:hover {
    opacity: 0.8;
    scale: 1.1;
    
    }
    
    h1,h2,h3 {
    text-align: center;
    }
       
    
  </xsl:template>
  
</xsl:stylesheet>