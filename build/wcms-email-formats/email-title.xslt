<?xml version="1.0" encoding="UTF-8"?>
	<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output indent="yes" method="xml"/>
	<xsl:template match="/system-index-block">
	  <xsl:apply-templates select="calling-page/system-page"/>
	</xsl:template>
  <xsl:template match="system-page">
		<xsl:if test="title != ''">
			<td align="left" class="mWidth title align-left">
				<h1 class="align-left"><xsl:value-of select="title"/></h1>
			</td>
		</xsl:if>
  </xsl:template>

</xsl:stylesheet>