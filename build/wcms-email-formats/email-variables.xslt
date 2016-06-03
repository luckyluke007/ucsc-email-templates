<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output indent="yes" method="xml"/>
    <xsl:template match="/system-index-block">
        <xsl:apply-templates select="calling-page/system-page"/>
    </xsl:template>
    <!-- UCSC URL -->
    <xsl:variable name="ucscURL">
        <xsl:text>http://www.ucsc.edu</xsl:text>
    </xsl:variable>
    <!-- SITE URL -->
    <xsl:variable name="siteURL">
        <xsl:text>http://messaging.ucsc.edu</xsl:text>
    </xsl:variable>
    <!-- PAGE URL -->
    <xsl:variable name="pageURL">
      <xsl:value-of select="$siteURL"/>
      <xsl:value-of select="/system-index-block/system-page/link"/>.html
    </xsl:variable>
    
    <!-- TRACKING URL -->
    <xsl:variable name="trackingURL">
      <xsl:text>?utm_source=</xsl:text>
      <xsl:value-of select="/system-index-block/calling-page/system-page/name"/>
      <xsl:text>&amp;utm_medium=email&amp;utm_campaign=</xsl:text>
      <xsl:value-of select="/system-index-block/calling-page/system-page/site"/>
      <xsl:value-of select="/system-index-block/calling-page/system-page/last-modified-by"/>
    </xsl:variable>

</xsl:stylesheet>