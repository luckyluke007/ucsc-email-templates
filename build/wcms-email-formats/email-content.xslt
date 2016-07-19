<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output indent="yes" method="xml"/>
    <xsl:include href="/_internal/email/formats/email-variables"/>
    <xsl:template match="system-page">

      <!-- IMAGE FOR ADMINISTRATIVE LETTER -->
        <!-- Admin image caption text -->
        <xsl:variable name="caption">
          <xsl:for-each select="system-data-structure">
            <xsl:if test="image-caption != ''">
                <xsl:value-of select="image-caption"></xsl:value-of>
            </xsl:if>
          </xsl:for-each>
        </xsl:variable>
        <!-- End admin image caption text -->

        <xsl:variable name="administrative-image">
          <xsl:for-each select="system-data-structure">
            <xsl:choose>
              <xsl:when test="image != ''">
                <table align="right" border="0" cellpadding="0" cellspacing="0" width="295" class="mWidth" summary="{image-alt}">
                 <tbody>
                   <tr>
                     <td class="mWidth spacing-left large-spacing-top">
                       <img src="{image/path}" width="295" height="200" alt="{image-alt}" class="mFullImage "></img>
                     </td>
                   </tr>
                   <tr>
                     <td class="mWidth spacing-left">
                      <xsl:value-of select="$caption"></xsl:value-of>
                     </td>
                   </tr>
                 </tbody>
                </table>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
        </xsl:variable>      
      <!-- END IMAGE FOR ADMINISTRATIVE LETTER -->

      <!-- FEATURE TEASER TEXT/ADMIN TEXT/FEATURE EVENT TEXT -->
      <xsl:for-each select="system-data-structure/feature/content">
        <xsl:if test=". != ''">
            <td align="left" class="mWidth spacing-top spacing-bottom large-spacing-left large-spacing-right">
                <xsl:copy-of select="$administrative-image"/>
                <xsl:copy-of select="node()"/>
            </td>
        </xsl:if>
      </xsl:for-each>
      <!-- END FEATURE TEASER TEXT/ADMIN TEXT/FEATURE EVENT TEXT -->

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
            
            <!-- Variable if link exist single column -->
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
            <!-- End variable if link exist single column -->

            <!-- Variable headline link exist single column -->
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
          <!-- End headline link exist single column -->


            <xsl:choose>
              <xsl:when test="image/link != ''">
                <tr>
                  <td class="mWidth section-content">
                  <!-- Left image column -->
                    <table align="left" border="0" cellpadding="0" cellspacing="0" class="mWidth" width="250" summary="Photo">
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
                  <table align="right" border="0" cellpadding="0" cellspacing="0" class="mWidth" width="340" summary="headline link">
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

        <!-- END ADDITIONAL CONTENT -->

        <!-- NEWSLETTER -->
        <xsl:for-each select="system-data-structure/email-content/section">
          
          <!-- if link exist for image in newsletter -->
          <xsl:variable name="newsletter-image-link">
            <xsl:for-each select="item">
              <xsl:choose>
                <xsl:when test="asset-link/path or url !=''">
                  <a href="{asset-link/link}{url}{$trackingURL}"><img align="left" alt="{image-alt}" border="0" class="mFullImage" height="185" src="{image/path}" width="250"/></a>
                </xsl:when>
                <otherwise>
                  <img align="left" alt="{image-alt}" border="0" class="mFullImage" height="185" src="{image/path}" width="250"/>
                </otherwise>
              </xsl:choose>
            </xsl:for-each>
          </xsl:variable>
          <!-- End if link exist for image in newsletter -->
          
          <!-- If link exist for headline in newsletter -->
          <xsl:variable name="newsletter-headline-link">
            <xsl:for-each select="item">
              <xsl:choose>
                <xsl:when test="asset-link/path or url !=''">
                  <h3><a href="{asset-link/link}{url}{$trackingURL}"><xsl:value-of select="headline"/></a></h3>
                </xsl:when>
                <otherwise>
                  <h3><xsl:value-of select="headline"/></h3>
                </otherwise>
              </xsl:choose>
            </xsl:for-each>
          </xsl:variable>
          <!-- End if link exist for headline in newsletter -->

          <xsl:if select="itemlayout != 'Column'">
            <xsl:for-each select="item">
              <xsl:choose>
                <xsl:when test="image/link !='' and teaser = 2">
                  <tr>
                    <td class="mWidth section-content">
                      <!-- two columns -->
                      <table align="left" border="0" cellpadding="0" cellspacing="0" width="295" class="mWidth">
                        <tbody>
                          <tr>
                            <td class="mWidth">
                              <!-- IMG URL VARIABLE HERE -->
                              <xsl:copy-of select="$newsletter-image-link"/>
                            </td>
                            <td class="mWidth spacing-top align-left">
                              <xsl:copy-of select="$newsletter-headline-link"/>
                              <xsl:for-each select="section-text">
                                <xsl:if test=". !='' ">
                                  <xsl:copy-of select="node()"/>
                                </xsl:if>
                              </xsl:for-each>
                            </td>
                          </tr>
                        </tbody>
                      </table>
                      <!-- End two columns -->
                    </td>
                  </tr>
                </xsl:when>
              </xsl:choose>
            </xsl:for-each>
          </xsl:if>
        </xsl:for-each>

        <!-- END NEWSLETTER -->

    </xsl:template>
    
</xsl:stylesheet>