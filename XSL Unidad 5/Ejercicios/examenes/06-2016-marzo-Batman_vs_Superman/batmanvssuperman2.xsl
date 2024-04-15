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
        
        <div style="width: 1000px; margin: 0 auto;">
          
           <xsl:apply-templates select="titulo"></xsl:apply-templates>
          
          <xsl:apply-templates select="sesiones"></xsl:apply-templates>
          
            <table border="1" width="100%">
              <tr>
                <td align="center" style="background:#dbf7ff;">
                  Sesión:
                  1
                  - Hora:
                  16:30
                  <table border="1" width="50%" align="center">
                    <tr>
                      <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/libre.png"/></td>
                      <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/libre.png"/></td>
                      <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/libre.png"/></td>
                      <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/libre.png"/></td>
                      <tr>
                        <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/libre.png"/></td>
                        <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/libre.png"/></td>
                        <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/ocupado.png"/></td>
                        <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/ocupado.png"/></td>
                        <tr>
                          <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/libre.png"/></td>
                          <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/libre.png"/></td>
                          <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/libre.png"/></td>
                          <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/libre.png"/></td>
                          <tr>
                            <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/ocupado.png"/></td>
                            <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/libre.png"/></td>
                            <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/libre.png"/></td>
                            <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/libre.png"/></td>
                          </tr>
                        </tr>
                      </tr>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td align="center" style="background:&#xA;                #FFFFFF&#xA;              ;">
                  Sesión:
                  2
                  - Hora:
                  18:30
                  <table border="1" width="50%" align="center">
                    <tr>
                      <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/libre.png"/></td>
                      <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/ocupado.png"/></td>
                      <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/ocupado.png"/></td>
                      <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/libre.png"/></td>
                      <tr>
                        <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/libre.png"/></td>
                        <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/libre.png"/></td>
                        <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/libre.png"/></td>
                        <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/libre.png"/></td>
                        <tr>
                          <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/libre.png"/></td>
                          <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/ocupado.png"/></td>
                          <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/ocupado.png"/></td>
                          <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/libre.png"/></td>
                          <tr>
                            <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/libre.png"/></td>
                            <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/libre.png"/></td>
                            <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/libre.png"/></td>
                            <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/libre.png"/></td>
                          </tr>
                        </tr>
                      </tr>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td align="center" style="background:#dbf7ff;">
                  Sesión:
                  3
                  - Hora:
                  20:30
                  <table border="1" width="50%" align="center">
                    <tr>
                      <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/libre.png"/></td>
                      <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/libre.png"/></td>
                      <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/libre.png"/></td>
                      <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/libre.png"/></td>
                      <tr>
                        <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/libre.png"/></td>
                        <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/ocupado.png"/></td>
                        <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/ocupado.png"/></td>
                        <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/libre.png"/></td>
                        <tr>
                          <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/libre.png"/></td>
                          <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/libre.png"/></td>
                          <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/libre.png"/></td>
                          <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/libre.png"/></td>
                          <tr>
                            <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/libre.png"/></td>
                            <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/ocupado.png"/></td>
                            <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/ocupado.png"/></td>
                            <td align="center"><img src="http://www.webdidacticarafaelmunoz.appspot.com/lmsgi/image/batmanvssumperman/libre.png"/></td>
                          </tr>
                        </tr>
                      </tr>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
        </div>
        
      </body>
    </html>
  </xsl:template>
  
  
  <!-- Template ap-b -->
  
  <xsl:template match="titulo">
    <h1><xsl:value-of select="@nombre"/></h1>
    <img src="{imagen/.}" width="500px"/>
    <h2><xsl:value-of select="@nombre"/></h2>
    <h3><xsl:value-of select="@estreno"/></h3>
    <p></p>
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
          </td>
        </tr>  
      </xsl:for-each>
      
    </table>
  </xsl:template>
  
  
  <xsl:template name="css">
    
    body {
    font-family: Arial;
    font-size: 12px;
    }
    
    
  </xsl:template>
  
</xsl:stylesheet>