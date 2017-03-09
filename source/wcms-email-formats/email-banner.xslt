<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output indent="yes" method="xml"/>
  <xsl:include href="/_internal/email/formats/email-variables"/>
  <xsl:template match="/system-index-block">
    <xsl:apply-templates select="calling-page/system-page"/>
  </xsl:template>
    
  <xsl:template match="system-page">
    <xsl:if test="system-data-structure/feature != '/'">
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

    <xsl:variable name="headline-optional-url">
      <xsl:choose>
        <xsl:when test="asset-link/link != '' or url != ''">
          <h3> <a href="{asset-link/link}{url}{$trackingURL}"> <xsl:value-of select="headline"/> </a> </h3>
        </xsl:when>
        <xsl:otherwise>
          <h3> <xsl:value-of select="headline"/> </h3>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <!-- END BILLBOARD A HREF -->
    
    <!-- BILLBOARD HTML -->
    <xsl:if test="image/path != '/'">
      <tr>
        <td class="full-width mWidth">
          <xsl:copy-of select="$banner-link"/>
        </td>
      </tr>
    </xsl:if>
    <!-- END BILLBOARD HTML -->

    <!-- NEWSLETTER FEATURE HEADLINE AND TEASER -->

    <xsl:if test="headline != ''">
      <tr>
        <td align="left" class="mWidth large-spacing-left large-spacing-right spacing-bottom-top align-left">
          <!-- HEADLINE -->
          <xsl:for-each select="headline">
            <xsl:if test=". != ''">
              <xsl:copy-of select="$headline-optional-url"/>
            </xsl:if>
          </xsl:for-each>
        </td>
      </tr>
    </xsl:if>  
          <!-- END HEADLINE -->
      <xsl:if test="teaser != ''">
      <tr>
        <td align="left" class="mWidth large-spacing-left large-spacing-right spacing-bottom align-left">
          <!-- TEASER-->
            <xsl:for-each select="teaser">
              <xsl:if test=". != ''">
                <span><xsl:copy-of select="node()"/></span>
              </xsl:if>
            </xsl:for-each>
          <!-- END TEASER-->
        </td>
      </tr> 
    </xsl:if>      
    <!-- END NEWSLETTER FEATURE HEADLINE AND TEASER-->
      
  </xsl:template>

</xsl:stylesheet>