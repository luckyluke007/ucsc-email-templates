<?xml version="1.0" encoding="UTF-8"?>
	<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output indent="yes" method="xml"/>
	<xsl:include href="/_internal/blocks/email/formating/email-variables"/>
	<xsl:template match="/system-index-block">
	  <xsl:apply-templates select="calling-page/system-page"/>
	</xsl:template>
		
	<xsl:template match="system-page">
    <xsl:if test="system-data-structure/feature/ != ''">
        <xsl:apply-templates select="system-data-structure/feature"/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="feature">
		<xsl:variable name="feature-image">
      <xsl:choose>
        <xsl:when test="image/path !='/'">
            <xsl:value-of select="image/path"/>
        </xsl:when>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="feature-alt">
      <xsl:choose>
        <xsl:when test="image-alt !=''">
            <xsl:value-of select="image-alt"/>
        </xsl:when>
      </xsl:choose>
    </xsl:variable>


  	<tr>
  		<td class="full-width mWidth" style="border-collapse: collapse !important; font-family: 'Helvetica Neue', Arial, Helvetica, sans-serif; padding: 0;">
  			<img src="{$siteURL}{$feature-image}" alt="{$feature-alt}" width="640" height="325" class="mFullImage" style="display: block; padding-bottom: 5px;" />
  		</td>
  	</tr>
  </xsl:template>
</xsl:stylesheet>