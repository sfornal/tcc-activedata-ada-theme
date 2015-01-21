<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="xml" indent="yes" />
  <xsl:key name="events-by-location" match="location" use="name" />
  <xsl:template match="*">
    <xsl:for-each select="//location[generate-id() =generate-id(key('events-by-location', name)[1])]">
      <h3>
        <xsl:value-of select="name" />
      </h3>
      <xsl:variable name="current-location" select="./name" />
      <xsl:for-each select="//event">
        <xsl:if test=".//location/name=$current-location">
          <xsl:value-of select="./name" />
          <br/>
        </xsl:if>
      </xsl:for-each>
      <br />
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>

