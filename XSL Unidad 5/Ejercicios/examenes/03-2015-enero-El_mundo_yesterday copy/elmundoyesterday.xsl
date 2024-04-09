<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output method="html" encoding="iso-8859-1"/>
  
  <xsl:template match="/periodico">
    <html>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
          <title><xsl:value-of select="@nombre"/></title>
        <style type="text/css">
            <xsl:call-template name="css"/>
          </style></head>
      <body>
        <div style="width: 1000px; margin: 0 auto;">
          <div style="width: 1000px;"><img src="{@logo}" width="997" height="115"/></div>
          <div id="menu" style="width: 1000px; margin: 0px; padding: 0px;">
            <ul>
              <xsl:for-each select="menu/enlace">
                <li>
                  <xsl:choose>
                    <xsl:when test="position() mod 2 = 1">
                      <xsl:attribute name="style">background:#DDE640</xsl:attribute>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:attribute name="style">background:orange</xsl:attribute>
                    </xsl:otherwise>
                  </xsl:choose>
                  <a href="#"><xsl:value-of select="."/></a>
                </li>
              </xsl:for-each> 
            </ul>
          </div>
         
          <div style="width: 700px; float: left;">
            <xsl:apply-templates select="noticias/noticia"/>
          </div>
         
          <div style="width: 300px; float: right;">
            <xsl:apply-templates select="publicidad"/>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>
  
  
  <xsl:template match="noticia">
    <div>
      <xsl:choose>
        <xsl:when test="@dobleAncho= 's'">
          <xsl:attribute name="class">noticiaDobleAncho</xsl:attribute>
        </xsl:when>
        <xsl:otherwise>
          <xsl:attribute name="class">noticia</xsl:attribute>
        </xsl:otherwise>
      </xsl:choose>

      <h2><xsl:value-of select="titular"/></h2>
      <h4><xsl:value-of select="subtitular"/></h4>
      <img src="{@imagen}"/>
      <br/>
      <span class="fechaNoticia"><xsl:value-of select="@fecha"/></span>
      <span class="comentariosNoticia"><xsl:value-of select="@comentarios"/> comentarios</span>
    </div>
  </xsl:template>


  <xsl:template match="publicidad">
    <xsl:for-each select="anuncio">
      <xsl:sort select="@orden"/>
      <div>
        <xsl:attribute name="class">divPublicidad</xsl:attribute>
        <img src="{@imagen}"></img>
      </div>
      
    </xsl:for-each>
  </xsl:template>
  
  
  
  
  
  
  
  
  <xsl:template name="css">
    
      body {
      font-family: Arial;
      font-size: 12px;
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
