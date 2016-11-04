<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output indent="yes" method="xml"/>

  <xsl:template match="system-page">
		
		<xsl:for-each select="system-data-structure">
			<xsl:if test="email-title != ''">
				<tr>
					<td align="left" class="mWidth title align-left">
						<h1 class="align-left"><xsl:copy-of select="email-title"/></h1>
					</td>
				</tr>
			</xsl:if>
		</xsl:for-each>

  </xsl:template>
</xsl:stylesheet>