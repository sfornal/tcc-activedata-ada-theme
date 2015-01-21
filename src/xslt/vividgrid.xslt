<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl adx"
    xmlns:adx="urn:adxns">
<xsl:output method="html"/>
  <xsl:template match="/">
    <div id="View_Container">
      <xsl:for-each  select="//event">
        <!-- Add Color Code -->
        <div id="Event_name_Date_Time" style="border-left: 4px solid {custom-data/ccode} ; padding-left: 10px">
          <div style="display: inline; float: left ; padding: 0.5% 0.5% 0.5% 0.5% ; width: 25% ; height: 300px;">
            <img style="width: 100%; padding-bottom: 10px;" alt="{alt-text}" src="/handlers/image.ashx?id={primary-image}&amp;tenant={/events/v/Tenant}&amp;site={/events/v/Site}" />
            <br />
            <div id="Event_name_Date_Time" style="border-left: 4px solid {custom-data/ccode} ; padding-left: 10px">
              <h1 class="Event_title">
                <!-- Build event URL-->
                <a href="{/events/v/BaseUrl}{/events/v/RelativeListPath}event/{route}">
                  <!--Treat Private Event Titles Differently-->
                  <xsl:choose>
                    <xsl:when test="private='Y'">
                      <div id="Private_Code" style="color: red;">
                        <xsl:text>Private -</xsl:text>
                        <xsl:value-of select="name"/>
                      </div>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="name"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </a>
              </h1>
              <span>
                <h3>
                <xsl:value-of select="adx:ToDateTimeFormat(./local-start-date,'MMM')" disable-output-escaping="no"/>
                  <xsl:text> </xsl:text>
                <xsl:value-of select="adx:ToDateTimeFormat(./local-start-date,'dd')" disable-output-escaping="no"/>
                  <!-- Test for all day-->
                  <xsl:choose>
                    <xsl:when test="all-day='Y'">
                      <xsl:text> All Day</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:text>@</xsl:text>
                      <xsl:value-of select="local-start-time"/>
                      <xsl:text> </xsl:text>
                      <xsl:value-of select="timezone-abbreviation"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </h3>
              </span>
            </div>
          </div>
        </div>
      </xsl:for-each>
    </div>
<!-- Additional Styling Container for each event that is returned in the feed.-->
<!-- Provide a Message if no events are found-->
    <xsl:if test="count(//event)=0">
      <h2>No Upcoming Events</h2>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
