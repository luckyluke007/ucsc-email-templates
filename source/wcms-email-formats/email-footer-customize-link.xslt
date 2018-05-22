<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output indent="yes" method="xml" omit-xml-declaration="yes"/>
  <xsl:include href="/_internal/email/formats/email-variables"/>
  <xsl:template match="system-page">
    <!-- Campaign button variable -->
    <xsl:variable name="footer-btn">
      <xsl:if test="system-data-structure/footer/content/system-data-structure/footer-btn/yoa-btn != ''">
        <tr>
          <td align="center" class="spacing-footer spacing-bottom mWidth">
            <a href="https://alumni.ucsc.edu/year-of-alumni/">
              <img alt="UC Santa Cruz Year of Alumni" border="0" src="https://emailbuilder.ucsc.edu/images/year-of-alumni.png"/>
            </a>
          </td>
        </tr>
      </xsl:if>
    </xsl:variable>
    <!-- End campaign button variable -->
    <xsl:choose>
      <xsl:when test="system-data-structure/footer/content/system-data-structure/social-group/social-link/social-site != '' and system-data-structure/footer/content/system-data-structure/social-group/social-link/social-url != ''">
        <table cellpadding="0" cellspacing="0" style="width: 300px;" summary="UC Santa Cruz follow us on social media">
          <tbody>
            <!-- Campaign variable button -->
            <xsl:copy-of select="$footer-btn"/>
            <!-- End campaign button -->
            <tr>
              <td align="center" class="footer-title" colspan="5">
                <h3>Follow us</h3>
              </td>
            </tr>
            <tr>
              <td align="center" class="spacing-top-content">
                <table align="center" border="0" cellpadding="0" cellspacing="0" summary="UC Santa Cruz social media links">
                  <tbody>
                    <tr>
                      <!-- Social button (Looking for Social Name and URL in order to work) -->
                      <xsl:for-each select="system-data-structure/footer/content/system-data-structure/social-group/social-link">
                        <xsl:if test="social-site != '' and social-url != ''">
                          <td align="center" class="spacing-top spacing-left spacing-right">
                            <a href="{social-url}">
                              <img alt="{social-site}" border="0" height="28" src="http://emailbuilder.ucsc.edu/images/social-icons/{social-site}.png" width="29"/>
                            </a>
                          </td>
                        </xsl:if>
                      </xsl:for-each>
                      <!-- End social button -->
                    </tr>
                  </tbody>
                </table>
              </td>
            </tr>
          </tbody>
        </table>
      </xsl:when>
      <!-- HTML code of standard footer (_includes folder)-->
      <xsl:otherwise>
        <xsl:copy-of select="system-data-structure/footer/content/node()"/>
      </xsl:otherwise>
      <!-- End HTML code of standard footer-->
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>