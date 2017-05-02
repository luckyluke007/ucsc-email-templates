<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output indent="yes" method="xml"/>
    <xsl:template match="/system-index-block">
        <xsl:apply-templates select="calling-page/system-page"/>
    </xsl:template>

   
    <!-- UCSC URL -->
    <xsl:variable name="ucscURL">
        <xsl:text>http://www.ucsc.edu</xsl:text>
    </xsl:variable>
    <!-- SITE URL -->
    <xsl:variable name="siteURL">
        <xsl:text>http://messaging.ucsc.edu</xsl:text>
    </xsl:variable>
    <!-- PAGE URL -->
    <xsl:variable name="pageURL">
      <xsl:value-of select="$siteURL"/>
      <xsl:value-of select="/system-index-block/calling-page/system-page/path"/>
      <xsl:text>.html</xsl:text>
    </xsl:variable>
    
    <!-- TRACKING URL -->
    <xsl:variable name="trackingURL">
      <xsl:text>?utm_source=</xsl:text>
      <xsl:value-of select="/system-index-block/calling-page/system-page/name"/>
      <xsl:text>&amp;utm_medium=email&amp;utm_campaign=</xsl:text>
      <xsl:value-of select="/system-index-block/calling-page/system-page/system-data-structure/ga-campaign"/>
    </xsl:variable>

    <!-- MSO TDs TWO COLUMNS -->
    <xsl:variable name="outlook-split-two">
      <xsl:comment>
        <![CDATA[[if (gte mso 9)|(IE)]>
            </td>
            <td width="340" valign="top">
        <![endif]]]>
      </xsl:comment>
    </xsl:variable>

    <!-- MSO TDs TWO COLUMNS -->
    <xsl:variable name="outlook-split-feature">
      <xsl:comment>
        <![CDATA[[if (gte mso 9)|(IE)]>
            </td>
            <td width="295" valign="top">
        <![endif]]]>
      </xsl:comment>
    </xsl:variable>

    <!-- MSO THREE COLUMNS OPEN TABLE -->
    <xsl:variable name="outlook-open-table">
      <xsl:comment>
        <![CDATA[[if (gte mso 9)|(IE)]>
            <table width="610" align="center">
              <tr>
                <td width="192" valign="top">
        <![endif]]]>
      </xsl:comment>
    </xsl:variable>

    <!-- MSO THREE COLUMNS TDs -->
    <xsl:variable name="outlook-split-three">
      <xsl:comment>
        <![CDATA[[if (gte mso 9)|(IE)]>
            </td>
            <td width="192" valign="top">
        <![endif]]]>
      </xsl:comment>
    </xsl:variable>

    <!-- MSO CLOSE TABLE -->
    <xsl:variable name="outlook-close-table">
      <xsl:comment>
        <![CDATA[[if (gte mso 9)|(IE)]>
              </td>
            </tr>
          </table>
        <![endif]]]>
      </xsl:comment>
    </xsl:variable>

    <!-- WCMS content -->

    <!-- Variable image link (two columns photo/text) -->
    <xsl:variable name="image-optional-url">
      <xsl:choose>
        <xsl:when test="asset-link/link != '' or url != ''">
          <a href="{asset-link/link}{url}{$trackingURL}"> <img align="left" alt="{image-alt}" border="0" class="mFullImage" src="{image/path}" width="250"/> </a>
        </xsl:when>
        <xsl:otherwise>
          <img align="left" alt="{image-alt}" border="0" class="mFullImage" src="{image/path}" width="250"/>
        </xsl:otherwise>
    </xsl:choose>
    </xsl:variable>
    <!-- End variable image link (two columns photo/text) --> 

</xsl:stylesheet>