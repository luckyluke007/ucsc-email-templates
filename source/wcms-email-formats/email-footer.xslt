<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output indent="yes" method="xml" omit-xml-declaration="yes"/>
  <xsl:include href="/_internal/email/formats/email-variables"/>
 

  <xsl:template match="system-page">
    <!-- FOOTER CODE -->
      <xsl:if test="system-data-structure/footer/path != ''">
        <xsl:apply-templates mode="homepage-block" select="system-data-structure/footer/path"/>
      </xsl:if>
    <!-- END FOOTER CODE -->
  </xsl:template>

</xsl:stylesheet>