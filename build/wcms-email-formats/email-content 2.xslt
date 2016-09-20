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
        <xsl:value-of select="image-caption"/>
      </xsl:if>
    </xsl:for-each>
    </xsl:variable>
    <!-- End admin image caption text -->
    <xsl:variable name="administrative-image">
    <xsl:for-each select="system-data-structure">
      <xsl:choose>
        <xsl:when test="image != ''">
          <table align="right" border="0" cellpadding="0" cellspacing="0" class="mWidth" summary="{image-alt}" width="295">
            <tbody>
              <tr>
                <td class="mWidth spacing-left large-spacing-top"><img alt="{image-alt}" class="mFullImage " height="200" src="{image/path}" width="295"/></td>
              <tr>
                <td class="mWidth spacing-left"><xsl:value-of select="$caption"/></td>
              </tr>
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
        <td align="left" class="mWidth spacing-top spacing-bottom large-spacing-left large-spacing-right"><xsl:copy-of select="$administrative-image"/>
          <xsl:copy-of select="node()"/></td>
      </xsl:if>
    </xsl:for-each>
    <!-- END FEATURE TEASER TEXT/ADMIN TEXT/FEATURE EVENT TEXT --> 
    <!-- ADDITIONAL CONTENT -->
    <xsl:for-each select="system-data-structure/content/section">
      <!-- Additional section title -->
      <xsl:if test="title != ''">
        <tr>
          <td align="left" class="mWidth section-title align-left"><h2> <xsl:value-of select="title"/> </h2></td>
        </tr>
      </xsl:if>
      <!-- Additional section title -->
      <xsl:for-each select="item">
        <!-- Variable image link (two columns photo/text) -->
        <xsl:variable name="image-optional-url">
        <xsl:choose>
          <xsl:when test="asset-link/link != '' or url != ''">
            <a href="{asset-link/link}{url}{$trackingURL}"> <img align="left" alt="{image-alt}" border="0" class="mFullImage" height="185" src="{image/path}" width="250"/> </a>
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
            <h3> <a href="{asset-link/link}{url}{$trackingURL}"> <xsl:value-of select="headline"/> </a> </h3>
          </xsl:when>
          <xsl:otherwise>
            <h3> <xsl:value-of select="headline"/> </h3>
          </xsl:otherwise>
        </xsl:choose>
        </xsl:variable>
        <!-- End variable headline link -->
        <xsl:choose>
          <xsl:when test="image/link != ''">
            <tr>
              <td class="mWidth section-content"><!-- Left image column -->
                
                <table align="left" border="0" cellpadding="0" cellspacing="0" class="mWidth" summary="test" width="250">
                  <tr>
                    <td class="mWidth"><!-- IMG URL VARIABLE HERE -->
                      
                      <xsl:copy-of select="$image-optional-url"/></td>
                  </tr>
                </table>
                
                <!-- End left image column --> 
                <!-- variable in variable includes -->
                
                <xsl:copy-of select="$outlook-split-two"/>
                
                <!-- Right text column with headline -->
                
                <table align="right" border="0" cellpadding="0" cellspacing="0" class="mWidth" summary="test" width="340">
                  <tr>
                    <td class="mWidth spacing-top align-left"><xsl:copy-of select="$headline-optional-url"/>
                      <xsl:for-each select="section-text">
                        <xsl:if test=". !='' ">
                          <xsl:copy-of select="node()"/>
                        </xsl:if>
                      </xsl:for-each></td>
                  </tr>
                </table>
                
                <!-- End right text column with headline --></td>
            </tr>
          </xsl:when>
          <xsl:otherwise>
            <!-- No image full column text -->
            <tr>
              <td class="mWidth spacing-top spacing-bottom large-spacing-left large-spacing-right"><xsl:copy-of select="$headline-optional-url"/>
                <xsl:for-each select="section-text">
                  <xsl:if test=". !='' ">
                    <xsl:copy-of select="node()"/>
                  </xsl:if>
                </xsl:for-each></td>
            </tr>
            <!-- End no image full column text -->
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
    </xsl:for-each>
    
    <!-- NEWSLETTER -->
    <xsl:for-each select="system-data-structure/email-content/section">
      <!-- item count variable to determine layout -->
      <xsl:variable name="item-count"> 
        <xsl:value-of select="count(item)"/> 
      </xsl:variable>
       
      <!-- Additional section title -->
      <xsl:if test="title != ''">
        <tr>
          <td align="left" class="mWidth section-title align-left"><h2> <xsl:value-of select="title"/> </h2></td>
        </tr>
      </xsl:if>
      <!-- Additional section title -->
      <tr>
        <td class="mWidth section-content">
          <xsl:if test="item-layout = 'Column'">
            <xsl:for-each select="item">
              <!-- Variable image link (two columns photo/text) -->
              <xsl:variable name="image-optional-url">
                <xsl:choose>
                  <xsl:when test="asset-link/link != '' or item/url != ''">
                    <a href="{item/asset-link/link}{url}{$trackingURL}"> <img align="left" alt="{image-alt}" border="0" class="mFullImage" src="{image/path}" width="295"/> </a>
                  </xsl:when>
                  <xsl:otherwise>
                    <img align="left" alt="{image-alt}" border="0" class="mFullImage" src="{image/path}" width="295"/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:variable>
              <!-- End variable image link (two columns photo/text) --> 
              <!-- Variable image link (two columns photo/text) -->
              <xsl:variable name="three-image-optional-url">
                <xsl:choose>
                  <xsl:when test="asset-link/link != '' or url != ''">
                    <a href="{asset-link/link}{item/url}{$trackingURL}"> <img align="left" alt="{image-alt}" border="0" class="mFullImage" src="{image/path}" width="190"/> </a>
                  </xsl:when>
                  <xsl:otherwise>
                    <img align="left" alt="{image-alt}" border="0" class="mFullImage" src="{image/path}" width="190"/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:variable>
              <!-- End variable image link (two columns photo/text) --> 
              <!-- Variable headline link -->
              <xsl:variable name="headline-optional-url">
                <xsl:choose>
                  <xsl:when test="asset-link/link != '' or url != ''">
                    <h3><a href="{asset-link/link}{url}{$trackingURL}"> <xsl:value-of select="headline"/> </a> </h3>
                  </xsl:when>
                  <xsl:otherwise>
                    <h3> <xsl:value-of select="headline"/> </h3>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:variable>
              <!-- End variable headline link -->


              <xsl:choose>
                <!-- 2 columns -->
                <xsl:when test="$item-count = 2">
                  <!-- Not last item -->
                  <xsl:if test="position() != last()">
                    <table align="left" border="0" cellpadding="0" cellspacing="0" class="mWidth" summary="{headline}" width="295">
                      <tbody>
                        <tr>
                          <td class="mWidth"><xsl:copy-of select="$image-optional-url"/></td>
                        </tr>
                        <tr>
                          <td align="left" class="mWidth align-left"><xsl:copy-of select="$headline-optional-url"/>
                            <p>
                              <xsl:for-each select="teaser">
                                <xsl:if test=". !='' ">
                                  <xsl:copy-of select="node()"/>
                                </xsl:if>
                              </xsl:for-each>
                            </p></td>
                        </tr>
                      </tbody>
                    </table>
                    <!-- variable in variable includes -->
                    <xsl:copy-of select="$outlook-split-feature"/>
                  </xsl:if>
                  <!-- end not last item --> 
                  <!-- last item -->
                  <xsl:if test="position() = last()">
                    <table align="right" border="0" cellpadding="0" cellspacing="0" class="mWidth" summary="{headline}" width="295">
                      <tbody>
                        <tr>
                          <td class="mWidth"><xsl:copy-of select="$image-optional-url"/></td>
                        </tr>
                        <tr>
                          <td align="left" class="mWidth align-left"><xsl:copy-of select="$headline-optional-url"/>
                            <p>
                              <xsl:for-each select="teaser">
                                <xsl:if test=". !='' ">
                                  <xsl:copy-of select="node()"/>
                                </xsl:if>
                              </xsl:for-each>
                            </p></td>
                        </tr>
                      </tbody>
                    </table>
                  </xsl:if>
                  <!-- end last item -->
                </xsl:when>
                <!-- end 2 columns -->
                <xsl:when test="$item-count = 3">
                    <!-- Not last item -->
                    <xsl:if test="position() != last()">
                      <!-- variable in variable includes -->
                      <xsl:copy-of select="$outlook-open-table"/>
                      <table align="left" border="0" cellpadding="0" cellspacing="0" class="mWidth" summary="{headline}" width="190">
                        <tr>
                          <td class="mWidth xlarge-spacing-right"><xsl:copy-of select="$three-image-optional-url"/></td>
                        </tr>
                        <tr>
                          <td align="left" class="mWidth xlarge-spacing-right align-left"><xsl:copy-of select="$headline-optional-url"/>
                            <p>
                              <xsl:for-each select="teaser">
                                <xsl:if test=". !='' ">
                                  <xsl:copy-of select="node()"/>
                                </xsl:if>
                              </xsl:for-each>
                            </p></td>
                        </tr>
                      </table>
                      <!-- variable in variable includes -->
                      <xsl:copy-of select="$outlook-split-three"/>
                    </xsl:if>
                    <!-- End not last item --> 
                    <!-- last 3 columns item -->
                    <xsl:if test="position() = last()">
                      <table align="left" border="0" cellpadding="0" cellspacing="0" class="mWidth" summary="{headline}" width="190">
                        <tr>
                          <td class="mWidth"><xsl:copy-of select="$three-image-optional-url"/></td>
                        </tr>
                        <tr>
                          <td align="left" class="mWidth align-left"><xsl:copy-of select="$headline-optional-url"/>
                            <p>
                              <xsl:for-each select="teaser">
                                <xsl:if test=". !='' ">
                                  <xsl:copy-of select="node()"/>
                                </xsl:if>
                              </xsl:for-each>
                            </p></td>
                        </tr>
                      </table>
                      <!-- variable in variable includes -->
                      <xsl:copy-of select="$outlook-close-table"/>
                    </xsl:if>
                  <!-- End last 3 columns item -->
                </xsl:when>

                <!-- single column -->
                <xsl:otherwise>
                    <img alt="{image-alt}" class="mFullImage" src="{image/path}" width="610"/>
                    <xsl:copy-of select="$headline-optional-url"/>
                    <p>
                      <xsl:for-each select="teaser">
                        <xsl:if test=". !='' ">
                          <xsl:copy-of select="node()"/>
                        </xsl:if>
                      </xsl:for-each>
                    </p>  
                </xsl:otherwise>
                <!-- end single column -->
              </xsl:choose>
            </xsl:for-each>
          </xsl:if>
          <!-- end item column layout-->
        </td>
      </tr>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>