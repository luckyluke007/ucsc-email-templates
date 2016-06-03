<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output indent="yes" method="xml"/>
    <xsl:include href="/_internal/blocks/email/formating/email-variables"/>
    <xsl:template match="/system-index-block">
        <xsl:apply-templates select="calling-page/system-page"/>
    </xsl:template>

    <xsl:template match="system-page">
        <xsl:if test="system-data-structure/more-content/section-content/content-image/path != '/'">
          <xsl:apply-templates select="system-data-structure/more-content/section-content/content-image">
        </xsl:if>

    <xsl:template match="content-image">
        <tr>
          <xsl:if test="content-image/path !='/'">
            <xsl:if test="contains('empty.png',content-image/name)">
              <!-- Empty to print caption --><br/>
            </xsl:if>
            <xsl:if test="not(contains('empty.png',content-image/name))">
              <td>
              <img alt="{section-content/image-alt}" src="{content-image/path}"/>
            </td>
            </xsl:if>
          </xsl:if>
        </tr>
    </xsl:template>

</xsl:stylesheet>