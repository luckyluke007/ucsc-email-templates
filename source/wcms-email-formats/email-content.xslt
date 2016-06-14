<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
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
          <xsl:choose>
             <xsl:when test="title != ''">
               <tr>
                <td align="left" class="mWidth section-title align-left">
                  <h2><xsl:value-of select="title"/></h2>
                </td>
              </tr>
             </xsl:when>
             <xsl:otherwise>
               <!-- EMPTY TITLE -->
             </xsl:otherwise>
          </xsl:choose>
          <xsl:choose>
            <xsl:when test="section-content/image/link != ''">
              <tr>
                <td class="mWidth section-content">
                <table align="left" border="0" cellspacing="0" cellpadding="0" width="250" class="mWidth">
                  <tr>
                    <td class="mWidth">
                      <img src="{link}" align="left" width="250" height="185" alt="{image-alt}" class="mFullImage"></img>
                    </td>
                  </tr>
                </table>
                <!-- END LEFT COLUMN -->
                <!--[if (gte mso 9)|(IE)]>
                    </td>
                    <td width="340" valign="top">
                <![endif]-->
                <!-- RIGHT COLUMN -->
                <table align="right" border="0" cellspacing="0" cellpadding="0" width="340" class="mWidth">
                  <tr>
                    <td class="mWidth spacing-top align-left">
                     <h3><a href="#"><xsl:value-of select="section-content/headline"/></a></h3>
                     <xsl:for-each select="section-content/section-text">
                        <xsl:if test=". !='' ">
                          <xsl:copy-of select="node()"/>
                        </xsl:if>
                    </xsl:for-each>
                  </td>
                  </tr>
                </table>
                </td>
              </tr>
            </xsl:when>
            <xsl:otherwise>
              <tr>
                <td class="mWidth spacing-top spacing-bottom spacing-left spacing-right">
                  <h3><a href="#"><xsl:value-of select="section-content/headline"/></a></h3>
                  <xsl:for-each select="section-content/section-text">
                      <xsl:if test=". !='' ">
                        <xsl:copy-of select="node()"/>
                      </xsl:if>
                  </xsl:for-each>
                </td>
              </tr>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>