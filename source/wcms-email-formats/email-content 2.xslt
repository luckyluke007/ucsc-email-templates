<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output indent="yes" method="xml"/>
  <xsl:include href="/_internal/email/formats/email-variables"/>
    
 
  <xsl:template match="system-page">
    <!-- EVENTS CONTENT -->
    <xsl:for-each select="system-data-structure/feature/content">
      <xsl:if test=". != ''">
        <td align="center" class="mWidth spacing-top spacing-bottom large-spacing-left large-spacing-right">
          <xsl:copy-of select="node()"/>
        </td>
      </xsl:if>
    </xsl:for-each>

    <!-- ADDITIONAL CONTENT -->
    <xsl:for-each select="system-data-structure/additional-content">
      <!-- Section Title -->
      <xsl:if test="title != ''">
        <tr>
          <td align="left" class="mWidth section-title align-left">
            <h2><xsl:value-of select="title"/></h2>
          </td>
        </tr>
      </xsl:if>
    </xsl:for-each>


    <xsl:for-each select="system-data-structure/additional-content/section-content">
      <xsl:if test="image/link != null">
        <tr>
            <td align="center" class="mWidth spacing-top spacing-bottom spacing-left spacing-right">
              <xsl:for-each select="section-text">
                  <xsl:if test=". !='' ">
                    <xsl:copy-of select="node()"/>
                  </xsl:if>
              </xsl:for-each>
            </td>
          </tr>
      </xsl:if>
      <xsl:if test="image/link !=''">
        <tr>
          <td class="mWidth section-content">
          <table align="left" border="0" cellspacing="0" cellpadding="0" width="250" class="mWidth">
            <tr>
              <td class="mWidth">
                <img src="{link}" align="left" width="250" height="185" alt="{image-alt}" class="mFullImage"></img>
              </td>
            </tr>
          </table>

          <table align="right" border="0" cellspacing="0" cellpadding="0" width="340" class="mWidth">
            <tr>
              <td class="mWidth spacing-top align-left">
               <xsl:for-each select="section-text">
                  <xsl:if test=". !='' ">
                    <xsl:copy-of select="node()"/>
                  </xsl:if>
              </xsl:for-each>
            </td>
            </tr>
          </table>
          </td>
        </tr>
      </xsl:if>
    </xsl:for-each>

  </xsl:template> 
</xsl:stylesheet>