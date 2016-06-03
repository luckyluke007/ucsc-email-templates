<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output indent="yes" method="xml"/>
    <xsl:include href="/_internal/blocks/email/formating/email-variables"/>
    <xsl:template match="/system-index-block">
        <xsl:apply-templates select="calling-page/system-page"/>
    </xsl:template>
    <xsl:template match="system-page">
        <td align="left" class="logo mWidth align-left">
            <a href="{$ucscURL}">
                <img src="http://luckyluke007.github.io/ucsc-email-templates/build/assets/logo.png" alt="University of California, UC Santa Cruz">
            </a>
        </td>
    </xsl:template>
</xsl:stylesheet>