<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output method="html" encoding="iso-8859-1"/>
  
  <xsl:template match="/cine">
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
            <title><xsl:value-of select="@nombre"/></title>
            <style type="text/css">
                <xsl:call-template name="css"/>
            </style>
        </head>
        <body>
            <div style="width: 1000px; margin: 0 auto;">
         
            </div>
        </body>
    </html>
  </xsl:template>