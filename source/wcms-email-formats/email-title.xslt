<?xml version="1.0" encoding="UTF-8"?>
	<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output indent="yes" method="xml"/>
	<xsl:template match="/system-index-block">
	  <xsl:apply-templates select="calling-page/system-page"/>
	</xsl:template>
  <xsl:template match="system-page">
		<xsl:if test="title != ''">
			<td align="left" class="mWidth title align-left" style="color: #ffc500; width: 640px; border-collapse: collapse !important; font-family: 'Helvetica Neue', Arial, Helvetica, sans-serif; text-align: left; background: #00458c; padding: 10px 15px;">
				<h1 style="font-weight: normal; line-height: 1.25em; font-size: 32px; margin: 0;"><xsl:value-of select="title"/></h1>
			</td>
		</xsl:if>
  </xsl:template>

</xsl:stylesheet>