<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output indent="yes" method="xml"/>
  <xsl:include href="/_internal/blocks/email/formating/email-variables"/>
  <xsl:template match="/system-index-block">
    <xsl:apply-templates select="calling-page/system-page"/>
  </xsl:template>
    
 
  <xsl:template match="system-page">
    <!-- EVENTS CONTENT -->
    <xsl:for-each select="system-data-structure/feature/content">
      <xsl:if test=". != ''">
        <td align="center" class="mWidth spacing-top spacing-bottom large-spacing-left large-spacing-right">
          <xsl:copy-of select="node()"/>
        </td>
      </xsl:if>
    </xsl:for-each>

    <!-- OTHER CONTENT -->
    <xsl:for-each select="system-data-structure/other-content">
      <!-- Section Title -->
      <xsl:if test="title != ''">
        <tr>
          <td align="left" class="mWidth section-title align-left">
            <h2><xsl:value-of select="title"/></h2>
          </td>
        </tr>
      </xsl:if>
    </xsl:for-each>

  </xsl:template>  
</xsl:stylesheet>