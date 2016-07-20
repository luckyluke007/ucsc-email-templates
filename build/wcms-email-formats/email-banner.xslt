<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output indent="yes" method="xml"/>
  <xsl:include href="/_internal/email/formats/email-variables"/>
  <xsl:template match="/system-index-block">
    <xsl:apply-templates select="calling-page/system-page"/>
  </xsl:template>
    
  <xsl:template match="system-page">
    <xsl:if test="system-data-structure/feature/image/path != '/'">
        <xsl:apply-templates select="system-data-structure/feature"/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="feature">
    
    <!-- BILLBOARD IMAGE  VARIABLE -->
    <xsl:variable name="feature-image">
      <xsl:choose>
        <xsl:when test="image/path !='/'">
            <xsl:value-of select="image/path"/>
        </xsl:when>
      </xsl:choose>
    </xsl:variable>
    <!-- END BILLBOARD IMAGE  VARIABLE -->
    
    <!-- BILLBOARD IMAGE ALT -->
    <xsl:variable name="feature-alt">
      <xsl:choose>
        <xsl:when test="image-alt !=''">
            <xsl:value-of select="image-alt"/>
        </xsl:when>
      </xsl:choose>
    </xsl:variable>
    <!-- END BILLBOARD IMAGE ALT -->
    
    <!-- BILLBOARD A HREF -->
    <xsl:variable name="banner-link">
      <xsl:choose>
        <xsl:when test="url != '' or asset-link/link !='' ">
          <a href="{url}{asset-link/link}{$trackingURL}">
            <img alt="{$feature-alt}" class="mFullImage" src="{$feature-image}" width="640"/>
          </a>
        </xsl:when>
        <xsl:otherwise>
          <img alt="{$feature-alt}" class="mFullImage" src="{$feature-image}" width="640"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="">
      
    </xsl:variable>
    <!-- END BILLBOARD A HREF -->
    
    <!-- BILLBOARD HTML -->
    <tr>
      <td class="full-width mWidth">
        <xsl:copy-of select="$banner-link"/>
      </td>
    </tr>
    <!-- END BILLBOARD HTML -->

    <!-- NEWSLETTER FEATURE HEADLINE AND TEASER -->

    <xsl:if test="teaser != ''">
      <tr>
        <td align="left" class="mWidth content align-left">
          <!-- HEADLINE -->
            <a href="{url}{asset-link/link}{$trackingURL}">
              <h2><xsl:value-of select="headline"/></h2>
            </a>
          <!-- END HEADLINE -->
          <!-- TEASER-->
            <xsl:for-each select="teaser">
              <xsl:if test=". != ''">
                <p><xsl:copy-of select="node()"/></p>
              </xsl:if>
            </xsl:for-each>
          <!-- END TEASER-->
        </td>
      </tr> 
    </xsl:if>      
    <!-- END NEWSLETTER FEATURE HEADLINE AND TEASER-->
    
      
  </xsl:template>

</xsl:stylesheet>