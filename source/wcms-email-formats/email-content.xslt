 <?xml version="1.0" encoding="UTF-8"?>
	<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output indent="yes" method="xml"/>
	<xsl:include href="/_internal/blocks/email/formating/email-variables"/>
	<xsl:template match="/system-index-block">
	  <xsl:apply-templates select="calling-page/system-page"/>
	</xsl:template>
		
	<xsl:template match="system-page">
    <xsl:if test="system-data-structure/feature/ != ''">
        <xsl:apply-templates select="system-data-structure/feature/content"/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="content">
		<xsl:variable name="content-text">
      <xsl:choose>
        <xsl:when test="content !=''">
            <xsl:value-of select="content"/>
        </xsl:when>
      </xsl:choose>
    </xsl:variable>

  	
  </xsl:template>
</xsl:stylesheet>