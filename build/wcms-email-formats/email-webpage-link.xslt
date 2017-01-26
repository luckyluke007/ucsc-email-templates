<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output indent="yes" method="xml"/>
    <xsl:include href="/_internal/email/formats/email-variables"/>
    <xsl:template match="/system-index-block">
        <xsl:apply-templates select="calling-page/system-page"/>
    </xsl:template>
    <xsl:template match="system-page">
        <td align="left" class="mWidth align-center">
            <a href="{$pageURL}{$trackingURL}">
                View this email in a web page
            </a>
        </td>
    </xsl:template>
</xsl:stylesheet>