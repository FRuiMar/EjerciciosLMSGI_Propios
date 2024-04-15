<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output method="html" encoding="iso-8859-1"/>
  <xsl:template match="/partidoBalonces-3.xml">
    <html>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
        <title><xsl:value-of select="@nombre"/></title>
        <style type="text/css">
          <xsl:call-template name="css"/>
        </style></head>
      <body>
        <div style="width: 1000px; margin: 0 auto;">
          <h1 align="center">Baloncesto: Baloncesto Lucena 2 - Unicaja Baloncesto</h1>
          <table align="center" border="1" width="50%">
            <tr>
              <th>Tiempo</th>
              <th>Jugador</th>
              <th>Apodo</th>
              <th>Descripcion</th>
              <th>Icono</th>
            </tr>
            <tr>
              <xsl:for-each select="historico">
                <xsl:call-template name="historico">
                  
                </xsl:call-template>
              </xsl:for-each>
         
            </tr>
          </table>
        </div>
      </body>
    </html>
  </xsl:template>
  
  
  <!-- Template -->
  
  <xsl:template name="historico">
    <xsl:param name="tipo"/> 
    <xsl:for-each select="entrada">
      <xsl:sort select="@tiempo"></xsl:sort>
      
      <tr>
        
        <td><xsl:value-of select="@tiempo"/></td>
        <td><xsl:value-of select="@jugador"/></td>
        <td>
          <xsl:variable name="nombre"><xsl:value-of select="@jugador"/></xsl:variable>
          <xsl:for-each select="/partidoBaloncesto/equipo/jugador">
            <xsl:if test="@nombre = $nombre">
              <xsl:value-of select="@apodo"/>
            </xsl:if>
          </xsl:for-each>
        </td>
        <td><xsl:value-of select="."/></td>
       
        <td>
          <xsl:variable name="tipo"><xsl:value-of select="@tipo"/></xsl:variable>
          <img src="{../imagen[@tipo = $tipo]}"></img>  
        </td>
        
      </tr>
    </xsl:for-each>
  </xsl:template>  
  
  
  <xsl:template name="css">
    
    body {
    font-family: Arial;
    font-size: 11px;
    }
    
    table img {
    width: 40px;
    }
    
    th {
    background: #1e3356;
    color: #FFFFFF;
    }
    
    #tablaCancha {
    color: #eff4fc;
    }
    
    ol, ul
    {
    margin-top: 10px;
    margin-left: 0px;
    }
    
    #menu li
    {
    margin-left: 0px;
    display: inline;
    list-style-type: none;
    padding: 10px 50px;
    }
    
    .noticia {
    /* border: #000 solid 1px; */
    padding: 10px 5px;
    float: left; 
    width: 338px;
    }
    
    .noticia img {
    width: 338px;
    }
    
    .noticiaDobleAncho {
    /* border: #000 solid 1px; */
    padding: 10px 5px;
    float: left; 
    width: 690px;
    }
    
    .noticiaDobleAncho img {
    width: 690px;
    }
    
    .fechaNoticia {
    color: #A3A34B;
    }
    
    .comentariosNoticia {
    color: #A3A34B;
    padding-left: 20px;
    }
    
    .divPublicidad {
    /* border: #000 solid 1px; */
    padding: 10px 5px;
    float: right; 
    width: 280px;                 
    }
    
    .divPublicidad img {
    width: 200px;
    }
    
    
  </xsl:template>
  
</xsl:stylesheet>