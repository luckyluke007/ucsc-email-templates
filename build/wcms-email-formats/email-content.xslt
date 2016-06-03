<?xml version="1.0" encoding="UTF-8"?>
  <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output indent="yes" method="xml"/>
  <xsl:include href="/_internal/blocks/email/formating/email-variables"/>
  <xsl:template match="/system-index-block">
    <xsl:apply-templates select="calling-page/system-page"/>
  </xsl:template>

<xsl:template match="system-page">
    <xsl:for-each select="system-data-structure/feature/content">
        <xsl:if test=". != ''">
          <td align="center" class="mWidth spacing-top spacing-bottom">
            <xsl:copy-of select="node()"/>
          </td>
        </xsl:if>
      </xsl:for-each>
</xsl:template>
</xsl:stylesheet>