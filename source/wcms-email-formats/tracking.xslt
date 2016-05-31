<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output indent="yes" method="xml"/>
    <xsl:include href="site://_library/formats/Format Date"/>
    <xsl:include href="/_internal/blocks/email/formating/email-title"/>

    <xsl:template match="/system-index-block">
        <xsl:apply-templates select="calling-page/system-page"/>
    </xsl:template>

    <xsl:variable name="email-title">
    	<xsl:text><xsl:value-of select="normalize-space(title)"/></xsl:text>
    </xsl:variable>

     <xsl:variable name="tracking-vars">
     	<xsl:text>?utm_source=</xsl:text><xsl:value-of select="$email-title"/><xsl:text>&amp;utm_medium=email&amp;utm_campaign=tuesday-newsday</xsl:text>
   </xsl:variable>

</xsl:stylesheet>