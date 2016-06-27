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
          <!-- VARIABLE IMAGE LINK -->
          <xsl:variable name="image-optional-url">
            <xsl:choose>
              <xsl:when test="section-content/other-link/link != '' or section-content/other-external-url != ''">
                <a href="{section-content/other-link/link}{section-content/other-external-url}{$trackingURL}"><img align="left" alt="{section-content/image-alt}" border="0" class="mFullImage" height="185" src="{section-content/image/path}" width="250"/></a>
              </xsl:when>
              <xsl:otherwise>
                <img align="left" alt="{section-content/image-alt}" border="0" class="mFullImage" height="185" src="{section-content/image/path}" width="250"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:variable>
          <!-- END VARIABLE IMAGE LINK -->

          <!-- VARIABLE HEADLINE LINK -->
          <xsl:variable name="headline-optional-url">
            <xsl:choose>
              <xsl:when test="section-content/other-link/link != '' or section-content/other-external-url != ''">
                <h3><a href="{section-content/other-link/link}{section-content/other-external-url}{$trackingURL}"><xsl:value-of select="section-content/headline"/></a></h3>
              </xsl:when>
              <xsl:otherwise>
                <h3><xsl:value-of select="section-content/headline"/></h3>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:variable>
          <!-- END VARIABLE HEADLINE LINK -->

          <xsl:if test="title != ''">
            <tr>
              <td align="left" class="mWidth section-title align-left">
                <h2><xsl:value-of select="title"/></h2>
              </td>
            </tr>
          </xsl:if>

          <xsl:for-each select="section-content">
            <xsl:choose>
              <xsl:when test="image/link != ''">
                <tr>
                  <td class="mWidth section-content">
                  <table align="left" border="0" cellpadding="0" cellspacing="0" class="mWidth" width="250">
                    <tr>
                      <td class="mWidth">
                        <!-- IMG URL VARIABLE HERE -->
                        <xsl:copy-of select="$image-optional-url"/>
                      </td>
                    </tr>
                  </table>
                  <!-- END LEFT COLUMN -->
                  <!--[if (gte mso 9)|(IE)]>
                      </td>
                      <td width="340" valign="top">
                  <![endif]-->
                  <!-- RIGHT COLUMN -->
                  <table align="right" border="0" cellpadding="0" cellspacing="0" class="mWidth" width="340">
                    <tr>
                      <td class="mWidth spacing-top align-left">
                       <xsl:copy-of select="$headline-optional-url"/>
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
              </xsl:when>

              <xsl:otherwise>
                <tr>
                  <td class="mWidth spacing-top spacing-bottom spacing-left spacing-right">
                    <xsl:copy-of select="$headline-optional-url"/>
                    <xsl:for-each select="section-text">
                        <xsl:if test=". !='' ">
                          <xsl:copy-of select="node()"/>
                        </xsl:if>
                    </xsl:for-each>
                  </td>
                </tr>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>