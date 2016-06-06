<?xml version="1.0" encoding="UTF-8"?>
	<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output indent="yes" method="xml"/>
	<xsl:include href="/_internal/blocks/email/formating/email-variables"/>
	<xsl:template match="/system-index-block">
	  <xsl:apply-templates select="calling-page/system-page"/>
	</xsl:template>
		
	<xsl:template match="system-page">
    <xsl:if test="system-data-structure/feature/image/path != '/'">
      <xsl:apply-templates select="system-data-structure/feature"/>
    </xsl:if>
  </xsl:template>
  
  <xsl:template match="feature">
    <!-- FEATURE IMAGE -->
		<xsl:variable name="feature-image">
      <xsl:choose>
        <xsl:when test="image/path !='/'">
            <xsl:value-of select="image/path"/>
        </xsl:when>
      </xsl:choose>
    </xsl:variable>
    <!-- FEATURE IMAGE ALTERNATIVE TEXT -->
    <xsl:variable name="feature-alt">
      <xsl:choose>
        <xsl:when test="image-alt !=''">
            <xsl:value-of select="image-alt"/>
        </xsl:when>
      </xsl:choose>
    </xsl:variable>
    
    <!-- FEATURE IMAGE & ALTERNATIVE TEXT HTML CODE -->
  	<tr>
  		<td class="full-width mWidth">
        <img src="{$siteURL}{$feature-image}" alt="{$feature-alt}" width="640" height="325" class="mFullImage">
  		</td>
  	</tr>
  </xsl:template>
</xsl:stylesheet>