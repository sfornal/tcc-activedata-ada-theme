<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl adx"
    xmlns:adx="urn:adxns">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <!--Main Details Container-->
        <div id="Details_Main" style="width:100%">
            <!-- Begin left align-->
            <div id="left_side" style="float:left; width:50%">

				<!-- Add the main information for the event, including its name. -->
				<h3 class="details">What:</h3>
				<h2 class="details">
					<xsl:value-of select="/events/event/name"/>
				</h2>
				<p class="details">
					<xsl:value-of select="/events/event/description" disable-output-escaping="yes"/>
				</p>


				<!-- Add the Start Date and Time Information-->
				<h3 class="details">When:</h3>
				<p class="details">
					<xsl:value-of select="/events/event/local-start-date"/>
					<xsl:text>  </xsl:text>
					<xsl:choose>
						<xsl:when test="/events/event/all-day='Y'">All Day</xsl:when>
						<xsl:otherwise>
							<xsl:text>@</xsl:text>
							<xsl:value-of select="/events/event/local-start-time"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="/events/event/timezone-abbreviation"/>
							<xsl:text> </xsl:text>
							
							<!-- Test for Hide End -->
							<xsl:if test="/events/event/hide-end='N'">
                <xsl:text>-</xsl:text>
								<xsl:value-of select="/events/event/local-end-date"/>
								<xsl:text>@</xsl:text>
								<xsl:value-of select="/events/event/local-end-time"/>
							</xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</p>
				
				<xsl:if test="/events/event/locations/location">
					<div id="Location_Information">
						<h3 class="details">Where:</h3>
						<!-- Use xsl for each to loop through all locations-->
						<xsl:for-each select="/events/event/locations/location">
							<p class="details">
								<!-- Google Maps Clickable Link-->
								<a href="https://www.google.com/maps/place/{address1}+{address2}+{city}+{state}+{zipcode}">
									<xsl:value-of select="name"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="address1"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="address2"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="city"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="state"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="zipcode"/>
								</a>
							</p>
						</xsl:for-each>
					</div>
				</xsl:if>
				
				<xsl:if test="/events/event/contact/name!=''">
					<h3 class="details">Who:</h3>
					<p class="details"><xsl:value-of select="/events/event/contact/name"/></p>
					<p class="details"><xsl:value-of select="/events/event/contact/phone"/></p>
					<p class="details">
            <xsl:if test="/events/event/contact/name/extension!=''">
              <xsl:text>ext.</xsl:text>
            </xsl:if>
            <xsl:value-of select="/events/event/contact/extension"/></p>
					<p class="details"><xsl:value-of select="/events/event/contact/email"/></p>
				</xsl:if>
				
				<xsl:if test="/events/event/products">
					<h3 class="details">How:</h3>
					<span class="more theme-nav">
						<a href="{/events/v/BaseUrl}{/events/v/RelativeListPath}page/registration?event={/events/event/route}">
							Register
						</a>
					</span>
				</xsl:if>

				<xsl:if test="/events/event/categories">     
					<h3 class="details">Categories:</h3>
					<xsl:for-each select="/events/event/categories/category">
						<p class="details"><xsl:value-of select="name"/></p>
					</xsl:for-each>
				</xsl:if>
			
				<xsl:if test="/events/event/keywords">
					<h3 class="details">Keywords:</h3>
					<xsl:variable name ="base" select="adx:GetListUrl(/events/event/tenant-route, /events/event/site-route)"></xsl:variable>
					<xsl:for-each select="adx:Split(/events/event/keywords, ',')">
						<p class="details">
							<a href="{$base}?keywords={.}">
								<xsl:value-of select ="."/>
							</a>
						</p>
					</xsl:for-each>
				</xsl:if>

				
				<xsl:if test="/events/event/attachments">
					<h3 class="details">Attachments:</h3>
					<xsl:for-each select="/events/event/attachments/attachment">
						<p class="details">
							<a href="/handlers/image.ashx?id={id}&amp;tenant={/events/v/Tenant}&amp;site={events/v/site}" alt="{alt-text}">
								<xsl:value-of select="name"/>
							</a>
						</p>
					</xsl:for-each>
				</xsl:if>
				<h3 class="details">Share:</h3>
				<p class="details">
					<a href="{/events/v/BaseUrl}{RelativeListPath}/page/ical/?event={/events/event/route}">
						<img src="{/events/v/LayoutDirectory}/images/outlook.png" />
					</a>
					<a href="{/events/v/BaseUrl}{RelativeListPath}/page/xml/?event={/events/event/route}">
						XML
					</a>

				</p>
			</div> <!--end left div-->
			<div id="Section_2" style="width: 50%; float: right; text-align: right;">
				<xsl:for-each select="/events/event/images/image">
					<!--Create a link to view full size (uploaded) image-->
					<a href="/handlers/image.ashx?id={id}&amp;tenant={/events/v/Tenant}&amp;site={/events/v/Site}">
						<!--Display image-->
						<img style="width: 100%; padding:10px 10px 10px 10px;" alt="{alt-text}" src="/handlers/image.ashx?id={id}&amp;tenant={/events/v/Tenant}&amp;site={/events/v/Site}" />
					</a>
				</xsl:for-each>
			</div>
          <div style="clear:both"></div>
		</div><!--End Main Details-->
	</xsl:template>
</xsl:stylesheet>