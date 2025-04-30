<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="ISO-8859-15"/>

<xsl:template name="fileName">
  <xsl:param name="str" />
  <xsl:choose>
    <xsl:when test="normalize-space(substring-after($str,'/'))">
      <xsl:call-template name="fileName">
        <xsl:with-param name="str" select="substring-after($str,'/')" />
      </xsl:call-template>  
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$str" />
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

    <xsl:template match="report">
        <xsl:apply-templates/>
    </xsl:template>


    <xsl:template match="tree">
        <ul class="tree">
        <xsl:apply-templates />
        </ul>
    </xsl:template>

    <xsl:template match="directory">
	    <li class="navbar-dir">
                <xsl:choose>
		    <xsl:when test="@open = 'opened'">&lt;details open="open">&lt;summary class="navbar-opened"></xsl:when>
		    <xsl:otherwise>&lt;details>&lt;summary></xsl:otherwise>
                </xsl:choose>
                <a href="{@name}">
<xsl:call-template name="fileName">
  <xsl:with-param name="str" select="@name" />
</xsl:call-template>    
                </a>&lt;/summary>
                <ul><xsl:apply-templates /></ul>
            &lt;/details>
        </li>
    </xsl:template>

    <xsl:template match="file">
                <xsl:choose>
<xsl:when test="@open = 'opened'">&lt;li class="navbar-file navbar-opened"></xsl:when>
		    <xsl:otherwise>&lt;li class="navbar-file"></xsl:otherwise>
                </xsl:choose>
		<a href="{@name}">
<xsl:call-template name="fileName">
  <xsl:with-param name="str" select="@name" />
</xsl:call-template>    
        </a>&lt;/li><xsl:apply-templates />
    </xsl:template>

</xsl:stylesheet>
