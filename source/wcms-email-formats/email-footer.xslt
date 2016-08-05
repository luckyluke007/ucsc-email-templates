<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output indent="yes" method="xml" omit-xml-declaration="yes"/>
  <xsl:include href="/_internal/email/formats/email-variables"/>
 

  <xsl:template match="system-page">
    <!-- FOOTER CODE -->
      <xsl:copy-of select="system-data-structure/footer/content"/>
    <!-- END FOOTER CODE -->
  </xsl:template>

</xsl:stylesheet>