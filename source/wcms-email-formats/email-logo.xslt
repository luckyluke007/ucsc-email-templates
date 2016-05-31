<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output indent="yes" method="xml"/>
    <xsl:include href="/_internal/blocks/email/formating/email-variables"/>
    <xsl:template match="/system-index-block">
        <xsl:apply-templates select="calling-page/system-page"/>
    </xsl:template>
    <xsl:template match="system-page">
        <td align="left" class="logo mWidth align-left" style="border-collapse: collapse !important; font-family: 'Helvetica Neue', Arial, Helvetica, sans-serif; text-align: left; padding: 15px;">
            <a href="{$ucscURL}">
                <img alt="University of California, UC Santa Cruz" border="0" src="http://luckyluke007.github.io/ucsc-email-templates/build/assets/logo.png" style="display: block; padding-bottom: 5px;"/>
            </a>
        </td>
    </xsl:template>
</xsl:stylesheet>