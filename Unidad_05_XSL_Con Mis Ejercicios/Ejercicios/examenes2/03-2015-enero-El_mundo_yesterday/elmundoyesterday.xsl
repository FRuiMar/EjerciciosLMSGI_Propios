<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8"/>
    
    <xsl:template match="/periodico">
        <html>
            <head>
                <title><xsl:value-of select="@nombre"/></title>
                <xsl:call-template name="css"></xsl:call-template>
            </head>
            <body>
                <div style="width: 1000px; margin: 0 auto;">
                    <div style="width: 1000px;"><img src="{@logo}" width="997" height="115"/></div>
                    <div id="menu" style="width: 1000px; margin: 0px; padding: 0px;">    
                        <ul>
                        <xsl:for-each select="menu/enlace">
                            <li>
                                <xsl:if test="position() mod 2 = 1">
                                    <!-- los atributos se aplican al primer elemento anterior
                                    en este caso "li"  que es un elemento de la lista -->
                                    <xsl:attribute name="style">
                                        background:#DDE640;
                                    </xsl:attribute>
                                </xsl:if>
                                <xsl:if test="position() mod 2 = 0">
                                    <xsl:attribute name="style">
                                        background:orange;
                                    </xsl:attribute>
                                </xsl:if>
                                <!-- dentro del elemento lista una vez elegido el color 
                                    pongo el href dentro de un <a> que es un enlace-->
                                <a href="#"><xsl:value-of select="."/></a>
                            </li>    
                        </xsl:for-each>
                        </ul>
                    </div>
                    <div style="width: 700px; float: left;">
                        <!-- deben aplicar las plantillas a todos los elementos noticia 
                            que son hijos del elemento noticias en el documento XML 
                            de origen. La instrucción xsl:apply-templates hace que 
                            el procesador XSLT busque y aplique las plantillas 
                            correspondientes a esos elementos noticia.   
                        
                        más a bajo el template tendrá que tener un match="noticia"-->
                        <xsl:apply-templates select="noticias/noticia"/> 
                    </div>
                    <div style="width: 295px; float: right;">
                        <xsl:for-each select="publicidad/anuncio">
                            <xsl:sort select="@orden" order="ascending"/>
                            <div class="divPublicidad"><img width="280px" src="{@imagen}"></img></div>
                                
                            
                            
                        </xsl:for-each>
                    </div>
                </div>
            </body>
        </html>
       
    </xsl:template>
    
    
    
    
    <xsl:template match="noticia">
        <div>
            <xsl:choose>
                <xsl:when test="@dobleAncho = 's'">
                    <xsl:attribute name="class">noticiaDobleAncho</xsl:attribute>                       
                </xsl:when>
                <xsl:when test="@dobleAncho = 'n'">
                    <xsl:attribute name="class">noticia</xsl:attribute>                       
                </xsl:when>
            </xsl:choose>
            <h2><xsl:value-of select="titular"/></h2>
            <h4><xsl:value-of select="subtitular"/></h4>
            <img src="{@imagen}"></img>
            <br/>
            <span class="fechaNoticia">Publicado el <xsl:value-of select="@fecha"/></span>
            <span class="comentariosNoticia"><xsl:value-of select="@comentarios"/> comentarios</span>
            
        </div>
    </xsl:template>
    
    
    
    <xsl:template name="css">
        <style type="text/css">
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
        </style>
    </xsl:template>
</xsl:stylesheet>