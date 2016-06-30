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
        <xsl:when test="url-link != '' or asset-link/link !='' ">
          <a href="{url-link}{asset-link/link}{$trackingURL}">
            <img src="{$siteURL}{$feature-image}" alt="{$feature-alt}" width="640" height="325" class="mFullImage"></img>
          </a>
        </xsl:when>
        <xsl:otherwise>
          <img src="{$siteURL}{$feature-image}" alt="{$feature-alt}" width="640" height="325" class="mFullImage"></img>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <!-- END BILLBOARD A HREF -->

  	<tr>
  		<td class="full-width mWidth">
        <xsl:copy-of select="$banner-link"></xsl:copy-of>
  		</td>
  	</tr>
  </xsl:template>
</xsl:stylesheet>