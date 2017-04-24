<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output indent="yes" method="xml"/>
    <xsl:include href="/_internal/email/formats/email-variables"/>
    
    <xsl:template match="system-page">
        <td align="left" class="logo mWidth align-left">
            <a href="{$ucscURL}{$trackingURL}">
                <img alt="University of California, UC Santa Cruz" border="0" class="logoImg" src="http://emailbuilder.ucsc.edu/images/logo.png" width="220"/>
            </a>
        </td>
    </xsl:template>
</xsl:stylesheet>