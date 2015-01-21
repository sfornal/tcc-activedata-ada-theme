<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl adx"
    xmlns:adx="urn:adxns">
<xsl:output method="html"/>
<xsl:template match="/">
   <!--<a href="{/events/v/BaseURL}{RelativeListPath}?view=list-with-maps">Experimental View</a> -->
  <xsl:for-each  select="//event">
    <div class="row" style="margin-left: 20px;">
      <!--Add Color Code Bar to the left of event name-->
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
      <!-- Additional Styling Container for each event that is returned in the feed.-->
          <div id="Each_Event_Record">
            <h4>
              <!-- Add the Start Date of the event, in local (Non-GMT) Time-->
              <xsl:value-of select="local-start-date"/>
              <xsl:text> </xsl:text>
              <!-- Test for All Day Events-->
              <xsl:choose>
                <!--Use the Text All Day where appropriate-->
                <xsl:when test="all-day='Y'">All Day</xsl:when>
                <!--Populate the Time and Timezone where appropriate-->
                <xsl:otherwise>
                  <span class="Time and Timezone">
                    <xsl:value-of select="local-start-time"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="timezone-abbreviation"/>
                    <xsl:text> </xsl:text>
                  </span>
                </xsl:otherwise>
              </xsl:choose>
              <!-- Check for a location -->
              <xsl:choose>
                <xsl:when test="locations=''"></xsl:when>
                <xsl:otherwise>
                  <!-- Use xsl for each to loop through all locations -->
                  <xsl:for-each select="locations/location">
                    <xsl:value-of select="name"/>
                    <xsl:text> </xsl:text>
                  </xsl:for-each>
                </xsl:otherwise>
              </xsl:choose>
            </h4>
           <xsl:if test="sale-type!='0'">
              <span class="more theme-nav">
              <a href="{/events/v/BaseUrl}{/events/v/RelativeListPath}page/registration?event={route}">
                Register
              </a>
            </span>
            </xsl:if>
           </div>
        </div>
      <!--Additional Div for Styling-->
          <div style="margin: 10px 0 10px 4px ">
            <!--Add Event Summary-->
            <p>
              <xsl:value-of select="summary"/>
            </p>
          </div>
			  <br />
		</div>
	</xsl:for-each>
  <!-- Provide a Message if no events are found-->
	<xsl:if test="count(//event)=0">
		<h2>No Upcoming Events</h2>
	</xsl:if>
</xsl:template>
</xsl:stylesheet>