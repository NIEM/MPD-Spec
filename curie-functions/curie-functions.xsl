<?xml version="1.0" encoding="UTF-8"?><stylesheet xmlns:cf="http://ittl.gtri.org/wr24/2010-03-03-1533/curie-functions/1" xmlns:private="http://ittl.gtri.org/wr24/2010-03-03-1533/curie-functions/1/private" xmlns:saxon="http://saxon.sf.net/" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xslext="http://ittl.gtri.gatech.edu/wr24/2009-03-23-1736/xsl-extension" xmlns="http://www.w3.org/1999/XSL/Transform" version="2.0">

  <function name="cf:resolve-curie" as="xs:anyURI?">
      <param name="curie" as="xs:string"/>
      <param name="element" as="element()"/>
      <choose>
        <when test="not(matches($curie, '[^:]*:[^:]*'))">
          <message>Curie has bad format. Value was "<value-of select="$curie"/>".</message>
        </when>
        <otherwise>
          <variable name="prefix" select="substring-before($curie, ':')"/>
          <variable name="rest" select="substring-after($curie, ':')"/>
          <variable name="base-URI" select="namespace-uri-for-prefix($prefix, $element)"/>
          <choose>
            <when test="empty($base-URI)">
              <message>Curie has bad prefix. Can't resolve prefix "<value-of select="$prefix"/>".</message>
            </when>
            <otherwise>
              <sequence select="xs:anyURI(concat($base-URI, $rest))"/>
            </otherwise>
          </choose>
        </otherwise>
      </choose>
  </function>

  <function name="cf:resolve-safe-curie" as="xs:anyURI?">
    <param name="safe-curie" as="xs:string"/>
    <param name="element" as="element()"/>
    <choose>
      <when test="matches($safe-curie, '^\[[^\[\]]+\]$')">
        <!-- it's a safe curie -->
        <sequence select="cf:resolve-curie(                              substring($safe-curie, 2, string-length($safe-curie) - 2),                              $element)"/>
      </when>
      <!-- it would be good to put better tests for URIs here -->
      <when test="string-length(normalize-space($safe-curie)) &gt; 0                   and matches($safe-curie, '^[^\[\]]+$')">
        <sequence select="xs:anyURI($safe-curie)"/>
      </when>
      <otherwise>
        <message>Safe CURIE probably is not a URI. Value was "<value-of select="$safe-curie"/>"</message>
      </otherwise>
    </choose>
  </function>

</stylesheet><!-- 
  Local Variables:
  mode: sgml
  indent-tabs-mode: nil
  fill-column: 9999
  End:
-->