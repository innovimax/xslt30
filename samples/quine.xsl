<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
  <!-- (c) Innovimax 2011-2017 - XSLT 3.0 Quine without DOE -->
  <xsl:variable name="code">
    <xsl:element name="xsl:stylesheet">
      <xsl:attribute name="version" select="'3.0'"/>
      <xsl:comment> (c) Innovimax 2011-2017 - XSLT 3.0 Quine without DOE </xsl:comment>
      <xsl:element name="xsl:variable">
        <xsl:attribute name="name" select="'code'"/>
        <xsl:element name="foo"/>
      </xsl:element>
      <xsl:element name="xsl:template">
        <xsl:attribute name="match" select="'/'"/>
        <xsl:element name="xsl:apply-templates">
          <xsl:attribute name="select" select="'$code'"/>
          <xsl:attribute name="mode" select="'copy'"/>
        </xsl:element>
      </xsl:element>
      <xsl:element name="xsl:template">
        <xsl:attribute name="match" select="'@*|node()'"/>
        <xsl:attribute name="mode" select="'copy'"/>
        <xsl:element name="xsl:copy">
          <xsl:element name="xsl:apply-templates">
            <xsl:attribute name="select" select="'@*|node()'"/>
            <xsl:attribute name="mode" select="'copy'"/>
          </xsl:element>
        </xsl:element>
      </xsl:element>
      <xsl:element name="xsl:template">
        <xsl:attribute name="match" select="'foo'"/>
        <xsl:attribute name="mode" select="'copy'"/>
        <xsl:element name="xsl:apply-templates">
          <xsl:attribute name="select" select="'$code'"/>
          <xsl:attribute name="mode" select="'el'"/>
        </xsl:element>
      </xsl:element>
      <xsl:element name="xsl:template">
        <xsl:attribute name="match" select="'*'"/>
        <xsl:attribute name="mode" select="'el'"/>
        <xsl:element name="xsl:element">
          <xsl:attribute name="name" select="'xsl:element'"/>
          <xsl:element name="xsl:attribute">
            <xsl:attribute name="name" select="'name'"/>
            <xsl:attribute name="select" select="'name()'"/>
          </xsl:element>
          <xsl:element name="xsl:apply-templates">
            <xsl:attribute name="select" select="'@*|*|text()|comment()'"/>
            <xsl:attribute name="mode" select="'el'"/>
          </xsl:element>
        </xsl:element>
      </xsl:element>
      <xsl:element name="xsl:template">
        <xsl:attribute name="match" select="'@*'"/>
        <xsl:attribute name="mode" select="'el'"/>
        <xsl:element name="xsl:element">
          <xsl:attribute name="name" select="'xsl:attribute'"/>
          <xsl:element name="xsl:attribute">
            <xsl:attribute name="name" select="'name'"/>
            <xsl:attribute name="select" select="'name()'"/>
          </xsl:element>
          <xsl:element name="xsl:attribute">
            <xsl:attribute name="name" select="'select'"/>
            <xsl:text>'</xsl:text>
            <xsl:element name="xsl:value-of">
              <xsl:attribute name="select" select="'.'"/>
            </xsl:element>
            <xsl:text>'</xsl:text>
          </xsl:element>
        </xsl:element>
      </xsl:element>
      <xsl:element name="xsl:template">
        <xsl:attribute name="match" select="'text()'"/>
        <xsl:attribute name="mode" select="'el'"/>
        <xsl:element name="xsl:element">
          <xsl:attribute name="name" select="'xsl:text'"/>
          <xsl:element name="xsl:value-of">
            <xsl:attribute name="select" select="'.'"/>
          </xsl:element>
        </xsl:element>
      </xsl:element>
      <xsl:element name="xsl:template">
        <xsl:attribute name="match" select="'comment()'"/>
        <xsl:attribute name="mode" select="'el'"/>
        <xsl:element name="xsl:element">
          <xsl:attribute name="name" select="'xsl:comment'"/>
          <xsl:element name="xsl:value-of">
            <xsl:attribute name="select" select="'.'"/>
          </xsl:element>
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:variable>
  <xsl:template match="/">
    <xsl:apply-templates select="$code" mode="copy"/>
  </xsl:template>
  <xsl:template match="@*|node()" mode="copy">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()" mode="copy"/>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="foo" mode="copy">
    <xsl:apply-templates select="$code" mode="el"/>
  </xsl:template>
  <xsl:template match="*" mode="el">
    <xsl:element name="xsl:element">
      <xsl:attribute name="name" select="name()"/>
      <xsl:apply-templates select="@*|*|text()|comment()" mode="el"/>
    </xsl:element>
  </xsl:template>
  <xsl:template match="@*" mode="el">
    <xsl:element name="xsl:attribute">
      <xsl:attribute name="name" select="name()"/>
      <xsl:attribute name="select">'<xsl:value-of select="."/>'</xsl:attribute>
    </xsl:element>
  </xsl:template>
  <xsl:template match="text()" mode="el">
    <xsl:element name="xsl:text">
      <xsl:value-of select="."/>
    </xsl:element>
  </xsl:template>
  <xsl:template match="comment()" mode="el">
    <xsl:element name="xsl:comment">
      <xsl:value-of select="."/>
    </xsl:element>
  </xsl:template>
</xsl:stylesheet>
