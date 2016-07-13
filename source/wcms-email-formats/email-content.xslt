<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output indent="yes" method="xml"/>
    <xsl:include href="/_internal/email/formats/email-variables"/>
    <xsl:template match="system-page">
        <!-- EVENTS CONTENT -->
        <xsl:for-each select="system-data-structure/feature/content">
            <xsl:if test=". != ''">
                <td align="left" class="mWidth spacing-top spacing-bottom large-spacing-left large-spacing-right">
                    <xsl:copy-of select="node()"/>
                </td>
            </xsl:if>
        </xsl:for-each>

        <!-- ADDITIONAL CONTENT -->
        <xsl:for-each select="system-data-structure/additional-content">
          <!-- Additional section title -->
          <xsl:if test="title != ''">
            <tr>
              <td align="left" class="mWidth section-title align-left">
                <h2><xsl:value-of select="title"/></h2>
              </td>
            </tr>
          </xsl:if>
          <!-- Additional section title -->

          <xsl:for-each select="section-content">
            
            <!-- Variable image link (two columns photo/text) -->
            <xsl:variable name="image-optional-url">
              <xsl:choose>
                <xsl:when test="asset-link/link != '' or url != ''">
                  <a href="{asset-link/link}{url}{$trackingURL}"><img align="left" alt="{image-alt}" border="0" class="mFullImage" height="185" src="{image/path}" width="250"/></a>
                </xsl:when>
                <xsl:otherwise>
                  <img align="left" alt="{image-alt}" border="0" class="mFullImage" height="185" src="{image/path}" width="250"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:variable>
            <!-- End variable image link (two columns photo/text) -->

            <!-- Variable headline link -->
            <xsl:variable name="headline-optional-url">
              <xsl:choose>
                <xsl:when test="asset-link/link != '' or url != ''">
                  <h3><a href="{asset-link/link}{url}{$trackingURL}"><xsl:value-of select="headline"/></a></h3>
                </xsl:when>
                <xsl:otherwise>
                  <h3><xsl:value-of select="headline"/></h3>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:variable>
          <!-- End variable headline link -->


            <xsl:choose>
              <xsl:when test="image/link != ''">
                <tr>
                  <td class="mWidth section-content">
                  <!-- Left image column -->
                    <table align="left" border="0" cellpadding="0" cellspacing="0" class="mWidth" width="250">
                      <tr>
                        <td class="mWidth">
                          <!-- IMG URL VARIABLE HERE -->
                          <xsl:copy-of select="$image-optional-url"/>
                        </td>
                      </tr>
                    </table>
                  <!-- End left image column -->
                  <!--[if (gte mso 9)|(IE)]>
                      </td>
                      <td width="340" valign="top">
                  <![endif]-->
                  <!-- Right text column with headline -->
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
                  <!-- End right text column with headline -->
                  </td>
                </tr>
              </xsl:when>

              <xsl:otherwise>
                <!-- No image full column text -->
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
                <!-- End no image full column text -->
              </xsl:otherwise>

            </xsl:choose>

          </xsl:for-each>

        </xsl:for-each>

    </xsl:template>
    
</xsl:stylesheet>